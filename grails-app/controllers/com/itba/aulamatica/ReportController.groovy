package com.itba.aulamatica

import grails.validation.Validateable;

import java.util.concurrent.TimeUnit;

import org.joda.time.DateTime;
import org.joda.time.DateTimeConstants;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationFieldType;
import org.joda.time.LocalDate;
import org.joda.time.LocalTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.itba.aulamatica.dto.CalendarEvent;
import com.itba.aulamatica.dto.Collision;
import com.itba.aulamatica.dto.Deficit;
import com.itba.aulamatica.dto.EventDTO;
import com.itba.aulamatica.dto.TetrisItem;
import com.sun.tools.jdi.JDWP.EventRequest.Set.Modifier.Count;

class ReportController {

	def days = [1: 'Lunes', 2:'Martes', 3:'Miercoles',4:'Jueves',5:'Viernes',6:'Sabado',7:'Domingo']
	DateTimeFormatter dtf = DateTimeFormat.forPattern("dd/MM/yyyy");

	def availableRooms = {
		ArrayList<Set<Room>> rooms = new ArrayList<HashSet<Room>>(14);
		List<Room> dbrooms = Room.findAllByCapacityGreaterThan(0)
		DateTime d = getDate(params.date)
		for(i in 0..13) {
			rooms[i] = new HashSet<Room>()
			rooms[i].addAll(dbrooms)
		}
		ArrayList<Set<Room>> notAvailable = getNotAvailableRooms(d)
		notAvailable.eachWithIndex { o, j ->
			o.each { r ->
				rooms[j].remove(r)
			}
		}
		[availableRooms: rooms, date: dtf.print(d), day: days[d.getDayOfWeek()]]
	}
	
	def roomCalendar = {
		if(params.room)
		{
			DateTime monday = getDate(params.date).weekOfWeekyear().roundFloorCopy()
			ArrayList<CalendarEvent> calendar = new ArrayList<CalendarEvent>()
			Integer totalHoursWeek = new Integer(14 * 5)
			Integer consume = new Integer(0)
			for(i in 0..4)
			{	
				DateTime otherDay = monday.withFieldAdded(DurationFieldType.days(), i)
				def extraord = ExtraOrdinaryEvent.findAllByDateAndRoom(otherDay, params.room)
				extraord.each {
					CalendarEvent c = new CalendarEvent([eventName: it.courseCode + ' - ' + it.courseName,
						day: otherDay.getDayOfMonth(), month: otherDay.getMonthOfYear(), year: otherDay.getYear(),
						hourFrom: it.from.getHourOfDay() + 3, minuteFrom: it.from.getMinuteOfHour(), 
						hourTo: it.to.getHourOfDay() + 3, minuteTo: it.to.getMinuteOfHour()
						])
					consume += c.hourTo - c.hourFrom
					calendar.add(c)
				}
				def ord = OrdinaryEvent.findAllByDayAndRoom(otherDay.getDayOfWeek(), params.room)
				ord.each {
					CalendarEvent c = new CalendarEvent([eventName: it.courseCode + ' - ' + it.courseName + '(' + it.commission + ')',
						day: otherDay.getDayOfMonth(), month: otherDay.getMonthOfYear(), year: otherDay.getYear(),
						hourFrom: it.from.getHourOfDay() + 3, minuteFrom: it.from.getMinuteOfHour(), 
						hourTo: it.to.getHourOfDay() + 3, minuteTo: it.to.getMinuteOfHour()
						])
					consume += c.hourTo - c.hourFrom
					calendar.add(c)
				}
			}
			[consume: consume, free: totalHoursWeek - consume, events: calendar, room: params.room, monday: dtf.print(monday), friday: dtf.print(monday.withFieldAdded(DurationFieldType.days(), 4))]
		}
	}
	
	def notAvailableRooms = {
		DateTime d = getDate(params.date)
		[notAvailableRooms: getNotAvailableRooms(d), date: dtf.print(d), day: days[d.getDayOfWeek()]]
	}
	def simulationDate = {
		DateTime d = getDate(params.date)
		LocalTime t = new LocalTime(8, 0)
		if(d.dayOfYear == new DateTime().dayOfYear) {
			t = getTime(params.time)
		}
		redirect(action:'realTime', params:[date: dtf.print(d), time: getTimeString(t, true)])
	}
	def realTime = {
		DateTime d = getDate(params.date)
		LocalTime t = getTime(params.time)
		[events: getEvents(d, t), date: dtf.print(d), day: days[d.getDayOfWeek()], time: getTimeString(t, true)]
	}
	def nextDay = {
		DateTime d = new DateTime().withFieldAdded(DurationFieldType.days(), 1)
		LocalTime t = new LocalTime(8, 0)
		redirect(action:'realTime', params:[date: dtf.print(d), time: getTimeString(t, true)])
	}
	def occupationalFactor = {
		DateTime monday = getDate(params.date).weekOfWeekyear().roundFloorCopy(); 
		int cant = 0, sum = 0
		def rooms = Room.findAllByCapacityGreaterThan(0)
		def occupationalFactorOccupied = ['Lunes':[], 'Martes':[], 'Miercoles':[], 'Jueves':[], 'Viernes':[], 'Total':[], '%':[]]
		def occupationalFactorFree = ['Lunes':[], 'Martes':[], 'Miercoles':[], 'Jueves':[], 'Viernes':[], 'Total':[], '%':[]]
		def occupationalFactorChairOccupied = ['Lunes':[], 'Martes':[], 'Miercoles':[], 'Jueves':[], 'Viernes':[], 'Total':[], '%':[]]
		def occupationalFactorChairFree = ['Lunes':[], 'Martes':[], 'Miercoles':[], 'Jueves':[], 'Viernes':[], 'Total':[], '%':[]]
		Integer[] totalOccupied = new Integer[14]
		Integer[] percentageOccupied = new Integer[14]
		Integer[] totalFree = new Integer[14]
		Integer[] percentageFree = new Integer[14]
		Integer[] totalChairOccupied = new Integer[14]
		Integer[] percentageChairOccupied = new Integer[14]
		Integer[] totalChairFree = new Integer[14]
		Integer[] percentageChairFree = new Integer[14]
		for (i in 0..13) {
			totalChairFree[i] = percentageChairFree[i] = totalChairOccupied[i] = percentageChairOccupied[i] = totalOccupied[i] = percentageOccupied[i] = totalFree[i] = percentageFree[i] = new Integer(0)
		}
		rooms.each {
			cant++
			sum += it.capacity
		}
		
		for(i in 0..4)
		{
			Integer[] forThis = new Integer[14]
			Integer[] forThisChair = new Integer[14]
			for(k in 0..13)
			{
				forThisChair[k] = new Integer(0)
			}
			ArrayList<Set<Room>> notAvailable = getNotAvailableRooms(monday.withFieldAdded(DurationFieldType.days(), i))
			notAvailable.eachWithIndex { r, j ->
				forThis[j] = r.size()
				totalOccupied[j] += r.size()
				r.each {
					totalChairOccupied[j] += it.capacity
					forThisChair[j] += it.capacity
				}
			}
			occupationalFactorOccupied[days[i+1]] = forThis;
			occupationalFactorChairOccupied[days[i+1]] = forThisChair;
		}
		
		occupationalFactorOccupied.each { key, value ->
			Integer[] forThis = new Integer[14]
			value.eachWithIndex { n, j ->
				forThis[j] = cant - n
				totalFree[j] += cant - n
			}
			occupationalFactorFree[key] = forThis
		}
		
		occupationalFactorChairOccupied.each { key, value ->
			Integer[] forThis = new Integer[14]
			value.eachWithIndex { n, j ->
				forThis[j] = sum - n
				totalChairFree[j] += sum - n
			}
			occupationalFactorChairFree[key] = forThis
		}
		
		totalOccupied.eachWithIndex { n, i ->
			percentageOccupied[i] = (n-1)/5
			percentageOccupied[i] *= (100/cant)
		}
		
		totalFree.eachWithIndex { n, i ->
			percentageFree[i] = (n-1)/5
			percentageFree[i] *= (100/cant)
		}
		
		totalChairOccupied.eachWithIndex { n, i ->
			percentageChairOccupied[i] = (n-1)/5
			percentageChairOccupied[i] *= (100/sum)
		}
		
		totalChairFree.eachWithIndex { n, i ->
			percentageChairFree[i] = (n-1)/5
			percentageChairFree[i] *= (100/sum)
		}
		
		occupationalFactorOccupied["Total"] = totalOccupied;
		occupationalFactorOccupied["%"] = percentageOccupied;
		occupationalFactorFree["Total"] = totalFree;
		occupationalFactorFree["%"] = percentageFree;
		occupationalFactorChairOccupied["Total"] = totalChairOccupied;
		occupationalFactorChairOccupied["%"] = percentageChairOccupied;
		occupationalFactorChairFree["Total"] = totalChairFree;
		occupationalFactorChairFree["%"] = percentageChairFree;

		[occupationalFactorChairOccupied: occupationalFactorChairOccupied, occupationalFactorChairFree: occupationalFactorChairFree, 
			occupationalFactorOccupied: occupationalFactorOccupied, occupationalFactorFree: occupationalFactorFree, 
			totalCapacity: sum, totalRooms: cant, monday: dtf.print(monday), 
			friday: dtf.print(monday.withFieldAdded(DurationFieldType.days(), 4))]
	}
	
	def tetris = {
		DateTime d = getDate(params.date)
		String dayName = days[d.getDayOfWeek()]
		[tetris: getTetris(d), day: dayName, date: dtf.print(d)]
	}
	
	def scheduleView = {
		DateTime d = getDate(params.date)
		String dayName = days[d.getDayOfWeek()]
		[tetris: getTetris(d), day: dayName, date: dtf.print(d), dateTime: d]
	}

	def collisions = {
		DateTime d = getDate(params.date)
		String dayName = days[d.getDayOfWeek()]
		ArrayList<TetrisItem> tetris = getTetris(d)
		ArrayList<Collision> collisions = new ArrayList<Collision>()
		tetris.each {
			it.events.eachWithIndex { e, i ->
				if(e.split("/").length > 1)
				{
					String timeTo = (i%2 == 0 ? ((i/2) + 8) + ":30" : (((i+1)/2) + 8) + ":00")
					boolean exists = false
					collisions.each{ c ->
						if(c.room.equals(it.roomName) && c.events.equals(e))
						{
							c.to = timeTo
							exists = true;
						}
					}
					if(!exists)
					{
						collisions.add(new Collision([room: it.roomName, events: e,
							from: (i%2 == 0 ? ((i/2) + 8) + ":00" : (((i-1)/2) + 8) + ":30"), to: timeTo]))
					}
				}
			}	
		}
		[collisions: collisions, day: dayName, date: dtf.print(d)]
	} 
	
	def deficits = {
		DateTime d = getDate(params.date)
		String dayName = days[d.getDayOfWeek()]
		ArrayList<Deficit> deficits = new ArrayList<Deficit>()
		def rooms = Room.findAllByCapacityGreaterThan(0)
		rooms.each {
			// Agregar enrolled a extraordinarios!!! def extra = ExtraOrdinaryEvent.findAllByRoomAndDate(it.name, d)
			def ord = OrdinaryEvent.findAllByRoomAndDay(it.name, d.getDayOfWeek())
			ord.each { ev ->
				if(ev.enrolled > it.capacity)
				{
					deficits.add(new Deficit([room: it.name, capacity: it.capacity,
						enrolled: ev.enrolled, name: ev.courseCode + ' - ' + ev.courseName + ' (' + ev.commission + ')',
						from: getTimeString(ev.from, false),
						to: getTimeString(ev.to, false)
						]))
				}
			}
		}
		[deficits: deficits, day: dayName, date: dtf.print(d)]
	}
	
	def bookingRoom = {
		DateTime d = getDate(params.date)
		String dayName = days[d.getDayOfWeek()]
		Integer capacity = Integer.parseInt(params.capacity)
		LocalTime tf = new LocalTime(8, 0)
		LocalTime tt = new LocalTime(10, 0)
		if(d.dayOfYear == new DateTime().dayOfYear || params.timeFrom || params.timeTo) {
			tf = getTime(params.timeFrom)
			tt = getTime(params.timeTo)
		}
		int min = ((tf.getHourOfDay() - 8)*2) + ((tf.getMinuteOfHour() > 0) ? 1 : 0)
		int max = ((tt.getHourOfDay() - 8)*2) + ((tt.getMinuteOfHour() > 0) ? 1 : 0)
		ArrayList<TetrisItem> tetris = getTetris(d)
		def items = tetris.findAll{t -> Integer.parseInt(t.roomCapacity) >= capacity}
		def cant = []
		items.eachWithIndex { t, i ->
			if(Integer.parseInt(t.roomCapacity) >= capacity && verifyHour(t.events, min, max)) {
				cant << i
			}
		}
		[allows: cant, capacity:capacity, tetris: items, day: dayName, date: dtf.print(d), from: getTimeString(tf, true), to: getTimeString(tt, true), min: min, max: max]
	}
	
	def confirmBookingRoom = {
		[capacity: params.capacity, room: params.room, roomCapacity: params.roomCapacity, 
			day: params.day, date: params.date, from: params.from, to: params.to]
	}
	
	def prebooking = {
		LocalDate startDate = new LocalDate(2011, 11, 8);
		LocalDate endDate = new LocalDate(2012, 5, 1);
		
		LocalDate thisMonday = startDate.withDayOfWeek(DateTimeConstants.MONDAY);
		
		if (startDate.isAfter(thisMonday)) {
			startDate = thisMonday.plusWeeks(1); // start on next monday
		} else {
			startDate = thisMonday; // start on this monday
		}
		
		while (startDate.isBefore(endDate)) {
			System.out.println(startDate);
			startDate = startDate.plusWeeks(1);
		}
	}
	
	public boolean verifyHour(String[] events, int from, int to)
	{
		for(i in from..to-1)
		{
			if(!events[i].equals('')) return false
		}
		return true;
	}
	
	public String getTimeString(LocalTime t, boolean zone) {
		return (t.getHourOfDay() < (zone ? 10 : 7) ? "0" : "") + (t.getHourOfDay() + (zone ? 0 : 3)) + ":" +
		(t.getMinuteOfHour() < 10 ? "0" : "") + t.getMinuteOfHour()
	}
	
	public DateTime getDate(def d)
	{
		DateTime date = new DateTime()
		if(d) {
			date = dtf.parseDateTime(d);
		}
		return date;
	}
	
	public LocalTime getTime(def t)
	{
		DateTime d = new DateTime()
		LocalTime time = new LocalTime(d.getHourOfDay(), d.getMinuteOfHour())
		if(t) {
			def ts = t.split(':')
			time = new LocalTime(Integer.parseInt(ts[0]), Integer.parseInt(ts[1]))
		}
		return time;
	}
	
	public ArrayList<Set<Room>> getNotAvailableRooms(DateTime date) {
		
		List<Room> dbrooms = Room.findAllByCapacityGreaterThan(0)
		ArrayList<Set<Room>> rooms = new ArrayList<HashSet<Room>>(14);
		for(i in 0..13) {
			rooms[i] = new HashSet<Room>()
		}
		for(Room r : dbrooms) {
			List<ExtraOrdinaryEvent> extra = ExtraOrdinaryEvent.findAllByRoomAndDate(r.getName(), date)
			extra.each {
				// para la base de datos soy GTM -3 -> +3
				// Arranco desde las 8am -> Pos x = X -8 / Pos 5 = 13hs - 8
				int min = it.getFrom().getHourOfDay() - 8 + 3
				int max = it.getTo().getHourOfDay() - 8 + 3
				for(int i = min; i < max; i++) {
					rooms[i].add(r)
				}
			}
			List<OrdinaryEvent> ord = OrdinaryEvent.findAllByRoomAndDay(r.getName(), date.getDayOfWeek())
			ord.each {
				// para la base de datos soy GTM -3
				int min = it.getFrom().getHourOfDay() - 8 + 3
				int max = it.getTo().getHourOfDay() - 8 + 3
				for(int i = min; i < max; i++) {
					rooms[i].add(r)
				}
			}
		}
		return rooms
	}
	
	public ArrayList<EventDTO> getEvents(DateTime d, LocalTime t)
	{
		List<EventDTO> events = new ArrayList<EventDTO>()
		def extra = ExtraOrdinaryEvent.findAllByDateAndToGreaterThan(d, t)
		extra.each {
			events.add(new EventDTO([code: it.courseCode, name: it.courseName, commission: '',
				from: getTimeString(it.from, false), to: getTimeString(it.to, false), room: it.room, extraord: true]))
		}
		def ord = OrdinaryEvent.findAllByDayAndToGreaterThan(d.getDayOfWeek(), t)
		ord.each {
			events.add(new EventDTO([code: it.courseCode, name: it.courseName, commission: it.commission,
				from: getTimeString(it.from, false), to: getTimeString(it.to, false), room: it.room, extraord: false]))
		}
		
		events.sort { a, b -> a.from.equals(b.from) ? a.to.compareTo(b.to) : a.from.compareTo(b.from) }
	}
	
	public ArrayList<TetrisItem> getTetris(DateTime d)
	{
		String dayName = days[d.getDayOfWeek()]
		List<TetrisItem> tetris = new ArrayList<TetrisItem>()
		def rooms = Room.findAllByCapacityGreaterThan(0)
		rooms.each {
			TetrisItem ti = new TetrisItem()
			ti.roomName = it.name
			ti.roomCapacity = it.capacity
			ti.day = dayName
			ti.events = new String[28]
			for(i in 0..27)
			{
				ti.events[i] = ''
			}
			List<ExtraOrdinaryEvent> extra = ExtraOrdinaryEvent.findAllByRoomAndDate(it.name, d)
			extra.each { e ->
				int min = ((e.from.getHourOfDay() - 8 + 3)*2) + ((e.from.getMinuteOfHour() > 0) ? 1 : 0)
				int max = ((e.to.getHourOfDay() - 8 + 3)*2) + ((e.to.getMinuteOfHour() > 0) ? 1 : 0)
				for(int i = min; i < max; i++) {
					if(!ti.events[i].equals('')) {
						ti.events[i] += '/'
					}
					ti.events[i] += e.courseName
				}
			}
			List<OrdinaryEvent> ord = OrdinaryEvent.findAllByRoomAndDay(it.name, d.getDayOfWeek())
			ord.each {e ->
				int min = ((e.from.getHourOfDay() - 8 + 3)*2) + ((e.from.getMinuteOfHour() > 0) ? 1 : 0)
				int max = ((e.to.getHourOfDay() - 8 + 3)*2) + ((e.to.getMinuteOfHour() > 0) ? 1 : 0)
				for(int i = min; i < max; i++) {
					if(!ti.events[i].equals('')) {
						ti.events[i] += '/'
					}
					ti.events[i] += e.courseCode + " - " + e.commission + " (" + e.enrolled + ") "
				}
			}
			tetris.add(ti)
		}
		return tetris
	}
}