class ShiroUser {
    String username
    String passwordHash
	String email
	
    static hasMany = [ roles: ShiroRole, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
		passwordHash(nullable: false, blank: false,size:6..70)
		email(nullable:true,blank:false,unique:true,email: true)
    }
}
