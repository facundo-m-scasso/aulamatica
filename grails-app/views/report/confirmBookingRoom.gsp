<%@page import="com.itba.aulamatica.Course"%>
<meta name="layout" content="main">

<style>
#repeat-div {
	display: table;
	border-collapse: collapse;
}

.repeat-div-row {
	display: table-row;
}

.repeat-div-cell-legend {
	display: table-cell;
	width: 8%;
	padding: 6px;
}

.repeat-div-cell-content {
	display: table-cell;
	width: 25%;
	padding: 6px;
}

.table-booking {
	display: table;
	 border-spacing: 5px;
}
.row-booking {
	display: table-row;
}
#date-booking, #time-booking, #capacity-booking {
	display: table-cell;
}
#capacity-booking {
	width: 50%;
}

#date-booking{
	width: 15%;
}#time-booking {
	width: 35%;
}
</style>
<div class="row">
	<div class="col-xs-12">
		<div class="box box-warning">
			<div class="box-header">
				<h3 class="box-title">Datos de la reserva</h3>
			</div>
			<div class="box-body table-booking">
				<div class="row-booking">
					<div id="date-booking">
						<label>Fecha </label> <input type="text" class="form-control"
							disabled value="${date}" />
					</div>
					<div id="time-booking">
						<label>Horario </label> <input type="text" class="form-control"
							disabled value="Desde las ${from} a las ${to} horas" />
					</div>
					<div id="capacity-booking">
						<label>Informacion del aula</label> <input type="text" class="form-control"
							disabled
							value="Aula: ${room}. Capacidad: ${roomCapacity}. Capacidad solicitada: ${capacity}" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">Confirmación de reserva</h3>
			</div>
			<form role="form">
				<div class="box-body">
					<div class="form-group">
						<div class="input-group input-group-lg">
							<div class="input-group-btn">
								<button type="button" class="btn btn-warning dropdown-toggle"
									data-toggle="dropdown">
									Tipo de Evento <span class="fa fa-caret-down"></span>
								</button>
								<ul class="dropdown-menu">
									<li class="opt"><a href="#">Clase</a></li>
									<li class="opt"><a href="#">Consulta</a></li>
									<li class="opt"><a href="#">Parcial</a></li>
									<li class="opt"><a href="#">Final</a></li>
									<li class="opt"><a href="#">Revisión</a></li>
									<li class="opt"><a href="#">Otro</a></li>
								</ul>
							</div>
							<input type="text" class="form-control" id="txtSelected" disabled>
						</div>
					</div>
					<div class="form-group" id="courseSelectedDiv">
						<label for="exampleInputEmail1">Materias</label> <select
							class="form-control" id="course" name="course">
							<g:each in="${Course.findAll()}" var="c">
								<option value="${c.code}">(${c.code}) -
									${c.name}
								</option>
							</g:each>
						</select> <input id="courseSelected" type="hidden" value="00.00" />
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Comentarios</label>
						<textarea class="form-control" id="comments" rows="3"
							placeholder="Comentarios ..."></textarea>
					</div>

				<div class="form-group">
					<label for="repeat">Repetir...</label>
					<input type="checkbox" name="repeat" id="repeat"></input>

				<div id="repeat-div">
					<div class="repeat-div-row">
						<div class="repeat-div-cell-legend">Se repite</div>
						<div class="repeat-div-cell-content">
							<select id="freq" class="form-control">
								<option id="">-- Seleccionar --</option>
								<option id="1C">Primer Cuatrimestre</option>
								<option id="2C">Segundo Cuatrimestre</option>
								<option id="12C">Todo el año</option>
								<option id="0">Otro</option>
							</select>
						</div>
						<div class="repeat-div-cell-legend" id="freqF">Desde</div>
						<div class="repeat-div-cell-content" id="freqDF">
							<div class="input-group date form_date" data-date=""
								data-date-format="dd/mm/yyyy" data-link-field="dtp_input2"
								data-link-format="yyyy-mm-dd">
								<input name="date" class="form-control" size="16" type="text"
									value="" id="freqFrom" readonly> <span class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
							<input type="hidden" id="dtp_input2" value="" />
						</div>
						<div class="repeat-div-cell-legend" id="freqT">Hasta</div>
						<div class="repeat-div-cell-content" id="freqDT">
							<div class="input-group date form_date" data-date=""
								data-date-format="dd/mm/yyyy" data-link-field="dtp_input2"
								data-link-format="yyyy-mm-dd" >
								<input name="date" class="form-control" size="16" type="text"
									value="" id="freqTo" readonly> <span class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
							<input type="hidden" id="dtp_input2" value="" />
						</div>
					</div>
					<div class="repeat-div-row">
						<div class="repeat-div-cell-legend">Lunes</div>
						<div class="repeat-div-cell-content">
							<input type="checkbox" name="lun" id="lun"></input>
						</div>
						<div class="repeat-div-cell-legend" id="lunLF">Desde</div>
						<div class="repeat-div-cell-content" id="lunDF">
							<div class="input-group date form_time" data-date=""
								data-date-format="hh:ii" data-link-field="dtp_input3"
								data-link-format="hh:ii">
								<input name="timeFrom" class="form-control" size="16"
									type="text" id="lunF" value="" readonly> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-time"></span></span>
							</div>
							<input type="hidden" id="dtp_input3" value="" />
						</div>
						<div class="repeat-div-cell-legend" id="lunLT">Hasta</div>
						<div class="repeat-div-cell-content" id="lunDT">
								<div class="input-group date form_time" data-date=""
									data-date-format="hh:ii" data-link-field="dtp_input3"
									data-link-format="hh:ii">
									<input name="timeFrom" id="lunT" class="form-control" size="16"
										type="text" value="" readonly> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-time"></span></span>
								</div>
								<input type="hidden" id="dtp_input3" value="" />
							</div>
					</div>
					<div class="repeat-div-row">
						<div class="repeat-div-cell-legend">Martes</div>
						<div class="repeat-div-cell-content">
							<input type="checkbox" name="mar" id="mar"></input>
						</div>
						<div class="repeat-div-cell-legend" id="marLF">Desde</div>
						<div class="repeat-div-cell-content" id="marDF">
							<div class="input-group date form_time" data-date=""
								data-date-format="hh:ii" data-link-field="dtp_input3"
								data-link-format="hh:ii">
								<input name="timeFrom" id="marF" class="form-control" size="16"
									type="text" value="" readonly> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-time"></span></span>
							</div>
							<input type="hidden" id="dtp_input3" value="" />
						</div>
						<div class="repeat-div-cell-legend" id="marLT">Hasta</div>
						<div class="repeat-div-cell-content" id="marDT">
								<div class="input-group date form_time" data-date=""
									data-date-format="hh:ii" data-link-field="dtp_input3"
									data-link-format="hh:ii">
									<input name="timeFrom" id="marT" class="form-control" size="16"
										type="text" value="" readonly> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-time"></span></span>
								</div>
								<input type="hidden" id="dtp_input3" value="" />
							</div>
					</div>
					<div class="repeat-div-row">
						<div class="repeat-div-cell-legend">Miercoles</div>
						<div class="repeat-div-cell-content">
							<input type="checkbox" name="mie" id="mie"></input>
						</div>
						<div class="repeat-div-cell-legend" id="mieLF">Desde</div>
						<div class="repeat-div-cell-content" id="mieDF">
							<div class="input-group date form_time" data-date=""
								data-date-format="hh:ii" data-link-field="dtp_input3"
								data-link-format="hh:ii">
								<input name="timeFrom" id="mieF" class="form-control" size="16"
									type="text" value="" readonly> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-time"></span></span>
							</div>
							<input type="hidden" id="dtp_input3" value="" />
						</div>
						<div class="repeat-div-cell-legend" id="mieLT">Hasta</div>
						<div class="repeat-div-cell-content" id="mieDT">
								<div class="input-group date form_time" data-date=""
									data-date-format="hh:ii" data-link-field="dtp_input3"
									data-link-format="hh:ii">
									<input name="timeFrom" class="form-control" size="16"
										type="text" value="" id="mieT" readonly> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-time"></span></span>
								</div>
								<input type="hidden" id="dtp_input3" value="" />
						</div>
					</div>
					<div class="repeat-div-row">
						<div class="repeat-div-cell-legend">Jueves</div>
						<div class="repeat-div-cell-content">
							<input type="checkbox" name="jue" id="jue"></input>
						</div>
						<div class="repeat-div-cell-legend" id="jueLF">Desde</div>
						<div class="repeat-div-cell-content" id="jueDF">
							<div class="input-group date form_time" data-date=""
								data-date-format="hh:ii" data-link-field="dtp_input3"
								data-link-format="hh:ii">
								<input name="timeFrom" id="jueF" class="form-control" size="16"
									type="text" value="" readonly> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-time"></span></span>
							</div>
							<input type="hidden" id="dtp_input3" value="" />
						</div>
						<div class="repeat-div-cell-legend" id="jueLT">Hasta</div>
						<div class="repeat-div-cell-content" id="jueDT">
								<div class="input-group date form_time" data-date=""
									data-date-format="hh:ii" data-link-field="dtp_input3"
									data-link-format="hh:ii">
									<input name="timeFrom" id="jueT" class="form-control" size="16"
										type="text" value="" readonly> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-time"></span></span>
								</div>
								<input type="hidden" id="dtp_input3" value="" />
							</div>
					</div>
					<div class="repeat-div-row">
						<div class="repeat-div-cell-legend">Viernes</div>
						<div class="repeat-div-cell-content" >
							<input type="checkbox" name="vie" id="vie"></input>
						</div>
						<div class="repeat-div-cell-legend" id="vieLF">Desde</div>
						<div class="repeat-div-cell-content" id="vieDF">
							<div class="input-group date form_time" data-date=""
								data-date-format="hh:ii" data-link-field="dtp_input3"
								data-link-format="hh:ii">
								<input name="timeFrom" class="form-control" size="16"
									type="text" value="" id="vieF" readonly> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-time"></span></span>
							</div>
							<input type="hidden" id="dtp_input3" value="" />
						</div>
						<div class="repeat-div-cell-legend" id="vieLT">Hasta</div>
						<div class="repeat-div-cell-content" id="vieDT">
								<div class="input-group date form_time" data-date=""
									data-date-format="hh:ii" data-link-field="dtp_input3"
									data-link-format="hh:ii">
									<input name="timeFrom" id="vieT" class="form-control" size="16"
										type="text" value="" readonly> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-time"></span></span>
								</div>
								<input type="hidden" id="dtp_input3" value="" />
						</div>
					</div>
					<div class="repeat-div-row">
						<div class="repeat-div-cell-legend">Sabado</div>
						<div class="repeat-div-cell-content" >
							<input type="checkbox" name="sab" id="sab"></input>
						</div>
						<div class="repeat-div-cell-legend" id="sabLF">Desde</div>
						<div class="repeat-div-cell-content" id="sabDF">
							<div class="input-group date form_time" data-date=""
								data-date-format="hh:ii" data-link-field="dtp_input3"
								data-link-format="hh:ii">
								<input name="timeFrom" class="form-control" size="16"
									type="text" value="" id="sabF" readonly> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-time"></span></span>
							</div>
							<input type="hidden" id="dtp_input3" value="" />
						</div>
						<div class="repeat-div-cell-legend" id="sabLT">Hasta</div>
						<div class="repeat-div-cell-content" id="sabDT">
								<div class="input-group date form_time" data-date=""
									data-date-format="hh:ii" data-link-field="dtp_input3"
									data-link-format="hh:ii">
									<input name="timeFrom" id="sabT" class="form-control" size="16"
										type="text" value="" readonly> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-time"></span></span>
								</div>
								<input type="hidden" id="dtp_input3" value="" />
						</div>
					</div>
				</div>
</div>
				</div>
				<div class="box-footer" style="float: right;">
					<button id="btnSubmit" class="btn btn-primary">Confirmar</button>
				</div>
			</form>
		</div>
	</div>
</div>

<g:javascript>  
$("#repeat-div").hide();
$("#freqF").hide();
$("#freqDF").hide();
$("#freqFrom").hide();
$("#freqT").hide();
$("#freqDT").hide();
$("#freqTo").hide();
$("#lunDF").hide();
$("#lunDT").hide();
$("#lunF").hide();
$("#lunT").hide();
$("#lunLF").hide();
$("#lunLT").hide();
$("#marDF").hide();
$("#marDT").hide();
$("#marF").hide();
$("#marT").hide();
$("#marLF").hide();
$("#marLT").hide();
$("#mieDF").hide();
$("#mieDT").hide();
$("#mieF").hide();
$("#mieT").hide();
$("#mieLF").hide();
$("#mieLT").hide();
$("#jueDF").hide();
$("#jueDT").hide();
$("#jueF").hide();
$("#jueT").hide();
$("#jueLF").hide();
$("#jueLT").hide();
$("#vieDF").hide();
$("#vieDT").hide();
$("#vieF").hide();
$("#vieT").hide();
$("#vieLF").hide();
$("#vieLT").hide();
$("#sabDF").hide();
$("#sabDT").hide();
$("#sabF").hide();
$("#sabT").hide();
$("#sabLF").hide();
$("#sabLT").hide();

$("#freq").change(function(){

	if($("#freq").val() === 'Otro')
	{
		$("#freqF").show();
		$("#freqDF").show();
		$("#freqFrom").val('${date}');
		$("#freqFrom").show();
		$("#freqT").show();
		$("#freqDT").show();
		$("#freqTo").val('${date}');
		$("#freqTo").show();
	}
	else
	{
		$("#freqF").hide();
		$("#freqDF").hide();
		$("#freqFrom").hide();
		$("#freqT").hide();
		$("#freqDT").hide();
		$("#freqTo").hide();
	}
});

$("#lun").change(function(){
	if($("#lun").is(':checked'))
	{
		$("#lunDF").show();
		$("#lunDT").show();
		$("#lunF").val('${from}');
		$("#lunT").val('${to}');
		$("#lunF").show();
		$("#lunT").show();
		$("#lunLF").show();
		$("#lunLT").show();
	}
	else
	{
		$("#lunDF").hide();
		$("#lunDT").hide();
		$("#lunF").hide();
		$("#lunT").hide();
		$("#lunLF").hide();
		$("#lunLT").hide();
	}
});
$("#mar").change(function(){
	if($("#mar").is(':checked'))
	{
		$("#marDF").show();
		$("#marDT").show();
		$("#marF").val('${from}');
		$("#marT").val('${to}');
		$("#marF").show();
		$("#marT").show();
		$("#marLF").show();
		$("#marLT").show();
	}
	else
	{
		$("#marDF").hide();
		$("#marDT").hide();
		$("#marF").hide();
		$("#marT").hide();
		$("#marLF").hide();
		$("#marLT").hide();
	}
});

$("#mie").change(function(){
	if($("#mie").is(':checked'))
	{
		$("#mieDF").show();
		$("#mieDT").show();
		$("#mieF").val('${from}');
		$("#mieT").val('${to}');
		$("#mieF").show();
		$("#mieT").show();
		$("#mieLF").show();
		$("#mieLT").show();
	}
	else
	{
		$("#mieDF").hide();
		$("#mieDT").hide();
		$("#mieF").hide();
		$("#mieT").hide();
		$("#mieLF").hide();
		$("#mieLT").hide();
	}
});

$("#jue").change(function(){
	if($("#jue").is(':checked'))
	{
		$("#jueDF").show();
		$("#jueDT").show();
		$("#jueF").val('${from}');
		$("#jueT").val('${to}');
		$("#jueF").show();
		$("#jueT").show();
		$("#jueLF").show();
		$("#jueLT").show();
	}
	else
	{
		$("#jueDF").hide();
		$("#jueDT").hide();
		$("#jueF").hide();
		$("#jueT").hide();
		$("#jueLF").hide();
		$("#jueLT").hide();
	}
});

$("#vie").change(function(){
	if($("#vie").is(':checked'))
	{
		$("#vieDF").show();
		$("#vieDT").show();
		$("#vieF").val('${from}');
		$("#vieT").val('${to}');
		$("#vieF").show();
		$("#vieT").show();
		$("#vieLF").show();
		$("#vieLT").show();
	}
	else
	{
		$("#vieDF").hide();
		$("#vieDT").hide();
		$("#vieF").hide();
		$("#vieT").hide();
		$("#vieLF").hide();
		$("#vieLT").hide();
	}
});

$("#sab").change(function(){
	if($("#sab").is(':checked'))
	{
		$("#sabDF").show();
		$("#sabDT").show();
		$("#sabF").val('${from}');
		$("#sabT").val('${to}');
		$("#sabF").show();
		$("#sabT").show();
		$("#sabLF").show();
		$("#sabLT").show();
	}
	else
	{
		$("#sabDF").hide();
		$("#sabDT").hide();
		$("#sabF").hide();
		$("#sabT").hide();
		$("#sabLF").hide();
		$("#sabLT").hide();
	}
});

$("#repeat").change(function(){
	if($("#repeat").is(':checked'))
	{
		$("#repeat-div").show();
	}
	else
	{
		$("#repeat-div").hide();
	}
});

$("#course").change(function(){
	$("#courseSelected").val($("#course").val());
});

$(".opt > a").click(function(){
	$("#txtSelected").val(this.innerHTML);
	if(this.innerHTML == "Otro")
	{
		$("#courseSelectedDiv").hide();
		$("#courseSelected").val("00.00");
	}
	else {
		$("#courseSelectedDiv").show();
	}
});
$("#btnSubmit").click(function(event) {
    event.preventDefault();
	var params = "capacity=" + ${capacity} + "&room=" + ${room} + "&roomCapacity=" + ${roomCapacity};
	params += "&eventType=" + $('#txtSelected').val() + "&course=";
	if($('#txtSelected').val() === 'Otro') {
		params += "00.00";
	}
	else {
		params += $('#course').val();
	}
	params += "&comments=" + $('#comments').val();
	if($("#repeat").is(':checked')){
		params += "&repeat= true";
		if($("#freq").val() === 'Otro') {
			params += "&other=true&dateF=" + $("#freqFrom").val() + "&dateT=" + $("#freqTo").val();
		}
		else if($("#freq").val() === 'Primer Cuatrimestre') {
			params += "&freq=1C";
		}
		else if($("#freq").val() === 'Segundo Cuatrimestre') {
			params += "&freq=2C";
		}
		else if($("#freq").val() === 'Todo el año') {
			params += "&freq=12C";
		}
		if($("#lun").is(':checked')){
			params += "&lun=true&lunF=" + $('#lunF').val() + "&lunTo=" + $('#lunT').val();
		}
		if($("#mar").is(':checked')){
			params += "&mar=true&marF=" + $('#marF').val() + "&marTo=" + $('#marT').val();
		}
		if($("#mie").is(':checked')){
			params += "&mie=true&mieF=" + $('#mieF').val() + "&mieTo=" + $('#mieT').val();
		}
		if($("#jue").is(':checked')){
			params += "&jue=true&jueF=" + $('#jueF').val() + "&jueTo=" + $('#jueT').val();
		}
		if($("#vie").is(':checked')){
			params += "&vie=true&vieF=" + $('#vieF').val() + "&vieTo=" + $('#vieT').val();
		}
		if($("#sab").is(':checked')){
			params += "&sab=true&sabF=" + $('#sabF').val() + "&sabTo=" + $('#sabT').val();
		}	
	}
	window.location.href= "${createLink(action:'prebooking', controller:'report')}" + "?" + params;
});
$('.form_time').datetimepicker({
        language:  'es',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0,
		showMeridian : true,
		minuteStep: 30
    });
     $('.form_date').datetimepicker({
        language:  'es',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0,
		showMeridian : true,
		daysOfWeekDisabled : [ 0 ]
    });
</g:javascript>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'bootstrap-datetimepicker.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js/locales', file: 'bootstrap-datetimepicker.es.js')}"></script>