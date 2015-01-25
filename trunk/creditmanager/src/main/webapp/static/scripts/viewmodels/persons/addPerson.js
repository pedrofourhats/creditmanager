var addPersonApp = angular.module('personApp', ['ui.bootstrap']);

addPersonApp.controller('addPersonController', function ($scope, $http, $filter) {
	$scope.selectIdNumberType = function(identityType) {
		$scope.newPerson.identityType = identityType.value;
		$scope.newPerson.identityTypeName = identityType.name;
	};
	
	$scope.selectGender = function(gender) {
		$scope.newPerson.gender = gender.value;
		$scope.newPerson.genderName = gender.name;
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