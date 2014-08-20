

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.apache.shiro.SecurityUtils

@Transactional(readOnly = true)
class ShiroUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def userindex(){
		def user=ShiroUser.findById(session .ShiroUser?.id)
		def friendsList=Friends.findAllByUser(user,[max:3,sort:'id', order:'desc'])
		def borrowedBookList=BorrowedBook.findAllByBorrower(user)
		def lendedBookList=BorrowedBook.findAllByOwner(user,[max:3,sort:'id', order:'desc'])
		def ownedbooklist=OwnedBook.findAllByUser(user)		
		return [friendsInstanceList:friendsList,borrowedBookInstanceList:borrowedBookList,
			    lendedBookInstanceList:lendedBookList,ownedBookInstanceList:ownedbooklist]
	}

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		//params.sort="gpsLongitude"
		//println params
		def nearbyUser= Profile.findAllByGpsLongitudeBetweenAndGpsLatitudeBetween(112.41,112.45,28.547,28.548)
		def aaa=nearbyUser.user
		print "findByGpsLongitudeBetween:"+nearbyUser+aaa
        respond ShiroUser.list(params), model:[shiroUserInstanceCount: ShiroUser.count()]//112.39 //ShiroUser.list(params)
    }

    def show(ShiroUser shiroUserInstance) {
        respond shiroUserInstance
    }

    def create() {
        respond new ShiroUser(params)
    }

    @Transactional
    def save(ShiroUser shiroUserInstance) {
        if (shiroUserInstance == null) {
            notFound()
            return
        }

        if (shiroUserInstance.hasErrors()) {
            respond shiroUserInstance.errors, view:'create'
            return
        }

        shiroUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'shiroUserInstance.label', default: 'ShiroUser'), shiroUserInstance.id])
                redirect shiroUserInstance
            }
            '*' { respond shiroUserInstance, [status: CREATED] }
        }
    }

    def edit(ShiroUser shiroUserInstance) {
        respond shiroUserInstance
    }

    @Transactional
    def update(ShiroUser shiroUserInstance) {
        if (shiroUserInstance == null) {
            notFound()
            return
        }

        if (shiroUserInstance.hasErrors()) {
            respond shiroUserInstance.errors, view:'edit'
            return
        }

        shiroUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ShiroUser.label', default: 'ShiroUser'), shiroUserInstance.id])
                redirect shiroUserInstance
            }
            '*'{ respond shiroUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ShiroUser shiroUserInstance) {

        if (shiroUserInstance == null) {
            notFound()
            return
        }

        shiroUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ShiroUser.label', default: 'ShiroUser'), shiroUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shiroUserInstance.label', default: 'ShiroUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
