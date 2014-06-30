

class Book {
	String title
	String isbn13
	String author
	String publisher
	String pubdate
	String summary
	String imageUrl
	String tags
	
    static constraints = {
		title(nullable:false, blank:false,  unique:false)
		isbn13(nullable:false, blank:false, unique:false)
		author(nullable:true)
		publisher(nullable:true)
		pubdate(nullable:true)
		summary(nullable:true)
		imageUrl(nullable:true)
		tags(nullable:true)
    }
}
