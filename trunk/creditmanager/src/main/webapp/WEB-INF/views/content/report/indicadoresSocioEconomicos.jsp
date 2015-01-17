<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	<div class="container">
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
								    Seleccionar fecha
								    <i class="fa fa-chevron-down"></i>
								  </a>
								  <ul class="dropdown-menu">
								    <li><a href="#">2/1/2015</a></li>
							          <li><a href="#">2/1/2015</a></li>
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
								<tr>
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
								  <td>YYY</td>
								  <td>YYY</td>
								  <td>YYY</td>
								</tr>
							  </tbody>
							</table>
						</div>
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