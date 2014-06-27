class ReadStatus {
	Book book
	ShiroUser user	
	static belongsTo=ShiroUser

    static constraints = {
		book(nullable:false, blank:false)
    }
}
