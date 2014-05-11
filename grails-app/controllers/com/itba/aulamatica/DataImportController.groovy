package com.itba.aulamatica;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.LocalTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

class DataImportController {
	def grailsApplication

	static layout = "main"

	def index = {
	}

	def importData = {
		String prueba = ""
		if(params.rooms) {
			File f = new File(grailsApplication.config.csv.location.toString() + "/rooms.csv")
			int rooms = 0
			if(f.exists()) {
				f.eachCsvLine { field ->
					Room r = new Room()
					r.name = field[0];
					r.capacity = 0
					if(field[1] && field[1] != '') {
						r.capacity = Integer.parseInt(field[1]);
					}
					r.exam_capacity = 0
					if(field[2] && field[2] != '') {
						r.exam_capacity = Integer.parseInt(field[1]);
					}
					r.use = field[3];
					r.localization = field[4];
					r.comments = field[6];
					r.save()
					rooms++;
				}
			}
			prueba += "<p>Se agregaron ${rooms} Aulas.</p>"
		}
		if(params.courses) {
			File fs = new File(grailsApplication.config.csv.location.toString() + "/subjects.csv")
			int courses = 0
			if(fs.exists()) {
				fs.eachCsvLine { field ->
					Course c = new Course([code : field[0], name : field[1], level : field[2], 
						department : field[3], period : field[4], year : field[5],
						active : (field[6] && field[6].toUpperCase() == 'SI') ? true : false,
						quota : (field[7] && field[7] != '') ? Integer.parseInt(field[7]) : 0])
					c.save()
					courses++;
				}
			}
			prueba += "<p>Se agregaron ${courses} Cursos.</p>"
		}
		if(params.events) {
			File foe = new File(grailsApplication.config.csv.location.toString() + "/ordinarios_extracurriculares.csv")
			int eventosExtraCurriculares = 0
			if(foe.exists()) {
				foe.eachCsvLine { field ->
					def timeFrom = field[2].toString().split(':')
					LocalTime from = new LocalTime(Integer.parseInt(timeFrom[0]), Integer.parseInt(timeFrom[1]))
					def timeTo = field[3].toString().split(':')
					LocalTime to = new LocalTime(Integer.parseInt(timeTo[0]), Integer.parseInt(timeTo[1]))
					OrdinaryEvent event = new OrdinaryEvent([
						room: field[0],
						day: (field[1] && field[1] != '') ? Integer.parseInt(field[1]) : 0,
						from: from,
						to: to,
						courseCode: field[4],
						courseName: field[5],
						commission: field[6],
						quota: (field[7] && field[7] != '') ? Integer.parseInt(field[7]) : 0,
						enrolled: (field[8] && field[8] != '') ? Integer.parseInt(field[8]) : 0,
						curricular: false])
					event.save()
					eventosExtraCurriculares++;
				}
			}
			prueba += "<p>Se agregaron ${eventosExtraCurriculares} Eventos Extracurriculares.</p>"
			File feo = new File(grailsApplication.config.csv.location.toString() + "/extraordinarios.csv")
			int eventosExtraOrdinarios = 0
			if(feo.exists()) {
				feo.eachCsvLine { field ->
					DateTimeFormatter dtf = DateTimeFormat.forPattern("dd/MM/yyyy");
					DateTime jodatime = dtf.parseDateTime(field[4]);
					def timeFrom = field[5].toString().split(':')
					LocalTime from = new LocalTime(Integer.parseInt(timeFrom[0]), Integer.parseInt(timeFrom[1]))
					def timeTo = field[6].toString().split(':')
					LocalTime to = new LocalTime(Integer.parseInt(timeTo[0]), Integer.parseInt(timeTo[1]))
					ExtraOrdinaryEvent event = new ExtraOrdinaryEvent([room: field[0],
						courseCode: field[1],
						courseName: field[2],
						day: (field[3] && field[3] != '') ? Integer.parseInt(field[3]) : 0,
						date: jodatime,
						from: from,
						to: to])
					event.save()
					eventosExtraOrdinarios++;
				}
			}
			prueba += "<p>Se agregaron ${eventosExtraOrdinarios} Eventos Extraordinarios.</p>"
			File foc = new File(grailsApplication.config.csv.location.toString() + "/ordinarios_curriculares.csv")
			int eventosCurriculares = 0
			if(foc.exists()) {
				foc.eachCsvLine { field ->
					def timeFrom = field[2].toString().split(':')
					LocalTime from = new LocalTime(Integer.parseInt(timeFrom[0]), Integer.parseInt(timeFrom[1]))
					def timeTo = field[3].toString().split(':')
					LocalTime to = new LocalTime(Integer.parseInt(timeTo[0]), Integer.parseInt(timeTo[1]))
					OrdinaryEvent event = new OrdinaryEvent([
						room: field[0],
						day: (field[1] && field[1] != '') ? Integer.parseInt(field[1]) : 0,
						from: from,
						to: to,
						courseCode: field[4],
						courseName: field[5],
						commission: field[6],
						quota: (field[7] && field[7] != '') ? Integer.parseInt(field[7]) : 0,
						enrolled: (field[8] && field[8] != '') ? Integer.parseInt(field[8]) : 0,
						curricular: true])
					event.save()
					eventosCurriculares++;
				}
			}
			prueba += "<p>Se agregaron ${eventosCurriculares} Eventos Curriculares.</p>"
		}
		render prueba
	}
}
