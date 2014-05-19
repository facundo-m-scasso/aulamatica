<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">Deficits (inscriptos/capacidad aula) para ${day} ${date}</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th>Aula</th>
		<th>Evento</th>
		<th>Inscriptos</th>
		<th>Capacidad Aula</th>
		<th>Horario</th>
		</tr>
		<g:each in="${deficits}" var="deficit" status="i">
		    <tr>
		    	<td>${deficit.room}</td>
		    	<td>${deficit.name}</td>
		    	<td>${deficit.enrolled}</td>
		    	<td>${deficit.capacity}</td>
		    	<td>${deficit.from} a ${deficit.to}</td>
		    </tr>
		</g:each>
	</table>
</div>