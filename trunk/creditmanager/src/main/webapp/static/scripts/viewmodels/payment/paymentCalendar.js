angular.module('paymentCalendarApp', [])
.controller('paymentCalendarCtrl', function($scope){
	var self = this;
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
	
	/***** Collections Managment *****/
	$scope.paymentsCount = $scope.project.payments.length;
	$scope.amountCharged = 0;
		
	self.getAmountCharged = function(){
		angular.forEach($scope.project.payments, function(payment) {
			$scope.amountCharged += payment.feeAmountPaid;
		});
	};
	
	self.getAmountCharged();
	
	/***** Simple Collections And Pole *****/
	$scope.fees = [];
	
	var lastExpirationDate = deliveryDate;
	var lastOpeningBalance = $scope.project.givenAmount;
	for(var i=0; i < $scope.totalDeadline; i++){
		var payment = $scope.project.payments[i];
		var number = i+1;
		
		lastExpirationDate.setDate(lastExpirationDate.getDate() + 30);
		var fee = new Fee(number, $scope.annualRate, lastExpirationDate, lastOpeningBalance, payment, $scope.project);
		lastOpeningBalance = fee.finalBalance;
		$scope.fees.push(fee);
	}
		
});
		
function pad(s) { return (s < 10) ? '0' + s : s; }

function Fee(number, annualRate, expirationDate, openingBalance, payment, project){
	var self = this;
	
	self.isGracePeriod = number <= project.requestedGracePeriod;
	
	self.number = number;
	self.annualRate = annualRate;
	self.expirationDate = [pad(expirationDate.getDate()), pad(expirationDate.getMonth()+1), expirationDate.getFullYear()].join('/');
	self.period = self.isGracePeriod ? 'Gracia' : '';
	
	/* Disminución x Pago de Cuotas */
	self.decreaseByFeePayment = self.isGracePeriod ? 0 : project.givenAmount / project.givenDeadline;
	self.openingBalance = openingBalance;
	self.finalBalance = self.openingBalance - self.decreaseByFeePayment;
}