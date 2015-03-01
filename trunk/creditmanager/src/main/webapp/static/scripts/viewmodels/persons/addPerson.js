var addPersonApp = angular.module('personApp', ['ui.bootstrap']);

addPersonApp.controller('addPersonController', function ($scope, $http, $filter) {
	$scope.localities = [{name: "LA PAZ", cp: "3138"}, {name: "GUALEGUAYCHU", cp: "2826"}, {name: "NOGOYA", cp: "3162"}, {name: "URUGUAY", cp: "3170"}, {name: "LA PAZ", cp: "3142"}, {name: "URUGUAY", cp: "3262"}, {name: "ISLAS", cp: "2823"}, {name: "PARANA", cp: "3122"}, {name: "FEDERACION", cp: "3238"}, {name: "COLON", cp: "3280"}, {name: "PARANA", cp: "3280"}, {name: "CONCORDIA", cp: "3201"}, {name: "URUGUAY", cp: "3261"}, {name: "URUGUAY", cp: "3260"}, {name: "CONCORDIA", cp: "3200"}, {name: "FEDERAL", cp: "3188"}, {name: "PARANA", cp: "3116"}, {name: "DIAMANTE", cp: "3105"}, {name: "GUALEGUAYCHU", cp: "2852"}, {name: "CONCORDIA", cp: "3201"}, {name: "FEDERACION", cp: "3206"}, {name: "FEDERAL", cp: "3180"}, {name: "SAN SALVADOR", cp: "3216"}, {name: "GUALEGUAY", cp: "2843"}, {name: "DIAMANTE", cp: "3164"}, {name: "GUALEGUAYCHU", cp: "2828"}, {name: "GUALEGUAY", cp: "2840"}, {name: "GUALEGUAYCHU", cp: "2820"}, {name: "PARANA", cp: "3134"}, {name: "PARANA", cp: "3127"}, {name: "NOGOYA", cp: "3156"}, {name: "URUGUAY", cp: "3272"}, {name: "ISLAS", cp: "2846"}, {name: "CONCORDIA", cp: "3212"}, {name: "LA PAZ", cp: "3190"}, {name: "GUALEGUAYCHU", cp: "2854"}, {name: "DIAMANTE", cp: "3103"}, {name: "CONCORDIA", cp: "3212"}, {name: "FEDERACION", cp: "3183"}, {name: "NOGOYA", cp: "3158"}, {name: "TALA", cp: "3177"}, {name: "TALA", cp: "3845"}, {name: "PARANA", cp: "3133"}, {name: "NOGOYA", cp: "3150"}, {name: "PARANA", cp: "3101"}, {name: "PARANA", cp: "3100"}, {name: "LA PAZ", cp: "3129"}, {name: "URUGUAY", cp: "3248"}, {name: "URUGUAY", cp: "3263"}, {name: "GUALEGUAYCHU", cp: "2852"}, {name: "CONCORDIA", cp: "3201"}, {name: "ROSARIO DEL TALA", cp: "3174"}, {name: "PARANA", cp: "3107"}, {name: "LA PAZ", cp: "3191"}, {name: "FEDERACION", cp: "3185"}, {name: "COLON", cp: "3280"}, {name: "SAN JOSE DE FELICIANO", cp: "3187"}, {name: "URUGUAY", cp: "3262"}, {name: "SAN SALVADOR", cp: "3218"}, {name: "FEDERACION", cp: "3208"}, {name: "URUGUAY", cp: "3248"}, {name: "LA PAZ", cp: "3192"}, {name: "FEDERAL", cp: "3144"}, {name: "PARANA", cp: "3117"}, {name: "PARANA", cp: "3111"}, {name: "COLON", cp: "3287"}, {name: "GUALEGUAYCHU", cp: "2826"}, {name: "DIAMANTE", cp: "3101"}, {name: "PARANA", cp: "3109"}, {name: "VICTORIA", cp: "3153"}, {name: "VILLAGUAY", cp: "3252"}, {name: "FEDERACION", cp: "3229"}, {name: "VILLAGUAY", cp: "3246"}, {name: "COLON", cp: "3265"}, {name: "URUGUAY", cp: "3272"}, {name: "ISLAS", cp: "2823"}, {name: "PARANA", cp: "3113"}, {name: "VILLAGUAY", cp: "3240"}];
	
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
	
	$scope.isEdition = false;
	if(editablePerson) {
		$scope.isEdition = true;
		editablePerson.cellPhone = parseInt(editablePerson.cellPhone);
		editablePerson.phone = parseInt(editablePerson.phone);
		editablePerson.workPhone = parseInt(editablePerson.workPhone);
		editablePerson.identityNumber = parseInt(editablePerson.identityNumber);
		editablePerson.identityTypeName = getIdentityTypeName(editablePerson.identityType);
		editablePerson.identityType = getIdentityType(editablePerson.identityTypeName);
		editablePerson.genderName = getGenderName(editablePerson.gender);
		editablePerson.gender = getGender(editablePerson.genderName);
		editablePerson.birthDate = new Date(editablePerson.birthDate);
		delete editablePerson.formattedBirthDate;
		
		$scope.newPerson = editablePerson;
	} else {
		$scope.newPerson = {identityTypeName: "", genderName: "", province: "Entre Ríos"};
	}
	
	$scope.addPerson = function() {
		if ($scope.createPersonForm.$valid) {
			if(!$scope.newPerson.birthDate) {
				$scope.newPerson.birthDate = new Date(1000,0,1);
			}
			
			if(!$scope.isEdition) {
				$http.post(getCompletePath("persons/createPerson"), JSON.stringify($scope.newPerson))
				.success(function () {
					redirect('person/list');
			    }).error(function () {
			    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
			    });
			} else {
				$http.post(getCompletePath("persons/editPerson"), JSON.stringify($scope.newPerson))
				.success(function () {
					redirect('person/list');
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