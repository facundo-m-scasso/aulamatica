<h1>Factor ocupacional - Lunes ${monday} a Viernes ${friday}</h1>
<h3>Hay ${totalRooms} aulas y una capacidad total de ${totalCapacity}</h3>
<br />
<p>Factor de aulas ocupadas</p>
<table>
<thead>
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
</thead>
<tbody>
<g:each in="${occupationalFactorOccupied}" var="item">  
    <tr>
        <td>${item.key}</td>
        <g:each in="${item.value}" var="cant">
        	<td>${cant}</td>
        </g:each>  
    </tr>
</g:each>
</tbody>
</table>

<br />

<p>Factor de aulas libres</p>
<table>
<thead>
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
</thead>
<tbody>
<g:each in="${occupationalFactorFree}" var="item">  
    <tr>
        <td>${item.key}</td>
        <g:each in="${item.value}" var="cant">
        	<td>${cant}</td>
        </g:each>  
    </tr>
</g:each>
</tbody>
</table>