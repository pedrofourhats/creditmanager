var addPersonApp = angular.module('personApp', ['ui.bootstrap']);

addPersonApp.controller('addPersonController', function ($scope, $http, $filter) {
	$scope.localities = [{name: "COLON - COLON", cp: "3280"}, {name: "COLON - SAN JOSE", cp: "3280"}, {name: "COLON - UBAJAY", cp: "3287"}, {name: "COLON - VILLA ELISA", cp: "3265"}, {name: "CONCORDIA - COLONIA AYUI", cp: "3201"}, {name: "CONCORDIA - CONCORDIA", cp: "3200"}, {name: "CONCORDIA - ESTANCIA GRANDE", cp: "3201"}, {name: "CONCORDIA - LA CRIOLLA", cp: "3212"}, {name: "CONCORDIA - LOS CHARRUAS", cp: "3212"}, {name: "CONCORDIA - PUERTO YERUA", cp: "3201"}, {name: "DIAMANTE - DIAMANTE", cp: "3105"}, {name: "DIAMANTE - GENERAL RAMIREZ", cp: "3164"}, {name: "DIAMANTE - LIBERTADOR SAN MARTIN", cp: "3103"}, {name: "DIAMANTE - VALLE MARIA", cp: "3101"}, {name: "FEDERACION - CHAJARI", cp: "3238"}, {name: "FEDERACION - FEDERACION", cp: "3206"}, {name: "FEDERACION - LOS CONQUISTADORES", cp: "3183"}, {name: "FEDERACION - SAN JAIME DE LA FRONTERA", cp: "3185"}, {name: "FEDERACION - SANTA ANA", cp: "3208"}, {name: "FEDERACION - VILLA DEL ROSARIO", cp: "3229"}, {name: "FEDERAL - CONSCRIPTO BERNARDI", cp: "3188"}, {name: "FEDERAL - FEDERAL", cp: "3180"}, {name: "FEDERAL - SAUCE DE LUNA", cp: "3144"}, {name: "GUALEGUAY - GENERAL GALARZA", cp: "2843"}, {name: "GUALEGUAY - GUALEGUAY", cp: "2840"}, {name: "GUALEGUAYCHU - ALDEA SAN ANTONIO ", cp: "2826"}, {name: "GUALEGUAYCHU - ENRIQUE CARBO", cp: "2852"}, {name: "GUALEGUAYCHU - GILBERT", cp: "2828"}, {name: "GUALEGUAYCHU - GUALEGUAYCHU", cp: "2820"}, {name: "GUALEGUAYCHU - LARROQUE", cp: "2854"}, {name: "GUALEGUAYCHU - PUEBLO GENERAL BELGRANO", cp: "2852"}, {name: "GUALEGUAYCHU - URDINARRAIN", cp: "2826"}, {name: "ISLAS - CEIBAS", cp: "2823"}, {name: "ISLAS - IBICUY", cp: "2846"}, {name: "ISLAS - VILLA PARANACITO", cp: "2823"}, {name: "LA PAZ - ALCARAZ", cp: "3138"}, {name: "LA PAZ - BOVRIL", cp: "3142"}, {name: "LA PAZ - LA PAZ", cp: "3190"}, {name: "LA PAZ - PIEDRAS BLANCAS", cp: "3129"}, {name: "LA PAZ - SAN GUSTAVO", cp: "3191"}, {name: "LA PAZ - SANTA ELENA", cp: "3192"}, {name: "NOGOYA - ARANGUREN", cp: "3162"}, {name: "NOGOYA - HERNANDEZ", cp: "3156"}, {name: "NOGOYA - LUCAS GONZALEZ", cp: "3158"}, {name: "NOGOYA - NOGOYA", cp: "3150"}, {name: "PARANA - CERRITO", cp: "3122"}, {name: "PARANA - COLONIA AVELLANEDA", cp: "3280"}, {name: "PARANA - CRESPO", cp: "3116"}, {name: "PARANA - HASENKAMP", cp: "3134"}, {name: "PARANA - HERNANDARIAS", cp: "3127"}, {name: "PARANA - MARIA GRANDE", cp: "3133"}, {name: "PARANA - ORO VERDE", cp: "3101"}, {name: "PARANA - PARANA", cp: "3100"}, {name: "PARANA - SAN BENITO", cp: "3107"}, {name: "PARANA - SEGUI", cp: "3117"}, {name: "PARANA - TABOSSI ", cp: "3111"}, {name: "PARANA - VIALE", cp: "3109"}, {name: "PARANA - VILLA URQUIZA", cp: "3113"}, {name: "ROSARIO DEL TALA - ROSARIO DEL TALA", cp: "3174"}, {name: "SAN JOSE DE FELICIANO - SAN JOSE DE FELICIANO", cp: "3187"}, {name: "SAN SALVADOR - GENERAL CAMPOS", cp: "3216"}, {name: "SAN SALVADOR - SAN SALVADOR", cp: "3218"}, {name: "TALA - MACIA", cp: "3177"}, {name: "TALA - MANSILLA", cp: "3845"}, {name: "URUGUAY - BASAVILBASO", cp: "3170"}, {name: "URUGUAY - CASEROS", cp: "3262"}, {name: "URUGUAY - COLONIA ELIA", cp: "3261"}, {name: "URUGUAY - CONCEPCION DEL URUGUAY", cp: "3260"}, {name: "URUGUAY - HERRERA", cp: "3272"}, {name: "URUGUAY - PRIMERO DE MAYO", cp: "3248"}, {name: "URUGUAY - PRONUNCIAMIENTO", cp: "3263"}, {name: "URUGUAY - SAN JUSTO", cp: "3262"}, {name: "URUGUAY - SANTA ANITA", cp: "3248"}, {name: "URUGUAY - VILLA MANTERO", cp: "3272"}, {name: "VICTORIA - VICTORIA", cp: "3153"}, {name: "VILLAGUAY - VILLA CLARA", cp: "3252"}, {name: "VILLAGUAY - VILLA DOMINGUEZ", cp: "3246"}, {name: "VILLAGUAY - VILLAGUAY", cp: "3240"}];
	
	$scope.selectIdNumberType = function(identityType) {
		$scope.newPerson.identityType = identityType.value;
		$scope.newPerson.identityTypeName = identityType.name;
	};
	
	$scope.selectGender = function(gender) {
		$scope.newPerson.gender = gender.value;
		$scope.newPerson.genderName = gender.name;
	};
	
	$scope.selectLocality = function(location) {
		$scope.newPerson.locality = location.localityName;
		$scope.newPerson.postCode = location.cpName;
	};
	
	$scope.selectType = function(type) {
		$scope.newPerson.type = type;
	};
	
	$scope.isEdition = false;
	if(editablePerson) {
		$scope.isEdition = true;
		if(editablePerson.cellPhone != undefined){
			var cellPhone = editablePerson.cellPhone.substring(1);
			cellPhone = cellPhone.split(') 15');
			editablePerson.cellPhoneAreaCode = cellPhone[0];
			editablePerson.cellPhoneNumber = cellPhone[1];
		}
		editablePerson.phone = parseInt(editablePerson.phone);
		editablePerson.workPhone = parseInt(editablePerson.workPhone);
		if(editablePerson.identityNumber != undefined){
			if ((editablePerson.identityNumber.charAt(0) == 'm') || (editablePerson.identityNumber.charAt(0) == 'f') || (editablePerson.identityNumber.charAt(0) == 'M') || (editablePerson.identityNumber.charAt(0) == 'F')) {
				editablePerson.identityNumberGenere = editablePerson.identityNumber.charAt(0);
				editablePerson.identityNumber = editablePerson.identityNumber.substring(1);
			}
			var res = editablePerson.identityNumber.split(".");
			editablePerson.identityNumberFirstPart = parseInt(res[0]);
			editablePerson.identityNumberSecondPart = parseInt(res[1]);
			editablePerson.identityNumberThirdPart = parseInt(res[2]);
		}
		editablePerson.identityTypeName = getIdentityTypeName(editablePerson.identityType);
		editablePerson.identityType = getIdentityType(editablePerson.identityTypeName);
		editablePerson.genderName = getGenderName(editablePerson.gender);
		editablePerson.gender = getGender(editablePerson.genderName);
		editablePerson.birthDate = new Date(editablePerson.birthDate);
		delete editablePerson.formattedBirthDate;
		
		$scope.newPerson = editablePerson;
	} else {
		$scope.newPerson = {identityTypeName: "", genderName: "", province: "Entre Ríos"};
		//se selecciona por default sexo masculino
		$scope.selectGender({value: 0, name: 'MASCULINO'});
	}
	
	$scope.addPerson = function() {
		if($scope.newPerson.identityNumberFirstPart != undefined){
			if($scope.newPerson.identityNumberGenere != undefined){
				$scope.newPerson.identityNumber = $scope.newPerson.identityNumberGenere + $scope.newPerson.identityNumberFirstPart + "." + $scope.newPerson.identityNumberSecondPart + "." + $scope.newPerson.identityNumberThirdPart;
			}
			else
			{
				$scope.newPerson.identityNumber = $scope.newPerson.identityNumberFirstPart + "." + $scope.newPerson.identityNumberSecondPart + "." + $scope.newPerson.identityNumberThirdPart;
			}
		}
		
		if($scope.newPerson.cellPhoneNumber != undefined){
			$scope.newPerson.cellPhone = '(' + $scope.newPerson.cellPhoneAreaCode + ') 15' + $scope.newPerson.cellPhoneNumber;
		}
		
		if ($scope.createPersonForm.$valid) {
			if(!$scope.newPerson.birthDate) {
				$scope.newPerson.birthDate = new Date(1000,0,1);
			}
			
			if(!$scope.isEdition) {
				$http.post(getCompletePath("persons/createPerson"), JSON.stringify($scope.newPerson))
				.success(function (error) {
					if(error.error && error.type == "Error") {
						alert(error.error);
					} else if (error.error&& error.type == "Warning") {
						if(confirm(error.error)) {
							$http.post(getCompletePath("persons/createPersonWithoutValidation"), JSON.stringify($scope.newPerson))
							.success(function () {
								alert('La persona ha sido agregada satisfactoriamente');
								redirect('person/list');
							}).error(function () {
						    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
						    });
						}
					} else {
						alert('La persona ha sido agregada satisfactoriamente');
						redirect('person/list');
					}
			    }).error(function () {
			    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
			    });
			} else {
				$http.post(getCompletePath("persons/editPerson"), JSON.stringify($scope.newPerson))
				.success(function (error) {
					if(error.error && error.type == "Error") {
						alert(error.error);
					} else if (error.error&& error.type == "Warning") {
						if(confirm(error.error)) {
							$http.post(getCompletePath("persons/editPersonWithoutValidation"), JSON.stringify($scope.newPerson))
							.success(function () {
								alert('La persona ha sido actualizada satisfactoriamente');
								redirect('person/list');
							}).error(function () {
						    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
						    });
						}
					} else {
						alert('La persona ha sido actualizada satisfactoriamente');
						redirect('person/list');
					}
			    }).error(function () {
			    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
			    });
			}
	    } else {
	      $scope.createPersonForm.submitted = true;
	    }
	};
});

function getIdentityTypeName(identityTypeName) {
	switch(identityTypeName) {
	    case "DNI":
	        return "DNI";
	        break;
	    case "LIBRETA_CIVICA":
	        return "LC";
	        break;
	    case "LIBRETA_ENROLAMIENTO":
	        return "LE";
	        break;
	    default:
	        return "";
	}
}

function getIdentityType(identityTypeName) {
	switch(identityTypeName) {
	    case "DNI":
	        return 0;
	        break;
	    case "LE":
	        return 1;
	        break;
	    case "LC":
	        return 2;
	        break;
	    default:
	        return 0;
	}
}

function getGenderName(genderName) {
	switch(genderName) {
	    case "MALE":
	        return "MASCULINO";
	        break;
	    case "FEMALE":
	        return "FEMENINO";
	        break;
	    default:
	        return "";
	}
}

function getGender(genderName) {
	switch(genderName) {
	    case "MASCULINO":
	        return 0;
	        break;
	    case "FEMENINO":
	        return 1;
	        break;
	    default:
	        return 0;
	}
}