class Profile {
	ShiroUser user
	String bAvatar//ͷ��
	String mAvatar
	String sAvatar
	String realname
	//String gpsLongitude//����
	//String gpsLatitude//γ��	123456	todo
	String province
	String city
	String dist //��
	String community //����
	String suite    //¥����,������������ʾ������Ϊ�Ƽ�ʹ�á�
	String weibo
	String qq
	String weixin
    static constraints = {
		bAvatar(nullable:true, blank:true)
		mAvatar(nullable:true, blank:true)
		sAvatar(nullable:true, blank:true)
		realname(nullable:true, blank:true)
		//gpsLongitude(nullable:true, blank:true)
		//gpsLatitude(nullable:true, blank:true)
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
