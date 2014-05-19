<%@page import="com.itba.oauth.GoogleAuthHelper"%>
<!DOCTYPE html>
<html class="bg-black">
<head>
<meta charset="UTF-8">
<title>Aulamatica | Login</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	rel="stylesheet" type="text/css" />
<link href="${resource(dir: 'css', file: 'font-awesome.min.css')}"
	rel="stylesheet" type="text/css" />
<link href="${resource(dir: 'css', file: 'AdminLTE.css')}"
	rel="stylesheet" type="text/css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="bg-black">
	<div class="form-box" id="login-box">
		<div class="header">Ingreso - Aulamatica </div>
		<form action="" method="post">
			<div class="body bg-gray">
				<g:if test="${params.login.equals('ERROR')}">
					<div class="alert alert-danger alert-dismissable">
						<i class="fa fa-ban"></i>
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">&times;</button>
						<b>Cuidado!</b> Ha ocurrido un error en el login.
					</div>
				</g:if>
				<g:elseif test="${params.login.equals('ERRORDOMAIN')}">
				<div class="alert alert-danger alert-dismissable">
						<i class="fa fa-ban"></i>
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">&times;</button>
						<b>Cuidado!</b> Quisiste entrar con una cuenta NO ITBA.
					</div>
				</g:elseif>
				<a class="btn btn-block btn-social btn-google-plus"
					href="${
						new GoogleAuthHelper().buildLoginUrl();}"> <i
					class="fa fa-google-plus"></i> Ingresar con cuenta ITBA Google.
				</a>
			</div>
			<div class="footer">Secretaría Académica - ITBA - 2014</div>
		</form>
		<div class="margin text-center">
			<span>Aulamatica en las redes sociales</span> <br />
			<button class="btn bg-light-blue btn-circle">
				<i class="fa fa-facebook"></i>
			</button>
			<button class="btn bg-aqua btn-circle">
				<i class="fa fa-twitter"></i>
			</button>
			<button class="btn bg-red btn-circle">
				<i class="fa fa-google-plus"></i>
			</button>
		</div>
	</div>
	<script src="${resource(dir: 'js', file: 'jquery-2-0-2.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"
		type="text/javascript"></script>
</body>
</html>