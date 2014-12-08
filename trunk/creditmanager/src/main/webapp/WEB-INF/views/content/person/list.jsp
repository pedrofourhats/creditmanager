<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>

<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section>
		<div class="container">
			<div class="pull-left">
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="redirect('person/create');">
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
							<button type="button" class="btn btn-link" onclick="redirect('person/detail');"><i class="fa fa-pencil txtSuccess"></i></button>
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
							<button type="button" class="btn btn-link" onclick="redirect('person/detail');"><i class="fa fa-pencil txtSuccess"></i></button>
							<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
						  </td>
						</tr>
					  </tbody>
					</table>
					<nav>
					  <ul class="pagination pul
					  l-right">
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
	<script>
		$("#goToPersonsLink").addClass("active");
	</script>
</body>
</html>