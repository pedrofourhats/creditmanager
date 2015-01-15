<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>INTI</title>
  <!-- SCRIPTS -->
  <%@ include file="../../include/scripts.jsp" %>
  
  <!-- STYLESHEET -->
  <%@ include file="../../include/styles.jsp" %>
</head>
<body>
  <%@ include file="../../include/header.jsp" %>

  <div class="container forms-list">
    <div class="panel panel-default">
      <div class="panel-body">
		<div class="panel-body">
				<h3>
				Pagaré
				</h3>
                <p class="signature">
                  En la Ciudad  Autónoma de Buenos Aires, a los <input type="text" name="num-dias" class="form-control"> días del mes de <input type="text" name="num-mes" class="form-control"> de 2014.-
                </p>
                <p class="mt20">
                  A LA VISTA pagaré sin protesto (Art. 50 Dec. Ley Nº 5965/63) al  Administrador Fiduciario  Polo  Tecnológico  Constituyentes  S.A., o  a  su  orden,  la  cantidad  de $ 30.000 (pesos treinta mil) por igual valor recibido en efectivo a mi entera satisfacción. De conformidad con lo dispuesto en el artículo 36 de Decreto Ley 5965/63, se amplía el plazo de presentación a cinco (5) años a contar de la fecha de libramiento del presente.
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
  <script>
    $("#goToFormsLink").addClass("active");
  </script>
</body>
</html>