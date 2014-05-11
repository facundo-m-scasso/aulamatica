<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Aulamatica | Secretaria Academica - ITBA"/></title>
		<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet" type="text/css" />
		<link href="${resource(dir: 'css', file: 'font-awesome.min.css')}" rel="stylesheet" type="text/css" />
		<link href="${resource(dir: 'css', file: 'ionicons.min.css')}" rel="stylesheet" type="text/css" />
		<link href="${resource(dir: 'css/jvectormap', file: 'jquery-jvectormap-1.2.2.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir: 'css/fullcalendar', file: 'fullcalendar.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir: 'css/daterangepicker', file: 'daterangepicker-bs3.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir: 'css/bootstrap-wysihtml5', file: 'bootstrap3-wysihtml5.min.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir: 'css', file: 'AdminLTE.css')}" rel="stylesheet" type="text/css" />
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body class="skin-blue">
        <header class="header" style="position: fixed;">
            <a href="index.html" class="logo">
                ITBA - Aulamatica
            </a>
            <nav class="navbar navbar-static-top" role="navigation">
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">Tenes 1 mensaje</li>
                                <li>
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="${resource(dir: 'img', file: 'silviaGomez.jpg')}" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Dpto. Ing. Informatica
                                                    <small><i class="fa fa-clock-o"></i>5 hs</small>
                                                </h4>
                                                <p>Aula Magna para el 30/05</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">Ver todos los mensajes</a></li>
                            </ul>
                        </li>
                        </li>
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>Federico Ferrando<i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="user-header bg-light-blue">
                                    <img src="${resource(dir: 'img', file: 'federicoFerrando.jpg')}" class="img-circle" alt="User Image" />
                                    <p>
                                        Federico Ferrando - Asistente de Procesos y Sistemas ITBA
                                        <small>Miembro desde Nov. 2011</small>
                                    </p>
                                </li>
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Perfil</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">Salir</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <aside class="left-side sidebar-offcanvas">                
                <section class="sidebar">
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="index.html">
                                <i class="fa fa-dashboard"></i> <span>Inicio</span>
                            </a>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-th"></i> <span>Reportes</span>
                                    <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/forms/general.html"><i class="fa fa-angle-double-right"></i>Tiempo Real</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Tetris TR</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Tetris TR CH</a></li>
                                <li><a href="pages/forms/editors.html"><i class="fa fa-angle-double-right"></i>Aulas Libres TR</a></li>
                                <li><a href="pages/forms/editors.html"><i class="fa fa-angle-double-right"></i>Aulas Ocupadas TR</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Factor Ocupacional</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Dia Siguiente</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Tiempo Real SIM</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Tetris SIM</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Tetris SIM CH</a></li>
                                <li><a href="pages/forms/editors.html"><i class="fa fa-angle-double-right"></i>Aulas Libres SIM</a></li>
                                <li><a href="pages/forms/editors.html"><i class="fa fa-angle-double-right"></i>Aulas Ocupadas SIM</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-edit"></i> <span>Solicitudes de Aulas</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/forms/general.html"><i class="fa fa-angle-double-right"></i>Solicitar Aula</a></li>
                                <li><a href="pages/forms/advanced.html"><i class="fa fa-angle-double-right"></i>Listado de solicitudes</a></li>                                
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-table"></i> <span>Administracion</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/tables/simple.html"><i class="fa fa-angle-double-right"></i>Aulas</a></li>
                                <li><a href="pages/tables/data.html"><i class="fa fa-angle-double-right"></i>Materias</a></li>
                                <li><a href="pages/tables/data.html"><i class="fa fa-angle-double-right"></i>SGA</a></li>
                                <li><a href="pages/tables/data.html"><i class="fa fa-angle-double-right"></i>Mutant</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
            </aside>
            <aside class="right-side">                
                <section class="content-header">
                    <h1>
                        Aulamática
                        <small>Inicio</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li class="active"><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                    </ol>
                </section>
                <section class="content">
                	<g:layoutBody/>
                </section>
            </aside>
        </div>
        <r:layoutResources />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="${resource(dir: 'js', file: 'jquery-ui-1.10.3.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/morris', file: 'morris.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/sparkline', file: 'jquery.sparkline.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/jvectormap', file: 'jquery-jvectormap-1.2.2.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/jvectormap', file: 'jquery-jvectormap-world-mill-en.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/fullcalendar', file: 'fullcalendar.min.js')}" type="text/javascript"></script>        
        <script src="${resource(dir: 'js/plugins/jqueryKnob', file: 'jquery.knob.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/daterangepicker', file: 'daterangepicker.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/bootstrap-wysihtml5', file: 'bootstrap3-wysihtml5.all.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/plugins/iCheck', file: 'icheck.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/AdminLTE', file: 'app.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/AdminLTE', file: 'dashboard.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/AdminLTE', file: 'demo.js')}" type="text/javascript"></script>
	</body>
</html>