<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">
		Aulas disponibles para el
		${day}
		${date} de ${from} a ${to}
	</h3>
</div>

<style>
.hover { background-color: #00AF33; }
.normal { background-color: #BEBEBE; }

table {
  table-layout: fixed; 
  width: 100%;
  *margin-left: -100px;/*ie7*/
}
td {
  border:1px solid grey; 
  vertical-align: top;
  border-top: 1px solid #ccc;
  padding:10px;
  width:100px;
  text-align: center;
}
th {
  position:absolute;
  *position: relative; /*ie7*/
  left:0; 
  width:200px;
  text-align: center;
}
.outer {position:relative}
.inner {
  overflow-x:scroll;
  overflow-y:visible;
  margin-left:200px;
}
</style>
<div class="box-body no-padding">
<div class="outer">
  <div class="inner">
    <table class="table">
        <tr>
          <th class="headcol">Datos</th>
			<g:each in="${0..13}" var="e" status="i">
				<td style="font-size: 11px;">
					${i+8}:00
				</td>
				<td style="font-size: 11px;">
					${i+8}:30
				</td>
			</g:each>
        </tr>
        <g:each in="${tetris}" var="item" status="j">
			<tr>
				<th class="headcol" style="margin:0px; padding:0px; ">
					${item.roomName} (${item.roomCapacity}) - ${item.day.substring(0, 2).toUpperCase()}
				</th>
				<g:if test="${allows.contains(j)}">
					<style>
					.hover { background-color: #00AF33; }
					.hovertd${j} { background-color: #009900; }
					</style>
					<g:javascript type="text/javascript">
						$(function() {
									"use strict";
									$(".hovertd${j}").hover(function() {
										$(".hovertd${j}").addClass('hover');
										$(".hovertd${j}").removeClass('.hovertd${j}');
										}, function() {
										$(".hovertd${j}").removeClass('hover');
										$(".hovertd${j}").addClass('.hovertd${j}');
										});
									$(".hovertd${j}").click(function() {
										location.href="${createLink(action: 'confirmBookingRoom', 
											params: [capacity: capacity, room: tetris[j].roomName, 
											roomCapacity: tetris[j].roomCapacity, day: day, 
											date: date, from: from, to: to])}"
									});
							
							});
					</g:javascript>
					</g:if>
				<g:each in="${item.events}" var="ev" status="i">
					<g:if test="${ev.equals('')}">
					
						<td class="${(allows.contains(j) && (i >= min && i < max)) ? 'hovertd' + j : 'normal'}" style="font-size: 11px; ">
							</td>
					</g:if>
					<g:else>
						<td style="font-size: 11px; background-color: #EEC591;">
							</td>
					</g:else>
				</g:each>
			</tr>
		</g:each>
    </table>
  </div>
</div>
</div>