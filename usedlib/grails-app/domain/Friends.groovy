class Friends {
	ShiroUser friend
	ShiroUser user
	static belongsTo=ShiroUser
	
    static constraints = {
		friend(blank:false, nullable:false)
		user(blank:false, nullable:false)
    }
}
