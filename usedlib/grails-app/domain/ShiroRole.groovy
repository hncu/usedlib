class ShiroRole {
    String name

    static hasMany = [ users: ShiroUser, permissions: String ]
    static belongsTo = ShiroUser

	String toString(){name}
	
    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
