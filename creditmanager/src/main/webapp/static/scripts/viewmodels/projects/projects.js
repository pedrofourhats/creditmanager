var projectApp = angular.module('projectApp',['ngRoute','project.controllers', 'pager', 'smart-table','ui.bootstrap']);

projectApp.config(function($routeProvider){
	$routeProvider.when('/project-list', {
		templateUrl : getCompletePath('/templates/project-list.html'),
		controller : 'ProjectListCtrl'
	});
	$routeProvider.when('/project-detail/:id', {
		templateUrl : getCompletePath('/templates/project-create.html'),
		controller : 'ProjectDetailCtrl'
	});
	$routeProvider.when('/project-creation', {
		templateUrl : getCompletePath('/templates/project-create.html'),
		controller : 'ProjectCreationCtrl'
	});
	$routeProvider.otherwise({
		redirectTo : '/project-list'
	});
});


var projectControllers = angular.module('project.controllers', []);

projectControllers.controller('ProjectListCtrl', ['$scope','$location','$http',
	function($scope, $location,$http){
		$scope.pageQty = 2;
		$scope.projects = [];
		
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
		
		$scope.remove = function(projectId){
			$http.delete(getCompletePath("projects/" + projectId), {})
			.success(function () {
				$location.path('/project-list');
		    }).error(function (data, status, headers, config) {
		    	alert("No se puede eliminar el proyecto porque tiene personas asignadas.");
		    });
		};
}]);

projectControllers.controller('ProjectCreationCtrl', ['$scope','$http', '$modal',
	function($scope,$http,$modal){
		var self = this;
		$scope.step = 1;
		$scope.title = 'CARGAR NUEVO PROYECTO';
		$scope.project = {};
		$scope.project.holders = [];
		$scope.project.guarantors = [];
		$scope.projectId;
		
		$scope.changeStep = function(step){
			$scope.step = step;
		};
	
		$scope.nextSetp = function(){
//			if(!$scope.institutionalForm.$valid) {
//				return;
//			}
			if($scope.step == 1 && !$scope.projectId){
				self.createProject();
			} else {
				self.editProject();
			}
		};
		
		$scope.openAddPerson = function(type){
			var modalInstance = $modal.open({
				templateUrl: 'addPersonModalContent.html',
			    controller: 'ModalAddPersonCtrl',
			    size: 'lg',
			    resolve: {
			    	type: function () {
			    		return type;
			        }
			    }
			});
			
			modalInstance.result.then(function (selectedItem) {
				if(type == 'Titular'){
					$scope.project.holders.push({ id: selectedItem.id, name: selectedItem.name, surname: selectedItem.surname });
				} else{
					$scope.project.guarantors.push({ id: selectedItem.id, name: selectedItem.name, surname: selectedItem.surname });
				}
		    });
		};
		
		$scope.deleteHolder = function(index){
			$scope.project.holders.splice(index, 1);
		};
		
		$scope.deleteGuarantor = function(index){
			$scope.project.guarantors.splice(index, 1);
		};
		
		self.createProject = function(){
			$http.post(getCompletePath("projects"), JSON.stringify($scope.project))
			.success(function (project) {
				$scope.projectId = project.id;
				//$scope.step++;
				alert("El proyecto se ha creado con exito");
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		self.editProject = function(){
			$http.put(getCompletePath("projects/" + $scope.projectId), JSON.stringify($scope.project))
			.success(function () {
				//$scope.step++;
				alert("El proyecto se ha actualizado con exito");
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
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
