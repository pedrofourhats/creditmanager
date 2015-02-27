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
										<label class="control-label"><strong>Capital Otorgado: </strong> {{project.givenAmount}}</br>
										<label class="control-label"><strong>Fecha Otorgamiento: </strong> {{deliveryFormattedDate}}</br>
										<label class="control-label"><strong>Fecha Actual: </strong> {{today}}</label></br>
										<label class="control-label"><strong>Amortización: </strong> {{project.givenDeadline}}</label></br>
										<label class="control-label"><strong>Gracia: </strong> {{project.requestedGracePeriod}}</label></br>
										<label class="control-label"><strong>Total de Plazo: </strong> {{totalDeadline}}</br>
										<label class="control-label"><strong>Crédito Inicial: </strong> </br>
									</div>
  									<div class="col-md-6">
  										<label class="control-label"><strong>Cuota Capital:  </strong>{{capitalQuote}}</label><br>
  										<label class="control-lable"><strong>TASA ANUAL: </strong>{{annualRate}} %</label><br>
  										<label class="control-lable"><strong>Tasa Diaria: </strong>{{dailyRate}} %</label>
  									</div>
								</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="collectionsManagement">
							Collections Management
						</div>
    					<div role="tabpanel" class="tab-pane" id="simpleCollectionsAndPole">
    						Simple Collections And Pole
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