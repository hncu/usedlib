class OwnedBook {
	Book book
	ShiroUser user
	static belongsTo=ShiroUser

    static constraints = {
		book(nullable:false, blank:true)
    }
}
