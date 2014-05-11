package com.itba.aulamatica

import org.bson.types.ObjectId;

class Room {

	ObjectId id;
	String name;
	Integer capacity;
	Integer exam_capacity;
	String use;
	String localization;
	String comments;
	
	public boolean equals(Object other) {
		if (other == null || other.getClass() != this.getClass()) {
           return false;
        }
        return ((Room)other).id == this.id;
	}
	
	public int hashCode(){
		if(id != null) return id.time
		return super.hashCode()
	}
	
	static mapWith = "mongo"
	
    static constraints = {
    }
}
