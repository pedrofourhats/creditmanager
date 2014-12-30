var projectApp = angular.module('projectApp',['ngRoute','project.controllers', 'pager', 'smart-table','ui.bootstrap']);

projectApp.config(function($routeProvider){
	$routeProvider.when('/project-list', {
		templateUrl : getCompletePath('/templates/project-list.html'),
		controller : 'ProjectListCtrl'
	});
//	$routeProvider.when('/user-detail/:id', {
//		templateUrl : 'partials/user-detail.html',
//		controller : 'UserDetailCtrl'
//	});
	$routeProvider.when('/project-creation', {
		templateUrl : getCompletePath('/templates/project-create.html'),
		controller : 'ProjectCreationCtrl'
	});
	$routeProvider.otherwise({
		redirectTo : '/project-list'
	});
});


var projectControllers = angular.module('project.controllers', []);

projectControllers.controller('ProjectListCtrl', ['$scope','$location',
	function($scope, $location){
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
}]);

projectControllers.controller('ProjectCreationCtrl', ['$scope','$http', '$modal',
	function($scope,$http,$modal){
		var self = this;
		$scope.tab = 'tab1';
		$scope.step = 1;
		$scope.newProject = {};
		$scope.newProject.holders = [];
		$scope.newProject.guarantors = [];
		
		$scope.changeTab = function(tab){
			$scope.tab = tab;
		};
	
		$scope.nextSetp = function(){
//			if(!$scope.institutionalForm.$valid) {
//				return;
//			}
			switch($scope.step){
				case 1:
					self.createProject();
					break;
			};
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
					$scope.newProject.holders.push({ id: selectedItem.id, name: selectedItem.name, surname: selectedItem.surname });
				} else{
					$scope.newProject.guarantors.push({ id: selectedItem.id, name: selectedItem.name, surname: selectedItem.surname });
				}
		    });
		};
		
		$scope.deleteHolder = function(index){
			$scope.newProject.holders.splice(index, 1);
		};
		
		$scope.deleteGuarantor = function(index){
			$scope.newProject.guarantors.splice(index, 1);
		};
		
		self.createProject = function(){
			$http.post(getCompletePath("projects"), JSON.stringify($scope.newProject))
			.success(function () {
				$scope.step++;
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