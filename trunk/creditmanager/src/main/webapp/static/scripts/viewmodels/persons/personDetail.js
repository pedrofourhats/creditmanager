var personDetailApp = angular.module('personApp', ['ui.bootstrap']);

personDetailApp.controller('personDetailController', function ($scope, $http) {
	personDetail.cellPhone = parseInt(personDetail.cellPhone);
	personDetail.phone = parseInt(personDetail.phone);
	personDetail.workPhone = parseInt(personDetail.workPhone);
	personDetail.identityNumber = parseInt(personDetail.identityNumber);
	personDetail.identityTypeName = getIdentityTypeName(personDetail.identityType);
	personDetail.identityType = getIdentityType(personDetail.identityTypeName);
	personDetail.genderName = getGenderName(personDetail.gender);
	personDetail.gender = getGender(personDetail.genderName);
	personDetail.birthDate = new Date(personDetail.birthDate);
	
	$scope.person = personDetail;
	
	$scope.guarantorProjects = guarantorProjects;
	$scope.holderProjects = holderProjects;
	
	$scope.goToProject = function(id) {
		redirect('project/list#/project-detail/' + id);
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