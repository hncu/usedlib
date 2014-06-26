

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BorrowedBookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BorrowedBook.list(params), model:[borrowedBookInstanceCount: BorrowedBook.count()]
    }

    def show(BorrowedBook borrowedBookInstance) {
        respond borrowedBookInstance
    }

    def create() {
        respond new BorrowedBook(params)
    }

    @Transactional
    def save(BorrowedBook borrowedBookInstance) {
        if (borrowedBookInstance == null) {
            notFound()
            return
        }

        if (borrowedBookInstance.hasErrors()) {
            respond borrowedBookInstance.errors, view:'create'
            return
        }

        borrowedBookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'borrowedBookInstance.label', default: 'BorrowedBook'), borrowedBookInstance.id])
                redirect borrowedBookInstance
            }
            '*' { respond borrowedBookInstance, [status: CREATED] }
        }
    }

    def edit(BorrowedBook borrowedBookInstance) {
        respond borrowedBookInstance
    }

    @Transactional
    def update(BorrowedBook borrowedBookInstance) {
        if (borrowedBookInstance == null) {
            notFound()
            return
        }

        if (borrowedBookInstance.hasErrors()) {
            respond borrowedBookInstance.errors, view:'edit'
            return
        }

        borrowedBookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BorrowedBook.label', default: 'BorrowedBook'), borrowedBookInstance.id])
                redirect borrowedBookInstance
            }
            '*'{ respond borrowedBookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(BorrowedBook borrowedBookInstance) {

        if (borrowedBookInstance == null) {
            notFound()
            return
        }

        borrowedBookInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BorrowedBook.label', default: 'BorrowedBook'), borrowedBookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'borrowedBookInstance.label', default: 'BorrowedBook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
