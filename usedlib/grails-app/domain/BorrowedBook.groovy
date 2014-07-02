import java.util.Date;


class BorrowedBook {
	ShiroUser owner
	ShiroUser borrower
	Book book
	int borrowStatus //5已退还4已借阅3正在交易2未处理 1同意借 0 不同意借//需设计一个状态机
	Date dateCreated
	Date dateBack
	
    static constraints = {
		owner(nullable:false,blank:true)
		borrower(nullable:false,blank:true)
		book(nullable:false,blank:true)
		borrowStatus(nullable:true,blank:true)
		dateCreated(nullable:true,blank:true)
		dateBack(nullable:true,blank:true)
    }
}
