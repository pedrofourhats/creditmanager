<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html ng-app="formApp">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>INTI</title>
  <!-- SCRIPTS -->
  <%@ include file="../../include/scripts.jsp" %>
  	<script>
		var project = <%= request.getAttribute("project") %>;
		var formName = '<%= request.getAttribute("formName") %>';
	</script>
  
  <!-- STYLESHEET -->
  <%@ include file="../../include/styles.jsp" %>
</head>
<body>
  <%@ include file="../../include/header.jsp" %>

  <div class="container forms-list" ng-controller="formController">
	    <div class="panel panel-default">
			<div class="panel-body">
					<h3>Calendario de pagos</h3>
	
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" ng-class="{'active': step == 1 }">
					    	<a href="javascript:void(0);" aria-controls="institutional" role="tab" data-toggle="tab" ng-click="changeStep(1)">Detalle cuotas cobradas</a>
					    </li>
					    <li role="presentation" ng-class="{'active': step == 2 }">
					    	<a href="javascript:void(0);" aria-controls="aspects" role="tab" data-toggle="tab" ng-click="changeStep(2)">Gestión de cobranzas</a>
					    </li>
					    <li role="presentation" ng-class="{'active': step == 3 }">
					    	<a href="javascript:void(0);" aria-controls="forms" role="tab" data-toggle="tab" ng-click="changeStep(3)">Cobranzas simples y polo</a>
					    </li>
					</ul>
					
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="institutional" ng-class="{'in active': step == 3 }">
							<table class="table table-hover table-condensed table-responsive table-report-expanded">
								<thead>
									<tr>
									<th>Nº</th>
									<th>Tasa de Interes</th>
									<th>Vencimientos</th>
									<th>Periodo</th>
									<th>Cuotas Pagadas</th>
									<th>Cuotas Vencidas</th>
									<th>Cuotas x Vencer</th>
									<th>Monto Cuota (1)</th>
									<th>Fecha de Real de Pago</th>
									<th>Pago Real (2)</th>
									<th>Días</th>
									<th>Saldo Final de Capital</th>
									<th>Saldo Inicial de Capital</th>
									<th>Disminución x Pago de Cuotas</th>
									<th></th>
									<th>Nº</th>
									<th>Capital</th>
									<th>Tasa</th>
									<th>Interés</th>
									<th>IVA 21%</th>
									<th>Monto Cuota</th>
									<th>Punit./Adm.</th>
									<th>Cuota + Punit.</th>
									<th>Días Transc.</th>
									<th>Saldo Mensual</th>
									<th>Gastos Adm. X Gestión de Cobranza</th>
									</tr>
								</thead>
								<tr>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
									<td>Y</td>
								</tr>									
							</table>

						</div>
					</div>
	      </div>
	    </div>
	</div>
  <script src="<%=scriptPageContext %>/static/scripts/viewmodels/forms/form.js" type="text/javascript"></script>
</body>
</html>