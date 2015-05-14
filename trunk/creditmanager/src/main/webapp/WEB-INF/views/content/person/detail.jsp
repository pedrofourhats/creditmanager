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
							<h4>Nombre:  <span>{{person.surname}}, {{person.name}}</span></h4>
						</div>
						<div class="col-sm-12">
							<h4>Tipo: <span>{{person.type}}</span></h4>
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
							Fecha de nacimiento: <span class="txtBlue">{{person.formattedBirthDate}}</span> <span id="result"></span>
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
							Dirección: <span class="txtBlue">{{person.address}} {{person.addressNumber}} <span ng-show="person.addressFloor">Piso</span> {{person.addressFloor}} <span ng-show="person.addressAppartment">Departamento/Localidad</span> {{person.addressAppartment}}</span>							<br>
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

	$( document ).ready(function() {
		calcularEdad();
	});
	
		function isValidDate(day,month,year) {
		    var dteDate;
		    month=month-1;
		    dteDate=new Date(year,month,day);
		    return ((day==dteDate.getDate()) && (month==dteDate.getMonth()) && (year==dteDate.getFullYear()));
		}

		function validate_fecha(fecha) {
		    var patron=new RegExp("^(19|20)+([0-9]{2})([-])([0-9]{1,2})([-])([0-9]{1,2})$");
		 
		    if(fecha.search(patron)==0)
		    {
		        var values=fecha.split("-");
		        if(isValidDate(values[2],values[1],values[0]))
		        {
		            return true;
		        }
		    }
		    return false;
		}

		function calcularEdad()
		{
			var fecha = personDetail.formattedBirthDate;
		    var fechas = personDetail.formattedBirthDate.split("-");
		    if(fechas.length > 1) {
		    	fecha = fechas[2] + "-" + fechas[1] + "-" + fechas[0];
		    }
		    
		    if(validate_fecha(fecha)==true)
		    {
		        var values=fecha.split("-");
		        var dia = values[2];
		        var mes = values[1];
		        var ano = values[0];
		 
		        var fecha_hoy = new Date();
		        var ahora_ano = fecha_hoy.getYear();
		        var ahora_mes = fecha_hoy.getMonth()+1;
		        var ahora_dia = fecha_hoy.getDate();
		 
		        var edad = (ahora_ano + 1900) - ano;
		        if ( ahora_mes < mes )
		        {
		            edad--;
		        }
		        if ((mes == ahora_mes) && (ahora_dia < dia))
		        {
		            edad--;
		        }
		        if (edad > 1900)
		        {
		            edad -= 1900;
		        }
		 
		        var meses=0;
		        if(ahora_mes>mes)
		            meses=ahora_mes-mes;
		        if(ahora_mes<mes)
		            meses=12-(mes-ahora_mes);
		        if(ahora_mes==mes && dia>ahora_dia)
		            meses=11;
		 
		        var dias=0;
		        if(ahora_dia>dia)
		            dias=ahora_dia-dia;
		        if(ahora_dia<dia)
		        {
		            ultimoDiaMes=new Date(ahora_ano, ahora_mes, 0);
		            dias=ultimoDiaMes.getDate()-(dia-ahora_dia);
		        }
		 
		        document.getElementById("result").innerHTML= "  (" + edad + " años)";
		    }else{
		        document.getElementById("result").innerHTML="La fecha "+fecha+" es incorrecta";
		    }
		}
	</script>
</body>
</html>