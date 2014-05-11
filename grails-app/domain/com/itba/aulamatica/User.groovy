package com.itba.aulamatica

import org.bson.types.ObjectId

class User {

	ObjectId id
	String name
	String password
	String mail
	Date created = new Date()
	
	static mapWith = "mongo"
	
    static constraints = {
		name size: 5..15, blank: false, unique: true
		password size: 5..15, blank: false
		mail email: true, blank: false
    }
}
