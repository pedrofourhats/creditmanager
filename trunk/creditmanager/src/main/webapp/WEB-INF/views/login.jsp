<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<% String stylePageContext = request.getContextPath(); %>
	<!-- SCRIPTS -->
	<script src="<%=stylePageContext %>/static/js/jquery.min.js"></script>		
	<script src="<%=stylePageContext %>/static/js/bootstrap.js"></script>
	<!-- STYLESHEET -->
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/fwk/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/styles.css" />
</head>
<body>
	<form role="form" method="post" action="j_spring_security_check">
		
		<section class="login">
		
			<div class="form-signin">
			
				<header>
					<h1 class="logo"></h1>
				</header>
				<h3 class="txtC">Ingresar al sistema</h3>
				<div class="form-group">
					<!-- VALIDACIÓN, agregar active a tooltip -->
					<div class="tooltip top active" role="tooltip">
					  <div class="tooltip-arrow"></div>
					  <div class="tooltip-inner">
						Email invalido
					  </div>
					</div>
					<!-- end VALIDACIÓN -->
					<label for="emailInputLogin">Email</label>
					<input type="name" class="form-control" name='j_username' id="emailInputLogin" placeholder="Email" required autofocus>
				</div>
				<div class="form-group">
					<!-- VALIDACIÓN -->
					<div class="tooltip top" role="tooltip">
					  <div class="tooltip-arrow"></div>
					  <div class="tooltip-inner">
						Contraseña invalida
					  </div>
					</div>
					<!-- end VALIDACIÓN -->
					<label for="passwordInputLogin">Contraseña</label>
					<input type="password" class="form-control" name='j_password' id="passwordInputLogin" placeholder="Password" required>
				</div>
				<div class="form-group pos-rel">
					<label class="checkbox">
					  <input type="checkbox" value="remember-me"> Recordar en esta maquina
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
			
			</div>
		
			<footer>
				<c:if test="${not empty param.error }">
					<div class="alert alert-danger col-md-12">
						<strong>Ups!</strong>
						Usuario y/o mail incorrecto.
					</div>
				</c:if>	
			</footer>
		
		</section>

	</form>
</body>
</html>