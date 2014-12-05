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
			<div class="pull-left">
				<div class="form-group">
					<button type="button" class="btn btn-primary">
						<i class="fa fa-plus-circle"></i> Nuevo persona
					</button>
				</div>
			</div>
			<div class="pull-right form-inline">
				<div class="form-group">
					<label for="exampleInputEmail1">Buscar persona</label>
					<input type="email" class="form-control" placeholder="Ingrese nombre">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary">
						<i class="fa fa-search"></i> Buscar
					</button>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-hover table-condensed table-responsive table-persons">
					  <thead>
						<tr>
						  <th>Nombre</th>
						  <th>Documento</th>
						  <th>Nacimiento</th>
						  <th>Genero</th>
						  <th>Telefono</th>
						  <th>Celular</th>
						  <th class="txtC">Acciones</th>
						</tr>
					  </thead>
					  <tbody>
						<tr>
						  <td>Nombre Simulado</td>
						  <td>22222222</td>
						  <td>11/11/1990</td>
						  <td>Genero</td>
						  <td>55555555</td>
						  <td>1155555555</td>
						  <td class="txtC">
							<button type="button" class="btn btn-link"><i class="fa fa-pencil txtSuccess"></i></button>
							<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
						  </td>
						</tr>
						<tr>
						  <td>Nombre Simulado</td>
						  <td>22222222</td>
						  <td>11/11/1990</td>
						  <td>Genero</td>
						  <td>55555555</td>
						  <td>1155555555</td>
						  <td class="txtC">
							<button type="button" class="btn btn-link"><i class="fa fa-pencil txtSuccess"></i></button>
							<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
						  </td>
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