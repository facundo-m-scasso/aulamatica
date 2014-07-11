<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle
		default="Aulamatica | Secretaria Academica - ITBA" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	rel="stylesheet" type="text/css" />
<link href="${resource(dir: 'css', file: 'font-awesome.min.css')}"
	rel="stylesheet" type="text/css" />
<link href="${resource(dir: 'css', file: 'ionicons.min.css')}"
	rel="stylesheet" type="text/css" />
<link
	href="${resource(dir: 'css/jvectormap', file: 'jquery-jvectormap-1.2.2.css')}"
	rel="stylesheet" type="text/css" />
<link
	href="${resource(dir: 'css/fullcalendar', file: 'fullcalendar.css')}"
	rel="stylesheet" type="text/css" />
<link
	href="${resource(dir: 'css/fullcalendar', file: 'fullcalendar.print.css')}"
	rel="stylesheet" type="text/css" media="print"/>
<link
	href="${resource(dir: 'css/daterangepicker', file: 'daterangepicker-bs3.css')}"
	rel="stylesheet" type="text/css" />
<link
	href="${resource(dir: 'css/bootstrap-wysihtml5', file: 'bootstrap3-wysihtml5.min.css')}"
	rel="stylesheet" type="text/css" />
<link href="${resource(dir: 'css/morris', file: 'morris.css')}"
	rel="stylesheet" type="text/css" />
<link href="${resource(dir: 'css', file: 'AdminLTE.css')}"
	rel="stylesheet" type="text/css" />
<link
	href="${resource(dir: 'css', file: 'bootstrap-datetimepicker.min.css')}"
	rel="stylesheet" media="screen">

<g:layoutHead />

<r:layoutResources />
</head>
<body class="skin-blue">
<script src="${resource(dir: 'js', file: 'jquery-2-0-2.min.js')}"
		type="text/javascript"></script>
	<header class="header" style="position: fixed;">
		<a href="${createLink(uri:'/index', absolute: 'true')}" class="logo">
			ITBA - Aulamatica </a>
		<nav class="navbar navbar-static-top" role="navigation">
			<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
				role="button"> <span class="sr-only">Toggle navigation</span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a>
			<div class="navbar-right">
				<ul class="nav navbar-nav">
					<li class="dropdown messages-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-envelope"></i> <span class="label label-success">1</span>
					</a>
						<ul class="dropdown-menu">
							<li class="header">Tenes 1 mensaje</li>
							<li>
								<ul class="menu">
									<li><a href="#">
											<div class="pull-left">
												<img src="${resource(dir: 'img', file: 'silviaGomez.jpg')}"
													class="img-circle" alt="User Image" />
											</div>
											<h4>
												Dpto. Ing. Informatica <small><i
													class="fa fa-clock-o"></i>5 hs</small>
											</h4>
											<p>Aula Magna para el 30/05</p>
									</a></li>
								</ul>
							</li>
							<li class="footer"><a href="#">Ver todos los mensajes</a></li>
						</ul></li>
					</li>
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="glyphicon glyphicon-user"></i> <span>Federico
								Ferrando<i class="caret"></i>
						</span>
					</a>
						<ul class="dropdown-menu">
							<li class="user-header bg-light-blue"><img
								src="${resource(dir: 'img', file: 'federicoFerrando.jpg')}"
								class="img-circle" alt="User Image" />
								<p>
									Federico Ferrando - Asistente de Procesos y Sistemas ITBA <small>Miembro
										desde Nov. 2011</small>
								</p></li>
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" class="btn btn-default btn-flat">Perfil</a>
								</div>
								<div class="pull-right">
									<a href="#" class="btn btn-default btn-flat">Salir</a>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<aside class="left-side sidebar-offcanvas">
			<section class="sidebar">
				<ul class="sidebar-menu">
					<li class="active"><a
						href="${createLink(uri:'/index', absolute: 'true')}"> <i
							class="fa fa-dashboard"></i> <span>Inicio</span>
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-th"></i>
							<span>Reportes</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a
								href="${createLink(uri:'/report/realTime', absolute: 'true')}"><i
									class="fa fa-angle-double-right"></i>Tiempo Real</a></li>
							<li><a
								href="${createLink(uri:'/report/tetris', absolute: 'true')}"><i
									class="fa fa-angle-double-right"></i>Tetris TR</a></li>
							<li><a
								href="${createLink(uri:'/report/scheduleView', absolute: 'true')}"><i
									class="fa fa-angle-double-right"></i>Tetris TR CH</a></li>
							<li><a
								href="${createLink(uri:'/report/availableRooms', absolute: 'true')}"><i
									class="fa fa-angle-double-right"></i>Aulas Libres TR</a></li>
							<li><a
								href="${createLink(uri:'/report/notAvailableRooms', absolute: 'true')}"><i
									class="fa fa-angle-double-right"></i>Aulas Ocupadas TR</a></li>
							<li><a
								href="${createLink(uri:'/report/occupationalFactor', absolute: 'true')}"><i
									class="fa fa-angle-double-right"></i>Factor Ocupacional</a></li>
							<li><a
								href="${createLink(uri:'/report/nextDay', absolute: 'true')}"><i
									class="fa fa-angle-double-right"></i>Dia Siguiente</a></li>
							<li><a href="#CalendarioAulaBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('CalendarioAula')">
									<i class="fa fa-angle-double-right"></i>Calendario Semanal Aula</a></li>
							<li><a href="#ColisionesBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('Colisiones')">
									<i class="fa fa-angle-double-right"></i>Colisiones</a></li>
							<li><a href="#DeficitsBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('Deficits')">
									<i class="fa fa-angle-double-right"></i>Deficits</a></li>
							<li><a href="#TiempoRealBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('TiempoReal')">
									<i class="fa fa-angle-double-right"></i>Tiempo Real SIM</a></li>
							<li><a href="#TetrisBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('Tetris')">
									<i class="fa fa-angle-double-right"></i>Tetris SIM</a></li>
							<li><a href="#TetrisChBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('TetrisCh')">
									<i class="fa fa-angle-double-right"></i>Tetris SIM CH</a></li>
							<li><a href="#AulasLibresBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('AulasLibres')">
									<i class="fa fa-angle-double-right"></i>Aulas Libres SIM</a></li>
							<li><a href="#AulasOcupadasBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('AulasOcupadas')">
									<i class="fa fa-angle-double-right"></i>Aulas Ocupadas SIM</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
							<span>Solicitudes de Aulas</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
						<li><a href="#SolicitarAulaBASIC" role="button" data-toggle="modal"
									onclick="runModalDynamixBASIC('SolicitarAula')">
									<i class="fa fa-angle-double-right"></i>Solicitar Aula</a></li>
							<li><a href="pages/forms/advanced.html"><i
									class="fa fa-angle-double-right"></i>Listado de solicitudes</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
							<span>Administracion</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="pages/tables/simple.html"><i
									class="fa fa-angle-double-right"></i>Aulas</a></li>
							<li><a href="pages/tables/data.html"><i
									class="fa fa-angle-double-right"></i>Materias</a></li>
							<li><a href="pages/tables/data.html"><i
									class="fa fa-angle-double-right"></i>SGA</a></li>
							<li><a href="pages/tables/data.html"><i
									class="fa fa-angle-double-right"></i>Mutant</a></li>
						</ul></li>
				</ul>
			</section>
		</aside>
		<aside class="right-side">
			<section class="content-header">
				<h1>
					Aulamática <small>Inicio</small>
				</h1>
				<ol class="breadcrumb">
					<li class="active"><a href="#"><i class="fa fa-dashboard"></i>
							Inicio</a></li>
				</ol>
			</section>
			<section class="content">
			<div id="SolicitarAula">
					<g:modalForm id="SolicitarAulaBASIC" title="Solicitud de aula"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectBookingRoom" 
						action="bookingRoom"/>
				</div>
				<div id="CalendarioAula">
					<g:modalForm id="CalendarioAulaBASIC" title="Calendario Semanal de un Aula"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateRoom" 
						action="roomCalendar" time="false" />
				</div>
				<div id="Colisiones">
					<g:modalForm id="ColisionesBASIC" title="Colisiones"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateTime" 
						action="collisions" time="false" />
				</div>
				<div id="Deficits">
					<g:modalForm id="DeficitsBASIC" title="Deficits"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateTime" 
						action="deficits" time="false" />
				</div>
				<div id="TiempoReal">
					<g:modalForm id="TiempoRealBASIC" title="Tiempo Real Simulado"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateTime" 
						action="realTime" time="true" />
				</div>
				<div id="Tetris">
					<g:modalForm id="TetrisBASIC" title="Tetris Simulado"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateTime" 
						action="tetris" time="false" />
				</div>
				<div id="TetrisCh">
					<g:modalForm id="TetrisChBASIC" title="Tetris Simulado"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateTime" 
						action="scheduleView" time="false" />
				</div>
				<div id="AulasLibres">
					<g:modalForm id="AulasLibresBASIC" title="Aulas libres Simuladas"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateTime" 
						action="availableRooms" time="false" />
				</div>
				<div id="AulasOcupadas">
					<g:modalForm id="AulasOcupadasBASIC" title="Aulas ocupadas Simuladas"
						modalTemplate="/modaldynamix/modalbasic"
						modalTemplatePage="/popups/selectDateTime" 
						action="notAvailableRooms" time="false" />
				</div>
				<g:layoutBody />
			</section>
		</aside>
	</div>

<r:layoutResources />
	

	
	<script src="${resource(dir: 'js', file: 'raphael-min.js')}"
		type="text/javascript"></script>
	<script src="${resource(dir: 'js', file: 'jquery-ui-1.10.3.min.js')}"
		type="text/javascript"></script>
	<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/morris', file: 'morris.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/sparkline', file: 'jquery.sparkline.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/jvectormap', file: 'jquery-jvectormap-1.2.2.min.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/jvectormap', file: 'jquery-jvectormap-world-mill-en.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/fullcalendar', file: 'fullcalendar.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/jqueryKnob', file: 'jquery.knob.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/daterangepicker', file: 'daterangepicker.js')}"
		type="text/javascript"></script>
	<script
		src="${resource(dir: 'js/plugins/bootstrap-wysihtml5', file: 'bootstrap3-wysihtml5.all.min.js')}"
		type="text/javascript"></script>
	<script src="${resource(dir: 'js/AdminLTE', file: 'app.js')}"
		type="text/javascript"></script>
	<script src="${resource(dir: 'js/AdminLTE', file: 'dashboard.js')}"
		type="text/javascript"></script>
</body>
</html>