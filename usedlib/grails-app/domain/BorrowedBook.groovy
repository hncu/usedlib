
class BorrowedBook {
	ShiroUser owner
	ShiroUser borrower
	Book book
	
    static constraints = {
		owner(nullable:false,blank:true)
		borrower(nullable:false,blank:true)
		book(nullable:false,blank:true)
    }
}
