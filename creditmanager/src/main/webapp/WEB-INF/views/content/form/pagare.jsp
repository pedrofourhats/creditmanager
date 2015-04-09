<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    	<button ng-click="goToProject()">Volver a proyecto</button>
    	<div class="formParameters">
      		<h4 class="parameterTitle">Parametros</h4>
			<input placeholder="Día"  type="text" id="day" ng-model="form.day" class="form-control"> 
			<input placeholder="Mes"  type="text" id="month" ng-model="form.month" class="form-control"> 
			<input placeholder="Año"  type="text" id="year" ng-model="form.year" class="form-control"> 
			
			<br>
			<label>Titular</label>
			<div class="dropdown" tabindex="3" dropdown style="width: 270px; height: 30px;">
			  <a type="button" data-toggle="dropdown">
			    <span >
				    {{selectedHolder.surname}} {{selectedHolder.name}}
			    </span>
			    <i class="fa fa-chevron-down"></i>
			  </a>
			  <ul class="dropdown-menu" role="menu">
			    <li data-ng-repeat="holder in project.holders" ng-click="selectHolder(holder)"><a href="javascript:void(0);">{{holder.surname}} {{holder.name}} </a></li>
			  </ul>
			</div>
		
		</div>
		<div class="panel-body" id="printableDiv">
				<h3>
				Pagaré
				</h3>
                <p class="signature">
                  En la Ciudad  Autónoma de Buenos Aires, a los {{form.day}} días del mes de {{form.month}} de {{form.year}}.-
                </p>
                <p class="mt20">
                  A LA VISTA pagaré sin protesto (Art. 50 Dec. Ley Nº 5965/63) al  Administrador Fiduciario  Polo  Tecnológico  Constituyentes  S.A., o  a  su  orden,  la  cantidad  de $ {{project.givenAmount}} ({{numberToLetter(project.givenAmount)}} PESOS) por igual valor recibido en efectivo a mi entera satisfacción. De conformidad con lo dispuesto en el artículo 36 de Decreto Ley 5965/63, se amplía el plazo de presentación a cinco (5) años a contar de la fecha de libramiento del presente.
                </p>
                <p class="mt20">
                  Pagadero en: Paraná 145 4º Capital Federal.
                </p>
                <p class="signature">
                  Firma : 
                  <br>
                  Aclaración: <span class="uppercase">{{selectedHolder.surname}} {{selectedHolder.name}}</span>
                  <br>
                  D.N.I.  Nº : {{selectedHolder.identityNumber}}
                </p>
	      </div>
	      <div class="row">
				<div class="col-sm-12">
					<div class="pull-right">
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Cargar formulario" ng-show="!isEdition" ng-disabled="form.day == '' || form.month == '' || form.year == ''" ng-click="saveForm()" />
							<input type="submit" class="btn btn-primary" value="Actualizar formulario" ng-show="isEdition" ng-disabled="form.day == '' || form.month == '' || form.year == ''" ng-click="saveForm()"/>
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