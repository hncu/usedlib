class ReadStatus {
	Book book
	ShiroUser user	
	static belongsTo=ShiroUser
	int bookReadStatus //1�ڶ���2�Ѷ���3�����
	
    static constraints = {
		book(nullable:false, blank:false)
		user(nullable:false, blank:false)
    }
}
