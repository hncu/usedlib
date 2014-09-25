class Friends {
	ShiroUser friend
	ShiroUser user
	static belongsTo=ShiroUser
	int status=1 //1:request 2:respond ok 3:
	
	String toString(){	friend	}//todo knight
	
    static constraints = {
		friend(blank:false, nullable:false)
		user(blank:false, nullable:false)
    }
}
