

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OwnedBookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OwnedBook.list(params), model:[ownedBookInstanceCount: OwnedBook.count()]
    }

    def show(OwnedBook ownedBookInstance) {
        respond ownedBookInstance
    }

    def create() {
        respond new OwnedBook(params)
    }

    @Transactional
    def save(OwnedBook ownedBookInstance) {
        if (ownedBookInstance == null) {
            notFound()
            return
        }

        if (ownedBookInstance.hasErrors()) {
            respond ownedBookInstance.errors, view:'create'
            return
        }

        ownedBookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ownedBookInstance.label', default: 'OwnedBook'), ownedBookInstance.id])
                redirect ownedBookInstance
            }
            '*' { respond ownedBookInstance, [status: CREATED] }
        }
    }

    def edit(OwnedBook ownedBookInstance) {
        respond ownedBookInstance
    }

    @Transactional
    def update(OwnedBook ownedBookInstance) {
        if (ownedBookInstance == null) {
            notFound()
            return
        }

        if (ownedBookInstance.hasErrors()) {
            respond ownedBookInstance.errors, view:'edit'
            return
        }

        ownedBookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OwnedBook.label', default: 'OwnedBook'), ownedBookInstance.id])
                redirect ownedBookInstance
            }
            '*'{ respond ownedBookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OwnedBook ownedBookInstance) {

        if (ownedBookInstance == null) {
            notFound()
            return
        }

        ownedBookInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OwnedBook.label', default: 'OwnedBook'), ownedBookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ownedBookInstance.label', default: 'OwnedBook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
