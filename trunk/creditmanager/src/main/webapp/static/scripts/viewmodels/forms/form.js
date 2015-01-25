var formApp = angular.module('formApp', []);

formApp.controller('formController', function ($scope, $http) {
	$scope.project = project;
	$scope.form = {name: formName, date: "", checkNumber: "", day: "", month: "", year: ""};
	$scope.isEdition = false;
	for(var i = 0; $scope.project.forms && i < $scope.project.forms.length; i++) {
		if($scope.project.forms[i].name == formName) {
			$scope.form = $scope.project.forms[i];
			$scope.isEdition = true;
			break;
		}
	}
	
	$scope.saveForm = function() {
		$http.put(getCompletePath("projects/form/" + $scope.project.id), JSON.stringify($scope.form))
		.success(function () {
			redirect("project/list#/project-detail/" + $scope.project.id);
	    }).error(function (err) {
	    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
	    });
	};
	
	$scope.printDiv = function() {
	  var printContents = document.getElementById("printableDiv").innerHTML;
	  var originalContents = document.body.innerHTML;        
	  var popupWin = window.open('', '_blank', 'width=300,height=300');
	  popupWin.document.open();
	  popupWin.document.write('<html><head></head><body onload="window.print()">' + printContents + '</html>');
	  popupWin.document.close();
	} ;
});