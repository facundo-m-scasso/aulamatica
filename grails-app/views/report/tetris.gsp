<meta name="layout" content="main">
<div class="box-header">
	<h3 class="box-title">
		Tetris para el
		${day}
		${date}
	</h3>
</div>
<style>
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
        <g:each in="${tetris}" var="item">
			<tr>
				<th class="headcol">
					${item.roomName} (${item.roomCapacity})
				</th>
				<g:each in="${item.events}" var="ev">
					<g:if test="${ev.equals('')}">
						<td style="font-size: 11px; background-color: #BEBEBE;">
							${ev}
						</td>
					</g:if>
					<g:else>
						<g:if test="${ev.split('/').size() == 1}">
							<td style="font-size: 11px; background-color: #EEC591;">
								${ev}
							</td>
						</g:if>
						<g:else>
							<td style="font-size: 11px; background-color: #EE3B3B;">
								${ev}
							</td>
						</g:else>
					</g:else>
				</g:each>
			</tr>
		</g:each>
    </table>
  </div>
</div>
</div>