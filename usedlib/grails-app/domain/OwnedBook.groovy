import java.util.Date;

class OwnedBook {
	Book book
	ShiroUser user
	static belongsTo=ShiroUser
	Date dateCreated
	
    static constraints = {
		book(nullable:false, blank:false)
		user(nullable:false, blank:false)
		dateCreated(nullable:false, blank:false)
    }
}
