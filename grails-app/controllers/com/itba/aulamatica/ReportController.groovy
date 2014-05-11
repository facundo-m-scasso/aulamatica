package com.itba.aulamatica

import grails.validation.Validateable;

import java.util.concurrent.TimeUnit;

import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;
import org.joda.time.DurationFieldType;
import org.joda.time.LocalTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.itba.aulamatica.dto.EventDTO;
import com.itba.aulamatica.dto.TetrisItem;
import com.sun.tools.jdi.JDWP.EventRequest.Set.Modifier.Count;

class ReportController {

	def days = [1: 'Lunes', 2:'Martes', 3:'Miercoles',4:'Jueves',5:'Viernes',6:'Sabado',7:'Domingo']
	DateTimeFormatter dtf = DateTimeFormat.forPattern("dd/MM/yyyy");

	def availableRooms = {
		ArrayList<Set<Room>> rooms = new ArrayList<HashSet<Room>>(14);
		List<Room> dbrooms = Room.findAll()
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
	def notAvailableRooms = {
		DateTime d = getDate(params.date)
		[notAvailableRooms: getNotAvailableRooms(d), date: dtf.print(d), day: days[d.getDayOfWeek()]]
	}
	def simulationDate = {
		DateTime d = getDate(params.date)
		LocalTime t = getTime(params.time)
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
		Integer[] totalOccupied = new Integer[14]
		Integer[] percentageOccupied = new Integer[14]
		Integer[] totalFree = new Integer[14]
		Integer[] percentageFree = new Integer[14]
		for (i in 0..13) {
			totalOccupied[i] = percentageOccupied[i] = totalFree[i] = percentageFree[i] = new Integer(0)
		}
		rooms.each {
			cant++
			sum += it.capacity
		}
		
		for(i in 0..4)
		{
			Integer[] forThis = new Integer[14]
			ArrayList<Set<Room>> notAvailable = getNotAvailableRooms(monday.withFieldAdded(DurationFieldType.days(), i))
			notAvailable.eachWithIndex { r, j ->
				forThis[j] = r.size()
				totalOccupied[j] += r.size()
			}
			occupationalFactorOccupied[days[i+1]] = forThis;
		}
		
		occupationalFactorOccupied.each { key, value ->
			Integer[] forThis = new Integer[14]
			value.eachWithIndex { n, j ->
				forThis[j] = cant - n
				totalFree[j] += cant - n
			}
			occupationalFactorFree[key] = forThis
		}
		
		totalOccupied.eachWithIndex { n, i ->
			percentageOccupied[i] = (n-1)/5
			percentageOccupied[i] *= (100/cant)
		}
		
		totalFree.eachWithIndex { n, i ->
			percentageFree[i] = (n-1)/5
			percentageFree[i] *= (100/cant)
		}
		
		occupationalFactorOccupied["Total"] = totalOccupied;
		occupationalFactorOccupied["%"] = percentageOccupied;
		occupationalFactorFree["Total"] = totalFree;
		occupationalFactorFree["%"] = percentageFree;

		[occupationalFactorOccupied: occupationalFactorOccupied, occupationalFactorFree: occupationalFactorFree, totalCapacity: sum, totalRooms: cant, monday: dtf.print(monday), friday: dtf.print(monday.withFieldAdded(DurationFieldType.days(), 4))]
	}
	
	def tetris = {
		DateTime d = getDate(params.date)
		List<TetrisItem> tetris = new ArrayList<TetrisItem>()
		String dayName = days[d.getDayOfWeek()]
		def rooms = Room.list()
		rooms.each {
			TetrisItem ti = new TetrisItem()
			ti.roomName = it.name
			ti.roomCapacity = it.capacity
			ti.day = dayName
			ti.events = new String[29]
			for(i in 0..28)
			{
				ti.events[i] = ''
			}
			List<ExtraOrdinaryEvent> extra = ExtraOrdinaryEvent.findAllByRoomAndDate(it.name, d)
			extra.each { e ->
				int min = ((e.from.getHourOfDay() - 8 + 3)*2) + ((e.from.getMinuteOfHour() > 0) ? 1 : 0)
				int max = ((e.to.getHourOfDay() - 8 + 3)*2) + ((e.to.getMinuteOfHour() > 0) ? 1 : 0)
				for(int i = min; i < max; i++) {
					ti.events[i] += e.courseName + "/"
				}
			}
			List<OrdinaryEvent> ord = OrdinaryEvent.findAllByRoomAndDay(it.name, d.getDayOfWeek())
			ord.each {e ->
				int min = ((e.from.getHourOfDay() - 8 + 3)*2) + ((e.from.getMinuteOfHour() > 0) ? 1 : 0)
				int max = ((e.to.getHourOfDay() - 8 + 3)*2) + ((e.to.getMinuteOfHour() > 0) ? 1 : 0)
				for(int i = min; i < max; i++) {
					ti.events[i] += e.courseCode + " - " + e.commission + " (" + e.enrolled + ") /"
				}
			}
			tetris.add(ti)
		}
		[tetris: tetris, day: dayName, date: dtf.print(d)]
	}
	
	def scheduleView = {}

	public String getTimeString(LocalTime t, boolean zone) {
		return (t.getHourOfDay() < (zone ? 10 : 7) ? "0" : "") + (t.getHourOfDay() + (zone ? 0 : 3)) + ":" +
		(t.getMinuteOfHour() < 10 ? "0" : "") + t.getMinuteOfHour()
	}
	
	public DateTime getDate(def d)
	{
		DateTime date = new DateTime()
		if(d) {
			DateTimeFormatter dtf = DateTimeFormat.forPattern("dd/MM/yyyy");
			date = dtf.parseDateTime(d);
		}
		return date;
	}
	
	public LocalTime getTime(def t)
	{
		LocalTime time = new LocalTime(8, 00)
		if(t) {
			def ts = t.split(':')
			time = new LocalTime(Integer.parseInt(ts[0]), Integer.parseInt(ts[1]))
		}
		return time;
	}
	
	public ArrayList<Set<Room>> getNotAvailableRooms(DateTime date) {
		
		List<Room> dbrooms = Room.findAll()
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
}