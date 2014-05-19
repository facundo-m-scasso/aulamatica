<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">Calendario semanal para Aula: ${room} desde Lunes ${monday} a Viernes ${friday}</h3>
</div>
<h5>Horas utilizadas a la semana: ${consume}. Horas libres: ${free}</h5>
<div id="calendar"></div>

<g:javascript type="text/javascript">
	$(function() {
		"use strict";
		var colors = ["#f56954", "#f39c12", "#0073b7", "#00c0ef", "#00a65a", "#3c8dbc"];
		var calendar = $('#calendar');
        calendar.fullCalendar({
         	minTime: '08:00am',
         	maxTime: '22:00pm',
         	defaultView: 'agendaWeek',
         	events: [
         	<g:each in="${events}" var="cal" status="i">
				{
					title: '${cal.eventName}',
					start: new Date(${cal.year}, ${cal.month - 1}, ${cal.day}, ${cal.hourFrom}, ${cal.minuteFrom}),
					end: new Date(${cal.year}, ${cal.month - 1}, ${cal.day}, ${cal.hourTo}, ${cal.minuteTo}),
					allDay: false,
					backgroundColor:  colors[${i%7}],
					borderColor:  colors[${i%7}]
				}
				<g:if test="${(events.size() - 1) > i}">
					,
				</g:if>
			</g:each>
         	],
             editable: false,
             droppable: false
         }); 
         var date = '${monday}'.split('/');
         calendar.fullCalendar('gotoDate', new Date(date[2], date[1]-1, date[0]));
  	});
</g:javascript>