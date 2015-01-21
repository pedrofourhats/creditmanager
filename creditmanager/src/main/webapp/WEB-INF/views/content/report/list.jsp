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
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>Listado de reportes</h3>
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-hover table-condensed table-responsive table-report-list">
						  <thead>
							<tr>
							  <th>
							  	<a href="javascript:void(0);">
							  		<!-- cambiar a fa-caret-up -->
							  		Nombre <i class="fa fa-caret-down pull-right"></i>
							  	</a>
							  </th>
							  <th>
							  	<a href="javascript:void(0);">
							  		<!-- cambiar a fa-caret-up -->
							  		Descripción
							  	</a>
							  </th>
							  <th class="txtC">Acciones</th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td>Datos filiatorios titulares</td>
							  <td>Detalle de datos filiatorios titulares</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/datosFiliatoriosTitulares')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Cartera en mora</td>
							  <td>Detalle de la cartera en mora</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/defaulters')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Cartera de créditos activos</td>
							  <td>Detalle de Cartera de créditos activos</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/carteraDeCreditosActivos')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Indicadores socio-economicos</td>
							  <td>Detalle de Indicadores socio-economicos</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/indicadoresSocioEconomicos')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Movimientos</td>
							  <td>Detalle de Movimientos</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/movimientos')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Creditos otorgados</td>
							  <td>Detalle de Creditos otorgados</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/creditosOtorgados')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Cobranzas</td>
							  <td>Detalle de Cobranzas</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/cobranzas')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Estado de cartera</td>
							  <td>Detalle de la cartera en mora</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/estadoDeCartera')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
							<tr>
							  <td>Movimiento de banco</td>
							  <td>Detalle de Movimiento de banco</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link" onclick="redirect('report/movimientoDeBanco')"><i class="fa fa-eye txtSuccess" ></i></button>
							  </td>
							</tr>
						  </tbody>
						</table>
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