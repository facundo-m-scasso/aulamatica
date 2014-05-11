<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">Aulas Ocupadas - ${day} ${date}</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th>Inicio</th>
			<th>Fin</th>
			<th>Aulas ocupadas</th>
		</tr>
		<g:each in="${notAvailableRooms}" var="rooms" status="i">
			<tr>
				<g:if test="${i == 0}">
					<td>0${i+8}:00
					</td>
					<td>0${i+9}:00
					</td>
				</g:if>
				<g:elseif test="${i == 1}">
					<td>0${i+8}:00
					</td>
					<td>
						${i+9}:00
					</td>
				</g:elseif>
				<g:elseif test="${i > 1}">
					<td>
						${i+8}:00
					</td>
					<td>
						${i+9}:00
					</td>
				</g:elseif>
				<td><g:each in="${rooms}" var="room">
						${room.name} (${room.capacity}) - 
	    	</g:each></td>
			</tr>
		</g:each>
	</table>
</div>