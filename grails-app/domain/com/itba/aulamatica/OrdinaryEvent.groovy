package com.itba.aulamatica

import org.bson.types.ObjectId;
import org.joda.time.LocalTime;

class OrdinaryEvent {

	ObjectId id;
	String room;
	Integer day;
	LocalTime from;
	LocalTime to;
	String courseCode;
	String courseName;
	String commission;
	Integer quota;
	Integer enrolled;
	Boolean curricular;
	
	static mapWith = "mongo"
	
    static constraints = {
    }
}
