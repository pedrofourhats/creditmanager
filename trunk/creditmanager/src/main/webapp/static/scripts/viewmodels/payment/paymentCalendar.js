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
	var initialCredit = 0;
	
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
	var lastOpeningBalance = parseFloat($scope.project.givenAmount).toFixed(2);
	var totalMonthlyBalance = 0;
	for(var i=0; i < $scope.totalDeadline; i++){
		var payment = $scope.project.payments[i];
		var number = i+1;
		
		var prevExpirationDate = new Date(lastExpirationDate.getTime());
		lastExpirationDate.setDate(lastExpirationDate.getDate() + 30);
		var fee = new Fee(number, $scope.annualRate, prevExpirationDate, lastExpirationDate, lastOpeningBalance, payment, $scope.project);
		lastOpeningBalance = fee.finalBalance;
		initialCredit += fee.feeAmount;
		totalMonthlyBalance += fee.exactMonthlyBalance;
		$scope.fees.push(fee);
	}
	
	$scope.initialCredit = parseFloat(initialCredit).toFixed(2);
	$scope.totalBalance = parseFloat(initialCredit - $scope.amountCharged).toFixed(2);
	$scope.totalMonthlyBalance = totalMonthlyBalance;
});
		
function pad(s) { return (s < 10) ? '0' + s : s; }

function Fee(number, annualRate, prevExpirationDate, expirationDate, openingBalance, payment, project){
	var self = this;
	
	var pDate = payment != null ? new Date(payment.paymentDate) : null;
	self.isGracePeriod = number <= project.requestedGracePeriod;
	self.dateDiff = function(d1, d2) {
        var t2 = d2.getTime();
        var t1 = d1.getTime();

        return parseInt((t2-t1)/(24*3600*1000));
    };
    
	self.number = number;
	self.annualRate = annualRate;
	self.dailyRate = self.annualRate / 365;
	self.expirationDate = [pad(expirationDate.getDate()), pad(expirationDate.getMonth()+1), expirationDate.getFullYear()].join('/');
	self.period = self.isGracePeriod ? 'Gracia' : '';
	self.paymentDate = payment != null ? [pad(pDate.getDate()), pad(pDate.getMonth()+1), pDate.getFullYear()].join('/') : '';
	self.feeAmountPaid = payment != null ? payment.feeAmountPaid : '';
	
	/* Disminución x Pago de Cuotas */
	var decreaseByFeePayment = self.isGracePeriod ? 0 : (project.givenAmount / project.givenDeadline);
	self.decreaseByFeePayment = parseFloat(decreaseByFeePayment).toFixed(2);
	self.openingBalance = openingBalance;
	self.finalBalance =  parseFloat(self.openingBalance - self.decreaseByFeePayment).toFixed(2);
	self.days = self.dateDiff(prevExpirationDate, expirationDate);
	var interest = self.openingBalance * (self.dailyRate / 100) * self.days;
	var iva = interest * 0.21;
	self.feeAmount = decreaseByFeePayment + interest + iva;
	self.interest = parseFloat(interest).toFixed(2);
	self.iva = parseFloat(iva).toFixed(2);
	self.amount = parseFloat(self.feeAmount).toFixed(2);
	
	/* Punit admn*/
	var rate = self.annualRate / 100;
	var pastDays = payment != null ? self.dateDiff(expirationDate, pDate) : self.dateDiff(expirationDate, new Date());
	var punit = pastDays >= 0 ? (decreaseByFeePayment*pastDays*rate/2/365*1.21) : 0;
	var amountPlusPunit = self.feeAmount + punit;
	
	self.punit = parseFloat(punit).toFixed(2);
	self.punitPlusAmount = parseFloat(amountPlusPunit).toFixed(2);
	self.pastDays = pastDays;
	
	var amountPaid = payment != null ? payment.feeAmountPaid : 0;
	self.exactMonthlyBalance = pastDays >= 0 && amountPaid >= 0 ? (amountPlusPunit - amountPaid) : 0;
	self.monthlyBalance = parseFloat(self.exactMonthlyBalance).toFixed(2);
}