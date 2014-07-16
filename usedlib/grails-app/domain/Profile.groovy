class Profile {
	String bAvatar//头像
	String mAvatar
	String sAvatar
	String realname
	String gpsLongitude//经度
	String gpsLatitude//纬度	123456	todo
	String province
	String city
	String dist //区
	String community //社区
	String suite    //楼房号,不向其他人显示，仅作为推荐使用。
	String weibo
	String qq
	String weixin
	
	static belongsTo =[user :ShiroUser]
    static constraints = {
		bAvatar(nullable:true, blank:true)
		mAvatar(nullable:true, blank:true)
		sAvatar(nullable:true, blank:true)
		realname(nullable:true, blank:true)
		gpsLongitude(nullable:true, blank:true)
		gpsLatitude(nullable:true, blank:true)
		province(nullable:true, blank:true)
		city(nullable:true, blank:true)
		dist(nullable:true, blank:true)
		community(nullable:true, blank:true)
		suite(nullable:true, blank:true)
		weibo(nullable:true, blank:true)
		qq(nullable:true, blank:true)
		weixin(nullable:true, blank:true)
    }
}
