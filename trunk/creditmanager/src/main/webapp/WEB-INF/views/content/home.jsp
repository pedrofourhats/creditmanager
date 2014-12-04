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
	<script src="<%=stylePageContext %>/static/js/less-1.7.5.min.js" type="text/javascript"></script>
	<script src="<%=stylePageContext %>/static/js/jquery.min.js" type="text/javascript"></script>		
	<script src="<%=stylePageContext %>/static/js/bootstrap.js" type="text/javascript"></script>
	<!-- STYLESHEET -->
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/font-awesome.css" />
	<!-- LESS -->
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/less/fwk/bootstrap.less" />
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/less/styles.less" />
</head>
<body>
	<header>
		<div class="container container-header">
			<div class="pull-left">
				<h1 class="logo"></h1>
			</div>
			<div class="pull-right">
				<button type="button" class="btn btn-default">
					<i class="fa fa-sign-out"></i> Salir
				</button>
			</div>
		</div>
	</header>
	
	<nav class="main-nav">
		<div class="container">
			<ul>
				<li class="active">
					<a href="">PROYECTOS</a>
				</li>
				<li>
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
						<i class="fa fa-plus-circle"></i> Nuevo proyecto
					</button>
				</div>
			</div>
			<div class="pull-right form-inline">
				<div class="form-group">
					<label for="exampleInputEmail1">Buscar por ID de proyecto</label>
					<input type="email" class="form-control" placeholder="ID de proyecto">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary">
						<i class="fa fa-search"></i> Busqueda avanzada
					</button>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-hover table-condensed table-responsive">
					  <thead>
						<tr>
						  <th>#</th>
						  <th>First Name</th>
						  <th>Last Name</th>
						  <th>Username</th>
						</tr>
					  </thead>
					  <tbody>
						<tr>
						  <td>1</td>
						  <td>Mark</td>
						  <td>Otto</td>
						  <td>@mdo</td>
						</tr>
						<tr>
						  <td>2</td>
						  <td>Jacob</td>
						  <td>Thornton</td>
						  <td>@fat</td>
						</tr>
						<tr>
						  <td>3</td>
						  <td colspan="2">Larry the Bird</td>
						  <td>@twitter</td>
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