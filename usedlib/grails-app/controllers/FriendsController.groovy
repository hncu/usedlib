

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FriendsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Friends.list(params), model:[friendsInstanceCount: Friends.count()]
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
                redirect friendsInstance
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
