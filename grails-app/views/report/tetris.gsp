<h1>Tetris para el ${day} ${date}</h1>
<table>
	<thead>
		<th>Aula</th>
		<th>Capacidad</th>
		<th>Dia</th>
		<g:each in="${0..13}" var="e" status="i">
			<th>${i+8}:00</th>
			<th>${i+8}:30</th>
		</g:each>
		<th>22:00</th>
	</thead>
		<g:each in="${tetris}" var="item">
			<tr>
				<td>${item.roomName}</td>
				<td>${item.roomCapacity}</td>
				<td>${item.day}</td>
				<g:each in="${item.events}" var="ev">
					<td>${ev}</td>
				</g:each>
			</tr>
		</g:each>
	<tbody>
	</tbody>
</table>