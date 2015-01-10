<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <h3>Formulario 5</h3>
        <div class="panel-group mt20" id="accordion" role="tablist" aria-multiselectable="true">
        </div>
      </div>
    </div>
  </div>
  <script>
    $("#goToFormsLink").addClass("active");
  </script>
</body>
</html>