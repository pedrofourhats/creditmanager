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
    		<div class="formParameters">
      			<h4 class="parameterTitle">Parametros</h4>
      			<input type="text" name="num-fecha" id="date" ng-model="form.date" class="form-control" placeholder="Fecha">
      		</div>
			<div class="panel-body" id="printableDiv">
                <h4>
                  Ciudad Autónoma de Buenos Aires
                </h4>
                <p class="mt10">
                  Por la presente, {{project.guarantors[0].name}} {{project.guarantors[0].surname}} con DNI Nº {{project.guarantors[0].identityNumber}}, se constituye en fiador solidario, liso, llano y principal pagador a favor del Polo Tecnológico Constituyentes S.A. en su carácter de Fiduciario del FIDEICOMISO SALTO GRANDE, de todas las obligaciones contraídas por {{project.holders[0].name}} {{project.holders[0].surname}} en virtud del Contrato celebrado con Polo Tecnológico Constituyentes S.A. con fecha {{form.date}}, por la suma de $ {{project.givenAmount}} ({{project.givenAmount}}). La deuda quedará instrumentada causalmente por el Contrato formalizado entre el Polo Tecnológico Constituyentes S. A . y el deudor principal que afianzamos.
                </p>
                <p class="mt10">                
					Para el caso en que el afianzado incurriere en mora en el cumplimiento de sus obligaciones,  el Polo Tecnológico Constituyentes S.A. queda expresamente autorizada a aplicar a partir del momento en que se produzca la mora, además del interés compensatorio equivalente al de descuento de documentos comerciales a 30 días que perciba el Banco de la Nación Argentina, un interés punitorio anual igual al 50% de la misma tasa sobre los montos abonados.  
                </p>
                <p class="mt10">
					Los intereses precedentemente referidos serán también de aplicación a todas las obligaciones caídas en mora y durante todo el transcurso de la misma.
                </p>
                <p class="mt10">
					La mora se producirá de pleno derecho por el mero vencimiento del plazo, sin interpelación previa judicial o extrajudicial, producirá la caducidad de los plazos que pudieren haberse otorgado, y volverá en consecuencia exigible el total de las sumas adeudadas.
                </p>
                <p class="mt10">
					Quedan comprendidas en la presente fianza, además del capital adeudado, todos los demás accesorios que la obligación genere tales como intereses, comisiones, gastos, impuestos, costas, costos y honorarios.
                </p>
                <p class="mt10">
					Asimismo renunciamos expresamente a los beneficios de excusión, división e interpelación previa al deudor principal, así como al de extinción de la fianza por prórrogas, renovaciones, modificaciones o novaciones que pudieran producirse en las obligaciones contraídas como consecuencia de las obligaciones afianzadas, y que fueran otorgadas sin requerir nuestra intervención y consentimiento.
                </p>
                <p class="mt10">
					Manifiesto conocer las cláusulas del Contrato suscripto entre el Polo Tecnológico Constituyentes S.A. y {{project.guarantors[0].surname}}, {{project.guarantors[0].name}} y que expresamente acepto y considero aplicable. La falta de cumplimiento de ésta obligación faculta al Polo Tecnológico Constituyentes S.A. para iniciar las acciones legales comerciales y criminales que considere menester. 
                </p>
                <p class="mt10">
					La existencia de otras garantías reales o personales que el Polo Tecnológico Constituyentes S.A.  pudiera tener, no impide ni coarta su derecho a que reclame el pago de la deuda, aún antes de excutir o liquidar aquellas.
                </p>
                <p class="mt10">
					La acción emergente de la presente fianza no caducará por falta de protesto o su notificación, tanto de la obligación principal como del presente instrumento.
                </p>
                <p class="mt10">
					Para todos los efectos judiciales o extrajudiciales a que diere lugar la presente fianza, nos sometemos a la jurisdicción y competencia de los Tribunales Ordinarios de la Ciudad Autónoma de Buenos Aires, con exclusión de cualquier otro fuero o jurisdicción, constituyendo domicilio en  la calle 8 de Junio N° 953 de la ciudad de Concepción del Uruguay provincia de Entre Ríos, donde serán tenidas por válidas todas las comunicaciones que nos fueren remitidas.
				</p>
                
                <div class="row txtC signature">
                  <div class="col-sm-4">
                    Firma del DEUDOR 
                    <hr>
                    {{project.holders[0].surname}}, {{project.holders[0].name}} 
                    <br>
                    DNI Nº: {{project.holders[0].identityNumber}}
                  </div>
                  <div class="clearfix"></div>
                </div>
              </div>
              
              <div class="row">
				<div class="col-sm-12">
					<div class="pull-right">
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Cargar formulario" ng-show="!isEdition" ng-disabled="form.date == ''" ng-click="saveForm()" />
							<input type="submit" class="btn btn-primary" value="Actualizar formulario" ng-show="isEdition" ng-disabled="form.date == ''" ng-click="saveForm()"/>
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