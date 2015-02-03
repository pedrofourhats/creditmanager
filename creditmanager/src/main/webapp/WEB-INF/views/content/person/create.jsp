<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="personApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	<script>
		var editablePerson = <%= request.getAttribute("editablePerson") %>; 
	</script>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section ng-controller="addPersonController">
		<div class="container">
			<ol class="breadcrumb">
			  <li><a href="#"><i class="fa fa-angel-right"></i> Personas</a></li>
			  <li class="active"><i class="fa fa-angel-right"></i> Crear persona</li>
			</ol>
			<div class="panel panel-default">
				<div class="panel-body">
					<form ng-submit="addPerson()" name="createPersonForm" >
						<h3>CARGAR NUEVA PERSONA</h3>
						<h4>Complete el formulario</h4>
						<hr>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.name.$dirty && createPersonForm.name.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.name.$error.required">Debe ingresar un nombre</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="name">Nombre</label>
									<input type="text" name="name" class="form-control" required maxlength="50" placeholder="Ingrese nombre" tabindex="1" autofocus ng-model="newPerson.name">
								</div>
							</div>	
							<div class="col-sm-6">								
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.surname.$dirty && createPersonForm.surname.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.surname.$error.required">Debe ingresar un apellido</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="surname">Apellido</label>
									<input type="text" name="surname" class="form-control" required maxlength="50" placeholder="Ingrese nombre" tabindex="2" ng-model="newPerson.surname">
								</div>								
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.identityTypeName.$dirty && createPersonForm.identityTypeName.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.identityTypeName.$error.required">Debe ingresar el tipo de documento</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label>Tipo de documento</label>
	
									<div class="dropdown" tabindex="3" dropdown>
									  <a type="button" data-toggle="dropdown">
									    <span ng-show="newPerson.identityTypeName == ''">
									    	Elegir tipo
									    </span>
									    <span ng-show="newPerson.identityTypeName != ''">
										    {{newPerson.identityTypeName}} 
									    </span>
									    <i class="fa fa-chevron-down"></i>
									  </a>
									  <ul class="dropdown-menu" role="menu">
									    <li ng-click="selectIdNumberType({value: 0, name: 'DNI'})"><a href="javascript:void(0);">DNI</a></li>
								        <li ng-click="selectIdNumberType({value: 1, name: 'LE'})"><a href="javascript:void(0);">LE</a></li>
								        <li ng-click="selectIdNumberType({value: 2, name: 'LC'})"><a href="javascript:void(0);">LC</a></li>
									  </ul>
									</div>
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.idNumber.$dirty && createPersonForm.idNumber.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.idNumber.$error.required">Debe ingresar un documento</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.idNumber.$error.number">Debe ingresar números</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="idNumber">Número de documento</label>
									<small class="fr">Soló números sin puntos</small>
									<input type="number" name="idNumber" class="form-control" maxlength="10" placeholder="Ingrese número de documento" tabindex="4" ng-model="newPerson.identityNumber">
									</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.birthDate.$dirty && createPersonForm.birthDate.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.birthDate.$error.required">Debe ingresar fecha de nacimiento</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.birthDate.$error.date">Formato invalido</div>
									</div>
									<!-- end VALIDACIO“N -->
									<div class="control-group">
										<label for="birthDate" class="control-label">Fecha de nacimiento</label>
										<input type="date" name="birthDate" placeholder="dd/MM/yyyy" class="form-control" tabindex="5" ng-model="newPerson.birthDate"/>	
									</div>
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.genderName.$dirty && createPersonForm.genderName.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.genderName.$error.required">Debe ingresar el genero</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label>Genero</label>
	
									<div class="dropdown" tabindex="6" dropdown is-open="status.isopen">
									  <a type="button" data-toggle="dropdown">
									    <span ng-show="newPerson.genderName == ''">
									    	Elegir genero
									    </span>
									    <span ng-show="newPerson.genderName != ''">
										    {{newPerson.genderName}} 
									    </span>
									    <i class="fa fa-chevron-down"></i>
									  </a>
									  <ul class="dropdown-menu" role="menu">
									    <li ng-click="selectGender({value: 0, name: 'MASCULINO'})"><a href="javascript:void(0);">MASCULINO</a></li>
								        <li ng-click="selectGender({value: 1, name: 'FEMENINO'})"><a href="javascript:void(0);">FEMENINO</a></li>
									  </ul>
									</div>								
								</div>								
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.cellPhone.$dirty && createPersonForm.cellPhone.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.cellPhone.$error.required">Debe ingresar el celular</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.cellPhone.$error.number">Debe ingresar números</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="cellPhone">Celular</label>
									<input type="number" name="cellPhone" class="form-control" maxlength="20" placeholder="Ingrese celular" tabindex="7" ng-model="newPerson.cellPhone">
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.email.$dirty && createPersonForm.email.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.email.$error.required">Debe ingresar el email</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.email.$error.email">Formato incorrecto</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="email">Email</label>
									<input type="email" name="email" class="form-control" maxlength="45" placeholder="Ingrese email" tabindex="8" ng-model="newPerson.email">
								</div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.province.$dirty && createPersonForm.province.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.province.$error.required">Debe ingresar la provincia</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="province">Provincia</label>
									<input type="text" name="province" class="form-control" maxlength="45" placeholder="Ingrese una provincia" tabindex="9" ng-model="newPerson.province">
	
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.locality.$dirty && createPersonForm.locality.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.locality.$error.required">Debe ingresar la localidad</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="locality">Localidad</label>
									<input type="text" name="locality" class="form-control" maxlength="45" placeholder="Ingrese una provincia" tabindex="10" ng-model="newPerson.locality">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.address.$dirty && createPersonForm.address.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.address.$error.required">Debe ingresar la dirección</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="address">Dirección</label>
									<input type="text" name="address" class="form-control" maxlength="100" placeholder="Ingrese dirección" tabindex="11" ng-model="newPerson.address">
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.postCode.$dirty && createPersonForm.postCode.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.postCode.$error.required">Debe ingresar el código postal</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="postCode">Código postal</label>
									<input type="text" name="postCode" class="form-control" maxlength="10" placeholder="Ingrese código postal" tabindex="12" ng-model="newPerson.postCode">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.phone.$dirty && createPersonForm.phone.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.phone.$error.required">Debe ingresar el teléfono</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.phone.$error.number">Debe ingresar números</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="phone">Teléfono</label>
									<input type="number" name="phone" class="form-control" maxlength="20" placeholder="Ingrese teléfono" tabindex="13" ng-model="newPerson.phone">
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.workphone.$dirty && createPersonForm.workphone.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.workphone.$error.required">Debe ingresar el teléfono laboral</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.workphone.$error.number">Debe ingresar números</div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="workphone">Teléfono laboral</label>
									<input type="number" name="workphone" class="form-control" maxlength="20" placeholder="Ingrese teléfono laboral" tabindex="14" ng-model="newPerson.workPhone">
								</div>
							</div>							
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-right">
									<div class="form-group">
										<input type="submit" class="btn btn-primary" tabindex="15" value="Cargar persona" ng-show="!isEdition" ng-disabled="createPersonForm.$invalid" />
										<input type="submit" class="btn btn-primary" tabindex="15" value="Actualizar persona" ng-show="isEdition" ng-disabled="createPersonForm.$invalid" />
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
	</footer>

	<script src="<%=scriptPageContext %>/static/scripts/viewmodels/persons/addPerson.js" type="text/javascript"></script>
	<script>
		$("#goToPersonsLink").addClass("active");
	</script>
</body>
</html>