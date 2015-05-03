var projectApp = angular.module('projectApp',['ngRoute','project.controllers', 'pager', 'intiFileUpload', 'smart-table','ui.bootstrap']);

projectApp.config(function($routeProvider){
	$routeProvider.when('/project-list', {
		templateUrl : getCompletePath('templates/project-list.html'),
		controller : 'ProjectListCtrl'
	});
	$routeProvider.when('/project-detail/:id', {
		templateUrl : getCompletePath('templates/project-create.html'),
		controller : 'ProjectDetailCtrl'
	});
	$routeProvider.when('/project-detail-readonly/:id', {
		templateUrl : getCompletePath('templates/project-readonly.html'),
		controller : 'ProjectDetailCtrl'
	});
	$routeProvider.when('/project-creation', {
		templateUrl : getCompletePath('templates/project-create.html'),
		controller : 'ProjectCreationCtrl'
	});
	$routeProvider.otherwise({
		redirectTo : '/project-list'
	});
});

var projectControllers = angular.module('project.controllers', []);

projectControllers.controller('ProjectListCtrl', ['$scope','$location','$http',
	function($scope, $location,$http){
		$scope.pageQty = 5;
		$scope.projects = [];
		$scope.serviceName = getCompletePath('projects');
		
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
		
		$scope.goToDetail = function(projectId){
			$location.path('/project-detail/' + projectId);
		};
		$scope.goToReadonly = function(projectId){
			$location.path('/project-detail-readonly/' + projectId);
		};
		
		$scope.remove = function(project){
			$http.delete(getCompletePath("projects/" + project.id), {})
			.success(function () {
				var index = $scope.projects.indexOf(project);
                $scope.projects.splice(index, 1);
				//$location.path('/project-list');
		    }).error(function (data, status, headers, config) {
		    	alert("No se puede eliminar un proyecto que tenga personas asignadas.");
		    });
		};
		
		$scope.getHolderNames = function(project){
			var holderNames = '';
			for(var i=0; i<project.holders.length; i++){
				var person = project.holders[i];
				holderNames += person.surname + ' ' + person.name + ', ';
			}
			return holderNames != '' ? holderNames.substring(0, holderNames.length - 2) : '';
		};
		
		$scope.getHolderDocumentNumbers = function(project){
			return project.holders.length == 1 ? project.holders[0].identityNumber : '- - -';
		};
}]);

projectControllers.controller('ProjectCreationCtrl', ['$scope','$http', '$modal', "$location",
	function($scope, $http, $modal, $location) {
		var self = this;
		$scope.step = 1;
		$scope.title = 'CARGAR NUEVO PROYECTO';
		$scope.project = {};
		$scope.project.holders = [];
		$scope.project.guarantors = [];
		$scope.projectId;
		
		$scope.servicers = [{name: "INTI"}, {name: "INTA"}];
		
		$scope.states = [{name: "EVALUACION INTI"}, {name: "EVALUACION INTA"}, {name: "INFORMACION CAFESG"}, {name: "RECHAZADO / DESISTIDO"}, {name: "SUJETO A REVISION"}, {name: "COMITE DE CREDITO"}, {name: "APROBADO"}, {name: "CREDITO OTORGADO"}, {name: "CREDITO VIGENTE"}, {name: "CREDITO EN MORA"}, {name: "CREDITO CANCELADO"}];
		
		$scope.types = [{name: "NUEVO"}, {name: "EN MARCHA"}];

		$scope.economicSectors = [{name: "INDUSTRIA"}, {name: "AGROPECUARIO"}, {name: "SERVICIOS INDUSTRIALES"}, {name: "SERVICIOS NO INDUSTRIALES"}, {name: "OTROS"}];
		
		$scope.economicActivities = [{name: "AERONAUTICA Y ESPACIAL"}, {name: "A CLASIFICAR"}, {name: "AGRICOLA"}, {name: "ALIMENTOS Y BIENES DE CONSUMO"}, {name: "ALIMENTOS Y PRODUCTOS PESQUEROS"}, {name: "AMBIENTE"}, {name: "ARTE"}, {name: "BEBIDAS"}, {name: "BIODIGESTION"}, {name: "BIOTECNOLOGIA INDUSTRIAL"}, {name: "CALIDAD INDUSTRIAL"}, {name: "CARNES"}, {name: "CAUCHO"}, {name: "CELULOSA Y PAPEL"}, {name: "CEREALES Y OLEAGINOSAS"}, {name: "CONSTRUCCIONES"}, {name: "CONTAMINANTES ORGANICOS"}, {name: "CUEROS"}, {name: "DISE�O INDUSTRIAL"}, {name: "ELECTRONICA E INFORMATICA"}, {name: "ENERGIA"}, {name: "ENERGIAS RENOVABLES"}, {name: "ENVASES Y EMBALAJES"}, {name: "EXTENSION Y DESARROLLO"}, {name: "FISICA Y METROLOGIA"}, {name: "FRUTAS Y HORTALIZAS"}, {name: "GANADERA"}, {name: "LACTEOS"}, {name: "MADERA Y MUEBLES"}, {name: "MECANICA"}, {name: "METALMECANICA"}, {name: "OLIVICOLA Y ACEITERAS"}, {name: "OTRAS ESPECIALIDADES"}, {name: "PETROLEO"}, {name: "PLASTICOS"}, {name: "PROCESOS SUPERFICIALES"}, {name: "QUIMICA"}, {name: "SEGURIDAD E HIGIENE"}, {name: "TECNOLOGIAS PARA LA SALUD Y DISCAPACIDAD"}, {name: "TEXTILES"}, {name: "TURISMO"}, {name: "VITIVINICOLA"}, {name: "PISCICULTURA"}, {name: "COMUNICACIONES"}];

		$scope.categories = [{name: "ABERTURAS"}, {name: "A CLASIFICAR"}, {name: "ACADEMIA DE DANZA"}, {name: "ALBA�ILERIA"}, {name: "ALIMENTOS BALANCEADOS"}, {name: "ALMACEN"}, {name: "ALQUILER DE ESPACIOS"}, {name: "ALQUILER DE VAJILLAS Y MANTELES"}, {name: "APICULTURA"}, {name: "ARTE Y DISE�O"}, {name: "ARTESANIAS"}, {name: "ASERRADERO"}, {name: "CALL CENTER"}, {name: "CARNICERIA"}, {name: "CARPINTERIA"}, {name: "CARPINTERIA EN ALUMINIO"}, {name: "CASA DE EMPANADAS"}, {name: "CENTRO DE PILATES"}, {name: "CENTROS DE LAVADO DE AUTOS"}, {name: "CENTROS DE LAVADO DE ROPA"}, {name: "CHACINADOS"}, {name: "CONSULTORIA"}, {name: "CORRALONES"}, {name: "CRIA DE CERDOS"}, {name: "CRIA DE PECES"}, {name: "CRIA DE POLLOS"}, {name: "CRIA DE TERNEROS"}, {name: "CYBER"}, {name: "DESPENSA"}, {name: "DISTRIBUIDORA"}, {name: "DOCENCIA"}, {name: "DRUGSTORE"}, {name: "ELECTRICIDAD"}, {name: "ENFERMERIA"}, {name: "EQUIPOS DE COMPUTO"}, {name: "ESTETICA DE PIES Y MANOS"}, {name: "EVENTOS"}, {name: "FABRICA DE CERVEZAS Y MALTAS"}, {name: "FABRICA DE MILANESAS"}, {name: "FABRICA DE PASTAS"}, {name: "FABRICA DE TABIQUES"}, {name: "FARMACIA"}, {name: "FERIAS ARTESANALES"}, {name: "FERRETERIA"}, {name: "FORRAJERIA"}, {name: "FRIGORIFICO"}, {name: "GASISTA"}, {name: "GERIATRICO"}, {name: "GESTORIA DEL AUTOMOTOR"}, {name: "GOMERIA"}, {name: "GRANJA"}, {name: "GUARDERIA"}, {name: "GYMNASIO"}, {name: "HERRERIA"}, {name: "HIDROPONIA"}, {name: "HORTICULTURA"}, {name: "HOSPEDAJE"}, {name: "IMPRENTA GRAFICA"}, {name: "INVERNADERO"}, {name: "JARDIN DE NI�OS"}, {name: "JARDINERIA"}, {name: "JUGUETERIA"}, {name: "KINESIOLOGO"}, {name: "KIOSCO"}, {name: "LAVADERO DE AUTOS"}, {name: "LAVADERO DE ROPA"}, {name: "LIBRERIA"}, {name: "LIBROS"}, {name: "LICORES"}, {name: "LOCUTORIO"}, {name: "MARROQUINERIA"}, {name: "MUEBLES"}, {name: "MULTIRUBRO"}, {name: "MUSICA"}, {name: "NATACION"}, {name: "ORTOPEDIA"}, {name: "OVINA"}, {name: "PANADERIA"}, {name: "PARRILLA"}, {name: "PASEOS EN LANCHA"}, {name: "PASEOS TURISTICOS"}, {name: "PASTELERIA"}, {name: "PELOTERO"}, {name: "PELUQUERIA"}, {name: "PIEDRAS PRECIOSAS"}, {name: "PINTURA"}, {name: "PIZZERIA"}, {name: "PLOMERIA"}, {name: "PODOLOGIA"}, {name: "POLLERIA"}, {name: "PRODUCCION DE MIEL"}, {name: "PRODUCTOS DE LIMPIEZA"}, {name: "PROFESIONALES INDEPENDIENTES"}, {name: "RADIO"}, {name: "REFRIGERACION"}, {name: "REGALERIA"}, {name: "REMISES Y TAXIS"}, {name: "REPOSTERIA"}, {name: "RESTAURANTE"}, {name: "ROPA INFANTIL"}, {name: "ROTISERIA"}, {name: "SERIGRAFIA"}, {name: "SERVICIO TECNICO INFORMATICO"}, {name: "SERVICIO TECNICO PARA EL HOGAR"}, {name: "SODERIA"}, {name: "SONIDO E ILUMINACION"}, {name: "TABAQUERIA"}, {name: "TALLER DE ARTE Y PINTURA"}, {name: "TALLER DE BICIBLETAS"}, {name: "TALLER DE CHAPA Y PINTURA"}, {name: "TALLER MECANICO"}, {name: "TALLER TECNICO PARA EL TRANSPORTE"}, {name: "TALLER TEXTIL"}, {name: "TAMBO"}, {name: "TORNERIA"}, {name: "TRANSPORTE DE PASAJEROS"}, {name: "VENTA AMBULANTE"}, {name: "VENTA DE ACCESORIOS"}, {name: "VENTA DE MOTOS"}, {name: "VENTA DE ROPA"}, {name: "VENTA DE ZAPATOS"}, {name: "VETERINARIA"}, {name: "VIVERO"}, {name: "ZINGUERIA"}, {name: "CUCHILLERIA"}, {name: "DISE�O GRAFICO"}, {name: "CONSTRUCCION DE OBRA"}, {name: "FRUTOS SECOS"}, {name: "YOGA"}, {name: "PORCINOS"}, {name: "AVICOLA"}, {name: "ILUMINACION"}, {name: "FOTOGRAFIA"}, {name: "AUDIO Y VIDEO"}, {name: "TRANSPORTE DE CARGA"}, {name: "FABRICA DE PISOS Y BALDOSAS"}, {name: "BLANQUERIA"}, {name: "ODONTOLOGIA"}, {name: "PA�ALERA"}, {name: "CRIA DE OVEJAS"}]; 

		$scope.department = [{name: "CONCORDIA"}, {name: "COLON"}, {name: "FEDERAL"}, {name: "VILLAGUAY"}, {name: "SAN SALVADOR"}, {name: "FEDERACION"}, {name: "CONCEPCION DEL URUGUAY"}, {name: "FELICIANO"}];

		$scope.locality = [{name: "BENITO LEGEREN"}, {name: "CALABACILLA"}, {name: "CASEROS"}, {name: "CHAJARI"}, {name: "COLONIA ALEMANA"}, {name: "COLONIA ENSANCHE SAUCE"}, {name: "COLONIA HUGUES"}, {name: "COLONIA LA ARGENTINA"}, {name: "COLONIA PE�A"}, {name: "COLONIA SANTA MARIA"}, {name: "CONCEPCION DEL URUGUAY"}, {name: "CONCORDIA"}, {name: "CONSCRIPTO BERNARDI"}, {name: "EL CIMARRON"}, {name: "EL COLORADO"}, {name: "EL REDOMON"}, {name: "ESTACION RAICES"}, {name: "ESTACION YERUA"}, {name: "FEDERACION"}, {name: "FEDERAL"}, {name: "GENERAL CAMPOS"}, {name: "HOCKER"}, {name: "INGENIERO MIGUEL SAJAROFF"}, {name: "JUBILEO"}, {name: "LA CLARITA"}, {name: "LA CRIOLLA"}, {name: "LAS TEJAS"}, {name: "MOJONES NORTE"}, {name: "NUEVA ESCOCIA"}, {name: "NUEVA VIZCAYA"}, {name: "OSVALDO MAGNASCO"}, {name: "PASO DE LA LAGUNA"}, {name: "PEDERNAL"}, {name: "PRONUNCIAMIENTO"}, {name: "PUEBLO CAZES"}, {name: "PUEBLO LIEBIG'S"}, {name: "PUERTO YERUA"}, {name: "SAN JOSE"}, {name: "SAN PEDRO"}, {name: "SAN SALVADOR"}, {name: "SANTA ANITA"}, {name: "SAUCE DE LUNA"}, {name: "UBAJAY"}, {name: "VILLA CLARA"}, {name: "VILLA DEL ROSARIO"}, {name: "VILLA DOMINGUEZ"}, {name: "VILLA ELISA"}, {name: "VILLA MANTERO"}, {name: "VILLA SAN JUSTO"}, {name: "VILLA ZORRAQUIN"}, {name: "SAN JOSE DE FELICIANO"}, {name: "CASEROS"}, {name: "VILLAGUAY"}];
		
		$scope.evaluators = [];
		
		$scope.accesors = [];
		
		$scope.selectServicer = function(servicerName) {
			$scope.project.servicers = servicerName;
		};
		
		$scope.selectState = function(stateName) {
			$scope.project.situationState = stateName;
		};
		
		$scope.selectEvaluator = function(evaluatorName) {
			$scope.project.evaluator = evaluatorName;
		};
		
		$scope.selectAccesor = function(accesorName) {
			$scope.project.accesor = accesorName;
		};
		
		$scope.selectEconomicArea = function(economicArea) {
			$scope.project.economicArea = economicArea;
		};

		$scope.selectCategory = function(category) {
			$scope.project.category = category;
		};
		
		$scope.selectType = function(type) {
			$scope.project.type = type;
		};

		$scope.selectEconomicActivity = function(economicActivity) {
			$scope.project.economicActivity = economicActivity;
		};

		$scope.loadProjectButtonName = 'Guardar proyecto';
		$scope.loadProjectButtonEnable = false;
		
		
		$scope.changeStep = function(step) {
			$scope.step = step;
		};
	
		$scope.nextSetp = function() {
			if(($scope.step == 1 || $scope.step == 2) && !$scope.projectId) {
				self.createProject();
			} else {
				self.editProject();
			}
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
		
		self.createProject = function(){
			if($scope.evaluators.length == 0 || $scope.accesors.length == 0){
				alert('No existen evaluadores y/o asesores en el sistema. \nAsegurese de cargarlos previamente.');
				return;
			}
			
			if(!$scope.project.evaluator || !$scope.project.accesor){
				alert('Debe completar los campos de evaluador y asesor');
				return;
			}
			
			if($scope.project.numberId != undefined){
				$scope.project.number = $scope.project.numberId + '/' + $scope.project.numberYear;
			}
			
			if($scope.project.deliveryDate) {
				/*if($scope.project.deliveryDate > new Date()) {
					alert("La fecha de otorgamiento del cr\u00e9dito debe ser menor que la fecha actual");
					return;
				} else */if(!$scope.project.dateOfEntry) {
					alert("Para ingresar la fecha de otorgamiento del cr\u00e9dito debe primero ingresar la fecha de ingreso al INTI");
					return;
				} else if($scope.project.deliveryDate < $scope.project.dateOfEntry) {
					alert("La fecha de otorgamiento del cr\u00e9dito debe ser mayor que la de ingreso al INTI");
					return;
				}
			}
			
			//TODO: REVISAR TEO!!!!!
			if($scope.project.evaluator) {//SE AGREGA PARA QUE NO ROMPA EL IF
				delete $scope.project.evaluator.formattedBirthDate;
			}
			
			if($scope.project.accesor) {//SE AGREGA PARA QUE NO ROMPA EL IF
				delete $scope.project.accesor.formattedBirthDate;
			}
			
			$http.post(getCompletePath("projects"), JSON.stringify($scope.project))
			.success(function (project) {
				$location.path('/project-detail/' + project.id);
				alert("El proyecto se ha creado con exito");
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		self.editProject = function(){
			if($scope.project.number != undefined){
				$scope.project.number = $scope.project.numberId + '/' + $scope.project.numberYear;
			}
			
			delete $scope.project.evaluator.formattedBirthDate;
			delete $scope.project.accesor.formattedBirthDate;
			
			$http.put(getCompletePath("projects/" + $scope.projectId), JSON.stringify($scope.project))
			.success(function () {
				alert("El proyecto se ha actualizado con exito");
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		$scope.loadForm = function() {
			$modal.open({
				templateUrl: 'loadFormModalContent.html',
			    controller: 'ModalLoadFormCtrl',
			    size: 'lg',
			    resolve: {
			    	projectId: function () {
			    		return $scope.projectId;
			        },
			    	graceQuantity: function () {
			    		return $scope.project.givenGracePeriod;
			        },
			    	holderQuantity: function () {
			    		return $scope.project.holders != undefined ? $scope.project.holders.length : 0;
			        }
			    }
			});
		};
		
		$http.get(getCompletePath("person/intiEvaluators"), {})
		.success(function(evaluators){
			$scope.evaluators = evaluators;
		});
		
		$http.get(getCompletePath("person/intiAccesor"), {})
		.success(function(accesors){
			$scope.accesors = accesors;
		});
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

projectControllers.controller('ModalLoadFormCtrl', 
function ($scope, $modalInstance, $http, projectId, graceQuantity, holderQuantity) {
	$scope.hasGrace = graceQuantity > 0;
	$scope.hasHolder = holderQuantity > 1;
	
	$scope.goToForm = function(formName) {
		redirect('forms/' + formName + "/" + projectId);
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
});

projectControllers.controller('ModalAddContactCtrl', 
function ($scope, $modalInstance, $http, projectId, contact) {
	function pad(s) { return (s < 10) ? '0' + s : s; }
	$scope.title = contact.id ? "Modificar Contacto" : "Agregar Contacto";
	$scope.contactDate = contact.date != null ? new Date(contact.date) : new Date();
	$scope.contactComment = contact.comment;
	
	$scope.addContact = function() {
		$http.put(getCompletePath("projects/contact/" + projectId), JSON.stringify({ id: contact.id, date: $scope.contactDate, comment: $scope.contactComment}))
		.then(function(response){
			var date = new Date(response.data.date);
			contact.id = response.data.id;
			contact.date = response.data.date;
			contact.comment = response.data.comment;
			contact.dateFormatted = [pad(date.getDate()), pad(date.getMonth()+1), date.getFullYear()].join('/');
			$modalInstance.close(contact);
			
		});
	};

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	};
});

projectControllers.controller('ModalLoadPayCtrl',
function($scope, $modalInstance, $http, projectId, feeNumberToPay){
	$scope.feeNumberToPay = feeNumberToPay;
	
	$scope.pay = function(){
		var param = { quoteAmountPaid: parseFloat($scope.fee), paymentDate: $scope.paymentDate, projectId: parseInt(projectId), feeNumber: feeNumberToPay };
		$http.post(getCompletePath("payment"), JSON.stringify(param))
		.then(function(response){
			$scope.cancel();
		});
	};
	
	$scope.cancel = function(){
		$modalInstance.dismiss('cancel');
	};
});