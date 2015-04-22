<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html ng-app="formApp">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>INTI</title>
  <!-- SCRIPTS -->
  <%@ include file="../../include/scripts.jsp" %>
  	<script>
		var project = <%= request.getAttribute("project") %>;
		var formName = '<%= request.getAttribute("formName") %>';
	</script>

  <!-- STYLESHEET -->
  <%@ include file="../../include/styles.jsp" %>
</head>
<body>
  <%@ include file="../../include/header.jsp" %>

  <div class="container forms-list" ng-controller="formController">
    <div class="panel panel-default">
    	<button ng-click="goToProject()">Volver a proyecto</button>
    	<div class="formParameters">
      		<h4 class="parameterTitle">Parametros</h4>
    		<input placeholder="Número de cheque" type="text" id="checkNumber" ng-model="form.checkNumber" class="form-control"> 
			<input placeholder="Día"  type="text" id="day" ng-model="form.day" class="form-control"> 
			<input placeholder="Mes"  type="text" id="month" ng-model="form.month" class="form-control"> 
			<input placeholder="Año"  type="text" id="year" ng-model="form.year" class="form-control">
			<button ng-show="project.guarantors.length > 1" ng-click="swapGuarantors(0, 1)">Cambiar Garantes 1 y 2</button>
			<button ng-show="project.guarantors.length > 2" ng-click="swapGuarantors(1, 2)">Cambiar Garantes 2 y 3</button> 
		</div>
		<div class="panel-body" id="printableDiv">
		    <h3>
                 Contrato de mutuo entre EL POLO TECNOLÓGICO CONSTITUYENTES S.A., en su calidad de FIDUCIARIO del FIDEICOMISO SALTO GRANDE, celebrado el 10 de Junio de 2005,  y <span class="uppercase">{{project.holders[0].surname}}, {{project.holders[0].name}}</span> 
               </h3>
               <p class="mt10">
                 Entre el POLO TECNOLÓGICO CONSTITUYENTES S.A. en su calidad de administrador FIDUCIARIO del contrato de fideicomiso que hubiere celebrado en fecha 10 de junio de 2005 con la Comisión Administradora para el Fondo Especial de Salto Grande, representado por su apoderado para este acto CPN <span class="uppercase">Elina Gabriela Buffa</span>, titular del DNI Nº 21.511.090 con domicilio en PARANÁ 145 Piso 4º, de la Ciudad Autónoma de Buenos Aires, en adelante el ACREEDOR, y por otra parte <span class="uppercase">{{project.holders[0].surname}}, {{project.holders[0].name}}</span> con DNI Nº {{project.holders[0].identityNumber}} con domicilio en la calle <span class="uppercase">{{project.holders[0].address}} {{project.holders[0].addressNumber}} <span ng-show="project.holders[0].addressFloor">Piso</span> {{project.holders[0].addressFloor}} <span ng-show="project.holders[0].addressAppartment">Departamento</span> {{project.holders[0].addressAppartment}}</span> , Departamento de {{departmentOnly(project.holders[0].locality)}}, Provincia de ENTRE RÌOS, en adelante el DEUDOR, se celebra el presente contrato de MUTUO, el que se sujetará a las siguientes cláusulas:
               </p>
               <p class="span-inline">
                   <b>PRIMERA: Monto del Préstamo</b>. El DEUDOR recibe en este acto del ACREEDOR la suma de $ {{addPoints(project.givenAmount)}} (PESOS {{numberToLetter(project.givenAmount)}}), mediante cheques del  Banco Credicoop Nº {{form.checkNumber}}, sirviendo el presente de eficaz recibo en legal forma, por lo cual el DEUDOR otorga a favor del ACREEDOR formal carta de adeudo.
                  <br>
                  <b>SEGUNDA: Amortización</b>. El  DEUDOR  se  obliga a pagar al ACREEDOR el total del préstamo que asciende a $ {{addPoints(project.givenAmount)}} (PESOS {{numberToLetter(project.givenAmount)}}) con más una tasa de interés mensual variable, que se establecerá sobre las bases estipuladas en la cláusula 9 del contrato de mutuo suscripto entre el FONCAP S.A. y el ACREEDOR, que el DEUDOR declara conocer y forma parte del presente contrato como Anexo I, en {{project.givenDeadline}} períodos mensuales y consecutivos, correspondientes a la deuda de capital, a contar desde el momento de desembolso por parte de FONCAP, en el lugar y tiempo que indique el  ACREEDOR. En tal sentido, el DEUDOR comenzara a pagar las cuotas de los primeros servicios correspondientes a la atención a capital e intereses el día {{dateToLetters(project.formattedDeliveryDate)}} según consta en el cronograma de pago, entregado a la firma del presente contrato o al día hábil inmediato posterior en el caso que este fuera inhábil.
                 <br>
                 <b>TERCERA: Impositiva</b>. El deudor acepta la imposición de cualquier tributo nacional, provincial o municipal promulgado o ha promulgarse, referente al presente Empréstito, como así también cualquier cambio o modificación que el Estado imponga referida a tales tributos.
                 <br>
                 <b>CUARTA: Mora</b>. Ante la falta de pago en término, por parte del DEUDOR, de una cuota de capital y/o intereses del préstamo en las oportunidades convenidas, se aplicará adicionalmente un interés punitorio, igual al 50% del compensatorio, el que se capitalizará en forma diaria durante todo el período en que transcurra la mora, a partir del día siguiente al vencimiento, sobre el total de las cuotas atrasadas, que no constituirá tope alguno al reclamo que el ACREEDOR pudiera formular por los daños y perjuicios que la mora le causare, con más sus accesorios. Además el ACREEDOR podrá proceder a ejecutar el presente contrato que conforma titulo ejecutivo suficiente.
                 <br>
                 <b>QUINTA: Incumplimiento</b>. Si el DEUDOR incumpliera el  pago de una cuota, ya sea total o parcial, quedará automáticamente en mora de pleno derecho, sin necesidad de interpelación judicial o extrajudicial de ninguna naturaleza. La mora del DEUDOR producirá la caducidad automática de los plazos acordados considerando toda la deuda como de plazo vencido, pudiendo el ACREEDOR exigir sin más el pago del  total de las sumas adeudadas con mas sus accesorios legales. En este supuesto, los pagos efectuados serán tomados como pago a cuenta, imputándose primero a intereses y luego a  capital.
                 <br>  
                 <b>SEXTA: Destino</b>. El importe de este préstamo será destinado a cubrir necesidades de {{project.investmentDestination}}, conforme surge del contenido del Proyecto Nº: CO {{project.number}} El DEUDOR se compromete a presentar elementos fehacientes que acrediten que los fondos recibidos han sido aplicados al destino arriba señalado, en el momento que se le solicite, quedando a consideración del ACREEDOR la solicitud de mayores precisiones en caso de no quedar satisfecho con la documentación presentada. La no presentación de esta documentación, facultará a la rescisión del presente contrato por parte del ACREEDOR, en cuyo caso este último podrá proceder a ejecutar el presente contrato que conforma título ejecutivo suficiente y solicitarle al DEUDOR el reintegro de la totalidad de los fondos más los costos que ello demandare.
                 <br>
                                   <b>SEPTIMA: Administrador</b>. El ACREEDOR ha designado al INSTITUTO NACIONAL DE TECNOLOGÍA INDUSTRIAL -INTI-, para que, bajo su control y supervisión, administre este proyecto de conformidad  y con los alcances establecidos en el convenio institucional suscripto entre ambas Instituciones con fecha 28 de Septiembre de 2005.
                 <br>  
                 <b>OCTAVA: Tutoría</b>. El DEUDOR aceptará el seguimiento “in situ” por parte del INTI del desarrollo del Proyecto, hasta la cancelación de la obligación principal, a efectos de verificar el cumplimiento de las condiciones técnicas y económico-financieras del Proyecto que le diera origen al préstamo.
                 <br>
                 <b>NOVENA</b>: Las obligaciones que asume el INTI por medio del presente Contrato o los acuerdos complementarios que se suscriban en su consecuencia son de medio, no de resultado. En virtud de lo expuesto el INTI deslinda cualquier tipo de responsabilidad por los resultados que se produzcan como consecuencia de la utilización de los productos y/o servicios resultantes del micro emprendimiento aquí promovido. Asimismo, el INTI deslinda toda responsabilidad bajo cualquier concepto tanto frente al DEUDOR como hacia sus colaboradores, dependientes, contratados o hacia terceros en general, usuarios o no usuarios de los productos comercializados como resultado del desarrollo aquí promovido, respecto a todo reclamo de índole civil, laboral, penal o administrativo, vinculado directa o indirectamente con sus acciones en ejecución del presente Convenio.
                 <br>
                 <b>DECIMA:</b> El DEUDOR ofrece en garantía los Contratos de Fianza del/la Sr./Sra. <span class="uppercase">{{project.guarantors[0].surname}}, {{project.guarantors[0].name}}</span> con DNI Nº {{project.guarantors[0].identityNumber}} y del/la Sr./Sra. <span class="uppercase">{{project.guarantors[1].surname}}, {{project.guarantors[1].name}}</span> con DNI Nº {{project.guarantors[1].identityNumber}}  emitidos en beneficio del ACREEDOR, respecto de las obligaciones por el asumidas en este Contrato de Mutuo, el que exhibe en este acto y cuya copia se agrega como Anexo II, y declara conocer y consentir, además, el contrato de mutuo suscripto el __________, entre el ACREEDOR y el FONCAP S.A., que se integra al presente contrato y se adjunta como anexo I. El DEUDOR, dará cumplimiento a las cargas y obligaciones contenidas en los referidos instrumentos que pesan sobre el ACREEDOR, así como se somete al régimen de causales de rescisión allí contenidas y a los efectos pactados, por su acción u omisión.
                 <br>
                 <b>UNDÉCIMA: Lugar de Pago</b>. El DEUDOR devolverá el préstamo abonando las cuotas al vencimiento, con la tarjeta de pago del Banco Credicoop que recibiera para tal fin al momento de la firma del presente contrato. Los pagos se efectuarán en los Cajeros Automáticos del Banco Credicoop o Cajeros de la red LINK habilitados para tal fin, o en cualquier lugar y/o bajo la nueva modalidad que indique el ACREEDOR.
                 <br>
                 <b>DÉCIMO SEGUNDA: Codeudores</b>. El/La Sr./Sra <span class="uppercase">{{project.guarantors[0].surname}}, {{project.guarantors[0].name}}</span> con DNI Nº {{project.guarantors[0].identityNumber}} con domicilio en la calle <span class="uppercase">{{project.guarantors[0].address}} {{project.guarantors[0].addressNumber}} <span ng-show="project.guarantors[0].addressFloor">Piso</span> {{project.guarantors[0].addressFloor}} <span ng-show="project.guarantors[0].addressAppartment">Departamento</span> {{project.guarantors[0].addressAppartment}}</span> y el/la Sr./Sra. <span class="uppercase">{{project.guarantors[1].surname}}, {{project.guarantors[1].name}}</span> con DNI Nº {{project.guarantors[1].identityNumber}} con domicilio en la calle <span class="uppercase">{{project.guarantors[1].address}} {{project.guarantors[1].addressNumber}} <span ng-show="project.guarantors[1].addressFloor">Piso</span> {{project.guarantors[1].addressFloor}} <span ng-show="project.guarantors[1].addressAppartment">Departamento</span> {{project.guarantors[1].addressAppartment}}</span>, de la Ciudad de {{cityOnly(project.guarantors[1].locality)}}, Departamento de {{departmentOnly(project.guarantors[1].locality)}}, Provincia de ENTRE RÌOS, se constituyen en codeudores solidarios, fiadores lisos y llanos, principales pagadores del DEUDOR respecto del cumplimiento de todas y cada una de las obligaciones asumidas en este contrato frente al ACREEDOR, por lo cual este último podrá requerirle el cumplimiento de la totalidad de las obligaciones asumidas por el DEUDOR, no pudiendo invocar los beneficios de excusión  y/o división
                 <br>
                 <b>DECIMOTERCERA: Domicilio - Jurisdicción</b>. A todos los efectos del presente, el DEUDOR constituye domicilio con domicilio en la calle <span class="uppercase">{{project.holders[0].address}} {{project.holders[0].addressNumber}} <span ng-show="project.holders[0].addressFloor">Piso</span> {{project.holders[0].addressFloor}} <span ng-show="project.holders[0].addressAppartment">Departamento</span> {{project.holders[0].addressAppartment}}</span> , Departamento de {{departmentOnly(project.holders[0].locality)}} y el ACREEDOR en PARANÁ 145 Piso 4º de la Ciudad Autónoma de Buenos Aires, en donde serán válidas todas las notificaciones judiciales y/o extrajudiciales que se cursen, y se someten a la jurisdicción y competencia de los Tribunales Ordinarios en lo Comercial de la Ciudad Autónoma de Buenos Aires, con exclusión de todo otro fuero o jurisdicción. En prueba de conformidad se suscriben tres ejemplares de un mismo tenor y a un sólo efecto en la Ciudad Autónoma de Buenos Aires, a los __________ días del mes de __________ del __________.
               </p>
               <div class="row txtC signature">
                  <div class="col-sm-4">
                    Firma del DEUDOR 
                    <hr>
                    <span class="uppercase">{{project.holders[0].surname}}, {{project.holders[0].name}}</span> 
                    <br>
                    DNI Nº: {{project.holders[0].identityNumber}}
                  </div>
                  <div class="col-sm-4">
                    Firma del CODEUDOR
                    <hr>
                    <span class="uppercase">{{project.guarantors[0].surname}}, {{project.guarantors[0].name}}</span>  
                    <br>
                    DNI Nº: {{project.guarantors[0].identityNumber}}
                  </div>
                  <div class="col-sm-4">
                    Firma del CODEUDOR
                    <hr>
                    <span class="uppercase">{{project.guarantors[1].surname}}, {{project.guarantors[1].name}}</span> 
                    <br>
                    DNI Nº: {{project.guarantors[1].identityNumber}}
                  </div>
                 <div class="col-sm-offset-3 col-sm-6 mt30">
                   Firma del representante del Fiduciario del FIDEICOMISO POLO TECNOLÓGICO CONSTITUYENTES S.A. 
                   <hr>
                   Por poder <b>CPN <span class="uppercase">Elina Gabriela Buffa</span></b>
                   <br>
                   DNI Nº: 21.511.090
                 </div>
                 <div class="clearfix"></div>
               </div>
             </div>
             <div class="row">
			<div class="col-sm-12">
				<div class="pull-right">
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Cargar formulario" ng-show="!isEdition" ng-disabled="form.checkNumber == '' || form.day == '' || form.month == '' || form.year == ''" ng-click="saveForm()" />
						<input type="submit" class="btn btn-primary" value="Actualizar formulario" ng-show="isEdition" ng-disabled="form.checkNumber == '' || form.day == '' || form.month == '' || form.year == ''" ng-click="saveForm()"/>
						<input type="submit" class="btn btn-primary" value="Imprimir formulario" ng-click="printDiv()"/>
					</div>
				</div>
			</div>
		</div>
      </div>
  </div>
	<script src="<%=scriptPageContext %>/static/scripts/viewmodels/forms/form.js" type="text/javascript"></script>
	<script src="<%=scriptPageContext %>/static/scripts/common/numberToLetter.js" type="text/javascript"></script>
</body>
</html>