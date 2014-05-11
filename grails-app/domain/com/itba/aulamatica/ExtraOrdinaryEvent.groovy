package com.itba.aulamatica

import org.bson.types.ObjectId;
import org.joda.time.DateTime;
import org.joda.time.LocalTime;

class ExtraOrdinaryEvent {

	ObjectId id;
	String room;
	String courseCode;
	String courseName;
	Integer day;
	DateTime date;
	LocalTime from;
	LocalTime to;
	
	static mapWith = "mongo"
	
	static constraints = {
	}
}
