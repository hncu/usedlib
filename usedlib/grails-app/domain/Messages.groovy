import java.util.Date;

class Messages {
	ShiroUser sender
	ShiroUser receiver
	String message
	Boolean statue
	Date dateCreated
	BorrowedBook borrowedMessage
	
    static constraints = {
		sender(nullable:false,blank:false)
		receiver(nullable:false,blank:false)
		message(nullable:false)//����գ������н��������Ϣ
		statue(nullable:true,blank:false)
		borrowedMessage(nullable:true,blank:false)
    }
}
