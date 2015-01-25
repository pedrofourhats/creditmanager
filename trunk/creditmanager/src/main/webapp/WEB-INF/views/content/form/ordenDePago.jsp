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
			<label for="checkNumber">Número de cheque: </label><input type="text" id="checkNumber" ng-model="checkNumber" class="form-control"> 
                <h3>
                  Orden de Pago                
                </h3>
                <p class="mt10">
                </p>
                <p class="span-inline">
                  <b>Nombre y apellido: </b>
                  <br>
                  <b>D.U.: </b>:
                  <br>
                  <b>Fecha de nacimiento: </b>
                  <br>
                  <b>Nº de proyecto: </b>
                  <br>
                  <b>Nº de cheque: </b>{{checkNumber}}
                  <br>  
                  <b>Importe aprobado: </b>
                  <br>
                  <b>Fecha de otorgamiento: </b>
                  <br>
                  <br>
                  <br>  
                  <b>Autorización para Emisión de Cheque</b>
                  <br>
                  <br>
                  Firma y aclaración
              </div>
      </div>
    </div>
  </div>
  <script src="<%=scriptPageContext %>/static/scripts/viewmodels/forms/form.js" type="text/javascript"></script>
</body>
</html>