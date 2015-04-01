<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html ng-app="formApp">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>INTI</title>
  <!-- SCRIPTS -->
  <%@ include file="../../include/scripts.jsp" %>
  <script src="<%=scriptPageContext %>/static/scripts/viewmodels/payment/paymentCalendar.js" type="text/javascript"></script>
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
			<div class="panel-body" role="tabpanel">
				<h3>Cronograma de pagos</h3>
				<button ng-click="goToProject()">Volver a proyecto</button>
				<div class="tab-content" id="printableDiv">
					<div role="tabpanel" class="tab-pane fade in active">
						<div class="container-fluid">
								<div class="row">
									<div class="col-md-6">
										<label class="control-label"><strong>Deudor: </strong></label></br>
										<label class="control-label"><strong>Proyecto Nº: </strong> {{project.number}}</br>
										<label class="control-label"><strong>Capital Otorgado: </strong> {{project.givenAmount}}</br>
										<label class="control-label"><strong>Fecha Otorgamiento: </strong> {{deliveryFormattedDate}}</br>
										<label class="control-label"><strong>Fecha Actual: </strong> {{today}}</label></br>
										<label class="control-label"><strong>Amortización: </strong> {{project.givenDeadline}}</label></br>
										<label class="control-label"><strong>Gracia: </strong> {{project.requestedGracePeriod}}</label></br>
										<label class="control-label"><strong>Total de Plazo: </strong> {{totalDeadline}}</br>
										<label class="control-label"><strong>Crédito Inicial: {{initialCredit}}</strong> </br>
									</div>
  									<div class="col-md-6">
  										<label class="control-label"><strong>Cuota Capital:  </strong>{{capitalQuote}}</label><br>
  										<label class="control-lable"><strong>TASA ANUAL: </strong>{{annualRate}} %</label><br>
  										<label class="control-lable"><strong>Tasa Diaria: </strong>{{dailyRate}} %</label>
  									</div>
								</div>
						</div>
   						<table class="table table-hover table-condensed table-responsive table-report-expanded">
							<thead>
								<tr>
								<th>Nº</th>
								<th>Tasa de Interes</th>
								<th>Vencimientos</th>
								<th>Periodo</th>
								<th>Monto Cuota</th>
								<th>Fecha de Pago</th>
								<th>Pago Real</th>
								</tr>
							</thead>
							<tr ng-repeat="fee in fees">
								<td>{{fee.number}}</td>
								<td>{{fee.annualRate}}%</td>
								<td>{{fee.expirationDate}}</td>
								<td>{{fee.period}}</td>
								<td>{{fee.amount}}</td>
								<td>{{fee.paymentDate}}</td>
								<td>{{fee.feeAmountPaid}}</td>
							</tr>									
						</table>
   					</div>
				</div>
	      </div>
	      <div class="row">
				<div class="col-sm-12">
					<div class="pull-right">
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Cargar formulario" ng-show="!isEdition" ng-click="saveForm()" />
							<input type="submit" class="btn btn-primary" value="Actualizar formulario" ng-show="isEdition" ng-click="saveForm()"/>
							<input type="submit" class="btn btn-primary" value="Imprimir formulario" ng-click="printDiv()"/>
						</div>
					</div>
				</div>
			</div>
	    </div>
	</div>
	<script src="<%=scriptPageContext %>/static/scripts/viewmodels/forms/form.js" type="text/javascript"></script>
 	<script src="<%=scriptPageContext %>/static/scripts/common/numberToLetter.js" type="text/javascript"></script>
</body>
</html>