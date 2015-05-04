<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html ng-app="paymentCalendarApp">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>INTI</title>
  <!-- SCRIPTS -->
  <%@ include file="../../include/scripts.jsp" %>
  <script src="<%=scriptPageContext %>/static/scripts/viewmodels/payment/paymentCalendar.js" type="text/javascript"></script>
  	<script>
		var project = <%= request.getAttribute("project") %>;
<%-- 		var formName = '<%= request.getAttribute("formName") %>'; --%>
	</script>
  
  <!-- STYLESHEET -->
  <%@ include file="../../include/styles.jsp" %>
</head>
<body>
  <%@ include file="../../include/header.jsp" %>

  <div class="container forms-list" ng-controller="paymentCalendarCtrl">
	    <div class="panel panel-default">
			<div class="panel-body" role="tabpanel">
					<h3>Calendario de pagos</h3>
	
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" id="quoteDetailTab">
					    	<a href="#quoteDetail" aria-controls="quoteDetail" role="tab" data-toggle="tab">Detalle cuotas cobradas</a>
					    </li>
					    <li role="presentation" id="collectionsManagementTab">
					    	<a href="#collectionsManagement" aria-controls="collectionsManagement" role="tab" data-toggle="tab">Gestión de cobranzas</a>
					    </li>
					    <li role="presentation" id="simpleCollectionsAndPoleTab">
					    	<a href="#simpleCollectionsAndPole" aria-controls="simpleCollectionsAndPole" role="tab" data-toggle="tab">Cobranzas simples y polo</a>
					    </li>
					</ul>
					
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="quoteDetail">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-6">
										<label class="control-label"><strong>Deudor: </strong></label></br>
										<label class="control-label"><strong>Proyecto Nº: </strong> {{project.number}}</br>
										<label class="control-label"><strong>Capital Otorgado: </strong>$ {{project.givenAmount}} Pesos</br>
										<label class="control-label"><strong>Fecha Otorgamiento: </strong> {{deliveryFormattedDate}}</br>
										<label class="control-label"><strong>Fecha Actual: </strong> {{today}}</label></br>
										<label class="control-label"><strong>Amortización: </strong> {{project.givenDeadline}}</label></br>
										<label class="control-label"><strong>Gracia: </strong> {{project.requestedGracePeriod}}</label></br>
										<label class="control-label"><strong>Total de Plazo: </strong> {{totalDeadline}}</br>
										<label class="control-label"><strong>Crédito Inicial: $ {{initialCredit}} Pesos</strong> </br>
									</div>
  									<div class="col-md-6">
  										<label class="control-label"><strong>Cuota Capital:  </strong>$ {{capitalQuote}} Pesos</label><br>
  										<label class="control-lable"><strong>TASA ANUAL: </strong>{{annualRate}} %</label><br>
  										<label class="control-lable"><strong>Tasa Diaria: </strong>{{dailyRateFormatted}} %</label>
  									</div>
								</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="collectionsManagement">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-4">
										<label class="control-label"><strong>Cuotas pagadas</strong></label><br>
										<p>{{paymentsCount}}</p>
										<label class="control-label"><strong>Importe Cobrado al</strong></label><br>
											$ {{amountCharged}} Pesos
									</div>
									<div class="col-md-4">
										<label class="control-label"><strong>Cuotas</strong></label> <br>
										<p>Vencidas: {{pastDues}}</p>
										<p>Por Vencer: {{duesForPayment}}</p>
										<label class="control-label"><strong>Saldo Total Original:</strong></label><br>
										$ {{totalBalance}} Pesos
									</div>
									<div class="col-md-4">
										<label class="control-label"><strong>Saldo Negociado:</strong></label><br>
										<label class="control-label"><strong>Gastos x Cobranzas:</strong></label> $130 Pesos<br>
										<label class="control-label"><strong>Saldo Vencido: </strong>$ {{totalMonthlyBalanceFormatted}} Pesos</label><br>
										<label class="control-label"><strong>Saldo x Vencer: </strong>$ {{balanceToOvercome}} Pesos</label><br>
										<label class="control-label"><strong>Saldo + Punitorios:</strong></label><br>
										<p>$ {{totalMonthlyBalanceFormatted}} Pesos</p>
									</div>
								</div>
							</div>
						</div>
    					<div role="tabpanel" class="tab-pane" id="simpleCollectionsAndPole" style="overflow-x: auto;">
    						<table class="table table-hover table-condensed table-responsive table-report-expanded">
								<thead>
									<tr>
									<th>Nº</th>
									<th>Tasa de Interes</th>
									<th>Vencimientos</th>
									<th>Periodo</th>
<!-- 									<th>Cuotas Pagadas</th> -->
<!-- 									<th>Cuotas Vencidas</th> -->
<!-- 									<th>Cuotas x Vencer</th> -->
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
								<tr ng-repeat="fee in fees">
									<td>{{fee.number}}</td>
									<td>{{fee.annualRate}}%</td>
									<td>{{fee.expirationDate}}</td>
									<td>{{fee.period}}</td>
<!-- 									<td>Y</td> -->
<!-- 									<td>{{fee.pastDue}}</td> -->
<!-- 									<td>{{fee.dueForPayment}}</td> -->
									<td>{{fee.amount}}</td>
									<td>{{fee.paymentDate}}</td>
									<td>{{fee.feeAmountPaid}}</td>
									<td>{{fee.days}}</td>
									<td>{{fee.finalBalance}}</td>
									<td>{{fee.openingBalance}}</td>
									<td>{{fee.decreaseByFeePayment}}</td>
									<td></td>
									<td>{{fee.number}}</td>
									<td>{{fee.decreaseByFeePayment}}</td>
									<td>{{fee.annualRate}}%</td>
									<td>{{fee.interest}}</td>
									<td>{{fee.iva}}</td>
									<td>{{fee.amount}}</td>
									<td>{{fee.punit}}</td>
									<td>{{fee.punitPlusAmount}}</td>
									<td>{{fee.pastDays}}</td>
									<td>{{fee.monthlyBalance}}</td>
								</tr>									
							</table>
    					</div>
					</div>
	      </div>
	    </div>
	</div>
	<script>
		$("#goToProjectsLink").addClass("active");
		$("#quoteDetailTab").addClass("active");
	</script>
</body>
</html>