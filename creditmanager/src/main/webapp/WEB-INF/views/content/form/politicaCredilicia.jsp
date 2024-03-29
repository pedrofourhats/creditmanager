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
		<div class="panel-body" id="printableDiv">
                <h3>
                  PROGRAMA DE CRÉDITOS PARA EMPRENDEDORES DE LA REGIÓN DE SALTO GRANDE<br>
                  MICROBANCO DE LA REGIÓN DE SALTO GRANDE<br>
                  POLITICA CREDITICIA:<br>
				</h3>
                <p class="span-inline">
                  <b>Objetivos</b>
                 	<ul>
						<li>Fomentar, consolidar y apoyar la creación de nuevos emprendimientos.</li>
						<li>Generar nuevos puestos de trabajo.</li>
						<li>Incorporar sectores al sistema formal de la economía.</li>
						<li>Promover la asociación de emprendedores y/o trabajadores.</li>
						<li>Incentivar el desarrollo productivo local y las economías regionales.</li>
                 	</ul>
                  <b>Destino</b>
                  <ul>
                  	<li>Activo Fijo
						<ul>
							<li>Compra de maquinaria y vehículos utilitarios: nuevos o usados,  para uso exclusivo en el emprendimiento.</li>
							<li>Obra Civil: construcción de infraestructura productiva e infraestructura de comercialización</li>
						</ul>
					</li>
					<li>Capital de Trabajo compra de materia prima, insumos, mercaderia, etc.</li>
                  </ul>
                  <b>Beneficiarios</b>
                  	<ul>
						<li>Personas/ Físicas</li>
						<li>Titulares de Microemprendimientos y/o Mipymes</li>
						<li>Nuevos y en Marcha</li>
						<li>Para actividades agropecuarias, industriales, comerciales y de servicios</li>  
                  	</ul>
                  <b>Garantías</b>
                  	<ul>
                  		<li>Garantes con recibo de sueldo</li>
						<li>Aval solidario</li>
                  	</ul>
                  <b>Condiciones de crédito</b>
                  <br>  
                  <b>Monto: </b>hasta $ 30.000.
                  <br>
                  <b>Moneda: </b>pesos
                  <br>  
                  <b>Tasa: </b>Variable trimestralmente
                  <br>
                  <b>Fomento de actividades nuevas</b>
	                  <ul>
						<li><b>TASA 0% (cero)</b> Créditos Hasta $ 3.000.</li> 
						<li><b>TASA: 6%</b> Efectiva Anual. Créditos Hasta $ 5.000.</li>
						<li><b>TASA: 9%</b> Efectiva Anual. Créditos de $ 5.001.-  a  $ 30.000.</li> 
					  </ul>
                  <b>Para emprendimientos en marcha</b>
	                  <ul>
						<li><b>TASA 0% (cero)</b> Créditos Hasta $ 3.000.</li> 
						<li><b>TASA: 12%</b> Efectiva Anual. Créditos más de $ 3.000 </li> 
					  </ul>
                  <b>Para emprendimientos ya financiados</b>
	                  <ul>
						<li><b>TASA: 12%</b> Efectiva Anual.</li> 
					  </ul>
					Se destaca que los créditos serán a escala de la microempresa, estableciendo los montos mínimos necesarios para comenzar o fortalecer la actividad.
                  <br>
                  <b>Plazo de devolución</b> hasta 30 meses, incluido el plazo de gracia.
                  <br>
                  <b>Plazo de gracia</b> hasta 6 meses de acuerdo al proyecto (este plazo surge de la evaluación del mismo)
                  <br>
                  <b>Forma de pago</b> Mensual, Posibilidad de pre-cancelación parcial o total sin gastos.
                 <div class="col-sm-offset-3 col-sm-6 mt30">
                    <span class="uppercase">Elina Gabriela Buffa</span></b>
	                  <br>
                   	DNI Nº: 21.511.090
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
</body>
</html>