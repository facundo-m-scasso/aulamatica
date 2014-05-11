<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">Eventos en tiempo real para ${day} ${date} a las ${time}</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th>Codigo</th>
		<th>Materia</th>
		<th>Comision</th>
		<th>Inicio</th>
		<th>Fin</th>
		<th>Aula</th>
		</tr>
		<g:each in="${events}" var="event" status="i">
		    <tr>
		    	<td>${event.code}</td>
		    	<td>${event.name}</td>
		    	<td>${event.commission}</td>
		    	<td>${event.from}</td>
		    	<td>${event.to}</td>
		    	<td>${event.room}</td>
		    </tr>
		</g:each>
	</table>
</div>