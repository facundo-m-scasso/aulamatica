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
<g:set var="d" value="${new DateTime()}"></g:set>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th style="font-size: 12px;">Datos</th>
			<g:each in="${0..13}" var="e" status="i">
				<g:if test="${d.dayOfYear != dateTime.dayOfYear || (i+8) >= d.getHourOfDay()}">
					<td style="font-size: 11px;">
						${i+8}:00
					</td>
				</g:if>
			</g:each>
		</tr>
		<g:each in="${tetris}" var="item">
			<tr>
				<th style="font-size: 11px; margin:0px; padding:0px; width:130px; text-align: center;">
					${item.roomName} (${item.roomCapacity}) 
				</th>
				<g:each in="${item.events}" var="ev" status="i">
					<g:if test="${(d.dayOfYear != dateTime.dayOfYear || ((i/2)+8) >= d.getHourOfDay()) && i%2 == 0}">
						<td
							class="${d.getHourOfDay() > ((i/2) + 8) ? 'op' : ''}"
							style="font-size: 11px; background-color: ${ev.equals('') ? '#BEBEBE;' : '#EEC591;'}"></td>
					</g:if>
				</g:each>
			</tr>
		</g:each>
	</table>
</div>