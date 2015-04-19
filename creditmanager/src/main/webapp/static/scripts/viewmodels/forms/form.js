var formApp = angular.module('formApp', []);

formApp.controller('formController', function ($scope, $http) {
	$scope.project = project;
	$scope.form = {name: formName, date: "", checkNumber: "", day: "", month: "", year: ""};
	$scope.isEdition = false;
	for(var i = 0; $scope.project.forms && i < $scope.project.forms.length; i++) {
		if($scope.project.forms[i].name == formName) {
			$scope.form = $scope.project.forms[i];
			$scope.isEdition = true;
			break;
		}
	}
	
	$scope.saveForm = function() {
		$scope.form.emitionDate = null;
		$http.put(getCompletePath("projects/form/" + $scope.project.id), JSON.stringify($scope.form))
		.success(function () {
			redirect("project/list#/project-detail/" + $scope.project.id + "?page=documentosLegales");
	    }).error(function (err) {
	    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
	    });
	};
	
	$scope.printDiv = function() {
	  var printContents = document.getElementById("printableDiv").innerHTML;
	  var originalContents = document.body.innerHTML;        
	  var popupWin = window.open('', '_blank', 'width=300,height=300');
	  popupWin.document.open();
	  popupWin.document.write('<html><head><link href="../../static/css/fwk/bootstrap.css" media="all" rel="stylesheet" type="text/css"><link href="../../static/css/styles.css" media="all" rel="stylesheet" type="text/css"></head><body onload="window.print()">' + printContents + '</html>');
	  popupWin.document.close();
	};
	
		
	$scope.numberToLetter = function(number) {
		return NumeroALetras(number);
	};
	
	$scope.addPoints = function(nStr)
    {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + '.' + '$2'); // changed comma to dot here
        }
        return x1 + x2;
    };
    
	$scope.dateToLetters = function(date)
    {
		splitedDate = date.split('-');
		var month = "";
		switch (splitedDate[1]) {
	    case "01":
	        month = "Enero";
	        break;
	    case "02":
	        month = "Febrero";
	        break;
	    case "03":
	        month = "Marzo";
	        break;
	    case "04":
	        month = "Abril";
	        break;
	    case "05":
	        month = "Mayo";
	        break;
	    case "06":
	        month = "Junio";
	        break;
	    case "07":
	        month = "Julio";
	        break;
	    case "08":
	        month = "Agosto";
	        break;
	    case "09":
	        month = "Septiembre";
	        break;
	    case "10":
	        month = "Octubre";
	        break;
	    case "11":
	        month = "Noviembre";
	        break;
	    case "12":
	        month = "Diciembre";
	        break;
		}
		return splitedDate[0] + " de " + month + " de " + splitedDate[2]; 
    };
	
	$scope.cityOnly = function(cityComplete) {
		return soloCiudad(cityComplete);
	};
	
	$scope.departmentOnly = function(cityComplete) {
		return soloDepartamento(cityComplete);
	};
	
	$scope.goToProject = function() {
		redirect('project/list#/project-detail/' + $scope.project.id);
	};
	
	$scope.swapGuarantors = function(x, y) {
		var b = $scope.project.guarantors[x];
		$scope.project.guarantors[x] = $scope.project.guarantors[y];
		$scope.project.guarantors[y] = b;
	};
	
	$scope.selectedHolder;
	
	if($scope.project.holders && $scope.project.holders.length > 0) {
		$scope.selectedHolder = $scope.project.holders[0];
	}
	
	$scope.selectHolder = function(holder) {
		$scope.selectedHolder = holder;
	};
});