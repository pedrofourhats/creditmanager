<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<% String stylePageContext = request.getContextPath(); %>
	<!-- SCRIPTS -->
	<script src="<%=stylePageContext %>/static/js/jquery.min.js" type="text/javascript"></script>		
	<script src="<%=stylePageContext %>/static/js/bootstrap.js" type="text/javascript"></script>
	<!-- STYLESHEET -->
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/fwk/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/styles.css" />
</head>
<body>
	<header>
		<div class="container container-header">
			<div class="pull-left">
				<h1 class="logo"></h1>
			</div>
			<div class="pull-right">
				<button type="button" class="btn btn-default  btn-exit">
					<i class="fa fa-sign-out"></i> Salir
				</button>
			</div>
		</div>
	</header>
	
	<nav class="main-nav">
		<div class="container">
			<ul>
				<li>
					<a href="">PROYECTOS</a>
				</li>
				<li class="active">
					<a href="">PERSONAS</a>
				</li>
				<li>
					<a href="">FORMULARIOS</a>
				</li>
				<li>
					<a href="">REPORTES</a>
				</li>					
			</ul>
		</div>
	</nav>
	
	<section>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">
					<h3>PERFIL PERSONA</h3>
					<h4>Datos e historial</h4>
					<hr>
					<div class="row txtBlue">
						<div class="col-sm-12">
							<h4>Nombre: <span>Nombre</span> <span>Apellido</span></h4>
						</div>								
					</div>
					<hr>
					<div class="row txtGrayd">
						<div class="col-sm-4">
							Tipo de documento: <span class="txtBlue">Nombre</span>
							<br>
							Número de documento: <span class="txtBlue">22222222</span>
						</div>
						<div class="col-sm-4">
							Fecha de nacimiento: <span class="txtBlue">22/22/2222</span>
							<br>
							Genero:	<span class="txtBlue">22/22/2222</span>							
						</div>
						<div class="col-sm-4">
							Celular: <span class="txtBlue">22222222</span>
							Email: <span class="txtBlue">email@email.com</span>
						</div>
					</div>
					<hr>
					<div class="row txtGrayd">
						<div class="col-sm-4">
							Provincia: <span class="txtBlue">PPPPPPPP</span>
							<br>
							Localidad: <span class="txtBlue">LLLLLLLL</span>
						</div>
						<div class="col-sm-4">
							Dirección: <span class="txtBlue">DDDDDDDD</span>
							<br>
							Código postal: <span class="txtBlue">CPCPCPCP</span>
						</div>
						<div class="col-sm-4">
							Teléfono: <span class="txtBlue">55555555</span>
							<br>
							Teléfono laboral: <span class="txtBlue">44444444</span>
						</div>							
					</div>
					<hr>
					<h4>Participación en proyectos</h4>
					<table class="table table-hover table-condensed table-responsive table-my-projects">
					  <thead>
						<tr>
						  <th>Proyecto</th>
						  <th>ID Proyecto</th>
						  <th>Cargo</th>
						</tr>
					  </thead>
					  <tbody>
						<tr>
						  <td>Diseño industrial</td>
						  <td>1A-2345</td>
						  <td>Titular</td>
						</tr>
						<tr>
						  <td>Metalurgica</td>
						  <td>1B-2345</td>
						  <td>Testigo</td>
						</tr>
					  </tbody>
					</table>
					<nav>
					  <ul class="pagination pull-right">
						<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
	
	</footer>
</body>
</html>