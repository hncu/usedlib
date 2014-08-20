class Profile {
	ShiroUser user
	String bAvatar//头像
	String mAvatar
	String sAvatar
	String realname
	double gpsLongitude//经度112.355145
	double gpsLatitude//纬度28.559382
	String province
	String city
	String dist //区
	String community //社区
	String suite    //楼房号,不向其他人显示，仅作为推荐使用。
	String weibo
	String qq
	String weixin
    static constraints = {
		bAvatar(nullable:true, blank:true)
		mAvatar(nullable:true, blank:true)
		sAvatar(nullable:true, blank:true)
		realname(nullable:true, blank:true)
		gpsLongitude(nullable:true,blank:false)
		gpsLatitude(nullable:true,blank:false)
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
