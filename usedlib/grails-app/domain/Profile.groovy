class Profile {
	String bAvatar//ͷ��
	String mAvatar
	String sAvatar
	String realname
	String gpsLongitude//����
	String gpsLatitude//γ��	
	String province
	String city
	String dist //��
	String community //����
	String suite    //¥����,������������ʾ������Ϊ�Ƽ�ʹ�á�
	String weibo
	String qq
	String weixin
	
	static belongsTo =[user :ShiroUser]
    static constraints = {
    }
}
