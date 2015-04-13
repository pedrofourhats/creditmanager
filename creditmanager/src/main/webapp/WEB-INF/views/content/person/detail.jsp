<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="personApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	
	<%@ include file="../../include/scripts.jsp" %>
	<script>
		var personDetail = <%= request.getAttribute("person") %>;
		var guarantorProjects = <%= request.getAttribute("guarantorProjects") %>;
		var holderProjects = <%= request.getAttribute("holderProjects") %>;
	</script>
	
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
							Fecha de nacimiento: <span class="txtBlue">{{person.formattedBirthDate}}</span>
							<br>
							Genero:	<span class="txtBlue">{{person.genderName}}</span>							
						</div>
						<div class="col-sm-4">
							Celular: <span class="txtBlue">{{person.cellPhone}}</span>
							<br>
							Email: <span class="txtBlue"><a href="mailto:{{person.email}}">{{person.email}}</a></span>
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
						  <th>
						  	<a href="javascript:void(0);">
						  		Proyecto
						  	</a>
						  </th>
						  <th>ID Proyecto</th>
						  <th>Cargo</th>
						  <th>Acciones</th>
						</tr>
					  </thead>
					  <tbody>
						<tr ng-repeat="project in guarantorProjects">
						  <td>{{project.title}}</td>
						  <td>{{project.number}}</td>
						  <td>Garante</td>
						  <td>
								<button type="button" class="btn btn-link" ng-click="goToProject(project.id)">
									<i class="fa fa-pencil txtSuccess"></i>
								</button>
								<button type="button" class="btn btn-link" ng-click="goToProjectReadOnly(project.id)">
									<i class="fa fa-eye txtSuccess"></i>
								</button>								
							</td>
						</tr>
						<tr ng-repeat="project in holderProjects">
						  <td>{{project.title}}</td>
						  <td>{{project.number}}</td>
						  <td>Titular</td>
						  <td>
								<button type="button" class="btn btn-link" ng-click="goToProject(project.id)">
									<i class="fa fa-pencil txtSuccess"></i>
								</button>
								<button type="button" class="btn btn-link" ng-click="goToProjectReadOnly(project.id)">
									<i class="fa fa-eye txtSuccess"></i>
								</button>								
							</td>
						</tr>
					  </tbody>
					</table>
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