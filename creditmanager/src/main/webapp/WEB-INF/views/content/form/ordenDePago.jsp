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
                  <b>Nº de cheque: </b>
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
  <script>
    $("#goToFormsLink").addClass("active");
  </script>
</body>
</html>