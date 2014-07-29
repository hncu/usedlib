class Friends {
	ShiroUser friend
	ShiroUser user
	static belongsTo=ShiroUser
	
	String toString(){	friend	}//todo knight
	
    static constraints = {
		friend(blank:false, nullable:false)
		user(blank:false, nullable:false)
    }
}
