
<%@page import="com.itba.aulamatica.Room"%>
<g:setProvider library="jquery" />
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'bootstrap-datetimepicker.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js/locales', file: 'bootstrap-datetimepicker.es.js')}"></script>
<script type="text/javascript">
	function runModalDynamixBASIC(action) {
		$('#' + action).show();
	}
	$('.form_date').datetimepicker({
		language : 'es',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0,
		showMeridian : true,
		daysOfWeekDisabled : [ 0 ]
	});
</script>

<g:form name="MYFORM" controller="report" action="${attrs.action}">
	<fieldset>
		<h5>Seleccione el aula y la fecha y para la que desea filtrar la
			opcion seleccionada.</h5>
		<br />
		<div class="form-group">
			<label for="dtp_input3" class="col-md-2 control-label">Aula:</label>
			<div class="input-group col-md-5">
				<select class="form-control" id="room" name="room">
					<g:each in="${Room.findAllByCapacityGreaterThan(0)}" var="room">
						<option value="${room.name}">
							${room.name}
						</option>
					</g:each>
				</select>
			</div>
			<input type="hidden" id="dtp_input3" value="" /><br />
		</div>
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
			<g:submitButton class="btn btn-success save" style="float:right;"
				name="create" value="Simular" />
		</div>

	</fieldset>
</g:form>





