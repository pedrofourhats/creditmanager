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
		
		function goToProjectDetail(){
			redirect('#/project-detail/' + project.id);
		}
	</script>
  
  <!-- STYLESHEET -->
  <%@ include file="../../include/styles.jsp" %>
</head>
<body>
  <%@ include file="../../include/header.jsp" %>

  <div class="container forms-list" ng-controller="paymentCalendarCtrl">
	    <div class="panel panel-default">
			<div class="panel-body" role="tabpanel">
				<h3>Cronograma de pagos</h3>
				<button type="button" class="btn btn-primary" onclick="goToProjectDetail()">
					<i class="fa fa-arrow-circle-left"></i> Volver
				</button>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active">
   						<table class="table table-hover table-condensed table-responsive table-report-expanded">
							<thead>
								<tr>
								<th>Nº</th>
								<th>Tasa de Interes</th>
								<th>Vencimientos</th>
								<th>Monto Cuota</th>
								<th>Fecha de Pago</th>
								<th>Pago Real</th>
								</tr>
							</thead>
							<tr ng-repeat="fee in fees">
								<td>{{fee.number}}</td>
								<td>{{fee.annualRate}}%</td>
								<td>{{fee.expirationDate}}</td>
								<td>{{fee.amount}}</td>
								<td>{{fee.paymentDate}}</td>
								<td>{{fee.feeAmountPaid}}</td>
							</tr>									
						</table>
   					</div>
				</div>
	      </div>
	    </div>
	</div>
</body>
</html>