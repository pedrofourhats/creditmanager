<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	
	<script type="text/javascript">
		angular.module('repApp', [])
		.controller('repController', function($scope, $http){
			$scope.items = [];
			$scope.dates = [];
			var months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
			
			$scope.generateReport = function(){
				var firstDay = new Date($scope.chosenDate.date.getFullYear(), $scope.chosenDate.date.getMonth(), 1);
				var lastDay = new Date($scope.chosenDate.date.getFullYear(), $scope.chosenDate.date.getMonth() + 1, 0);
				
				$http.get(getCompletePath("report/api/socioeconomicIndicator"), { params: { dateFrom: convertDate(firstDay), dateTo: convertDate(lastDay) } })
				.success(function (items) {
					$scope.items = items;
			    }).error(function () {
			    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
			    });
			};
			
			$scope.chooseDate = function(date){
				$scope.chosenDate = date;
				$scope.generateReport();
			};
			
			var date = new Date();
			$scope.dates.push({ text: 'Seleccionar fecha', date: null });
			for(var i=0; i<12; i++){
				var newDate = new Date(date.getTime());
				$scope.dates.push({ text: months[newDate.getMonth()] + ' - ' + newDate.getFullYear(), date: newDate });
				date.setMonth(date.getMonth() - 1, 1);
			}
			
			$scope.chosenDate = $scope.dates[0];
		});
		
		function convertDate(inputFormat) {
		  function pad(s) { return (s < 10) ? '0' + s : s; }
		  var d = new Date(inputFormat);
		  return [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('/');
		}
	</script>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>
<body ng-app="repApp">
	<%@ include file="../../include/header.jsp" %>
	<div class="container" ng-controller="repController">
		<ol class="breadcrumb">
		  <li><a href="#"><i class="fa fa-angel-right"></i> Listado de reportes</a></li>
		  <li class="active"><i class="fa fa-angel-right"></i> Detalle de reporte</li>
		</ol>
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Indicadores socioeconómicos.</h3>
				<div class="row mt20">
					<div class="col-sm-12">
						<div class="form-inline">
							<div class="form-group">
								<label>Fecha</label>
								<div class="dropdown">
								  <a id="" type="button" data-toggle="dropdown">
								    {{chosenDate.text}}
								    <i class="fa fa-chevron-down"></i>
								  </a>
								  <ul class="dropdown-menu">
									<li ng-repeat="date in dates" ng-click="chooseDate(date)">
										<a href="#">{{date.text}}</a>
									</li>
								  </ul>
								</div>
							</div>
						</div>		
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="table-content">
							<table class="table table-hover table-condensed table-responsive table-report-expanded table-long">
							  <thead>
								<tr>
								  <th rowspan="2">
								  	Total de proyectos ingresados por Mes/Año
								  </th>
								  <th colspan="3">
								  	Estado de los proyectos
								  </th>
								  <th colspan="2">
								  	Servicer
								  </th>
								  <th colspan="3">
								  	Tipo de activdad
								  </th>
								  <th colspan="2">
								  	Temporalidad
								  </th>
								  <th colspan="2">
								  	Tipo de emprendimiento
								  </th>
								  <th colspan="4">
								  	Tipo de inversión
								  </th>
								  <th colspan="7">
								  	Otros indicadores
								  </th>
								</tr>

								<tr>
								  <th>Aprobados</th>
								  <th>Rechazados</th>
								  <th>Evaluación</th>
								  <th>INTI</th>
								  <th>INTA</th>
								  <th>Industrial</th>
								  <th>Servicios</th>
								  <th>Agropecuario</th>
								  <th>Nuevos</th>
								  <th>Existentes</th>

								  <th>Individual</th>
								  <th>Asociativo</th>
								  <th>Construcción</th>
								  <th>Utilitarios</th>
								  <th>K de trabajos</th>
								  <th>Otros</th>
								  <th>Genero</th>
								  <th>Edad</th>
								  <th>Localidad</th>
								  <th>Rubro</th>
								  <th>Puestos de trabajo generados</th>
								  <th>Cantidad de ingresos familiares</th>
								  <th>Habilitados</th>
								</tr>
							  </thead>
							  <tbody>
								<tr ng-repeat="item in items">
								  <td>{{item.total}}</td>	
								  <td>{{item.aprobados}}</td>
								  <td>{{item.rechazado}}</td>
								  <td>{{item.evaluacion}}</td>
								  <td>{{item.inti}}</td>
								  <td>{{item.inta}}</td>
								  <td>{{item.industria}}</td>
								  <td>{{item.servicios}}</td>
								  <td>{{item.agropecuario}}</td>
								  <td>{{item.nuevo}}</td>
								  <td>{{item.existente}}</td>
								  <td>{{item.individual}}</td>

								  <td>{{item.asociativo}}</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								</tr>
							  </tbody>
							</table>
						</div>
<!-- 						<nav> -->
<!-- 						  <ul class="pagination pull-right"> -->
<!-- 							<li><a href="#"><i class="fa fa-chevron-left"></i></a></li> -->
<!-- 							<li><a href="#">1</a></li> -->
<!-- 							<li><a href="#">2</a></li> -->
<!-- 							<li><a href="#">3</a></li> -->
<!-- 							<li><a href="#"><i class="fa fa-chevron-right"></i></a></li> -->
<!-- 						  </ul> -->
<!-- 						</nav> -->
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-right">
							<div class="form-group">
								<button type="button" class="btn btn-primary">
									<i class="fa fa-file-excel-o"></i> Importar resultados a excel
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		$("#goToReportsLink").addClass("active");
	</script>
</body>
</html>