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
				<h3>Movimientos</h3>
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
				    <li role="presentation">
				    	<a href="javascript:void(0);" aria-controls="totales" role="tab" data-toggle="tab">Totales</a>
				    </li>
				    <li role="presentation">
				    	<a href="javascript:void(0);" aria-controls="reporte-bancos" role="tab" data-toggle="tab">Reporte bancos</a>
				    </li>
				    <li role="presentation">
				    	<a href="javascript:void(0);" aria-controls="depositos-sin-detalle" role="tab" data-toggle="tab">Depositos sin detalle</a>
				    </li>
				    <li role="presentation">
				    	<a href="javascript:void(0);" aria-controls="pagos-escribanos" role="tab" data-toggle="tab">Pagos escribanos</a>
				    </li>
				    <li role="presentation">
				    	<a href="javascript:void(0);" aria-controls="cheques-entregados" role="tab" data-toggle="tab">Cheques entregados</a>
				    </li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
				    <div role="tabpanel" class="tab-pane fade in active" id="institutional">
				    	Sin definir aun...
				    </div>
				    <div role="tabpanel" class="tab-pane fade" id="reporte-bancos">
				    	<div class="row">
							<div class="col-sm-12">
								<table class="table table-hover table-condensed table-responsive table-report-detail-expanded">
								  <thead>
								  	<tr>
								  	  <th colspan="2"></th>
								  	  <th colspan="2">Ing. cuota</th>
								  	  <th>Total ingreso</th>
								  	  <th colspan="2">Total egreso</th>
								  	  <th></th>
								  	</tr>
								  </thead>	
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Fecha <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	Concepto
									  </th>
									  <th>
									  	Capital
									  </th>
									  <th>
									  	Interes + iva
									  </th>
									  <th>
									  	
									  </th>
									  <th>
									  	Creditos
									  </th>
									  <th>
									  	Gasto
									  </th>
									  <th>
									  	Saldo
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
				    <div role="tabpanel" class="tab-pane fade" id="depositos-sin-detalle">
				    	<div class="row">
							<div class="col-sm-12">
								<table class="table table-hover table-condensed table-responsive table-report-detail-expanded">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Fecha deposito <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Monto <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Fecha confirmación <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	Proyecto
									  </th>
									  <th>
									  	Emprendedor
									  </th>
									  <th colspan="4">
									  	Observaciones
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
									  <td colspan="4">YYY</td>
									</tr>
									<tr>
									  <td>YYY</td>	
									  <td>YYY</td>
									  <td>YYY</td>
									  <td>YYY</td>
									  <td>YYY</td>
									  <td colspan="4">YYY</td>
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
				    <div role="tabpanel" class="tab-pane fade" id="pagos-escribanos">
				    	<div class="row">
							<div class="col-sm-12">
								<table class="table table-hover table-condensed table-responsive table-report-detail-expanded">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Fecha de facturación <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Factura <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Monto <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	Escribano
									  </th>
									  <th>
									  	Mes de pago
									  </th>
									  <th>
									  	Cheque
									  </th>
									  <th>
									  	Dep. bco.
									  </th>
									  <th colspan="4">
									  	Observaciones
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
									  <td colspan="4">YYY</td>
									</tr>
									<tr>
									  <td>YYY</td>	
									  <td>YYY</td>
									  <td>YYY</td>
									  <td>YYY</td>
									  <td>YYY</td>
									  <td>YYY</td>
									  <td>YYY</td>
									  <td colspan="4">YYY</td>
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
				    <div role="tabpanel" class="tab-pane fade" id="cheques-entregados">
				    	<div class="row">
							<div class="col-sm-12">
								<table class="table table-hover table-condensed table-responsive table-report-detail-expanded">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Proyecto <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Emprendedor <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Fecha de emisión <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	N° cheque
									  </th>
									  <th>
									  	Monto
									  </th>
									  <th>
									  	Entrega CAFESGS
									  </th>
									  <th>
									  	Entrega emprendedor
									  </th>
									  <th>
									  	Fecha deposito
									  </th>
									  <th>
									  	Estado
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
		    	</div>

			</div>
		</div>
	</div>


	<script>
		$("#goToReportsLink").addClass("active");
	</script>
</body>
</html>