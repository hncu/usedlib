

class Book {
	//String title
	//String isbn13
	//String author
	//String publisher
	//String pubdate
	//String summary
	//String imageUrl
	//String tags
	
	String rating
	String subtitle
	String author
	String pubdate
	String tags
	String origin_title
	String image
	String binding
	String translator
	String catalog
	String pages
	String images
	String alt
	String doubanid
	String publisher
	String isbn10
	String isbn13
	String title
	String url
	String alt_title
	String author_intro
	String summary
	String price
	
	String discount
	String discountPrice
	String recentness //new old degree
	
	String toString(){	title	}
	
    static constraints = {
		title(nullable:false, blank:false,  unique:false)
		isbn13(nullable:false, blank:false, unique:false)
		author(nullable:true)
		publisher(nullable:true)
		pubdate(nullable:true)
		summary(nullable:true)
		tags(nullable:true)
		origin_title(nullable:true)
		rating(nullable:true)
		subtitle(nullable:true)
		image(nullable:true)
		binding(nullable:true)
		translator(nullable:true)
		catalog(nullable:true)
		pages(nullable:true)
		images(nullable:true)
		alt(nullable:true)
		doubanid(nullable:true)
		isbn10(nullable:true)
		url(nullable:true)
		alt_title(nullable:true)
		author_intro(nullable:true)
		summary(nullable:true)
		price(nullable:true)
		
		discount(nullable:true)
		discountPrice(nullable:true)
		recentness(nullable:true) //new old degree
    }
}
