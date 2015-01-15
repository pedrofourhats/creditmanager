var projectApp = angular.module('projectApp',['ngRoute','project.controllers', 'pager', 'smart-table','ui.bootstrap']);

projectApp.config(function($routeProvider){
	$routeProvider.when('/project-list', {
		templateUrl : getCompletePath('/templates/project-list.html'),
		controller : 'ProjectListCtrl'
	});
	$routeProvider.when('/project-detail/:id', {
		templateUrl : getCompletePath('/templates/project-create.html'),
		controller : 'ProjectDetailCtrl'
	});
	$routeProvider.when('/project-creation', {
		templateUrl : getCompletePath('/templates/project-create.html'),
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
		
		$scope.remove = function(projectId){
			$http.delete(getCompletePath("projects/" + projectId), {})
			.success(function () {
				$location.path('/project-list');
		    }).error(function (data, status, headers, config) {
		    	alert("No se puede eliminar el proyecto porque tiene personas asignadas.");
		    });
		};
}]);

projectControllers.controller('ProjectCreationCtrl', ['$scope','$http', '$modal',
	function($scope, $http, $modal) {
		var self = this;
		$scope.step = 1;
		$scope.title = 'CARGAR NUEVO PROYECTO';
		$scope.project = {};
		$scope.project.holders = [];
		$scope.project.guarantors = [];
		$scope.projectId;
		$scope.fakeProject = { serviceEvaluatorName: "", adviserEvaluatorName: ""};
		
		$scope.servicers = [{name: "INTI"}, {name: "INTA"}];
		
		$scope.states = [{name: "EVALUACIÓN INTI"}, {name: "EVALUACION INTA"}, {name: "INFORMACION CAFESG"}, {name: "RECHAZADO / DESISTIDO"}, {name: "SUJETO A REVISIÓN"}, {name: "COMITÉ DE CRÉDITO"}, {name: "APROBADO"}, {name: "CREDITO OTORGADO"}, {name: "CREDITO VIGENTE"}, {name: "CREDITO EN MORA"}, {name: "CREDITO CANCELADO"}];
		
		$scope.evaluators = [{name: "ELIZABETH A."}, {name: "ADRIANA V."}, {name: "ROMINA M."}, {name: "WALTER H."}, {name: "MELINA SCH."}, {name: "MARTIN S."}, {name: "ELINA B."}, {name: "INTA"}];
		
		$scope.assistants = [{name: "NOELIA A."}, {name: "JAVIER B."}, {name: "EMANUEL R."}, {name: "ROSA F."}, {name: "ROSANA G."}, {name: "NOELIA D."}, {name: "DIEGO"}, {name: "CECILIA B."}, {name: "MARTIN L."}];

		$scope.type = [{name: "NUEVO"}, {name: "EN MARCHA"}];

		$scope.economicSector = [{name: "INDUSTRIA"}, {name: "AGROPECUARIO"}, {name: "SERVICIOS INDUSTRIALES"}, {name: "SERVICIOS NO INDUSTRIALES"}, {name: "OTROS"}];
		
		$scope.economicActivity = [{name: "AERONAUTICA Y ESPACIAL"}, {name: "A CLASIFICAR"}, {name: "AGRICOLA"}, {name: "ALIMENTOS Y BIENES DE CONSUMO"}, {name: "ALIMENTOS Y PRODUCTOS PESQUEROS"}, {name: "AMBIENTE"}, {name: "ARTE"}, {name: "BEBIDAS"}, {name: "BIODIGESTION"}, {name: "BIOTECNOLOGIA INDUSTRIAL"}, {name: "CALIDAD INDUSTRIAL"}, {name: "CARNES"}, {name: "CAUCHO"}, {name: "CELULOSA Y PAPEL"}, {name: "CEREALES Y OLEAGINOSAS"}, {name: "CONSTRUCCIONES"}, {name: "CONTAMINANTES ORGANICOS"}, {name: "CUEROS"}, {name: "DISEÑO INDUSTRIAL"}, {name: "ELECTRONICA E INFORMATICA"}, {name: "ENERGIA"}, {name: "ENERGIAS RENOVABLES"}, {name: "ENVASES Y EMBALAJES"}, {name: "EXTENSION Y DESARROLLO"}, {name: "FISICA Y METROLOGIA"}, {name: "FRUTAS Y HORTALIZAS"}, {name: "GANADERA"}, {name: "LACTEOS"}, {name: "MADERA Y MUEBLES"}, {name: "MECANICA"}, {name: "METALMECANICA"}, {name: "OLIVICOLA Y ACEITERAS"}, {name: "OTRAS ESPECIALIDADES"}, {name: "PETROLEO"}, {name: "PLASTICOS"}, {name: "PROCESOS SUPERFICIALES"}, {name: "QUIMICA"}, {name: "SEGURIDAD E HIGIENE"}, {name: "TECNOLOGIAS PARA LA SALUD Y DISCAPACIDAD"}, {name: "TEXTILES"}, {name: "TURISMO"}, {name: "VITIVINICOLA"}, {name: "PISCICULTURA"}, {name: "COMUNICACIONES"}];

		$scope.category = [{name: "ABERTURAS"}, {name: "A CLASIFICAR"}, {name: "ACADEMIA DE DANZA"}, {name: "ALBAÑILERIA"}, {name: "ALIMENTOS BALANCEADOS"}, {name: "ALMACEN"}, {name: "ALQUILER DE ESPACIOS"}, {name: "ALQUILER DE VAJILLAS Y MANTELES"}, {name: "APICULTURA"}, {name: "ARTE Y DISEÑO"}, {name: "ARTESANIAS"}, {name: "ASERRADERO"}, {name: "CALL CENTER"}, {name: "CARNICERIA"}, {name: "CARPINTERIA"}, {name: "CARPINTERIA EN ALUMINIO"}, {name: "CASA DE EMPANADAS"}, {name: "CENTRO DE PILATES"}, {name: "CENTROS DE LAVADO DE AUTOS"}, {name: "CENTROS DE LAVADO DE ROPA"}, {name: "CHACINADOS"}, {name: "CONSULTORIA"}, {name: "CORRALONES"}, {name: "CRIA DE CERDOS"}, {name: "CRIA DE PECES"}, {name: "CRIA DE POLLOS"}, {name: "CRIA DE TERNEROS"}, {name: "CYBER"}, {name: "DESPENSA"}, {name: "DISTRIBUIDORA"}, {name: "DOCENCIA"}, {name: "DRUGSTORE"}, {name: "ELECTRICIDAD"}, {name: "ENFERMERIA"}, {name: "EQUIPOS DE COMPUTO"}, {name: "ESTETICA DE PIES Y MANOS"}, {name: "EVENTOS"}, {name: "FABRICA DE CERVEZAS Y MALTAS"}, {name: "FABRICA DE MILANESAS"}, {name: "FABRICA DE PASTAS"}, {name: "FABRICA DE TABIQUES"}, {name: "FARMACIA"}, {name: "FERIAS ARTESANALES"}, {name: "FERRETERIA"}, {name: "FORRAJERIA"}, {name: "FRIGORIFICO"}, {name: "GASISTA"}, {name: "GERIATRICO"}, {name: "GESTORIA DEL AUTOMOTOR"}, {name: "GOMERIA"}, {name: "GRANJA"}, {name: "GUARDERIA"}, {name: "GYMNASIO"}, {name: "HERRERIA"}, {name: "HIDROPONIA"}, {name: "HORTICULTURA"}, {name: "HOSPEDAJE"}, {name: "IMPRENTA GRAFICA"}, {name: "INVERNADERO"}, {name: "JARDIN DE NIÑOS"}, {name: "JARDINERIA"}, {name: "JUGUETERIA"}, {name: "KINESIOLOGO"}, {name: "KIOSCO"}, {name: "LAVADERO DE AUTOS"}, {name: "LAVADERO DE ROPA"}, {name: "LIBRERÍA"}, name: "LIBROS"}, {name: "LICORES"}, {name: "LOCUTORIO"}, {name: "MARROQUINERIA"}, {name: "MUEBLES"}, {name: "MULTIRUBRO"}, {name: "MUSICA"}, {name: "NATACION"}, {name: "ORTOPEDIA"}, {name: "OVINA"}, {name: "PANADERIA"}, {name: "PARRILLA"}, {name: "PASEOS EN LANCHA"}, {name: "PASEOS TURISTICOS"}, {name: "PASTELERIA"}, {name: "PELOTERO"}, {name: "PELUQUERIA"}, {name: "PIEDRAS PRECIOSAS"}, {name: "PINTURA"}, {name: "PIZZERIA"}, {name: "PLOMERIA"}, {name: "PODOLOGIA"}, {name: "POLLERIA"}, {name: "PRODUCCION DE MIEL"}, {name: "PRODUCTOS DE LIMPIEZA"}, {name: "PROFESIONALES INDEPENDIENTES"}, {name: "RADIO"}, {name: "REFRIGERACION"}, {name: "REGALERIA"}, {name: "REMISES Y TAXIS"}, {name: "REPOSTERIA"}, {name: "RESTAURANTE"}, {name: "ROPA INFANTIL"}, {name: "ROTISERIA"}, {name: "SERIGRAFIA"}, {name: "SERVICIO TECNICO INFORMATICO"}, {name: "SERVICIO TECNICO PARA EL HOGAR"}, {name: "SODERIA"}, {name: "SONIDO E ILUMINACION"}, {name: "TABAQUERIA"}, {name: "TALLER DE ARTE Y PINTURA"}, {name: "TALLER DE BICIBLETAS"}, {name: "TALLER DE CHAPA Y PINTURA"}, {name: "TALLER MECANICO"}, {name: "TALLER TECNICO PARA EL TRANSPORTE"}, {name: "TALLER TEXTIL"}, {name: "TAMBO"}, {name: "TORNERIA"}, {name: "TRANSPORTE DE PASAJEROS"}, {name: "VENTA AMBULANTE"}, {name: "VENTA DE ACCESORIOS"}, {name: "VENTA DE MOTOS"}, {name: "VENTA DE ROPA"}, {name: "VENTA DE ZAPATOS"}, {name: "VETERINARIA"}, {name: "VIVERO"}, {name: "ZINGUERIA"}, {name: "CUCHILLERIA"}, {name: "DISEÑO GRAFICO"}, {name: "CONSTRUCCION DE OBRA"}, {name: "FRUTOS SECOS"}, {name: "YOGA"}, {name: "PORCINOS"}, {name: "AVICOLA"}, {name: "ILUMINACION"}, {name: "FOTOGRAFIA"}, {name: "AUDIO Y VIDEO"}, {name: "TRANSPORTE DE CARGA"}, {name: "FABRICA DE PISOS Y BALDOSAS"}, {name: "BLANQUERIA"}, {name: "ODONTOLOGIA"}, {name: "PAÑALERA"}, {name: "CRIA DE OVEJAS"}]; 

		$scope.department = [{name: "CONCORDIA"}, {name: "COLON"}, {name: "FEDERAL"}, {name: "VILLAGUAY"}, {name: "SAN SALVADOR"}, {name: "FEDERACION"}, {name: "CONCEPCION DEL URUGUAY"}, {name: "FELICIANO"}];

		$scope.locality = [{name: "BENITO LEGEREN"}, {name: "CALABACILLA"}, {name: "CASEROS"}, {name: "CHAJARÍ"}, {name: "COLONIA ALEMANA"}, {name: "COLONIA ENSANCHE SAUCE"}, {name: "COLONIA HUGUES"}, {name: "COLONIA LA ARGENTINA"}, {name: "COLONIA PEÑA"}, {name: "COLONIA SANTA MARÍA"}, {name: "CONCEPCIÓN DEL URUGUAY"}, {name: "CONCORDIA"}, {name: "CONSCRIPTO BERNARDI"}, {name: "EL CIMARRÓN"}, {name: "EL COLORADO"}, {name: "EL REDOMON"}, {name: "ESTACIÓN RAÍCES"}, {name: "ESTACION YERUA"}, {name: "FEDERACIÓN"}, {name: "FEDERAL"}, {name: "GENERAL CAMPOS"}, {name: "HOCKER"}, {name: "INGENIERO MIGUEL SAJAROFF"}, {name: "JUBILEO"}, {name: "LA CLARITA"}, {name: "LA CRIOLLA"}, {name: "LAS TEJAS"}, {name: "MOJONES NORTE"}, {name: "NUEVA ESCOCIA"}, {name: "NUEVA VIZCAYA"}, {name: "OSVALDO MAGNASCO"}, {name: "PASO DE LA LAGUNA"}, {name: "PEDERNAL"}, {name: "PRONUNCIAMIENTO"}, {name: "PUEBLO CAZES"}, {name: "PUEBLO LIEBIG'S"}, {name: "PUERTO YERUA"}, {name: "SAN JOSÉ"}, {name: "SAN PEDRO"}, {name: "SAN SALVADOR"}, {name: "SANTA ANITA"}, {name: "SAUCE DE LUNA"}, {name: "UBAJAY"}, {name: "VILLA CLARA"}, {name: "VILLA DEL ROSARIO"}, {name: "VILLA DOMINGUEZ"}, {name: "VILLA ELISA"}, {name: "VILLA MANTERO"}, {name: "VILLA SAN JUSTO"}, {name: "VILLA ZORRAQUIN"}, {name: "SAN JOSE DE FELICIANO"}, {name: "CASEROS"}, {name: "VILLAGUAY"}];
		
		$scope.selectServicer = function(servicerName) {
			$scope.project.servicers = servicerName;
		};
		
		$scope.selectServiceEvaluator = function(serviceEvaluator) {
			$scope.fakeProject.serviceEvaluatorName = serviceEvaluator.name;
		};
		
		$scope.selectAdviserEvaluator = function(adviserEvaluator) {
			$scope.fakeProject.adviserEvaluatorName = adviserEvaluator.name;
		};
		
		$scope.buttonName = ($scope.step == 1 && !$scope.projectId) ? 'Cargar proyecto' : 'Editar proyecto';
		
		$scope.changeStep = function(step) {
			$scope.step = step;
		};
	
		$scope.nextSetp = function() {
//			if(!$scope.institutionalForm.$valid) {
//				return;
//			}
			if($scope.step == 1 && !$scope.projectId) {
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
			$http.post(getCompletePath("projects"), JSON.stringify($scope.project))
			.success(function (project) {
				$scope.projectId = project.id;
				//$scope.step++;
				alert("El proyecto se ha creado con exito");
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		self.editProject = function(){
			$http.put(getCompletePath("projects/" + $scope.projectId), JSON.stringify($scope.project))
			.success(function () {
				//$scope.step++;
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
			        }
			    }
			});
		};
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
		function ($scope, $modalInstance, $http, projectId) {
			$scope.goToForm = function(formName) {
				redirect('forms/' + formName + "/" + projectId);
			};
	
			$scope.cancel = function () {
				$modalInstance.dismiss('cancel');
			};
		});
