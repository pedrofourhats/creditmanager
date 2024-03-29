projectControllers.controller('ProjectCreationCtrl', ['$scope','$http', '$modal', "$location", '$rootScope',
	function($scope, $http, $modal, $location, $rootScope) {
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
		
		self.isValid = function(){
			if($scope.institutionalForm.$invalid){
				$scope.institutionalForm.$submitted = true;
				self.submit();
				return false;
			}
			
			if($scope.project.holders.length == 0 || $scope.project.guarantors.length == 0){
				alert('Debe ingresar al menos un titular y un codeudor.');
				return false;
			}
			
			
			if(!$scope.project.servicers){
				alert('Debe completar el campo servicers.');
				return false;
			}
			
			if(!$scope.project.situationState){
				alert('Debe completar el campo estado de situacion.');
				return false;
			}
			
			if(!$scope.project.evaluator || !$scope.project.accesor){
				alert('Debe completar los campos de evaluador y asesor');
				return false;
			}
			
			if(!$scope.project.type){
				alert('Debe elegir un tipo');
				return false;
			}
			
			if(!$scope.project.economicArea){
				alert('Debe elegir un sector economico');
				return false;
			}
			
			if(!$scope.project.economicActivity){
				alert('Debe elegir una actividad económica');
				return false;
			}
			
			if(!$scope.project.category){
				alert('Debe elegir un rubro.');
				return false;
			}
			

			
//			if($scope.step == 2){
				if($scope.aspectsForm.$invalid){
					$scope.aspectsForm.$submitted = true;
					self.submit();
					return false;
				}
				
				if($scope.project.situationState == 'APROBADO' && 
						(!$scope.project.givenAmount || !$scope.project.givenGracePeriod || !$scope.project.givenDeadline)){
					alert('Debe completar los campos Importe otorgado, \nPeriodo de gracia otorgado y Plazo otorgado.');
					return false;
				}
//			}
			
			return true;
		};
		
		self.submit = function(){
		};
		
		self.createProject = function(){
			if($scope.evaluators.length == 0 || $scope.accesors.length == 0){
				alert('No existen evaluadores y/o asesores en el sistema. \nAsegurese de cargarlos previamente.');
				return;
			}
			
			if($scope.project.dateOfEntry == undefined) {
				alert("Debe ingresar una fecha correcta");
				return; 
			}
			
			if(!self.isValid()){
				return;
			}
			

			
			if($scope.project.numberId != undefined){
				$scope.project.number = $scope.project.numberId + '/' + $scope.project.numberYear;
			}
			
			if(($scope.project.dateOfEntry.getFullYear() != new Date().getFullYear()) || ($scope.project.dateOfEntry.getDay() != new Date().getDay()) || ($scope.project.dateOfEntry.getMonth() != new Date().getMonth())) {
				if($scope.project.dateOfEntry > new Date()) {
					alert("La fecha de ingreso debe ser igual o inferior a la fecha de hoy");
					return; 
				}
			}
			
			
			if($scope.project.deliveryDate) {
				if($scope.project.deliveryDate > new Date()) {
					alert("La fecha de otorgamiento del cr\u00e9dito debe ser menor que la fecha actual");
					return;
				} 
				else if(!$scope.project.dateOfEntry) {
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
				$rootScope.allowNavigation();
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
		
		$scope.$watch('projectForm.$dirty', function (dirty) {
			$rootScope.preventNavigation();
		});
}]);