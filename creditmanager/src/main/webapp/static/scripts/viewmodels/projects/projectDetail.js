projectControllers.controller('ProjectDetailCtrl', ['$scope','$http', '$routeParams', '$modal',
	function($scope, $http, $routeParams, $modal){
		var self = this;
		$scope.projectId = $routeParams.id;
		$scope.step = 1;
		$scope.title = 'MODIFICAR PROYECTO';
		$scope.project = {};
		$scope.project.holders = [];
		$scope.project.guarantors = [];
		
		$scope.buttonName = 'Editar proyecto';
		
		$scope.fakeProject = { serviceEvaluatorName: "", adviserEvaluatorName: "" };
		
		$scope.selectServiceEvaluator = function(serviceEvaluator) {
			$scope.fakeProject.serviceEvaluatorName = serviceEvaluator.name;
		};
		
		$scope.selectAdviserEvaluator = function(adviserEvaluator) {
			$scope.fakeProject.adviserEvaluatorName = adviserEvaluator.name;
		};
		
		$scope.changeStep = function(step){
			$scope.step = step;
		};
	
		$scope.nextSetp = function(){
//			if(!$scope.institutionalForm.$valid) {
//				return;
//			}
			self.editProject();
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
		
		self.editProject = function(){
			var projectToEdit = $scope.project;
			projectToEdit.guarantors = $.map(projectToEdit.guarantors, function(value){ delete value.formattedBirthDate; return value; });
			projectToEdit.holders = $.map(projectToEdit.holders, function(value){ delete value.formattedBirthDate; return value; });
			$http.put(getCompletePath("projects/" + $scope.projectId), JSON.stringify(projectToEdit))
			.success(function () {
				alert("El proyecto se ha actualizado con exito");
				//$scope.step++;
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		$http.get(getCompletePath("projects/findById/" + $scope.projectId), {})
		.success(function(project){
			project.dateOfEntry = new Date(project.dateOfEntry);
			$scope.project = project;
		}).error(function(err){
			alert("Ha ocurrido un problema. Por favor intente nuevamente");
		});
}]);