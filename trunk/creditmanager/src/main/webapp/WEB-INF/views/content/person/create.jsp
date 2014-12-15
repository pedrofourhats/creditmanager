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
					<form ng-submit="addPerson()">
						<h3>CARGAR NUEVA PERSONA</h3>
						<h4>Complete el formulario</h4>
						<hr>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<!-- VALIDACION, agregar active a tooltip -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar un nombre
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="name">Nombre</label>
									<input type="text" name="name" class="form-control" maxlength="50" placeholder="Ingrese nombre" tabindex="1" autofocus ng-model="newPerson.name">
								</div>
							</div>	
							<div class="col-sm-6">								
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar apellido
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="surname">Apellido</label>
									<input type="text" name="surname" class="form-control" maxlength="50" placeholder="Ingrese nombre" tabindex="2" ng-model="newPerson.surname">
								</div>								
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
									  	Debe ingresar el tipo de documento
									  </div>
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
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar un número de documento
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="idNumber">Número de documento</label>
									<input type="text" name="idNumber" class="form-control" maxlength="10" placeholder="Ingrese número de documento" tabindex="4" ng-model="newPerson.identityNumber">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar fecha de nacimiento
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<div class="control-group">
										<label for="date-picker-2" class="control-label">Fecha de nacimiento</label>
										<div class="controls">
											<div class="input-group">
												<input ng-click="open($event)" type="text" maxlength="15" class="date-picker form-control" tabindex="5"
												 	datepicker-popup="dd/MM/yyyy" ng-model="newPerson.birthDate" is-open="opened" datepicker-options="dateOptions" close-text="Close" />
												<span class="input-group-btn">
									                <button type="button" class="btn btn-default" ng-click="open($event)"><i class="fa fa-calendar"></i></button>
									            </span>											
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar genero
									  </div>
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
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar celular
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="cellPhone">Celular</label>
									<input type="text" name="cellPhone" class="form-control" maxlength="20" placeholder="Ingrese celular" tabindex="7" ng-model="newPerson.cellPhone">
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar email
									  </div>
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
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar provincia
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="province">Provincia</label>
									<input type="text" name="province" class="form-control" maxlength="45" placeholder="Ingrese una provincia" tabindex="9" ng-model="newPerson.province">
	
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar localidad
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="locality">Localidad</label>
									<input type="text" name="locality" class="form-control" maxlength="45" placeholder="Ingrese una provincia" tabindex="10" ng-model="newPerson.locality">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar dirección
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="address">Dirección</label>
									<input type="text" name="address" class="form-control" maxlength="100" placeholder="Ingrese dirección" tabindex="11" ng-model="newPerson.address">
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar código postal
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="postCode">Código postal</label>
									<input type="text" name="postCode" class="form-control" maxlength="10" placeholder="Ingrese código postal" tabindex="12" ng-model="newPerson.postCode">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar teléfono
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="phone">Teléfono</label>
									<input type="text" name="phone" class="form-control" maxlength="20" placeholder="Ingrese teléfono" tabindex="13" ng-model="newPerson.phone">
								</div>
								<div class="form-group">
									<!-- VALIDACIO“N -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar telófono laboral
									  </div>
									</div>
									<!-- end VALIDACIO“N -->
									<label for="workphone">Teléfono laboral</label>
									<input type="text" name="workphone" class="form-control" maxlength="20" placeholder="Ingrese teléfono laboral" tabindex="14" ng-model="newPerson.workPhone">
								</div>
							</div>							
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-right">
									<div class="form-group">
										<input type="submit" class="btn btn-primary" tabindex="15" value="Cargar persona"/>
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