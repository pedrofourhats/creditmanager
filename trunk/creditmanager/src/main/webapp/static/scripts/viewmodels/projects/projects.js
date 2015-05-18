var projectApp = angular.module('projectApp',['ngRoute','project.controllers', 'pager', 'intiFileUpload', 'smart-table','ui.bootstrap']);

projectApp.config(function($routeProvider){
	$routeProvider.when('/project-list', {
		templateUrl : getCompletePath('templates/project-list.html'),
		controller : 'ProjectListCtrl'
	});
	$routeProvider.when('/project-detail/:id', {
		templateUrl : getCompletePath('templates/project-create.html'),
		controller : 'ProjectDetailCtrl'
	});
	$routeProvider.when('/project-detail-readonly/:id', {
		templateUrl : getCompletePath('templates/project-readonly.html'),
		controller : 'ProjectDetailCtrl'
	});
	$routeProvider.when('/project-creation', {
		templateUrl : getCompletePath('templates/project-create.html'),
		controller : 'ProjectCreationCtrl'
	});
	$routeProvider.otherwise({
		redirectTo : '/project-list'
	});
});

projectApp.run(['$rootScope', '$location', function ($rootScope, $location) {
  var _preventNavigation = false;
  var _preventNavigationUrl = null;

  $rootScope.allowNavigation = function() {
    _preventNavigation = false;
  };

  $rootScope.preventNavigation = function() {
    _preventNavigation = true;
    _preventNavigationUrl = $location.absUrl();
  };

  $rootScope.$on('$locationChangeStart', function (event, newUrl, oldUrl) {
    // Allow navigation if our old url wasn't where we prevented navigation from
    if (_preventNavigationUrl != oldUrl || _preventNavigationUrl == null) {
      $rootScope.allowNavigation();
      return;
    }

    if (_preventNavigation && !confirm("¿Esta seguro que desea salir de esta página? Todos sus cambios no guardados se perderán")) {
      event.preventDefault();
    }
    else {
      $rootScope.allowNavigation();
    }
  });

  // Take care of preventing navigation out of our angular app
  window.onbeforeunload = function() {
    // Use the same data that we've set in our angular app
    if (_preventNavigation && $location.absUrl() == _preventNavigationUrl) {
      return "¿Esta seguro que desea salir de esta página? Todos sus cambios no guardados se perderán";
    }
  };

}]);

/******************************* CONTROLLERS **********************************/
var projectControllers = angular.module('project.controllers', []);

projectControllers.controller('ProjectListCtrl', ['$scope','$location','$http',
	function($scope, $location,$http){
		$scope.pageQty = 5;
		$scope.projects = [];
		$scope.serviceName = getCompletePath('projects');
		
		$scope.advancedSearch = false;
		
		$scope.toggleAdvancedSearch = function(){
			$scope.advancedSearch = !$scope.advancedSearch;
		};
		
		$scope.onSucces = function (page){
			$scope.projects = page.elements;
		};
		
		//copy the references
		$scope.displayedCollection = [].concat($scope.projects);
		
		$scope.createNewProject = function(){
			$location.path('/project-creation');
		};
		
		$scope.goToDetail = function(projectId){
			$location.path('/project-detail/' + projectId);
		};
		$scope.goToReadonly = function(projectId){
			$location.path('/project-detail-readonly/' + projectId);
		};
		
		$scope.remove = function(project){
			$http.delete(getCompletePath("projects/" + project.id), {})
			.success(function () {
				var index = $scope.projects.indexOf(project);
                $scope.projects.splice(index, 1);
				//$location.path('/project-list');
		    }).error(function (data, status, headers, config) {
		    	alert("No se puede eliminar un proyecto que tenga personas asignadas.");
		    });
		};
		
		$scope.getHolderNames = function(project){
			var holderNames = '';
			for(var i=0; i<project.holders.length; i++){
				var person = project.holders[i];
				holderNames += person.surname + ', ' +  person.name + ' - ';
			}
			return holderNames != '' ? holderNames.substring(0, holderNames.length - 2) : '';
		};
		
		$scope.getHolderDocumentNumbers = function(project){
			var holderDocuments = '';
			for(var i=0; i<project.holders.length; i++){
				holderDocuments += project.holders[i].identityNumber + ', ';
			}
			return holderDocuments != '' ? holderDocuments.substring(0, holderDocuments.length - 2) : '';
			//return project.holders.length == 1 ? project.holders[0].identityNumber : '- - -';
		};
}]);

projectControllers.controller('ModalAddPersonCtrl', 
	function ($scope, $modalInstance, $http, type) {
		$scope.type = type;
		
		$scope.persons = function(personName){
			return $http.get(getCompletePath("person/autocomplete/" + personName), {})
			.then(function (response) {
				return response.data;
		    });
		};
		
		$scope.ok = function () {
			$modalInstance.close($scope.selected);
		};
	
		$scope.cancel = function () {
			$modalInstance.dismiss('cancel');
	  };
});

projectControllers.controller('ModalLoadFormCtrl', 
function ($scope, $modalInstance, $http, projectId, graceQuantity, holderQuantity) {
	$scope.hasGrace = graceQuantity > 0;
	$scope.hasHolder = holderQuantity > 1;
	
	$scope.goToForm = function(formName) {
		redirect('forms/' + formName + "/" + projectId);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
});

projectControllers.controller('ModalAddContactCtrl', 
function ($scope, $modalInstance, $http, projectId, contact) {
	function pad(s) { return (s < 10) ? '0' + s : s; }
	$scope.title = contact.id ? "Modificar Contacto" : "Agregar Contacto";
	$scope.contactDate = contact.date != null ? new Date(contact.date) : new Date();
	$scope.contactComment = contact.comment;
	
	$scope.addContact = function() {
		$http.put(getCompletePath("projects/contact/" + projectId), JSON.stringify({ id: contact.id, date: $scope.contactDate, comment: $scope.contactComment}))
		.then(function(response){
			var date = new Date(response.data.date);
			contact.id = response.data.id;
			contact.date = response.data.date;
			contact.comment = response.data.comment;
			contact.dateFormatted = [pad(date.getDate()), pad(date.getMonth()+1), date.getFullYear()].join('/');
			$modalInstance.close(contact);
			
		});
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
});

projectControllers.controller('ModalLoadPayCtrl',
function($scope, $modalInstance, $http, projectId, feeNumberToPay){
	$scope.feeNumberToPay = feeNumberToPay;
	
	$scope.pay = function(){
		var param = { quoteAmountPaid: parseFloat($scope.fee), paymentDate: $scope.paymentDate, projectId: parseInt(projectId), feeNumber: feeNumberToPay };
		$http.post(getCompletePath("payment"), JSON.stringify(param))
		.then(function(response){
			$scope.cancel();
		});
	};
	
	$scope.cancel = function(){
		$modalInstance.dismiss('cancel');
	};
});