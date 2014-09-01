import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.apache.shiro.SecurityUtils

@Transactional(readOnly = true)
class FriendsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def friendsList
		def friendsListCount
		if(SecurityUtils.getSubject().hasRole("ROLE_ADMIN")){
			friendsList=Friends.list(params)
			friendsListCount=Friends.count
		}else{
			def user=ShiroUser.findById(session .ShiroUser?.id)
			friendsList=Friends.findAllByUser(user,params)
			friendsListCount=Friends.countByUser(user)
		}
        respond friendsList, model:[friendsInstanceCount: friendsListCount]
    }

    def show(Friends friendsInstance) {
        respond friendsInstance
    }

    def create() {
        respond new Friends(params)
    }

    @Transactional
    def save(Friends friendsInstance) {
        if (friendsInstance == null) {
            notFound()
            return
        }

        if (friendsInstance.hasErrors()) {
            respond friendsInstance.errors, view:'create'
            return
        }

        friendsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'friendsInstance.label', default: 'Friends'), friendsInstance.id])
                //redirect friendsInstance
                redirect controller:"ShiroUser",action:"index", method:"GET"
            }
            '*' { respond friendsInstance, [status: CREATED] }
        }
    }

    def edit(Friends friendsInstance) {
        respond friendsInstance
    }

    @Transactional
    def update(Friends friendsInstance) {
        if (friendsInstance == null) {
            notFound()
            return
        }

        if (friendsInstance.hasErrors()) {
            respond friendsInstance.errors, view:'edit'
            return
        }

        friendsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Friends.label', default: 'Friends'), friendsInstance.id])
                redirect friendsInstance
            }
            '*'{ respond friendsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Friends friendsInstance) {

        if (friendsInstance == null) {
            notFound()
            return
        }
        friendsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Friends.label', default: 'Friends'), friendsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'friendsInstance.label', default: 'Friends'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
