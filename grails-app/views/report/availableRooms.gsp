<meta name="layout" content="main">
<h1>${day} ${date}</h1>
<table>
<thead>
	<tr>
		<th>Inicio</th>
		<th>Fin</th>
		<th>Aulas libres</th>
	</tr>
</thead>
<tbody>
<g:each in="${availableRooms}" var="rooms" status="i">
    <tr>
   		<g:if test="${i == 0}">
   			<td>0${i+8}:00</td><td>0${i+9}:00</td>
   		</g:if>
   		<g:elseif test="${i == 1}">
   			<td>0${i+8}:00</td><td>${i+9}:00</td>
   		</g:elseif>
   		<g:elseif test="${i > 1}">
   			<td>${i+8}:00</td><td>${i+9}:00</td>
   		</g:elseif>
    	<td>
	    	<g:each in="${rooms}" var="room">
	    		${room.name} (${room.capacity}) - 
	    	</g:each>
    	</td>
    </tr>
</g:each>
</tbody>
</table>