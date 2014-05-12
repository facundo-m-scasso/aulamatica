<meta name="layout" content="main">
<g:javascript library="jquery"/>
<div class="box-header">
	<h3 class="box-title">Factor ocupacional - Lunes ${monday} a Viernes ${friday}</h3>
</div>
<div class="box-header">
	<h5 class="box-title">Hay ${totalRooms} aulas y una capacidad total de ${totalCapacity} sillas.</h5>
</div>
<div class="box-header">
		<h3 class="box-title">Aulas ocupadas</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th></th>
			<th>08:00</th>
			<th>09:00</th>
			<th>10:00</th>
			<th>11:00</th>
			<th>12:00</th>
			<th>13:00</th>
			<th>14:00</th>
			<th>15:00</th>
			<th>16:00</th>
			<th>17:00</th>
			<th>18:00</th>
			<th>19:00</th>
			<th>20:00</th>
			<th>21:00</th>
		</tr>
		<g:each in="${occupationalFactorOccupied}" var="item">
			<tr>
				<td>
					${item.key}
				</td>
				<g:each in="${item.value}" var="cant">
					<td>
						${cant}
					</td>
				</g:each>
			</tr>
		</g:each>
	</table>
</div>
<div class="row">
	<div class="box-body chart-responsive">
		<div class="chart" id="bar-chart" style="height: 300px;"></div>
	</div>
</div>
<g:javascript type="text/javascript">
	$(function() {
		"use strict";
		var bar = new Morris.Bar({
			element : 'bar-chart',
			resize : true,
			data : [ {
				y : 'Lunes',
				a : ${occupationalFactorOccupied['Lunes'][0]},
				b : ${occupationalFactorOccupied['Lunes'][1]},
				c : ${occupationalFactorOccupied['Lunes'][2]},
				d : ${occupationalFactorOccupied['Lunes'][3]},
				e : ${occupationalFactorOccupied['Lunes'][4]},
				f : ${occupationalFactorOccupied['Lunes'][5]},
				g : ${occupationalFactorOccupied['Lunes'][6]},
				h : ${occupationalFactorOccupied['Lunes'][7]},
				i : ${occupationalFactorOccupied['Lunes'][8]},
				j : ${occupationalFactorOccupied['Lunes'][9]},
				k : ${occupationalFactorOccupied['Lunes'][10]},
				l : ${occupationalFactorOccupied['Lunes'][11]},
				m : ${occupationalFactorOccupied['Lunes'][12]},
				n : ${occupationalFactorOccupied['Lunes'][13]}
			}, {
				y : 'Martes',
				a : ${occupationalFactorOccupied['Martes'][0]},
				b : ${occupationalFactorOccupied['Martes'][1]},
				c : ${occupationalFactorOccupied['Martes'][2]},
				d : ${occupationalFactorOccupied['Martes'][3]},
				e : ${occupationalFactorOccupied['Martes'][4]},
				f : ${occupationalFactorOccupied['Martes'][5]},
				g : ${occupationalFactorOccupied['Martes'][6]},
				h : ${occupationalFactorOccupied['Martes'][7]},
				i : ${occupationalFactorOccupied['Martes'][8]},
				j : ${occupationalFactorOccupied['Martes'][9]},
				k : ${occupationalFactorOccupied['Martes'][10]},
				l : ${occupationalFactorOccupied['Martes'][11]},
				m : ${occupationalFactorOccupied['Martes'][12]},
				n : ${occupationalFactorOccupied['Martes'][13]}
			}, {
				y : 'Miercoles',
				a : ${occupationalFactorOccupied['Miercoles'][0]},
				b : ${occupationalFactorOccupied['Miercoles'][1]},
				c : ${occupationalFactorOccupied['Miercoles'][2]},
				d : ${occupationalFactorOccupied['Miercoles'][3]},
				e : ${occupationalFactorOccupied['Miercoles'][4]},
				f : ${occupationalFactorOccupied['Miercoles'][5]},
				g : ${occupationalFactorOccupied['Miercoles'][6]},
				h : ${occupationalFactorOccupied['Miercoles'][7]},
				i : ${occupationalFactorOccupied['Miercoles'][8]},
				j : ${occupationalFactorOccupied['Miercoles'][9]},
				k : ${occupationalFactorOccupied['Miercoles'][10]},
				l : ${occupationalFactorOccupied['Miercoles'][11]},
				m : ${occupationalFactorOccupied['Miercoles'][12]},
				n : ${occupationalFactorOccupied['Miercoles'][13]}
			}, {
				y : 'Jueves',
				a : ${occupationalFactorOccupied['Jueves'][0]},
				b : ${occupationalFactorOccupied['Jueves'][1]},
				c : ${occupationalFactorOccupied['Jueves'][2]},
				d : ${occupationalFactorOccupied['Jueves'][3]},
				e : ${occupationalFactorOccupied['Jueves'][4]},
				f : ${occupationalFactorOccupied['Jueves'][5]},
				g : ${occupationalFactorOccupied['Jueves'][6]},
				h : ${occupationalFactorOccupied['Jueves'][7]},
				i : ${occupationalFactorOccupied['Jueves'][8]},
				j : ${occupationalFactorOccupied['Jueves'][9]},
				k : ${occupationalFactorOccupied['Jueves'][10]},
				l : ${occupationalFactorOccupied['Jueves'][11]},
				m : ${occupationalFactorOccupied['Jueves'][12]},
				n : ${occupationalFactorOccupied['Jueves'][13]}
			}, {
				y : 'Viernes',
				a : ${occupationalFactorOccupied['Viernes'][0]},
				b : ${occupationalFactorOccupied['Viernes'][1]},
				c : ${occupationalFactorOccupied['Viernes'][2]},
				d : ${occupationalFactorOccupied['Viernes'][3]},
				e : ${occupationalFactorOccupied['Viernes'][4]},
				f : ${occupationalFactorOccupied['Viernes'][5]},
				g : ${occupationalFactorOccupied['Viernes'][6]},
				h : ${occupationalFactorOccupied['Viernes'][7]},
				i : ${occupationalFactorOccupied['Viernes'][8]},
				j : ${occupationalFactorOccupied['Viernes'][9]},
				k : ${occupationalFactorOccupied['Viernes'][10]},
				l : ${occupationalFactorOccupied['Viernes'][11]},
				m : ${occupationalFactorOccupied['Viernes'][12]},
				n : ${occupationalFactorOccupied['Viernes'][13]}
			} ],
			barColors : [ '#00a65a', '#f56954', '#865cdf', '#b4a322', '#9b0220', '#d182a2', '#3fc6d8', '#683529', '#195d53', '#94bff0',
			  			'#491527', '#2e835f', '#75431f', '#d79d12', '#e90b92' ],
			xkey : 'y',
			ykeys : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n' ],
			labels : [ '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21' ],
			hideHover : 'auto'
		});
	});
</g:javascript>
<br />
<div class="box-header">
		<h3 class="box-title">Aulas libres</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th></th>
			<th>08:00</th>
			<th>09:00</th>
			<th>10:00</th>
			<th>11:00</th>
			<th>12:00</th>
			<th>13:00</th>
			<th>14:00</th>
			<th>15:00</th>
			<th>16:00</th>
			<th>17:00</th>
			<th>18:00</th>
			<th>19:00</th>
			<th>20:00</th>
			<th>21:00</th>
		</tr>
		<g:each in="${occupationalFactorFree}" var="item">
			<tr>
				<td>
					${item.key}
				</td>
				<g:each in="${item.value}" var="cant">
					<td>
						${cant}
					</td>
				</g:each>
			</tr>
		</g:each>
	</table>
</div>
<div class="row">
	<div class="box-body chart-responsive">
		<div class="chart" id="bar-chart-free" style="height: 300px;"></div>
	</div>
</div>
<g:javascript type="text/javascript">
	$(function() {
		"use strict";
		var bar = new Morris.Bar({
			element : 'bar-chart-free',
			resize : true,
			data : [ {
				y : 'Lunes',
				a : ${occupationalFactorFree['Lunes'][0]},
				b : ${occupationalFactorFree['Lunes'][1]},
				c : ${occupationalFactorFree['Lunes'][2]},
				d : ${occupationalFactorFree['Lunes'][3]},
				e : ${occupationalFactorFree['Lunes'][4]},
				f : ${occupationalFactorFree['Lunes'][5]},
				g : ${occupationalFactorFree['Lunes'][6]},
				h : ${occupationalFactorFree['Lunes'][7]},
				i : ${occupationalFactorFree['Lunes'][8]},
				j : ${occupationalFactorFree['Lunes'][9]},
				k : ${occupationalFactorFree['Lunes'][10]},
				l : ${occupationalFactorFree['Lunes'][11]},
				m : ${occupationalFactorFree['Lunes'][12]},
				n : ${occupationalFactorFree['Lunes'][13]}
			}, {
				y : 'Martes',
				a : ${occupationalFactorFree['Martes'][0]},
				b : ${occupationalFactorFree['Martes'][1]},
				c : ${occupationalFactorFree['Martes'][2]},
				d : ${occupationalFactorFree['Martes'][3]},
				e : ${occupationalFactorFree['Martes'][4]},
				f : ${occupationalFactorFree['Martes'][5]},
				g : ${occupationalFactorFree['Martes'][6]},
				h : ${occupationalFactorFree['Martes'][7]},
				i : ${occupationalFactorFree['Martes'][8]},
				j : ${occupationalFactorFree['Martes'][9]},
				k : ${occupationalFactorFree['Martes'][10]},
				l : ${occupationalFactorFree['Martes'][11]},
				m : ${occupationalFactorFree['Martes'][12]},
				n : ${occupationalFactorFree['Martes'][13]}
			}, {
				y : 'Miercoles',
				a : ${occupationalFactorFree['Miercoles'][0]},
				b : ${occupationalFactorFree['Miercoles'][1]},
				c : ${occupationalFactorFree['Miercoles'][2]},
				d : ${occupationalFactorFree['Miercoles'][3]},
				e : ${occupationalFactorFree['Miercoles'][4]},
				f : ${occupationalFactorFree['Miercoles'][5]},
				g : ${occupationalFactorFree['Miercoles'][6]},
				h : ${occupationalFactorFree['Miercoles'][7]},
				i : ${occupationalFactorFree['Miercoles'][8]},
				j : ${occupationalFactorFree['Miercoles'][9]},
				k : ${occupationalFactorFree['Miercoles'][10]},
				l : ${occupationalFactorFree['Miercoles'][11]},
				m : ${occupationalFactorFree['Miercoles'][12]},
				n : ${occupationalFactorFree['Miercoles'][13]}
			}, {
				y : 'Jueves',
				a : ${occupationalFactorFree['Jueves'][0]},
				b : ${occupationalFactorFree['Jueves'][1]},
				c : ${occupationalFactorFree['Jueves'][2]},
				d : ${occupationalFactorFree['Jueves'][3]},
				e : ${occupationalFactorFree['Jueves'][4]},
				f : ${occupationalFactorFree['Jueves'][5]},
				g : ${occupationalFactorFree['Jueves'][6]},
				h : ${occupationalFactorFree['Jueves'][7]},
				i : ${occupationalFactorFree['Jueves'][8]},
				j : ${occupationalFactorFree['Jueves'][9]},
				k : ${occupationalFactorFree['Jueves'][10]},
				l : ${occupationalFactorFree['Jueves'][11]},
				m : ${occupationalFactorFree['Jueves'][12]},
				n : ${occupationalFactorFree['Jueves'][13]}
			}, {
				y : 'Viernes',
				a : ${occupationalFactorFree['Viernes'][0]},
				b : ${occupationalFactorFree['Viernes'][1]},
				c : ${occupationalFactorFree['Viernes'][2]},
				d : ${occupationalFactorFree['Viernes'][3]},
				e : ${occupationalFactorFree['Viernes'][4]},
				f : ${occupationalFactorFree['Viernes'][5]},
				g : ${occupationalFactorFree['Viernes'][6]},
				h : ${occupationalFactorFree['Viernes'][7]},
				i : ${occupationalFactorFree['Viernes'][8]},
				j : ${occupationalFactorFree['Viernes'][9]},
				k : ${occupationalFactorFree['Viernes'][10]},
				l : ${occupationalFactorFree['Viernes'][11]},
				m : ${occupationalFactorFree['Viernes'][12]},
				n : ${occupationalFactorFree['Viernes'][13]}
			} ],
			barColors : [ '#00a65a', '#f56954', '#865cdf', '#b4a322', '#9b0220', '#d182a2', '#3fc6d8', '#683529', '#195d53', '#94bff0',
			  			'#491527', '#2e835f', '#75431f', '#d79d12', '#e90b92' ],
			xkey : 'y',
			ykeys : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n' ],
			labels : [ '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21' ],
			hideHover : 'auto'
		});
	});
</g:javascript>
<div class="box-header">
		<h3 class="box-title">Sillas ocupadas</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th></th>
			<th>08:00</th>
			<th>09:00</th>
			<th>10:00</th>
			<th>11:00</th>
			<th>12:00</th>
			<th>13:00</th>
			<th>14:00</th>
			<th>15:00</th>
			<th>16:00</th>
			<th>17:00</th>
			<th>18:00</th>
			<th>19:00</th>
			<th>20:00</th>
			<th>21:00</th>
		</tr>
		<g:each in="${occupationalFactorChairOccupied}" var="item">
			<tr>
				<td>
					${item.key}
				</td>
				<g:each in="${item.value}" var="cant">
					<td>
						${cant}
					</td>
				</g:each>
			</tr>
		</g:each>
	</table>
</div>
<div class="row">
	<div class="box-body chart-responsive">
		<div class="chart" id="bar-chart-chair-occupied" style="height: 300px;"></div>
	</div>
</div>
<g:javascript type="text/javascript">
	$(function() {
		"use strict";
		var bar = new Morris.Bar({
			element : 'bar-chart-chair-occupied',
			resize : true,
			data : [ {
				y : 'Lunes',
				a : ${occupationalFactorChairOccupied['Lunes'][0]},
				b : ${occupationalFactorChairOccupied['Lunes'][1]},
				c : ${occupationalFactorChairOccupied['Lunes'][2]},
				d : ${occupationalFactorChairOccupied['Lunes'][3]},
				e : ${occupationalFactorChairOccupied['Lunes'][4]},
				f : ${occupationalFactorChairOccupied['Lunes'][5]},
				g : ${occupationalFactorChairOccupied['Lunes'][6]},
				h : ${occupationalFactorChairOccupied['Lunes'][7]},
				i : ${occupationalFactorChairOccupied['Lunes'][8]},
				j : ${occupationalFactorChairOccupied['Lunes'][9]},
				k : ${occupationalFactorChairOccupied['Lunes'][10]},
				l : ${occupationalFactorChairOccupied['Lunes'][11]},
				m : ${occupationalFactorChairOccupied['Lunes'][12]},
				n : ${occupationalFactorChairOccupied['Lunes'][13]}
			}, {
				y : 'Martes',
				a : ${occupationalFactorChairOccupied['Martes'][0]},
				b : ${occupationalFactorChairOccupied['Martes'][1]},
				c : ${occupationalFactorChairOccupied['Martes'][2]},
				d : ${occupationalFactorChairOccupied['Martes'][3]},
				e : ${occupationalFactorChairOccupied['Martes'][4]},
				f : ${occupationalFactorChairOccupied['Martes'][5]},
				g : ${occupationalFactorChairOccupied['Martes'][6]},
				h : ${occupationalFactorChairOccupied['Martes'][7]},
				i : ${occupationalFactorChairOccupied['Martes'][8]},
				j : ${occupationalFactorChairOccupied['Martes'][9]},
				k : ${occupationalFactorChairOccupied['Martes'][10]},
				l : ${occupationalFactorChairOccupied['Martes'][11]},
				m : ${occupationalFactorChairOccupied['Martes'][12]},
				n : ${occupationalFactorChairOccupied['Martes'][13]}
			}, {
				y : 'Miercoles',
				a : ${occupationalFactorChairOccupied['Miercoles'][0]},
				b : ${occupationalFactorChairOccupied['Miercoles'][1]},
				c : ${occupationalFactorChairOccupied['Miercoles'][2]},
				d : ${occupationalFactorChairOccupied['Miercoles'][3]},
				e : ${occupationalFactorChairOccupied['Miercoles'][4]},
				f : ${occupationalFactorChairOccupied['Miercoles'][5]},
				g : ${occupationalFactorChairOccupied['Miercoles'][6]},
				h : ${occupationalFactorChairOccupied['Miercoles'][7]},
				i : ${occupationalFactorChairOccupied['Miercoles'][8]},
				j : ${occupationalFactorChairOccupied['Miercoles'][9]},
				k : ${occupationalFactorChairOccupied['Miercoles'][10]},
				l : ${occupationalFactorChairOccupied['Miercoles'][11]},
				m : ${occupationalFactorChairOccupied['Miercoles'][12]},
				n : ${occupationalFactorChairOccupied['Miercoles'][13]}
			}, {
				y : 'Jueves',
				a : ${occupationalFactorChairOccupied['Jueves'][0]},
				b : ${occupationalFactorChairOccupied['Jueves'][1]},
				c : ${occupationalFactorChairOccupied['Jueves'][2]},
				d : ${occupationalFactorChairOccupied['Jueves'][3]},
				e : ${occupationalFactorChairOccupied['Jueves'][4]},
				f : ${occupationalFactorChairOccupied['Jueves'][5]},
				g : ${occupationalFactorChairOccupied['Jueves'][6]},
				h : ${occupationalFactorChairOccupied['Jueves'][7]},
				i : ${occupationalFactorChairOccupied['Jueves'][8]},
				j : ${occupationalFactorChairOccupied['Jueves'][9]},
				k : ${occupationalFactorChairOccupied['Jueves'][10]},
				l : ${occupationalFactorChairOccupied['Jueves'][11]},
				m : ${occupationalFactorChairOccupied['Jueves'][12]},
				n : ${occupationalFactorChairOccupied['Jueves'][13]}
			}, {
				y : 'Viernes',
				a : ${occupationalFactorChairOccupied['Viernes'][0]},
				b : ${occupationalFactorChairOccupied['Viernes'][1]},
				c : ${occupationalFactorChairOccupied['Viernes'][2]},
				d : ${occupationalFactorChairOccupied['Viernes'][3]},
				e : ${occupationalFactorChairOccupied['Viernes'][4]},
				f : ${occupationalFactorChairOccupied['Viernes'][5]},
				g : ${occupationalFactorChairOccupied['Viernes'][6]},
				h : ${occupationalFactorChairOccupied['Viernes'][7]},
				i : ${occupationalFactorChairOccupied['Viernes'][8]},
				j : ${occupationalFactorChairOccupied['Viernes'][9]},
				k : ${occupationalFactorChairOccupied['Viernes'][10]},
				l : ${occupationalFactorChairOccupied['Viernes'][11]},
				m : ${occupationalFactorChairOccupied['Viernes'][12]},
				n : ${occupationalFactorChairOccupied['Viernes'][13]}
			} ],
			barColors : [ '#00a65a', '#f56954', '#865cdf', '#b4a322', '#9b0220', '#d182a2', '#3fc6d8', '#683529', '#195d53', '#94bff0',
			  			'#491527', '#2e835f', '#75431f', '#d79d12', '#e90b92' ],
			xkey : 'y',
			ykeys : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n' ],
			labels : [ '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21' ],
			hideHover : 'auto'
		});
	});
</g:javascript>
<br />
<div class="box-header">
		<h3 class="box-title">Sillas libres</h3>
</div>
<div class="box-body no-padding">
	<table class="table">
		<tr>
			<th></th>
			<th>08:00</th>
			<th>09:00</th>
			<th>10:00</th>
			<th>11:00</th>
			<th>12:00</th>
			<th>13:00</th>
			<th>14:00</th>
			<th>15:00</th>
			<th>16:00</th>
			<th>17:00</th>
			<th>18:00</th>
			<th>19:00</th>
			<th>20:00</th>
			<th>21:00</th>
		</tr>
		<g:each in="${occupationalFactorChairFree}" var="item">
			<tr>
				<td>
					${item.key}
				</td>
				<g:each in="${item.value}" var="cant">
					<td>
						${cant}
					</td>
				</g:each>
			</tr>
		</g:each>
	</table>
</div>
<div class="row">
	<div class="box-body chart-responsive">
		<div class="chart" id="bar-chart-chair-free" style="height: 300px;"></div>
	</div>
</div>
<g:javascript type="text/javascript">
	$(function() {
		"use strict";
		var bar = new Morris.Bar({
			element : 'bar-chart-chair-free',
			resize : true,
			data : [ {
				y : 'Lunes',
				a : ${occupationalFactorChairFree['Lunes'][0]},
				b : ${occupationalFactorChairFree['Lunes'][1]},
				c : ${occupationalFactorChairFree['Lunes'][2]},
				d : ${occupationalFactorChairFree['Lunes'][3]},
				e : ${occupationalFactorChairFree['Lunes'][4]},
				f : ${occupationalFactorChairFree['Lunes'][5]},
				g : ${occupationalFactorChairFree['Lunes'][6]},
				h : ${occupationalFactorChairFree['Lunes'][7]},
				i : ${occupationalFactorChairFree['Lunes'][8]},
				j : ${occupationalFactorChairFree['Lunes'][9]},
				k : ${occupationalFactorChairFree['Lunes'][10]},
				l : ${occupationalFactorChairFree['Lunes'][11]},
				m : ${occupationalFactorChairFree['Lunes'][12]},
				n : ${occupationalFactorChairFree['Lunes'][13]}
			}, {
				y : 'Martes',
				a : ${occupationalFactorChairFree['Martes'][0]},
				b : ${occupationalFactorChairFree['Martes'][1]},
				c : ${occupationalFactorChairFree['Martes'][2]},
				d : ${occupationalFactorChairFree['Martes'][3]},
				e : ${occupationalFactorChairFree['Martes'][4]},
				f : ${occupationalFactorChairFree['Martes'][5]},
				g : ${occupationalFactorChairFree['Martes'][6]},
				h : ${occupationalFactorChairFree['Martes'][7]},
				i : ${occupationalFactorChairFree['Martes'][8]},
				j : ${occupationalFactorChairFree['Martes'][9]},
				k : ${occupationalFactorChairFree['Martes'][10]},
				l : ${occupationalFactorChairFree['Martes'][11]},
				m : ${occupationalFactorChairFree['Martes'][12]},
				n : ${occupationalFactorChairFree['Martes'][13]}
			}, {
				y : 'Miercoles',
				a : ${occupationalFactorChairFree['Miercoles'][0]},
				b : ${occupationalFactorChairFree['Miercoles'][1]},
				c : ${occupationalFactorChairFree['Miercoles'][2]},
				d : ${occupationalFactorChairFree['Miercoles'][3]},
				e : ${occupationalFactorChairFree['Miercoles'][4]},
				f : ${occupationalFactorChairFree['Miercoles'][5]},
				g : ${occupationalFactorChairFree['Miercoles'][6]},
				h : ${occupationalFactorChairFree['Miercoles'][7]},
				i : ${occupationalFactorChairFree['Miercoles'][8]},
				j : ${occupationalFactorChairFree['Miercoles'][9]},
				k : ${occupationalFactorChairFree['Miercoles'][10]},
				l : ${occupationalFactorChairFree['Miercoles'][11]},
				m : ${occupationalFactorChairFree['Miercoles'][12]},
				n : ${occupationalFactorChairFree['Miercoles'][13]}
			}, {
				y : 'Jueves',
				a : ${occupationalFactorChairFree['Jueves'][0]},
				b : ${occupationalFactorChairFree['Jueves'][1]},
				c : ${occupationalFactorChairFree['Jueves'][2]},
				d : ${occupationalFactorChairFree['Jueves'][3]},
				e : ${occupationalFactorChairFree['Jueves'][4]},
				f : ${occupationalFactorChairFree['Jueves'][5]},
				g : ${occupationalFactorChairFree['Jueves'][6]},
				h : ${occupationalFactorChairFree['Jueves'][7]},
				i : ${occupationalFactorChairFree['Jueves'][8]},
				j : ${occupationalFactorChairFree['Jueves'][9]},
				k : ${occupationalFactorChairFree['Jueves'][10]},
				l : ${occupationalFactorChairFree['Jueves'][11]},
				m : ${occupationalFactorChairFree['Jueves'][12]},
				n : ${occupationalFactorChairFree['Jueves'][13]}
			}, {
				y : 'Viernes',
				a : ${occupationalFactorChairFree['Viernes'][0]},
				b : ${occupationalFactorChairFree['Viernes'][1]},
				c : ${occupationalFactorChairFree['Viernes'][2]},
				d : ${occupationalFactorChairFree['Viernes'][3]},
				e : ${occupationalFactorChairFree['Viernes'][4]},
				f : ${occupationalFactorChairFree['Viernes'][5]},
				g : ${occupationalFactorChairFree['Viernes'][6]},
				h : ${occupationalFactorChairFree['Viernes'][7]},
				i : ${occupationalFactorChairFree['Viernes'][8]},
				j : ${occupationalFactorChairFree['Viernes'][9]},
				k : ${occupationalFactorChairFree['Viernes'][10]},
				l : ${occupationalFactorChairFree['Viernes'][11]},
				m : ${occupationalFactorChairFree['Viernes'][12]},
				n : ${occupationalFactorChairFree['Viernes'][13]}
			} ],
			barColors : [ '#00a65a', '#f56954', '#865cdf', '#b4a322', '#9b0220', '#d182a2', '#3fc6d8', '#683529', '#195d53', '#94bff0',
			  			'#491527', '#2e835f', '#75431f', '#d79d12', '#e90b92' ],
			xkey : 'y',
			ykeys : [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n' ],
			labels : [ '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21' ],
			hideHover : 'auto'
		});
	});
</g:javascript>