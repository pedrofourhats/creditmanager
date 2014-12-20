var personsListApp = angular.module('personApp', []);

personsListApp.controller('personsListController', function ($scope, $http) {
    $scope.personsPage = personsPage;
	
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
    
	$scope.goToPage = function(pageNumber) {
		if($scope.personsPage.pageIndex != pageNumber) {
			$http.get(getCompletePath("persons/" + pageNumber + "/10"))
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