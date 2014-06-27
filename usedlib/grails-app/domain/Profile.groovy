class Profile {
	String location

	static belongsTo =[user :ShiroUser]
    static constraints = {
    }
}
