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
    	<button ng-click="goToProject()">Volver a proyecto</button>
		<div class="formParameters">
			<h4 class="parameterTitle">Parametros</h4>
    		<input placeholdeR="Nº de cheque" type="text" id="checkNumber" ng-model="form.checkNumber" class="form-control">
    	</div>
		<div class="panel-body" id="printableDiv">
               <h3>
                 Orden de Pago                
               </h3>
               <p class="mt10">
               </p>
               <p class="span-inline">
                 <b>Nombre y apellido: </b><span class="uppercase">{{project.holders[0].name}} {{project.holders[0].surname}}</span>
                 <br>
                 <b>D.U.: </b>{{project.holders[0].identityNumber}}
                 <br>
                 <b>Fecha de nacimiento: </b>{{project.holders[0].formattedBirthDate}}
                 <br>
                 <b>Nº de proyecto: </b>{{project.number}} 
                 <br>
                 <b>Nº de cheque: </b>{{form.checkNumber}}
                 <br>  
                 <b>Importe aprobado: </b>{{project.givenAmount}} ({{numberToLetter(project.givenAmount)}} PESOS)
                 <br>
                 <b>Fecha de otorgamiento: </b> {{project.formattedDeliveryDate}}
                 <br>
                 <br>
                 <br>  
                 <b>Autorización para Emisión de Cheque</b>
                 <br>
                 <br>
                 Firma y aclaración
             </div>
             <div class="row">
			<div class="col-sm-12">
				<div class="pull-right">
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Cargar formulario" ng-show="!isEdition" ng-disabled="form.checkNumber == ''" ng-click="saveForm()" />
						<input type="submit" class="btn btn-primary" value="Actualizar formulario" ng-show="isEdition" ng-disabled="form.checkNumber == ''" ng-click="saveForm()"/>
						<input type="submit" class="btn btn-primary" value="Imprimir formulario" ng-click="printDiv()"/>
					</div>
				</div>
			</div>
		</div>
      </div>
  </div>
  <script src="<%=scriptPageContext %>/static/scripts/viewmodels/forms/form.js" type="text/javascript"></script>
</body>
</html>