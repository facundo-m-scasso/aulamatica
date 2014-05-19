<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">Colisiones para ${day} ${date}</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th>Aula</th>
		<th>Eventos</th>
		<th>Cruce horario</th>
		</tr>
		<g:each in="${collisions}" var="collision" status="i">
		    <tr>
		    	<td>${collision.room}</td>
		    	<td>${collision.events}</td>
		    	<td>${collision.from} a ${collision.to}</td>
		    </tr>
		</g:each>
	</table>
</div>