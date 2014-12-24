<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="personApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	<script>
		var personDetail = <%= request.getAttribute("person") %>; 
	</script>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>

<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section ng-controller="personDetailController">
		<div class="container">
			<ol class="breadcrumb">
			  <li><a href="#"><i class="fa fa-angel-right"></i> Personas</a></li>
			  <li class="active"><i class="fa fa-angel-right"></i> Detalle de persona</li>
			</ol>
			<div class="panel panel-default">
				<div class="panel-body">
					<h3>PERFIL PERSONA</h3>
					<h4>Datos e historial</h4>
					<hr>
					<div class="row txtBlue">
						<div class="col-sm-12">
							<h4>Nombre: <span>{{person.name}}</span> <span>{{person.surname}}</span></h4>
						</div>								
					</div>
					<hr>
					<div class="row txtGrayd">
						<div class="col-sm-4">
							Tipo de documento: <span class="txtBlue">{{person.identityTypeName}}</span>
							<br>
							Número de documento: <span class="txtBlue">{{person.identityNumber}}</span>
						</div>
						<div class="col-sm-4">
							Fecha de nacimiento: <span class="txtBlue">{{person.birthDate}}</span>
							<br>
							Genero:	<span class="txtBlue">{{person.genderName}}</span>							
						</div>
						<div class="col-sm-4">
							Celular: <span class="txtBlue">{{person.cellphone}}</span>
							Email: <span class="txtBlue">{{person.email}}</span>
						</div>
					</div>
					<hr>
					<div class="row txtGrayd">
						<div class="col-sm-4">
							Provincia: <span class="txtBlue">{{person.province}}</span>
							<br>
							Localidad: <span class="txtBlue">{{person.locality}}</span>
						</div>
						<div class="col-sm-4">
							Dirección: <span class="txtBlue">{{person.address}}</span>
							<br>
							Código postal: <span class="txtBlue">{{person.postCode}}</span>
						</div>
						<div class="col-sm-4">
							Teléfono: <span class="txtBlue">{{person.phone}}</span>
							<br>
							Teléfono laboral: <span class="txtBlue">{{person.workPhone}}</span>
						</div>							
					</div>
					<hr>
					<h4>Participación en proyectos</h4>
					<table class="table table-hover table-condensed table-responsive table-my-projects">
					  <thead>
						<tr>
						  <th>Proyecto
						  	<a href="javascript:void(0);">
						  		<!-- cambiar a fa-caret-up -->
						  		Proyecto<!--  <i class="fa fa-caret-down pull-right"></i> -->
						  	</a>
						  </th>
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
	
	<script src="<%=scriptPageContext %>/static/scripts/viewmodels/persons/personDetail.js" type="text/javascript"></script>
	<script>
		$("#goToPersonsLink").addClass("active");
	</script>
</body>
</html>