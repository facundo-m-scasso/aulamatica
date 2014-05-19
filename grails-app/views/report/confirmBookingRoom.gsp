<%@page import="com.itba.aulamatica.Course"%>
<meta name="layout" content="main">
<div class="row">
	<!-- left column -->
	<div class="col-md-6">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">Confirmación de reserva</h3>
			</div>
			<form role="form">
				<div class="box-body">
				<div class="form-group">
						  <div class="input-group input-group-lg">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">Tipo de Evento <span class="fa fa-caret-down"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Clase</a></li>
                                                <li><a href="#">Consulta</a></li>
                                                <li><a href="#">Parcial</a></li>
                                                <li><a href="#">Final</a></li>
                                                <li><a href="#">Revisión</a></li>
                                                <li><a href="#">Otro</a></li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control">
                                    </div>
					</div>
				<div class="form-group">
						<label for="exampleInputEmail1">Materias</label> <select class="form-control" id="course" name="course">
					<g:each in="${Course.findAll()}" var="c">
						<option value="${c.code}">
							(${c.code}) - ${c.name}
						</option>
					</g:each>
				</select>
					</div>
					
				<div class="form-group">
						<label for="exampleInputEmail1">Comentarios</label> 
						<textarea class="form-control" rows="3" placeholder="Comentarios ..."></textarea>
					</div>
				</div>
				
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">Confirmar</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-6">
		<!-- general form elements disabled -->
		<div class="box box-warning">
			<div class="box-header">
				<h3 class="box-title">Datos de la reserva</h3>
			</div>
			<div class="box-body">
				<form role="form">
					<div class="form-group">
						<label>Fecha </label> <input type="text" class="form-control"
							disabled value="${date}" />
					</div>
					<div class="form-group">
						<label>Horario </label> <input type="text" class="form-control"
							disabled value="Desde las ${from} a las ${to} horas" />
					</div>
					<div class="form-group">
						<label>Capacidades</label> <input type="text" class="form-control"
							disabled value="Capacidad del aula: ${roomCapacity}. Capacidad solicitada: ${capacity}" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>