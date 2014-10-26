<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form role="form" method="post" action="j_spring_security_check">
		<div>
			<div>
				<label for="emailInputLogin">Usuario: </label>
				<input type="text" name='j_username' id="emailInputLogin" placeholder="Usuario">
			</div>
		</div>
		<div>
			<div>
				<label for="passwordInputLogin">Password: </label> 
				<input type="password" name='j_password' id="passwordInputLogin" placeholder="Password">
			</div>
		</div>
		<div>
			<button type="submit">
				LOGIN
			</button>
		</div>

		<c:if test="${not empty param.error }">
			<div class="alert alert-danger col-md-12">
				<strong>Ups!</strong>
				Usuario y/o mail incorrecto.
			</div>
		</c:if>
	</form>
</body>
</html>