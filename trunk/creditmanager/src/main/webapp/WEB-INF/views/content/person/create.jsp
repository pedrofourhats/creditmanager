<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="personApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<%@ include file="../../include/scripts.jsp" %>
	<script>
		var editablePerson = <%= request.getAttribute("editablePerson") %>; 
	</script>
	
	<%@ include file="../../include/styles.jsp" %>
	<script type="text/javascript">
    window.onbeforeunload = function() {
        return "�Esta seguro que desea salir de esta p�gina? Todos sus cambios no guardados se perder�n";
    }
</script>
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
							<div class="col-sm-4">
							<div class="form-group">
								<label>Categor�a</label>

								<div class="dropdown" dropdown>
								  <a type="button" data-toggle="dropdown">
								    <span ng-show="newPerson.type == undefined">
								    	Elegir categor�a
								    </span>
								    <span>
									    {{newPerson.type}} 
								    </span>
								    <i class="fa fa-chevron-down"></i>
								  </a>
								  <ul class="dropdown-menu" role="menu">
								    <li ng-click="selectType('EVALUADORES INTI')"><a href="javascript:void(0);">EVALUADORES INTI</a></li>
							        <li ng-click="selectType('ASESORES CAFESG')"><a href="javascript:void(0);">ASESORES CAFESG</a></li>
							        <li ng-click="selectType('TITULAR/CODEUDOR')"><a href="javascript:void(0);">TITULAR/CODEUDOR</a></li>
								  </ul>
								</div>
							</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.surname.$dirty && createPersonForm.surname.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.surname.$error.required">Debe ingresar un apellido</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="surname">Apellido (*)</label>
									<input type="text" name="surname" class="form-control" required maxlength="50" placeholder="Ingrese apellido" tabindex="1" ng-model="newPerson.surname">
								</div>
							</div>
							<div class="col-sm-4">								
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.name.$dirty && createPersonForm.name.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.name.$error.required">Debe ingresar un nombre</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="name">Nombre (*)</label>
									<input type="text" name="name" class="form-control" required maxlength="50" placeholder="Ingrese nombre" tabindex="2" autofocus ng-model="newPerson.name">
								</div>								
							</div>

						</div>
						<hr>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.identityTypeName.$dirty && createPersonForm.identityTypeName.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.identityTypeName.$error.required">Debe ingresar el tipo de documento</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label>Tipo de documento (*)</label>
	
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
								<div class="form-group idNumberInput">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.idNumber.$dirty && createPersonForm.idNumber.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.idNumber.$error.required">Debe ingresar un documento</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="idNumber">N�mero de documento (*)</label>
									<!-- <small class="fr">Sol� n�meros sin puntos</small> -->
									<input type="text" name="idNumberGenere" class="form-control" maxlength="1" placeholder="M/F" tabindex="4" onkeypress='return event.charCode == 102 || event.charCode == 109' ng-model="newPerson.identityNumberGenere">
									<input type="text" name="idNumberFirstPart" class="form-control" maxlength="2" placeholder="" tabindex="4" min="0" max="99" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model="newPerson.identityNumberFirstPart"><span>.</span> 
									<input type="text" name="idNumberSecondPart" class="form-control" maxlength="3" placeholder="" tabindex="4" min="0" max="999" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model="newPerson.identityNumberSecondPart"><span>.</span> 
									<input type="text" name="idNumberThirdPart" class="form-control" maxlength="3" placeholder="" tabindex="4" min="0" max="999" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ng-model="newPerson.identityNumberThirdPart">
									</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.birthDate.$dirty && createPersonForm.birthDate.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.birthDate.$error.required">Debe ingresar fecha de nacimiento</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.birthDate.$error.date">Formato invalido</div>
									</div>
									<!-- end VALIDACIO�N -->
									<div class="control-group">
										<label for="birthDate" class="control-label">Fecha de nacimiento (*)</label><span id="result"></span>
										<input id="birthDate" type="date" name="birthDate" onchange="calcularEdad()" placeholder="dd/MM/yyyy" class="form-control" tabindex="5" required ng-model="newPerson.birthDate" max="1997-01-01"/>	
									</div>
								</div>
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.genderName.$dirty && createPersonForm.genderName.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.genderName.$error.required">Debe ingresar el genero</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label>Genero (*)</label>
	
									<div class="dropdown" tabindex="6" dropdown is-open="status.isopen">
									  <a type="button" data-toggle="dropdown">
									    <span ng-show="newPerson.genderName == ''">
									    	Elegir genero (*)
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
								<div class="form-group cellphoneInput">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.cellPhone.$dirty && createPersonForm.cellPhone.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.cellPhone.$error.required">Debe ingresar el celular</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.cellPhone.$error.number">Debe ingresar n�meros</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="cellPhone">Celular</label>
									<span>(</span><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="cellPhoneAreaCode" class="form-control" maxlength="20" placeholder="COD AREA" tabindex="7" ng-model="newPerson.cellPhoneAreaCode"><span>) 15</span>
									<input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="cellPhoneNumber" class="form-control" maxlength="20" placeholder="NUMERO" tabindex="7" ng-model="newPerson.cellPhoneNumber">
								</div>
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.email.$dirty && createPersonForm.email.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.email.$error.required">Debe ingresar el email</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.email.$error.email">Formato incorrecto</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="email">Email</label>
									<input type="email" name="email" class="form-control" maxlength="45" placeholder="Ingrese email" tabindex="8" ng-model="newPerson.email">
								</div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.province.$dirty && createPersonForm.province.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.province.$error.required">Debe ingresar la provincia</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="province">Provincia (*)</label>
									<input type="text" name="province" class="form-control" required maxlength="45" placeholder="Ingrese una provincia" tabindex="9" ng-model="newPerson.province">
	
								</div>
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.locality.$dirty && createPersonForm.locality.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.locality.$error.required">Debe ingresar la localidad</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="locality">Departamento - Localidad (*)</label>
									<div class="dropdown" tabindex="10" dropdown>
									  <a type="button" data-toggle="dropdown">
									    <span ng-show="newPerson.locality == undefined">
									    	Elegir localidad
									    </span>
									    <span ng-show="newPerson.locality != undefined">
										    {{newPerson.locality}} 
									    </span>
									    <i class="fa fa-chevron-down"></i>
									  </a>
									  <ul class="dropdown-menu" role="menu">
									    <li ng-repeat="locality in localities" ng-click="selectLocality({localityName: locality.name, cpName: locality.cp})"><a href="javascript:void(0);">{{locality.name}}</a></li>
									  </ul>
									</div>
								</div>
							</div> 
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.address.$dirty && createPersonForm.address.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.address.$error.required">Debe ingresar la direcci�n</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="address">Direcci�n (*)</label>
									<input type="text" name="address" class="form-control" maxlength="100" placeholder="Ingrese direcci�n" required tabindex="11" ng-model="newPerson.address">
									<label for="addressNumber">Numero</label>
									<input type="text" name="addressNumber" class="form-control" maxlength="45" placeholder="Ingrese n�mero" tabindex="12" ng-model="newPerson.addressNumber">
									<label for="addressFloor">Piso</label>
									<input type="text" name="addressFloor" class="form-control" maxlength="45" placeholder="Ingrese piso" tabindex="13" ng-model="newPerson.addressFloor">
									<label for="addressAppartment">Departamento/Localidad</label>
									<input type="text" name="addressAppartment" class="form-control" maxlength="45" placeholder="Ingrese departamento/localidad" tabindex="14" ng-model="newPerson.addressAppartment">
								</div>
								<div class="form-group">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.postCode.$dirty && createPersonForm.postCode.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.postCode.$error.required">Debe ingresar el c�digo postal</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="postCode">C�digo postal (*)</label>
									<input type="text" name="postCode" class="form-control" maxlength="10" placeholder="Ingrese c�digo postal" tabindex="15" required ng-model="newPerson.postCode">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group cellphoneInput">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.phone.$dirty && createPersonForm.phone.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.phone.$error.required">Debe ingresar el tel�fono</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.phone.$error.number">Debe ingresar n�meros</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="phone">Tel�fono</label>
									<span>(</span><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="phoneCode" class="form-control" maxlength="20" placeholder="" tabindex="16" ng-model="newPerson.phoneCode"><span>)</span> 
									<input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="phoneNumber" class="form-control" maxlength="20" placeholder="" tabindex="16" ng-model="newPerson.phoneNumber">
								</div>
								<div class="form-group cellphoneInput">
									<!-- VALIDACIO�N -->
									<div class="top tooltip active" role="tooltip" ng-show="createPersonForm.workphone.$dirty && createPersonForm.workphone.$invalid">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner" ng-show="createPersonForm.workphone.$error.required">Debe ingresar el tel�fono laboral</div>
									  <div class="tooltip-inner" ng-show="createPersonForm.workphone.$error.number">Debe ingresar n�meros</div>
									</div>
									<!-- end VALIDACIO�N -->
									<label for="workphone">Tel�fono laboral</label>
									<span>(</span><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="workphoneNumber" class="form-control" maxlength="20" placeholder="" tabindex="17" ng-model="newPerson.workPhoneCode"><span>)</span> 
									<input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="workphoneCode" class="form-control" maxlength="20" placeholder="" tabindex="17" ng-model="newPerson.workPhoneNumber">
								</div>
							</div>							
						</div>
						<hr>
						
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-right">
									<div class="form-group">
										<button type="button" class="btn btn-primary" ng-click="cancelEdit()">Cancelar</button>
										<input type="submit" class="btn btn-primary" tabindex="18" value="Guardar persona" ng-show="!isEdition" ng-disabled="createPersonForm.$invalid || newPerson.genderName == '' || newPerson.identityTypeName == '' || newPerson.locality == '' || newPerson.type == ''" />
										<input type="submit" class="btn btn-primary" tabindex="18" value="Actualizar persona" ng-show="isEdition" ng-disabled="createPersonForm.$invalid || newPerson.genderName == '' || newPerson.identityTypeName == '' || newPerson.locality == '' || newPerson.type == ''" />
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

		function isValidDate(day,month,year)
		{
		    var dteDate;
		    month=month-1;
		    dteDate=new Date(year,month,day);
		    return ((day==dteDate.getDate()) && (month==dteDate.getMonth()) && (year==dteDate.getFullYear()));
		}

		function validate_fecha(fecha)
		{
		    var patron=new RegExp("^(19|20)+([0-9]{2})([-])([0-9]{1,2})([-])([0-9]{1,2})$");
		 
		    if(fecha.search(patron)==0)
		    {
		        var values=fecha.split("-");
		        if(isValidDate(values[2],values[1],values[0]))
		        {
		            return true;
		        }
		    }
		    return false;
		}

		function calcularEdad()
		{
		    var fecha=document.getElementById("birthDate").value;
		    if(validate_fecha(fecha)==true)
		    {
		        var values=fecha.split("-");
		        var dia = values[2];
		        var mes = values[1];
		        var ano = values[0];
		 
		        var fecha_hoy = new Date();
		        var ahora_ano = fecha_hoy.getYear();
		        var ahora_mes = fecha_hoy.getMonth()+1;
		        var ahora_dia = fecha_hoy.getDate();
		 
		        var edad = (ahora_ano + 1900) - ano;
		        if ( ahora_mes < mes )
		        {
		            edad--;
		        }
		        if ((mes == ahora_mes) && (ahora_dia < dia))
		        {
		            edad--;
		        }
		        if (edad > 1900)
		        {
		            edad -= 1900;
		        }
		 
		        var meses=0;
		        if(ahora_mes>mes)
		            meses=ahora_mes-mes;
		        if(ahora_mes<mes)
		            meses=12-(mes-ahora_mes);
		        if(ahora_mes==mes && dia>ahora_dia)
		            meses=11;
		 
		        var dias=0;
		        if(ahora_dia>dia)
		            dias=ahora_dia-dia;
		        if(ahora_dia<dia)
		        {
		            ultimoDiaMes=new Date(ahora_ano, ahora_mes, 0);
		            dias=ultimoDiaMes.getDate()-(dia-ahora_dia);
		        }
		 
		        document.getElementById("result").innerHTML= "  (" + edad + " a�os)";
		    }else{
		        document.getElementById("result").innerHTML="La fecha "+fecha+" es incorrecta";
		    }
		}
	</script>
</body>
</html>