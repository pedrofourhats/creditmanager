projectControllers.controller('ProjectDetailCtrl', ['$scope','$http', '$routeParams', '$modal',
	function($scope, $http, $routeParams, $modal){
		var self = this;
		$scope.projectId = $routeParams.id;
		$scope.step = 1;
		$scope.title = 'MODIFICAR PROYECTO';
		$scope.project = { };
		$scope.project.holders = [];
		$scope.project.guarantors = [];
		$scope.loadProjectButtonName = 'Guardar proyecto';
		$scope.loadProjectButtonEnable = true;

		
		$scope.servicers = [{name: "INTI"}, {name: "INTA"}];
		
		$scope.states = [{name: "EVALUACION INTI"}, {name: "EVALUACION INTA"}, {name: "INFORMACION CAFESG"}, {name: "RECHAZADO"}, {name: "DESISTIDO"}, {name: "SUJETO A REVISION"}, {name: "COMITE DE CREDITO"}, {name: "APROBADO"}, {name: "CREDITO OTORGADO"}, {name: "CREDITO VIGENTE"}, {name: "CREDITO EN MORA"}, {name: "CREDITO CANCELADO"}];
		
		$scope.evaluators = [{name: "ELIZABETH A."}, {name: "ADRIANA V."}, {name: "ROMINA M."}, {name: "WALTER H."}, {name: "MELINA SCH."}, {name: "MARTIN S."}, {name: "ELINA B."}, {name: "INTA"}];
		
		$scope.accesors = [{name: "NOELIA A."}, {name: "JAVIER B."}, {name: "EMANUEL R."}, {name: "ROSA F."}, {name: "ROSANA G."}, {name: "NOELIA D."}, {name: "DIEGO"}, {name: "CECILIA B."}, {name: "MARTIN L."}];

		$scope.types = [{name: "NUEVO"}, {name: "EN MARCHA"}];

		$scope.economicSectors = [{name: "INDUSTRIA"}, {name: "AGROPECUARIO"}, {name: "SERVICIOS INDUSTRIALES"}, {name: "SERVICIOS NO INDUSTRIALES"}, {name: "OTROS"}];
		
		$scope.economicActivities = [{name: "AERONAUTICA Y ESPACIAL"}, {name: "A CLASIFICAR"}, {name: "AGRICOLA"}, {name: "ALIMENTOS Y BIENES DE CONSUMO"}, {name: "ALIMENTOS Y PRODUCTOS PESQUEROS"}, {name: "AMBIENTE"}, {name: "ARTE"}, {name: "BEBIDAS"}, {name: "BIODIGESTION"}, {name: "BIOTECNOLOGIA INDUSTRIAL"}, {name: "CALIDAD INDUSTRIAL"}, {name: "CARNES"}, {name: "CAUCHO"}, {name: "CELULOSA Y PAPEL"}, {name: "CEREALES Y OLEAGINOSAS"}, {name: "CONSTRUCCIONES"}, {name: "CONTAMINANTES ORGANICOS"}, {name: "CUEROS"}, {name: "DISEï¿½O INDUSTRIAL"}, {name: "ELECTRONICA E INFORMATICA"}, {name: "ENERGIA"}, {name: "ENERGIAS RENOVABLES"}, {name: "ENVASES Y EMBALAJES"}, {name: "EXTENSION Y DESARROLLO"}, {name: "FISICA Y METROLOGIA"}, {name: "FRUTAS Y HORTALIZAS"}, {name: "GANADERA"}, {name: "LACTEOS"}, {name: "MADERA Y MUEBLES"}, {name: "MECANICA"}, {name: "METALMECANICA"}, {name: "OLIVICOLA Y ACEITERAS"}, {name: "OTRAS ESPECIALIDADES"}, {name: "PETROLEO"}, {name: "PLASTICOS"}, {name: "PROCESOS SUPERFICIALES"}, {name: "QUIMICA"}, {name: "SEGURIDAD E HIGIENE"}, {name: "TECNOLOGIAS PARA LA SALUD Y DISCAPACIDAD"}, {name: "TEXTILES"}, {name: "TURISMO"}, {name: "VITIVINICOLA"}, {name: "PISCICULTURA"}, {name: "COMUNICACIONES"}];

		$scope.categories = [{name: "ABERTURAS"}, {name: "A CLASIFICAR"}, {name: "ACADEMIA DE DANZA"}, {name: "ALBAï¿½ILERIA"}, {name: "ALIMENTOS BALANCEADOS"}, {name: "ALMACEN"}, {name: "ALQUILER DE ESPACIOS"}, {name: "ALQUILER DE VAJILLAS Y MANTELES"}, {name: "APICULTURA"}, {name: "ARTE Y DISEï¿½O"}, {name: "ARTESANIAS"}, {name: "ASERRADERO"}, {name: "CALL CENTER"}, {name: "CARNICERIA"}, {name: "CARPINTERIA"}, {name: "CARPINTERIA EN ALUMINIO"}, {name: "CASA DE EMPANADAS"}, {name: "CENTRO DE PILATES"}, {name: "CENTROS DE LAVADO DE AUTOS"}, {name: "CENTROS DE LAVADO DE ROPA"}, {name: "CHACINADOS"}, {name: "CONSULTORIA"}, {name: "CORRALONES"}, {name: "CRIA DE CERDOS"}, {name: "CRIA DE PECES"}, {name: "CRIA DE POLLOS"}, {name: "CRIA DE TERNEROS"}, {name: "CYBER"}, {name: "DESPENSA"}, {name: "DISTRIBUIDORA"}, {name: "DOCENCIA"}, {name: "DRUGSTORE"}, {name: "ELECTRICIDAD"}, {name: "ENFERMERIA"}, {name: "EQUIPOS DE COMPUTO"}, {name: "ESTETICA DE PIES Y MANOS"}, {name: "EVENTOS"}, {name: "FABRICA DE CERVEZAS Y MALTAS"}, {name: "FABRICA DE MILANESAS"}, {name: "FABRICA DE PASTAS"}, {name: "FABRICA DE TABIQUES"}, {name: "FARMACIA"}, {name: "FERIAS ARTESANALES"}, {name: "FERRETERIA"}, {name: "FORRAJERIA"}, {name: "FRIGORIFICO"}, {name: "GASISTA"}, {name: "GERIATRICO"}, {name: "GESTORIA DEL AUTOMOTOR"}, {name: "GOMERIA"}, {name: "GRANJA"}, {name: "GUARDERIA"}, {name: "GYMNASIO"}, {name: "HERRERIA"}, {name: "HIDROPONIA"}, {name: "HORTICULTURA"}, {name: "HOSPEDAJE"}, {name: "IMPRENTA GRAFICA"}, {name: "INVERNADERO"}, {name: "JARDIN DE NIï¿½OS"}, {name: "JARDINERIA"}, {name: "JUGUETERIA"}, {name: "KINESIOLOGO"}, {name: "KIOSCO"}, {name: "LAVADERO DE AUTOS"}, {name: "LAVADERO DE ROPA"}, {name: "LIBRERIA"}, {name: "LIBROS"}, {name: "LICORES"}, {name: "LOCUTORIO"}, {name: "MARROQUINERIA"}, {name: "MUEBLES"}, {name: "MULTIRUBRO"}, {name: "MUSICA"}, {name: "NATACION"}, {name: "ORTOPEDIA"}, {name: "OVINA"}, {name: "PANADERIA"}, {name: "PARRILLA"}, {name: "PASEOS EN LANCHA"}, {name: "PASEOS TURISTICOS"}, {name: "PASTELERIA"}, {name: "PELOTERO"}, {name: "PELUQUERIA"}, {name: "PIEDRAS PRECIOSAS"}, {name: "PINTURA"}, {name: "PIZZERIA"}, {name: "PLOMERIA"}, {name: "PODOLOGIA"}, {name: "POLLERIA"}, {name: "PRODUCCION DE MIEL"}, {name: "PRODUCTOS DE LIMPIEZA"}, {name: "PROFESIONALES INDEPENDIENTES"}, {name: "RADIO"}, {name: "REFRIGERACION"}, {name: "REGALERIA"}, {name: "REMISES Y TAXIS"}, {name: "REPOSTERIA"}, {name: "RESTAURANTE"}, {name: "ROPA INFANTIL"}, {name: "ROTISERIA"}, {name: "SERIGRAFIA"}, {name: "SERVICIO TECNICO INFORMATICO"}, {name: "SERVICIO TECNICO PARA EL HOGAR"}, {name: "SODERIA"}, {name: "SONIDO E ILUMINACION"}, {name: "TABAQUERIA"}, {name: "TALLER DE ARTE Y PINTURA"}, {name: "TALLER DE BICIBLETAS"}, {name: "TALLER DE CHAPA Y PINTURA"}, {name: "TALLER MECANICO"}, {name: "TALLER TECNICO PARA EL TRANSPORTE"}, {name: "TALLER TEXTIL"}, {name: "TAMBO"}, {name: "TORNERIA"}, {name: "TRANSPORTE DE PASAJEROS"}, {name: "VENTA AMBULANTE"}, {name: "VENTA DE ACCESORIOS"}, {name: "VENTA DE MOTOS"}, {name: "VENTA DE ROPA"}, {name: "VENTA DE ZAPATOS"}, {name: "VETERINARIA"}, {name: "VIVERO"}, {name: "ZINGUERIA"}, {name: "CUCHILLERIA"}, {name: "DISEï¿½O GRAFICO"}, {name: "CONSTRUCCION DE OBRA"}, {name: "FRUTOS SECOS"}, {name: "YOGA"}, {name: "PORCINOS"}, {name: "AVICOLA"}, {name: "ILUMINACION"}, {name: "FOTOGRAFIA"}, {name: "AUDIO Y VIDEO"}, {name: "TRANSPORTE DE CARGA"}, {name: "FABRICA DE PISOS Y BALDOSAS"}, {name: "BLANQUERIA"}, {name: "ODONTOLOGIA"}, {name: "PAï¿½ALERA"}, {name: "CRIA DE OVEJAS"}]; 

		$scope.department = [{name: "CONCORDIA"}, {name: "COLON"}, {name: "FEDERAL"}, {name: "VILLAGUAY"}, {name: "SAN SALVADOR"}, {name: "FEDERACION"}, {name: "CONCEPCION DEL URUGUAY"}, {name: "FELICIANO"}];

		$scope.locality = [{name: "BENITO LEGEREN"}, {name: "CALABACILLA"}, {name: "CASEROS"}, {name: "CHAJARI"}, {name: "COLONIA ALEMANA"}, {name: "COLONIA ENSANCHE SAUCE"}, {name: "COLONIA HUGUES"}, {name: "COLONIA LA ARGENTINA"}, {name: "COLONIA PEï¿½A"}, {name: "COLONIA SANTA MARIA"}, {name: "CONCEPCION DEL URUGUAY"}, {name: "CONCORDIA"}, {name: "CONSCRIPTO BERNARDI"}, {name: "EL CIMARRON"}, {name: "EL COLORADO"}, {name: "EL REDOMON"}, {name: "ESTACION RAICES"}, {name: "ESTACION YERUA"}, {name: "FEDERACION"}, {name: "FEDERAL"}, {name: "GENERAL CAMPOS"}, {name: "HOCKER"}, {name: "INGENIERO MIGUEL SAJAROFF"}, {name: "JUBILEO"}, {name: "LA CLARITA"}, {name: "LA CRIOLLA"}, {name: "LAS TEJAS"}, {name: "MOJONES NORTE"}, {name: "NUEVA ESCOCIA"}, {name: "NUEVA VIZCAYA"}, {name: "OSVALDO MAGNASCO"}, {name: "PASO DE LA LAGUNA"}, {name: "PEDERNAL"}, {name: "PRONUNCIAMIENTO"}, {name: "PUEBLO CAZES"}, {name: "PUEBLO LIEBIG'S"}, {name: "PUERTO YERUA"}, {name: "SAN JOSE"}, {name: "SAN PEDRO"}, {name: "SAN SALVADOR"}, {name: "SANTA ANITA"}, {name: "SAUCE DE LUNA"}, {name: "UBAJAY"}, {name: "VILLA CLARA"}, {name: "VILLA DEL ROSARIO"}, {name: "VILLA DOMINGUEZ"}, {name: "VILLA ELISA"}, {name: "VILLA MANTERO"}, {name: "VILLA SAN JUSTO"}, {name: "VILLA ZORRAQUIN"}, {name: "SAN JOSE DE FELICIANO"}, {name: "CASEROS"}, {name: "VILLAGUAY"}];
		
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
		
		$scope.cancelEdit = function() {
			if (confirm("¿Esta seguro que desea salir sin guardar los cambios?")) {
				history.go(-1);
			}
		};
		
		
		
		$scope.deleteHolder = function(index){
			$scope.project.holders.splice(index, 1);
		};
		
		$scope.deleteGuarantor = function(index){
			$scope.project.guarantors.splice(index, 1);
		};
		
		self.editProject = function() {
			$scope.project.number = $scope.project.numberId + '/' + $scope.project.numberYear;
			if($scope.project.deliveryDate) {
				if($scope.project.deliveryDate > new Date()) {
					alert("La fecha de otorgamiento del cr\u00e9dito debe ser menor que la fecha actual");
					return;
				} else if(!$scope.project.dateOfEntry) {
					alert("Para ingresar la fecha de otorgamiento del cr\u00e9dito debe primero ingresar la fecha de ingreso al INTI");
					return;
				} else if($scope.project.deliveryDate < $scope.project.dateOfEntry) {
					alert("La fecha de otorgamiento del cr\u00e9dito debe ser mayor que la de ingreso al INTI");
					return;
				}
			}
			
			var projectToEdit = $scope.project;
			delete projectToEdit.formattedDeliveryDate;
			projectToEdit.guarantors = 
				$.map(projectToEdit.guarantors, 
					function(value) { 
						delete value.formattedBirthDate;
						if(!value.gender) delete value.gender;
						if(!value.identityType) delete value.identityType;
						
						return value;
					}
				);
			projectToEdit.holders = 
				$.map(projectToEdit.holders, 
					function(value) { 
						delete value.formattedBirthDate;
						if(!value.gender) delete value.gender;
						if(!value.identityType) delete value.identityType;
							
						return value; 
					}
				);
			projectToEdit.defaultForms = self.getDefaultForms().toString();
			$http.put(getCompletePath("projects/" + $scope.projectId), JSON.stringify(projectToEdit))
			.success(function () {
				alert("El proyecto se ha actualizado con exito");
				//$scope.step++;
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		self.getDefaultForms = function() {
			var defaultForms = [];
			var index = -1;
			if($scope.defaultForm1) defaultForms[++index] = "1";
			if($scope.defaultForm2) defaultForms[++index] = "2";
			if($scope.defaultForm3) defaultForms[++index] = "3";
			if($scope.defaultForm4) defaultForms[++index] = "4";
			if($scope.defaultForm5) defaultForms[++index] = "5";
			if($scope.defaultForm6) defaultForms[++index] = "6";
			if($scope.defaultForm7) defaultForms[++index] = "7";
			if($scope.defaultForm8) defaultForms[++index] = "8";
			if($scope.defaultForm9) defaultForms[++index] = "9";
			if($scope.defaultForm10) defaultForms[++index] = "10";
			if($scope.defaultForm11) defaultForms[++index] = "11";
			if($scope.defaultForm12) defaultForms[++index] = "12";
			if($scope.defaultForm13) defaultForms[++index] = "13";
			if($scope.defaultForm14) defaultForms[++index] = "14";
			if($scope.defaultForm15) defaultForms[++index] = "15";
			if($scope.defaultForm16) defaultForms[++index] = "16";
			if($scope.defaultForm17) defaultForms[++index] = "17";
			if($scope.defaultForm18) defaultForms[++index] = "18";
			
			return defaultForms;
		};
		
		$http.get(getCompletePath("projects/findById/" + $scope.projectId), {})
		
		.success(function(project){
			if(project && project.number){
				var res = project.number.split('/');
				project.numberId = res[0];
				project.numberYear = res[1];
			}
			project.dateOfEntry = new Date(project.dateOfEntry);
			project.deliveryDate = new Date(project.deliveryDate);
			$scope.project = project;
			var defaultForms = [];
			if(project.defaultForms) {
				defaultForms = project.defaultForms.split(",");
			}
			
			$scope.defaultForm1 = defaultForms.indexOf("1") > -1;
			$scope.defaultForm2 = defaultForms.indexOf("2") > -1;
			$scope.defaultForm3 = defaultForms.indexOf("3") > -1;
			$scope.defaultForm4 = defaultForms.indexOf("4") > -1;
			$scope.defaultForm5 = defaultForms.indexOf("5") > -1;
			$scope.defaultForm6 = defaultForms.indexOf("6") > -1;
			$scope.defaultForm7 = defaultForms.indexOf("7") > -1;
			$scope.defaultForm8 = defaultForms.indexOf("8") > -1;
			$scope.defaultForm9 = defaultForms.indexOf("9") > -1;
			$scope.defaultForm10 = defaultForms.indexOf("10") > -1;
			$scope.defaultForm11 = defaultForms.indexOf("11") > -1;
			$scope.defaultForm12 = defaultForms.indexOf("12") > -1;
			$scope.defaultForm13 = defaultForms.indexOf("13") > -1;
			$scope.defaultForm14 = defaultForms.indexOf("14") > -1;
			$scope.defaultForm15 = defaultForms.indexOf("15") > -1;
			$scope.defaultForm16 = defaultForms.indexOf("16") > -1;
			$scope.defaultForm17 = defaultForms.indexOf("17") > -1;
			$scope.defaultForm18 = defaultForms.indexOf("18") > -1;
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
		
		/*********************** CONTACTS **************************/
		
		$scope.addContact = function(){
			$scope.selectedContact = { date: null, comment: '' };
			self.openContactPopin();
		};
		
		$scope.editContact = function(contact){
			$scope.selectedContact = contact;
			self.openContactPopin();
		};
		
		self.openContactPopin = function(){
			var contactModalInstance = $modal.open({
				templateUrl: 'addContactModalContent.html',
				controller: 'ModalAddContactCtrl',
				size: 'lg',
				resolve: {
					projectId: function(){
						return $scope.projectId;
					},
					contact: function(){
						return $scope.selectedContact;
					}
				}
			});
			
			contactModalInstance.result.then(function(contact){
				var index = $scope.project.contacts.indexOf(contact);
				if(index != -1){
					$scope.project.contacts[index] = contact;
				} else {
					$scope.project.contacts.push(contact);
				}
				//$scope.project.contacts.splice(index, 1);
			});
		};
		
		/*********************** ADDITIONAL FORM *************************/
		
		$scope.additionalFormsVisible = false;
		
		$scope.pdfUploadUrl = function(){
			return getCompletePath('fileUploader/uploadPdf');
		};
		
		$scope.toggleAdditionalForm = function(){
			$scope.additionalFormsVisible = !$scope.additionalFormsVisible;
		};
		
		$scope.onPdfUploadSuccess = function(fileName){
			var form = { fileName: fileName, projectId: $scope.projectId };
			$http.post(getCompletePath("projects/additionalForm"), JSON.stringify(form))
			.success(function () {
				$scope.project.additionalForms.push(form);
		    }).error(function (err) {
		    	alert("Ha ocurrido un problema. Por favor intente nuevamente");
		    });
		};
		
		$scope.pdfUrl = function(fileName){
			return getCompletePath("fileUploader/getPdfFile?fileName=" + fileName);
		};
		
		/************************ PAYMENT ****************************/
		
		$scope.goToPaymentCalendar = function(){
			redirect('project/paymentCalendar/' + $scope.projectId);
		};
		
		$scope.goToScheduleCalendar = function(){
			redirect('project/paymentSchedule/' + $scope.projectId);
		};
		
		$scope.openPaymentModal = function(){
			$http.get(getCompletePath("payment/project/" + $scope.projectId), {})
			.success(function (feeNumber) {
				$scope.feeNumberToPay = feeNumber;
				$scope.ShowPaymentModal();
		    }).error(function (data, status, headers, config) {
		    	alert("Estan todas las cuotas pagas!");
		    });
		};
		
		$scope.ShowPaymentModal = function(){
			$modal.open({
				templateUrl: 'paymentModalContent.html',
				controller: 'ModalLoadPayCtrl',
				size: 'sm',
				resolve: {
					projectId: function(){
						return $scope.projectId;
					},
					feeNumberToPay: function(){
						return $scope.feeNumberToPay;
					}
				}
			});
		};
}]);