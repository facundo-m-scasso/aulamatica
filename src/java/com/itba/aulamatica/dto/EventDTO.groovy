package com.itba.aulamatica.dto

import org.bson.types.ObjectId;
import org.joda.time.LocalTime;

class EventDTO {
	ObjectId id
	String room
	String code
	String name
	String commission
	String from
	String to
	Boolean extraord
}
