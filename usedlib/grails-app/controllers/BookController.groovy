import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.util.regex.Matcher
import java.util.regex.Pattern
import com.alibaba.fastjson.JSON
import com.alibaba.fastjson.JSONArray
import com.alibaba.fastjson.JSONObject

@Transactional(readOnly = true)
class BookController {
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
		def moreOffset=7
        params.max = Math.min(max ?: moreOffset, 100)
		def bookTotalNum=0
		def bookTotalTemp=[]
		def ownedBook=[]
		def ownedBookTotalCount
		params.offset=params.offset?:0
		//println "***********************initial params"+params
		if(!params.offset){flash.bookTotalTemp=null}
		while(bookTotalNum<moreOffset){
			def criteria = OwnedBook.createCriteria()
			def ownedBooktemp = criteria.list (params,{
				user {
					//ge('level',0)
					//order("id", "desc")
					profile{
						//eq('community',"2")
					}
				}
				order("book.id","asc")
			})
			ownedBookTotalCount=ownedBooktemp.totalCount
			ownedBook=ownedBook+ownedBooktemp

			bookTotalTemp=ownedBook*.book.unique()
			
			if(bookTotalTemp[0]?.id==flash.bookEndId){bookTotalTemp?.remove(0)}
			
			if(flash.bookTotalTemp) {
				bookTotalTemp=flash.bookTotalTemp+bookTotalTemp
			}
			
			bookTotalNum=bookTotalTemp.size()

			params.offset=params.offset.toInteger()+moreOffset
			if(!ownedBooktemp)break
		}

		if(bookTotalNum>moreOffset){
			flash.bookTotalTemp=bookTotalTemp.getAt(moreOffset..(bookTotalNum-1))			
		}else{
			flash.bookTotalTemp=null
		}
		flash.bookEndId=bookTotalTemp[bookTotalNum-1].id
		
		def books=bookTotalTemp.getAt(0..(Math.min(bookTotalNum,moreOffset)-1))
		//println "books.id"+books.id
        //respond books, model:[params:params,bookInstanceCount: books.totalCount]//Book.list(params)
		respond books,model:[booksCount:ownedBookTotalCount]
    }

    def show(Book bookInstance,Integer max) {
		params.max = Math.min(max ?: 10, 100)		
		def bookOwnerList=OwnedBook.findAllByBook(bookInstance,params).user
		def bookOwnerListCount=OwnedBook.findAllByBook((Book)bookInstance).user.size()
		respond bookInstance, model:[bookOwnerList:bookOwnerList,bookOwnerListInstanceCount: bookOwnerListCount]
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
		//println params.searchString
		params.searchString="java"
		def books=[]
		String regEx="[^0-9]"
		Pattern p = Pattern.compile(regEx)
		Matcher m = p.matcher(params.searchString)
		String searchString = m.replaceAll("")
		if(searchString.length()==13 || searchString.length()==10)
		{
			String url='https://api.douban.com/v2/book/isbn/:'+params.searchString					
			//String doubanString= 'https://api.douban.com/v2/book/1220562'.toURL().text
			//https://api.douban.com/v2/book/search?q=java&count=100
			String doubanString
			try{
				doubanString=url.toURL().text			
			}catch(FileNotFoundException e){e.printStackTrace() }
			
			if(doubanString==null){
				println "error doubanString null"
				redirect(uri: "/book/index")
				return}
			JSONObject json = JSON.parseObject(doubanString)
			def bookInstance = Book.findByIsbn13(json.isbn13)
			//println bookInstance
			if(bookInstance==null){
				bookInstance= new Book()
				bookInstance.isbn13= json.isbn13
				bookInstance.title= json.title
		
				if (bookInstance.hasErrors()) {
					respond bookInstance.errors, view:'create'
					return
				}
				//bookInstance.save flush:true
			}
			books.add(bookInstance)
		}else{
			String url='https://api.douban.com/v2/book/search?q='+params.searchString
			String doubanString
			try{
				doubanString=url.toURL().text
			}catch(FileNotFoundException e){e.printStackTrace() }
			
			if(doubanString==null){
				println "error doubanString null"
				redirect(uri: "/book/index")
				return}
			
			JSONObject json = JSON.parseObject(doubanString)
			//println "json.books:"+json.books//json.books si JSONArray
			Iterator jsonIter = json.books.iterator()
			while(jsonIter.hasNext()){
				JSONObject jsonABook=jsonIter.next()
				//println "jsonaa.isbn13:"+jsonABook.isbn13
				//println "jsonaa.title:"+jsonABook.title
				def bookInstance = Book.findByIsbn13(jsonABook.isbn13)
				//println bookInstance
				if(bookInstance==null){
					bookInstance= new Book()
					bookInstance.isbn13= jsonABook.isbn13
					bookInstance.title= jsonABook.title
					
					if (bookInstance.hasErrors()) {
						respond bookInstance.errors, view:'create'
						return
					}
					bookInstance.save flush:true
				}
				books.add(bookInstance)
			}
		}
		//redirect( action: "index", method: "GET")//,params:['id':bookInstance.id]
		println "books.size()"+books.size()
		render(view: "index", model: [bookInstanceList:books,bookInstanceCount: books.size()])
		//respond books, model:[bookInstanceCount: books.count()]//Book.list(params)
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
