<h1>Eventos en tiempo real para ${day} ${date} a las ${time} </h1>
<table>
	<thead>
		<th>Codigo</th>
		<th>Materia</th>
		<th>Comision</th>
		<th>Inicio</th>
		<th>Fin</th>
		<th>Aula</th>
	</thead>
	<tbody>
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
	</tbody>
</table>