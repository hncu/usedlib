class Profile {
	String bAvatar//头像
	String mAvatar
	String sAvatar
	String realname
	String gpsLongitude//经度
	String gpsLatitude//纬度	
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
    }
}
