angular.module('paymentCalendarApp', [])
.controller('paymentCalendarCtrl', function($scope){
	$scope.project = project;
	
	/***** Quote Detail *****/
	var d = new Date();
	$scope.today = [pad(d.getDate()), pad(d.getMonth()+1), d.getFullYear()].join('/');
	$scope.totalDeadline = parseInt($scope.project.givenDeadline) + parseInt($scope.project.requestedGracePeriod);
	
	var deliveryDate = new Date($scope.project.deliveryDate);
	$scope.deliveryFormattedDate = [pad(deliveryDate.getDate()), pad(deliveryDate.getMonth()+1), deliveryDate.getFullYear()].join('/');
	
	$scope.capitalQuote = $scope.project.givenAmount / $scope.project.givenDeadline;
	$scope.annualRate = 12;
	$scope.dailyRate = $scope.annualRate / 365;
});
		
function pad(s) { return (s < 10) ? '0' + s : s; }