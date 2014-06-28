class ShiroUser {
    String username
    String passwordHash
	String email
	Profile profile
	String huoyuedu//�����Ծ���˵�ͼ�������Ƽ�
	String loginCount
	String deleted
	
    static hasMany = [roles: ShiroRole, permissions: String,
					  borrowedBookOwner:BorrowedBook,own:OwnedBook,
					  sendMessages:Messages,readStatuses:ReadStatus,friends:Friends]
	static mappedBy=[borrowedBookOwner:"owner",sendMessages:"sender",friends:"user"]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
		passwordHash(nullable: false, blank: false,size:6..70)
		email(nullable:true,blank:false,unique:true,email: true)
		profile(nullable:true,blank:false)
		huoyuedu(nullable: true, blank: false)
		loginCount(nullable: true, blank: false)
		deleted(nullable: true, blank: false)
    }
}
