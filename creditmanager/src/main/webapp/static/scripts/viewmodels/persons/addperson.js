var addPersonApp = angular.module('personApp', ['ui.bootstrap']);

addPersonApp.controller('addPersonController', function ($scope, $http) {
	$scope.newPerson = {identityTypeName: "", genderName: "", province: "Entre Ríos"};
	
	$scope.selectIdNumberType = function(identityType) {
		$scope.newPerson.identityType = identityType.value;
		$scope.newPerson.identityTypeName = identityType.name;
	};
	
	$scope.selectGender = function(gender) {
		$scope.newPerson.gender = gender.value;
		$scope.newPerson.genderName = gender.name;
	};
	
	$scope.addPerson = function() {
		if ($scope.createPersonForm.$valid) {
			$http.post(getCompletePath("persons/createPerson"), JSON.stringify($scope.newPerson))
			.success(function () {
				redirect('person/list');
		    }).error(function () {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
	    } else {
	      $scope.createPersonForm.submitted = true;
	    }
	};
});