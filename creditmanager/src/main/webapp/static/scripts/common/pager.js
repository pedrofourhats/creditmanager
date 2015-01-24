angular.module('pager', [])
.directive('intiPagination', function ($http) {
    return {
        restrict: 'E',
        scope: {
            itemsPerPage: '=',
            serviceName: '=',
            parentId: '=',
            spinner: '=',
            onSuccess: '&',
            search: '=search',
            filter: '='
        },
        templateUrl: getCompletePath('templates/common/pager.html'),
        controller: function ($scope, $element) {
            $scope.currentPage = 1;
            $scope.pageCount = 0;
            $scope.pagesToShow = [];
            $scope.totalItems = 0;

            $scope.errorHandler = function(err) {
                if ($scope.spinner) {
                    $scope.spinner.stop();
                }

                alert(err);
            };

            $scope.getPageSuccess = function (page) {
                $scope.currentPage = page.pageIndex;
                $scope.totalItems = page.totalItems;
                $scope.pageCount = page.totalPages;
                $scope.setPagesToShow();

                if ($scope.spinner) {
                    $scope.spinner.stop();
                }

                $scope.onSuccess({ page: page });
            };

            $scope.getPage = function (pageNumber) {
                if ($scope.spinner) {
                    $scope.spinner.start();
                }

                var type = $scope.type || 1;
                var filter = $scope.filter || '';
                var parentId = $scope.parentId || null;
                //var params = { type: type, filter: filter, page: pageNumber, maximumRows: $scope.itemsPerPage, parentId: parentId };
                var serviceName = filter != '' ? $scope.serviceName + "/" + filter: $scope.serviceName;
                var params = { pageIndex: pageNumber, pageSize: $scope.itemsPerPage };
                $http({ method: 'GET', url: serviceName, params: params }).success($scope.getPageSuccess).error($scope.errorHandler);
            };

            $scope.search = function(){
            	$scope.getPage(1);
            };
            
            $scope.getNextPage = function () {
                $scope.currentPage = $scope.currentPage + 1;
                $scope.getPage($scope.currentPage);
            };

            $scope.getPreviousPage = function () {
                $scope.currentPage = $scope.currentPage - 1;
                $scope.getPage($scope.currentPage);
            };

            $scope.setPagesToShow = function () {
                var pages = [];
                var firstPage;
                var lastPage;

                if ($scope.pageCount < 8) {
                    firstPage = 1;
                    lastPage = $scope.pageCount;
                } else if ($scope.currentPage < 4) {
                    firstPage = 1;
                    lastPage = 7;
                } else if ($scope.currentPage > $scope.pageCount - 3) {
                    lastPage = $scope.pageCount;
                    firstPage = lastPage - 6;
                } else {
                    firstPage = $scope.currentPage - 3;
                    lastPage = $scope.currentPage + 3;
                }

                for (var i = firstPage; i <= lastPage; i++) {
                    pages.push(i);
                }

                $scope.pagesToShow = pages;
            };

            $scope.isFirstPage = function () { return $scope.currentPage == 1; };
            $scope.moreItems = function () { return $scope.currentPage < $scope.pageCount; };
            $scope.showPagingNumbers = function () { return $scope.pageCount != 1; };

            $scope.getPage($scope.currentPage);
        }
    };
});