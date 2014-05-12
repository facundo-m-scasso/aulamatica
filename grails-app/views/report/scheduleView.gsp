<%@page import="org.joda.time.DateTime"%>
<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">
		Tetris para el
		${day}
		${date}
	</h3>
</div>
<style>
.op {
	background-color: blue;
	filter: alpha(opacity = 75) -moz-opacity:0.75;
	opacity: 0.75;
}
</style>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th style="font-size: 12px;">Datos</th>
			<g:each in="${0..13}" var="e" status="i">
				<td style="font-size: 11px;">
					${i+8}:00
				</td>
			</g:each>
		</tr>
		<g:each in="${tetris}" var="item">
			<tr>
				<th style="font-size: 12px;">
					${item.roomName} (${item.roomCapacity}) - ${item.day}
				</th>
				<g:each in="${item.events}" var="ev" status="i">
					<g:if test="${i%2 == 0}">
						<td
							class="${new DateTime().getHourOfDay() > ((i/2) + 8) ? 'op' : ''}"
							style="font-size: 11px; background-color: ${ev.equals('') ? '#BEBEBE;' : '#EEC591;'}"></td>
					</g:if>
				</g:each>
			</tr>
		</g:each>
	</table>
</div>