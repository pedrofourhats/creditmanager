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
						<div role="tabpanel" class="tab-pane fade in active" id="institutional" ng-class="{'in active': step == 1 }">
							<label class="control-label">Deudor</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Proyecto Nº</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Capital Otorgado</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Fecha Otorgamiento</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Fecha Actual</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Amortización</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Gracia</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Total de Plazo</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
							<label class="control-label">Crédito Inicial</label><input type="text" class="form-control ng-pristine ng-valid ng-touched" placeholder="" tabindex="1" ng-model="" value="test"></br>
						</div>
					</div>
	      </div>
	    </div>
	</div>
  <script src="<%=scriptPageContext %>/static/scripts/viewmodels/forms/form.js" type="text/javascript"></script>
</body>
</html>