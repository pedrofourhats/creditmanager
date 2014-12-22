var personsListApp = angular.module('personApp', []);

personsListApp.controller('personsListController', function ($scope, $http) {
    $scope.personsPage = personsPage;
    $scope.isSearching = false;
	
    $scope.deletePerson = function(person) {
    	var confirmDeletion = confirm("¿Está seguro que desea eliminar esta persona?");
    	if(confirmDeletion) {
	    	$http.post(getCompletePath("persons/deletePerson"), person.id)
			.success(function () {
				var index = $scope.personsPage.elements.indexOf(person);
	            $scope.personsPage.elements.splice(index, 1);
		    }).error(function () {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
    	}
    };
    
    $scope.goToEditPerson = function(person) {
    	redirect('person/edit/' + person.id);
    };
    
	$scope.goToPage = function(pageNumber) {
		if($scope.personsPage.pageIndex != pageNumber) {
			var path = "persons/" + pageNumber + "/10" + ($scope.searchedKeyword ? "/" + $scope.searchedKeyword : "");
			$http.get(getCompletePath(path))
			.success(function (newPersonsPage) {
				newPersonsPage.pagesToShow = function () {
			        var pages = [];
			        var firstPage;
			        var lastPage;
	
			        if (newPersonsPage.totalPages < 8) {
			            firstPage = 1;
			            lastPage = newPersonsPage.totalPages;
			        } else if (newPersonsPage.pageIndex < 4) {
			            firstPage = 1;
			            lastPage = 7;
			        } else if (newPersonsPage.pageIndex > newPersonsPage.totalPages - 3) {
			            lastPage = newPersonsPage.totalPages;
			            firstPage = lastPage - 6;
			        } else {
			            firstPage = newPersonsPage.pageIndex - 3;
			            lastPage = newPersonsPage.pageIndex + 3;
			        }
	
			        for (var i = firstPage; i <= lastPage; i++) {
			            pages.push(i);
			        }
	
			        return pages;
			    };
				$scope.personsPage = newPersonsPage;
		    }).error(function () {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		}
	};
	
	$scope.deleteSearch = function() {
		$scope.isSearching = false;
		$scope.searchedKeyword = "";
		$scope.goToPage(0);
	};
	
	$scope.search = function() {
		if($scope.searchedKeyword) {
			$scope.isSearching = true;
			
			$http.get(getCompletePath("persons/1/10/" + $scope.searchedKeyword))
			.success(function (newPersonsPage) {
				newPersonsPage.pagesToShow = function () {
			        var pages = [];
			        var firstPage;
			        var lastPage;
	
			        if (newPersonsPage.totalPages < 8) {
			            firstPage = 1;
			            lastPage = newPersonsPage.totalPages;
			        } else if (newPersonsPage.pageIndex < 4) {
			            firstPage = 1;
			            lastPage = 7;
			        } else if (newPersonsPage.pageIndex > newPersonsPage.totalPages - 3) {
			            lastPage = newPersonsPage.totalPages;
			            firstPage = lastPage - 6;
			        } else {
			            firstPage = newPersonsPage.pageIndex - 3;
			            lastPage = newPersonsPage.pageIndex + 3;
			        }
	
			        for (var i = firstPage; i <= lastPage; i++) {
			            pages.push(i);
			        }
	
			        return pages;
			    };
				$scope.personsPage = newPersonsPage;
		    }).error(function () {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		}
	};
});