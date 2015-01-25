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
	</script>

  <!-- STYLESHEET -->
  <%@ include file="../../include/styles.jsp" %>
</head>
<body>
  <%@ include file="../../include/header.jsp" %>

  <div class="container forms-list" ng-controller="formController">
    <div class="panel panel-default">
      <div class="panel-body">
		<div class="panel-body">
			<label for="day">Día: </label><input type="text" name="day" ng-model="day" class="form-control"> 
			<label for="month">Mes: </label><input type="text" name="month" ng-model="month" class="form-control"> 
			<label for="years">Año: </label><input type="text" name="year" ng-model="year" class="form-control"> 
				<h3>
				Pagaré
				</h3>
                <p class="signature">
                  En la Ciudad  Autónoma de Buenos Aires, a los {{day}} días del mes de {{month}} de {{year}}.-
                </p>
                <p class="mt20">
                  A LA VISTA pagaré sin protesto (Art. 50 Dec. Ley Nº 5965/63) al  Administrador Fiduciario  Polo  Tecnológico  Constituyentes  S.A., o  a  su  orden,  la  cantidad  de $ {{project.givenAmount}} ({{project.givenAmount}}) por igual valor recibido en efectivo a mi entera satisfacción. De conformidad con lo dispuesto en el artículo 36 de Decreto Ley 5965/63, se amplía el plazo de presentación a cinco (5) años a contar de la fecha de libramiento del presente.
                </p>
                <p class="mt20">
                  Pagadero en: Paraná 145 4º Capital Federal.
                </p>
                <p class="signature">
                  Firma : 
                  <br>
                  Aclaración: 
                  <br>
                  D.N.I.  Nº : 
                </p>
	      </div>
	    </div>
	  </div>
  </div>
  <script src="<%=scriptPageContext %>/static/scripts/viewmodels/forms/form.js" type="text/javascript"></script>
</body>
</html>