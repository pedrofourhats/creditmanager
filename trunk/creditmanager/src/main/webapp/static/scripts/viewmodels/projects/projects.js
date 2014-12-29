var projectApp = angular.module('projectApp',['ngRoute','project.controllers', 'pager', 'smart-table']);

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

projectControllers.controller('ProjectCreationCtrl', ['$scope', 
	function($scope){
		$scope.tab = 'tab1';
		
		$scope.changeTab = function(tab){
			$scope.tab = tab;
		};
	
}]);