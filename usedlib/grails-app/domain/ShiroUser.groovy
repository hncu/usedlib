class ShiroUser {
    String username
    String passwordHash
	String email
	//Profile profile
	Date signupDay
	Date lastLoginDay
	int loginCount
	int numOwnedBook=0I
	int numBorrowedBook=0I
	int numLendedBook=0I
	int numReadedBook=0I
	int huoyuedu//最近活跃的人的图书优先推荐
	int level=0I //computed from huoyuedu numOwnedBook numBorrowedBook numLendedBook numReadedBook
	int deleted
	
	String toString(){	username	}
	
	static hasOne = [profile:Profile]	
	
    static hasMany = [roles: ShiroRole, permissions: String,
					  borrowedBookOwner:BorrowedBook,own:OwnedBook,
					  sendMessages:Messages,readStatuses:ReadStatus,friends:Friends]
	static mappedBy=[borrowedBookOwner:"owner",sendMessages:"sender",friends:"user"]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
		profile(nullable:true,blank:false,unique:true)
		signupDay(nullable:true,blank:false)
		lastLoginDay(nullable:true,blank:false)
		loginCount(nullable: true, blank: false)
		numOwnedBook(nullable: true, blank: false)
		numBorrowedBook(nullable: true, blank: false)
		numLendedBook(nullable: true, blank: false)
		numReadedBook(nullable: true, blank: false)
		huoyuedu(nullable: true, blank: false)
		level(nullable: true, blank: false)
		email(nullable:true,blank:false,unique:true,email: true)
		passwordHash(nullable: false, blank: false,size:6..70)
		deleted(nullable: true, blank: false)
    }
}
