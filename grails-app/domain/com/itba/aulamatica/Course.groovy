package com.itba.aulamatica

import org.bson.types.ObjectId;

class Course {

	ObjectId id;
	String code;
	String name;
	String level;
	String department;
	String period;
	String year;
	Boolean active;
	Integer quota;
	
	static mapWith = "mongo"
	
    static constraints = {
    }
}
