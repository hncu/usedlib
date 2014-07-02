import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.alibaba.fastjson.JSON
import com.alibaba.fastjson.JSONObject

@Transactional(readOnly = true)
class BookController {
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Book.list(params), model:[bookInstanceCount: Book.count()]
    }

    def show(Book bookInstance) {
		def bookOwnerList=OwnedBook.findAllByBook((Book)bookInstance).user
		respond bookInstance, model:[bookOwnerList:bookOwnerList,bookOwnerListInstanceCount: bookOwnerList.size()]
    }

    def create() {
        respond new Book(params)
    }

    @Transactional
    def save(Book bookInstance) {
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view:'create'
            return
        }

        bookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bookInstance.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*' { respond bookInstance, [status: CREATED] }
        }
    }
	
	@Transactional
	def searchBook() {
		//后面添加/v2/book/search 搜索功能。
		//println params.isbn13
		String url='https://api.douban.com/v2/book/isbn/:'+params.isbn13					
		//String doubanString= 'https://api.douban.com/v2/book/1220562'.toURL().text
		String doubanString
		try{
			doubanString=url.toURL().text			
		}catch(FileNotFoundException e){e.printStackTrace() }
		
		
		//BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream('F:\\GitHubWorkspace\\for usedlib\\douban-utf-8.json'),"UTF-8"));
		//String doubanString =  br.readLine();
		//println "\n"+doubanString
		//br.close();		
		//doubanString= doubanString.substring(5,doubanString.size())
		//println "||||||||||***********||||||||||\n"
		//println doubanString
		if(doubanString==null){
			println "error doubanString null"
			redirect(uri: "/book/index")
			return}
		JSONObject json = JSON.parseObject(doubanString)
		def bookInstance1 = Book.findByIsbn13(json.isbn13)
		//println bookInstance1
		if(bookInstance1==null){	
			bookInstance1= new Book()
			bookInstance1.isbn13= json.isbn13
			bookInstance1.title= json.title
	
			if (bookInstance1.hasErrors()) {
				respond bookInstance1.errors, view:'create'
				return
			}
			
			bookInstance1.save flush:true
		}
		
		redirect( action: "show", method: "GET",params:['id':bookInstance1.id])
		
	}
	
	def edit(Book bookInstance) {
        respond bookInstance
    }

    @Transactional
    def update(Book bookInstance) {
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view:'edit'
            return
        }

        bookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*'{ respond bookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Book bookInstance) {

        if (bookInstance == null) {
            notFound()
            return
        }

        bookInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookInstance.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
