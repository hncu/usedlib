class ShiroUser {
    String username
    String passwordHash
	String email
	double gpsLongitude//经度112.355145
	double gpsLatitude//纬度28.559382
	Profile profile
	String huoyuedu//最近活跃的人的图书优先推荐
	String loginCount
	String deleted
	
	String toString(){	username	}
	
    static hasMany = [roles: ShiroRole, permissions: String,
					  borrowedBookOwner:BorrowedBook,own:OwnedBook,
					  sendMessages:Messages,readStatuses:ReadStatus,friends:Friends]
	static mappedBy=[borrowedBookOwner:"owner",sendMessages:"sender",friends:"user"]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
		passwordHash(nullable: false, blank: false,size:6..70)
		email(nullable:true,blank:false,unique:true,email: true)
		gpsLongitude(nullable:true,blank:false)
		gpsLatitude(nullable:true,blank:false)
		profile(nullable:true,blank:false)
		huoyuedu(nullable: true, blank: false)
		loginCount(nullable: true, blank: false)
		deleted(nullable: true, blank: false)
    }
}
