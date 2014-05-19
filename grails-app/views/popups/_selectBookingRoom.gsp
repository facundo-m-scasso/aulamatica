
<g:setProvider library="jquery"/>
<script type="text/javascript"
		src="${resource(dir: 'js', file: 'bootstrap-datetimepicker.js')}"></script>
	<script type="text/javascript"
		src="${resource(dir: 'js/locales', file: 'bootstrap-datetimepicker.es.js')}"></script>
<script type="text/javascript">
        function runModalDynamixBASIC(action) {
        	$('#' + action).show();
 	 	}
 	 
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
</script>

<g:form name="MYFORM" controller="report"
	action="${attrs.action}">
	<fieldset>
		<h5>Seleccione la fecha, el rango horario y la cantidad de asistentes para la que desea filtrar la
			opcion seleccionada.</h5>
		<br />
		<div class="form-group">
			<label for="dtp_input2" class="col-md-2 control-label">Fecha:</label>
			<div class="input-group date form_date col-md-5" data-date=""
				data-date-format="dd/mm/yyyy" data-link-field="dtp_input2"
				data-link-format="yyyy-mm-dd">
				<input name="date" class="form-control" size="16" type="text"
					value="" readonly> <span class="input-group-addon"><span
					class="glyphicon glyphicon-calendar"></span></span>
			</div>
			<input type="hidden" id="dtp_input2" value="" /><br />
		</div>
		<div class="form-group">
			<label for="dtp_input3" class="col-md-2 control-label">Desde:</label>
			<div class="input-group date form_time col-md-5" data-date=""
				data-date-format="hh:ii" data-link-field="dtp_input3"
				data-link-format="hh:ii">
				<input name="timeFrom" class="form-control" size="16" type="text"
					value="" readonly> <span class="input-group-addon"><span
					class="glyphicon glyphicon-time"></span></span>
			</div>
			<input type="hidden" id="dtp_input3" value="" /><br />
		</div>
		<div class="form-group">
			<label for="dtp_input4" class="col-md-2 control-label">Hasta:</label>
			<div class="input-group date form_time col-md-5" data-date=""
				data-date-format="hh:ii" data-link-field="dtp_input4"
				data-link-format="hh:ii">
				<input name="timeTo" class="form-control" size="16" type="text"
					value="" readonly> <span class="input-group-addon"><span
					class="glyphicon glyphicon-time"></span></span>
			</div>
			<input type="hidden" id="dtp_input4" value="" /><br />
		</div>
		<div class="form-group">
			<label for="dtp_input5" class="col-md-2 control-label">Capacidad:</label>
			<div class="input-group col-md-5">
				<input id="dtp_input5" name="capacity" class="form-control" size="16" type="text"> 
			</div>
		</div>
		<div class="form-group">
			<g:submitButton class="btn btn-success save" style="float:right;"
				name="create" value="Simular" />
		</div>

	</fieldset>
</g:form>




	
