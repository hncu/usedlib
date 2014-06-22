import grails.util.GrailsUtil

class BootStrap {

	def shiroSecurityService

	def init = { servletContext ->
		switch (GrailsUtil.environment) {

			case  "development":
				createTestingUsers()
			//				createTestingCategorys()
			//				createTestingBooks()
			//				createTestingOwns()
			//				createTestingBorrows()

				break;

			case "production":
				println "No special configuration required"
				break;
		}
	}
	def destroy = {
	}

	void createTestingUsers(){

		// Create the admin role
		def adminRole = ShiroRole.findByName('ROLE_ADMIN') ?:
				new ShiroRole(name: 'ROLE_ADMIN').save(flush: true, failOnError: true)

		// Create the user role
		def userRole = ShiroRole.findByName('ROLE_USER') ?:
				new ShiroRole(name: 'ROLE_USER').save(flush: true, failOnError: true)

		// Create an admin user
		def adminUser = ShiroUser.findByUsername('admin') ?:
				new ShiroUser(username: "admin",
				passwordHash: shiroSecurityService.encodePassword('password'))
				.save(flush: true, failOnError: true)

		// Add roles to the admin user
		assert adminUser.addToRoles(adminRole)
		.save(flush: true, failOnError: true)
		//.addToRoles(userRole)

		// Create an standard user
		def standardUser = ShiroUser.findByUsername('joe') ?:
				new ShiroUser(username: "joe",
				passwordHash: shiroSecurityService.encodePassword('password'))
				.save(flush: true, failOnError: true)

		// Add role to the standard user
		assert standardUser.addToRoles(userRole)
		.save(flush: true, failOnError: true)

		for(i in 0..3) {
			def jane = ShiroUser.findByUsername("knight${i}") ?:
					new ShiroUser(username:"knight${i}",
					passwordHash:shiroSecurityService.encodePassword('123456'))
					.save(flush: true, failOnError: true)
			if(jane.hasErrors()){
				println jane.errors
			}
			assert jane.addToRoles(userRole)
			.save(flush: true, failOnError: true)
		}
	}
}
