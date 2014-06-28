class ReadStatus {
	Book book
	ShiroUser user	
	static belongsTo=ShiroUser
	int bookReadStatus //1ÔÚ¶Á£¬2ÒÑ¶Á£¬3Ïë¶Á¡£
	
    static constraints = {
		book(nullable:false, blank:false)
		user(nullable:false, blank:false)
    }
}
