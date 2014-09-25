

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MessagesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	@Transactional
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		//clear the unread messages show
		def mess=Messages.findAllByReceiverAndStatue(session.ShiroUser,true)
		mess*.statue=false
		mess*.save flush:true
		
		def messages=Messages.findAllBySenderOrReceiver(session.ShiroUser,session.ShiroUser,params)
		def messagesCount=Messages.countBySenderOrReceiver(session.ShiroUser,session.ShiroUser)
		
        //respond Messages.list(params), model:[messagesInstanceCount: Messages.count()]
		respond messages, model:[messagesInstanceCount:messagesCount]
    }

    def show(Messages messagesInstance) {
        respond messagesInstance
    }

    def create() {
        respond new Messages(params)
    }

    @Transactional
    def save(Messages messagesInstance) {
        if (messagesInstance == null) {
            notFound()
            return
        }

        if (messagesInstance.hasErrors()) {
            respond messagesInstance.errors, view:'create'
            return
        }
		messagesInstance.statue=true  //unread
        messagesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'messagesInstance.label', default: 'Messages'), messagesInstance.id])
                redirect messagesInstance
            }
            '*' { respond messagesInstance, [status: CREATED] }
        }
    }

    def edit(Messages messagesInstance) {
        respond messagesInstance
    }

    @Transactional
    def update(Messages messagesInstance) {
        if (messagesInstance == null) {
            notFound()
            return
        }

        if (messagesInstance.hasErrors()) {
            respond messagesInstance.errors, view:'edit'
            return
        }

        messagesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Messages.label', default: 'Messages'), messagesInstance.id])
                redirect messagesInstance
            }
            '*'{ respond messagesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Messages messagesInstance) {

        if (messagesInstance == null) {
            notFound()
            return
        }

        messagesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Messages.label', default: 'Messages'), messagesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'messagesInstance.label', default: 'Messages'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
