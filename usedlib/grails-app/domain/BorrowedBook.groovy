import java.util.Date;


class BorrowedBook {
	ShiroUser owner
	ShiroUser borrower
	Book book
	int borrowStatus //5���˻�4�ѽ���3���ڽ���2δ���� 1ͬ��� 0 ��ͬ���//�����һ��״̬��
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
