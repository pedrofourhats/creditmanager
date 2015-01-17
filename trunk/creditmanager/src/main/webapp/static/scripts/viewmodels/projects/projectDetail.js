projectControllers.controller('ProjectDetailCtrl', ['$scope','$http', '$routeParams', '$modal',
	function($scope, $http, $routeParams, $modal){
		var self = this;
		$scope.projectId = $routeParams.id;
		$scope.step = 1;
		$scope.title = 'MODIFICAR PROYECTO';
		$scope.project = { };
		$scope.project.holders = [];
		$scope.project.guarantors = [];
		$scope.buttonName = 'Editar proyecto';
		
		$scope.servicers = [{name: "INTI"}, {name: "INTA"}];
		
		$scope.states = [{name: "EVALUACION INTI"}, {name: "EVALUACION INTA"}, {name: "INFORMACION CAFESG"}, {name: "RECHAZADO / DESISTIDO"}, {name: "SUJETO A REVISION"}, {name: "COMITE DE CREDITO"}, {name: "APROBADO"}, {name: "CREDITO OTORGADO"}, {name: "CREDITO VIGENTE"}, {name: "CREDITO EN MORA"}, {name: "CREDITO CANCELADO"}];
		
		$scope.evaluators = [{name: "ELIZABETH A."}, {name: "ADRIANA V."}, {name: "ROMINA M."}, {name: "WALTER H."}, {name: "MELINA SCH."}, {name: "MARTIN S."}, {name: "ELINA B."}, {name: "INTA"}];
		
		$scope.accesors = [{name: "NOELIA A."}, {name: "JAVIER B."}, {name: "EMANUEL R."}, {name: "ROSA F."}, {name: "ROSANA G."}, {name: "NOELIA D."}, {name: "DIEGO"}, {name: "CECILIA B."}, {name: "MARTIN L."}];

		$scope.types = [{name: "NUEVO"}, {name: "EN MARCHA"}];

		$scope.economicSectors = [{name: "INDUSTRIA"}, {name: "AGROPECUARIO"}, {name: "SERVICIOS INDUSTRIALES"}, {name: "SERVICIOS NO INDUSTRIALES"}, {name: "OTROS"}];
		
		$scope.economicActivities = [{name: "AERONAUTICA Y ESPACIAL"}, {name: "A CLASIFICAR"}, {name: "AGRICOLA"}, {name: "ALIMENTOS Y BIENES DE CONSUMO"}, {name: "ALIMENTOS Y PRODUCTOS PESQUEROS"}, {name: "AMBIENTE"}, {name: "ARTE"}, {name: "BEBIDAS"}, {name: "BIODIGESTION"}, {name: "BIOTECNOLOGIA INDUSTRIAL"}, {name: "CALIDAD INDUSTRIAL"}, {name: "CARNES"}, {name: "CAUCHO"}, {name: "CELULOSA Y PAPEL"}, {name: "CEREALES Y OLEAGINOSAS"}, {name: "CONSTRUCCIONES"}, {name: "CONTAMINANTES ORGANICOS"}, {name: "CUEROS"}, {name: "DISEÑO INDUSTRIAL"}, {name: "ELECTRONICA E INFORMATICA"}, {name: "ENERGIA"}, {name: "ENERGIAS RENOVABLES"}, {name: "ENVASES Y EMBALAJES"}, {name: "EXTENSION Y DESARROLLO"}, {name: "FISICA Y METROLOGIA"}, {name: "FRUTAS Y HORTALIZAS"}, {name: "GANADERA"}, {name: "LACTEOS"}, {name: "MADERA Y MUEBLES"}, {name: "MECANICA"}, {name: "METALMECANICA"}, {name: "OLIVICOLA Y ACEITERAS"}, {name: "OTRAS ESPECIALIDADES"}, {name: "PETROLEO"}, {name: "PLASTICOS"}, {name: "PROCESOS SUPERFICIALES"}, {name: "QUIMICA"}, {name: "SEGURIDAD E HIGIENE"}, {name: "TECNOLOGIAS PARA LA SALUD Y DISCAPACIDAD"}, {name: "TEXTILES"}, {name: "TURISMO"}, {name: "VITIVINICOLA"}, {name: "PISCICULTURA"}, {name: "COMUNICACIONES"}];

		$scope.categories = [{name: "ABERTURAS"}, {name: "A CLASIFICAR"}, {name: "ACADEMIA DE DANZA"}, {name: "ALBAÑILERIA"}, {name: "ALIMENTOS BALANCEADOS"}, {name: "ALMACEN"}, {name: "ALQUILER DE ESPACIOS"}, {name: "ALQUILER DE VAJILLAS Y MANTELES"}, {name: "APICULTURA"}, {name: "ARTE Y DISEÑO"}, {name: "ARTESANIAS"}, {name: "ASERRADERO"}, {name: "CALL CENTER"}, {name: "CARNICERIA"}, {name: "CARPINTERIA"}, {name: "CARPINTERIA EN ALUMINIO"}, {name: "CASA DE EMPANADAS"}, {name: "CENTRO DE PILATES"}, {name: "CENTROS DE LAVADO DE AUTOS"}, {name: "CENTROS DE LAVADO DE ROPA"}, {name: "CHACINADOS"}, {name: "CONSULTORIA"}, {name: "CORRALONES"}, {name: "CRIA DE CERDOS"}, {name: "CRIA DE PECES"}, {name: "CRIA DE POLLOS"}, {name: "CRIA DE TERNEROS"}, {name: "CYBER"}, {name: "DESPENSA"}, {name: "DISTRIBUIDORA"}, {name: "DOCENCIA"}, {name: "DRUGSTORE"}, {name: "ELECTRICIDAD"}, {name: "ENFERMERIA"}, {name: "EQUIPOS DE COMPUTO"}, {name: "ESTETICA DE PIES Y MANOS"}, {name: "EVENTOS"}, {name: "FABRICA DE CERVEZAS Y MALTAS"}, {name: "FABRICA DE MILANESAS"}, {name: "FABRICA DE PASTAS"}, {name: "FABRICA DE TABIQUES"}, {name: "FARMACIA"}, {name: "FERIAS ARTESANALES"}, {name: "FERRETERIA"}, {name: "FORRAJERIA"}, {name: "FRIGORIFICO"}, {name: "GASISTA"}, {name: "GERIATRICO"}, {name: "GESTORIA DEL AUTOMOTOR"}, {name: "GOMERIA"}, {name: "GRANJA"}, {name: "GUARDERIA"}, {name: "GYMNASIO"}, {name: "HERRERIA"}, {name: "HIDROPONIA"}, {name: "HORTICULTURA"}, {name: "HOSPEDAJE"}, {name: "IMPRENTA GRAFICA"}, {name: "INVERNADERO"}, {name: "JARDIN DE NIÑOS"}, {name: "JARDINERIA"}, {name: "JUGUETERIA"}, {name: "KINESIOLOGO"}, {name: "KIOSCO"}, {name: "LAVADERO DE AUTOS"}, {name: "LAVADERO DE ROPA"}, {name: "LIBRERIA"}, {name: "LIBROS"}, {name: "LICORES"}, {name: "LOCUTORIO"}, {name: "MARROQUINERIA"}, {name: "MUEBLES"}, {name: "MULTIRUBRO"}, {name: "MUSICA"}, {name: "NATACION"}, {name: "ORTOPEDIA"}, {name: "OVINA"}, {name: "PANADERIA"}, {name: "PARRILLA"}, {name: "PASEOS EN LANCHA"}, {name: "PASEOS TURISTICOS"}, {name: "PASTELERIA"}, {name: "PELOTERO"}, {name: "PELUQUERIA"}, {name: "PIEDRAS PRECIOSAS"}, {name: "PINTURA"}, {name: "PIZZERIA"}, {name: "PLOMERIA"}, {name: "PODOLOGIA"}, {name: "POLLERIA"}, {name: "PRODUCCION DE MIEL"}, {name: "PRODUCTOS DE LIMPIEZA"}, {name: "PROFESIONALES INDEPENDIENTES"}, {name: "RADIO"}, {name: "REFRIGERACION"}, {name: "REGALERIA"}, {name: "REMISES Y TAXIS"}, {name: "REPOSTERIA"}, {name: "RESTAURANTE"}, {name: "ROPA INFANTIL"}, {name: "ROTISERIA"}, {name: "SERIGRAFIA"}, {name: "SERVICIO TECNICO INFORMATICO"}, {name: "SERVICIO TECNICO PARA EL HOGAR"}, {name: "SODERIA"}, {name: "SONIDO E ILUMINACION"}, {name: "TABAQUERIA"}, {name: "TALLER DE ARTE Y PINTURA"}, {name: "TALLER DE BICIBLETAS"}, {name: "TALLER DE CHAPA Y PINTURA"}, {name: "TALLER MECANICO"}, {name: "TALLER TECNICO PARA EL TRANSPORTE"}, {name: "TALLER TEXTIL"}, {name: "TAMBO"}, {name: "TORNERIA"}, {name: "TRANSPORTE DE PASAJEROS"}, {name: "VENTA AMBULANTE"}, {name: "VENTA DE ACCESORIOS"}, {name: "VENTA DE MOTOS"}, {name: "VENTA DE ROPA"}, {name: "VENTA DE ZAPATOS"}, {name: "VETERINARIA"}, {name: "VIVERO"}, {name: "ZINGUERIA"}, {name: "CUCHILLERIA"}, {name: "DISEÑO GRAFICO"}, {name: "CONSTRUCCION DE OBRA"}, {name: "FRUTOS SECOS"}, {name: "YOGA"}, {name: "PORCINOS"}, {name: "AVICOLA"}, {name: "ILUMINACION"}, {name: "FOTOGRAFIA"}, {name: "AUDIO Y VIDEO"}, {name: "TRANSPORTE DE CARGA"}, {name: "FABRICA DE PISOS Y BALDOSAS"}, {name: "BLANQUERIA"}, {name: "ODONTOLOGIA"}, {name: "PAÑALERA"}, {name: "CRIA DE OVEJAS"}]; 

		$scope.department = [{name: "CONCORDIA"}, {name: "COLON"}, {name: "FEDERAL"}, {name: "VILLAGUAY"}, {name: "SAN SALVADOR"}, {name: "FEDERACION"}, {name: "CONCEPCION DEL URUGUAY"}, {name: "FELICIANO"}];

		$scope.locality = [{name: "BENITO LEGEREN"}, {name: "CALABACILLA"}, {name: "CASEROS"}, {name: "CHAJARI"}, {name: "COLONIA ALEMANA"}, {name: "COLONIA ENSANCHE SAUCE"}, {name: "COLONIA HUGUES"}, {name: "COLONIA LA ARGENTINA"}, {name: "COLONIA PEÑA"}, {name: "COLONIA SANTA MARIA"}, {name: "CONCEPCION DEL URUGUAY"}, {name: "CONCORDIA"}, {name: "CONSCRIPTO BERNARDI"}, {name: "EL CIMARRON"}, {name: "EL COLORADO"}, {name: "EL REDOMON"}, {name: "ESTACION RAICES"}, {name: "ESTACION YERUA"}, {name: "FEDERACION"}, {name: "FEDERAL"}, {name: "GENERAL CAMPOS"}, {name: "HOCKER"}, {name: "INGENIERO MIGUEL SAJAROFF"}, {name: "JUBILEO"}, {name: "LA CLARITA"}, {name: "LA CRIOLLA"}, {name: "LAS TEJAS"}, {name: "MOJONES NORTE"}, {name: "NUEVA ESCOCIA"}, {name: "NUEVA VIZCAYA"}, {name: "OSVALDO MAGNASCO"}, {name: "PASO DE LA LAGUNA"}, {name: "PEDERNAL"}, {name: "PRONUNCIAMIENTO"}, {name: "PUEBLO CAZES"}, {name: "PUEBLO LIEBIG'S"}, {name: "PUERTO YERUA"}, {name: "SAN JOSE"}, {name: "SAN PEDRO"}, {name: "SAN SALVADOR"}, {name: "SANTA ANITA"}, {name: "SAUCE DE LUNA"}, {name: "UBAJAY"}, {name: "VILLA CLARA"}, {name: "VILLA DEL ROSARIO"}, {name: "VILLA DOMINGUEZ"}, {name: "VILLA ELISA"}, {name: "VILLA MANTERO"}, {name: "VILLA SAN JUSTO"}, {name: "VILLA ZORRAQUIN"}, {name: "SAN JOSE DE FELICIANO"}, {name: "CASEROS"}, {name: "VILLAGUAY"}];
		
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
		$scope.changeStep = function(step){
			$scope.step = step;
		};
	
		$scope.nextSetp = function(){
//			if(!$scope.institutionalForm.$valid) {
//				return;
//			}
			self.editProject();
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
		
		self.editProject = function(){
			var projectToEdit = $scope.project;
			projectToEdit.guarantors = $.map(projectToEdit.guarantors, function(value){ delete value.formattedBirthDate; return value; });
			projectToEdit.holders = $.map(projectToEdit.holders, function(value){ delete value.formattedBirthDate; return value; });
			$http.put(getCompletePath("projects/" + $scope.projectId), JSON.stringify(projectToEdit))
			.success(function () {
				alert("El proyecto se ha actualizado con exito");
				//$scope.step++;
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		$http.get(getCompletePath("projects/findById/" + $scope.projectId), {})
		.success(function(project){
			project.dateOfEntry = new Date(project.dateOfEntry);
			$scope.project = project;
		}).error(function(err){
			alert("Ha ocurrido un problema. Por favor intente nuevamente");
		});
		
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