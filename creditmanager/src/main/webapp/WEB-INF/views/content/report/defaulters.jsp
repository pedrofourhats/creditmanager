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
				<h3>Cartera en mora.</h3>
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
						<table class="table table-hover table-condensed table-responsive table-report-detail-expanded">
						  <thead>
							<tr>
							  <th>
							  	<a href="javascript:void(0);">
							  		<!-- cambiar a fa-caret-up -->
							  		N° Proyecto <i class="fa fa-caret-down pull-right"></i>
							  	</a>
							  </th>
							  <th>
							  	<a href="javascript:void(0);">
							  		<!-- cambiar a fa-caret-up -->
							  		Apellido y nombre <i class="fa fa-caret-down pull-right"></i>
							  	</a>
							  </th>
							  <th>
							  	Capital otorgado
							  </th>
							  <th>
							  	Fecha de otorgamiento
							  </th>
							  <th>
							  	Deuda original (K+I)
							  </th>
							  <th>
							  	Saldo deudor (K+I+P+C)
							  </th>
							  <th>
							  	Plazo otorgado
							  </th>
							  <th>
							  	Cuotas pagadas
							  </th>
							  <th>
							  	Fecha de pago
							  </th>
							  <th>
							  	Importe pagado
							  </th>
							  <th>
							  	Cuotas impagadas
							  </th>
							  <th>
							  	Dias transcurridos
							  </th>
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
							</tr>
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