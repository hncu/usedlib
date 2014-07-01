import java.util.Date;

class OwnedBook {
	Book book
	ShiroUser user
	static belongsTo=ShiroUser
	Date dateCreated
	
	String toString(){book.title}
	
    static constraints = {
		book(nullable:false, blank:false)
		user(nullable:false, blank:false)
		dateCreated(nullable:true, blank:false)//添加用户id&&书id一致的约束。
    }
}
