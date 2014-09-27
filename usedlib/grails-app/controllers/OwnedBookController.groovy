import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.apache.shiro.SecurityUtils

@Transactional(readOnly = true)
class OwnedBookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def ownedbooklist
		def ownedbooklistCount
		def userid
		if(!params.userid){
			params.userid=session .ShiroUser?.id
		}
		if(SecurityUtils.getSubject().hasRole("ROLE_ADMIN")){
			ownedbooklist=OwnedBook.list(params)
			ownedbooklistCount=OwnedBook.count
		}else{			
			def user=ShiroUser.findById(params.userid)
			ownedbooklist=OwnedBook.findAllByUser(user)
			ownedbooklistCount=OwnedBook.countByUser(user)
		}
		//println "params.userid"+params.userid
        respond ownedbooklist, model:[ownedBookInstanceCount: ownedbooklistCount]
    }

    def show(OwnedBook ownedBookInstance) {
        respond ownedBookInstance
    }

    def create() {
        respond new OwnedBook(params)
    }

    @Transactional
    def save(OwnedBook ownedBookInstance) {
		//println "params:${params}"
		//println "ownedBookInstance:${ownedBookInstance}"
		//println "ownedBookInstance.book.id:${ownedBookInstance.book.id}"
		//println "params.book.isbn13:${params.book.isbn13}"
		
		if(ownedBookInstance.book.id==null){
			def booktemp=Book.findByIsbn13(params.book.isbn13)
			if(booktemp==null){
				def bookInstance= new Book()
				bookInstance.subtitle= params.book.subtitle
				bookInstance.author= params.book.author
				bookInstance.pubdate= params.book.pubdate
				bookInstance.tags= params.book.tags
				//bookInstance.origin_title= params.book.origin_title
				bookInstance.image= params.book.image
				bookInstance.binding= params.book.binding
				bookInstance.translator= params.book.translator
				bookInstance.catalog= params.book.catalog
				bookInstance.pages= params.book.pages
				bookInstance.images= params.book.images
				bookInstance.doubanid= params.book.id
				bookInstance.publisher= params.book.publisher
				bookInstance.isbn10= params.book.isbn10
				bookInstance.isbn13= params.book.isbn13
				bookInstance.title= params.book.title
				bookInstance.url= params.book.url
				bookInstance.alt_title= params.book.alt_title
				bookInstance.author_intro= params.book.author_intro
				bookInstance.summary= params.book.summary
				bookInstance.price= params.book.price
				
				bookInstance.save flush:true
				ownedBookInstance.book=bookInstance
			}else{
				ownedBookInstance.book=booktemp
			}
		}
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
                //redirect ownedBookInstance.book
				redirect(view: "index", model: [ownedBookInstanceList:OwnedBook,ownedBookInstanceCount: OwnedBook.count()])
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
