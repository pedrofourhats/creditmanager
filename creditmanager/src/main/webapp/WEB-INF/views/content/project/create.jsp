<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>

	<div class="container">
		<ol class="breadcrumb">
		  <li><a href="#"><i class="fa fa-angel-right"></i> Proyectos</a></li>
		  <li class="active"><i class="fa fa-angel-right"></i> Crear proyecto</li>
		</ol>
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>CARGAR NUEVO PROYECTO</h3>
				<h4>Complete los siguientes pasos</h4>

				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
				    <li role="presentation" class="active"><a href="#institutional" aria-controls="institutional" role="tab" data-toggle="tab">Institucional</a></li>
				    <li role="presentation"><a href="#aspects" aria-controls="aspects" role="tab" data-toggle="tab">Aspectos</a></li>
				    <li role="presentation"><a href="#forms" aria-controls="forms" role="tab" data-toggle="tab">Formularios</a></li>
				    <li role="presentation"><a href="#payments" aria-controls="payments" role="tab" data-toggle="tab">Contactos y pagos</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
				    <div role="tabpanel" class="tab-pane fade in active" id="institutional">
				    	<div class="row">
				    		<div class="col-sm-12">
				    			<h4>Informaci�n institucionales</h4>
				    		</div>
				    	</div>
				    	<div class="row mt20">
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Fecha de ingreso INTI
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<div class="control-group">
										<label for="date-picker-2" class="control-label">Fecha de ingreso al INTI</label>
										<div class="controls">
											<div class="input-group">
												<input id="date-picker-2" type="text" class="date-picker form-control" tabindex="5" />
												<label for="date-picker-2" class="input-group-addon btn"><span class="fa fa-calendar"></span>
												</label>
											</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar un n�mero de proyecto
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>N�mero de proyecto</label>
									<input type="text" class="form-control" placeholder="Ingrese n�mero de documento" tabindex="2">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar services
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>N�mero de services</label>
									<input type="text" class="form-control" placeholder="Ingrese n�mero de services" tabindex="3">
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar situaci�n
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Estado de situaci�n</label>
									<input type="text" class="form-control" placeholder="Ingrese estado de situaci�n">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar evaluador seg�n services
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Evaluador segun services</label>
									<div class="dropdown">
									  <a id="" type="button" data-toggle="dropdown">
									    Elegir evaluador
									    <i class="fa fa-chevron-down"></i>
									  </a>
									  <ul class="dropdown-menu">
									    <li><a href="javascript:void(0);">Evaluador 1</a></li>
								          <li><a href="javascript:void(0);">Evaluador 2</a></li>
									  </ul>
									</div>
									<!-- <div class="dropdown" dropdown is-open="status.isopen">
									  <a type="button" data-toggle="dropdown">
									    <span ng-show="project.serviceEvaluator == ''">
									    	Elegir evaluador
									    </span>
									    <span ng-show="newPerson.genderName != ''">
										    {{newPerson.genderName}} 
									    </span>
									    <i class="fa fa-chevron-down"></i>
									  </a>
									  <ul class="dropdown-menu" role="menu">
									    <li ng-click="selectGender({value: 0, name: 'MASCULINO'})"><a href="javascript:void(0);">MASCULINO</a></li>
								        <li ng-click="selectGender({value: 1, name: 'FEMENINO'})"><a href="javascript:void(0);">FEMENINO</a></li>
									  </ul>
									</div>-->
								</div>
								
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar ascesor CAFESG
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Ascesor CAFESG</label>
									<div class="dropdown">
									  <a id="" type="button" data-toggle="dropdown">
									    Elegir evaluador
									    <i class="fa fa-chevron-down"></i>
									  </a>
									  <ul class="dropdown-menu">
									    <li><a href="javascript:void(0);">Evaluador 1</a></li>
								          <li><a href="javascript:void(0);">Evaluador 2</a></li>
									  </ul>
									</div>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar destino de la inversi�n
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Destino de la inversi�n</label>
									<textarea class="form-control" placeholder="Ingrese estado de situación"></textarea>
								</div>
							</div> 
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<div class="row head-small">
									<div class="col-sm-6">
										<h4>Titulares</h4>
									</div>
									<div class="col-sm-6 txtR">
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-plus-circle"></i> Agregar titular
										</button>
									</div>	
								</div>
								<table class="table table-hover table-condensed table-responsive table-small">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		N� <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Nombre <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th class="txtC">Acciones</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td>1</td>
									  <td>Nombre del titular</td>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-eye txtSuccess" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
									  </td>
									</tr>
									<tr>
									  <td>2</td>
									  <td>Nombre del titular</td>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-eye txtSuccess" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
									  </td>
									</tr>
								  </tbody>
								</table>
							</div>						
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<div class="row head-small">
									<div class="col-sm-6">
										<h4>Garantes</h4>
									</div>
									<div class="col-sm-6 txtR">
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-plus-circle"></i> Agregar garante
										</button>
									</div>	
								</div>
								<table class="table table-hover table-condensed table-responsive table-small">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		N� <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Nombre <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th class="txtC">Acciones</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td>1</td>
									  <td>Nombre del garante</td>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-eye txtSuccess" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
									  </td>
									</tr>
									<tr>
									  <td>2</td>
									  <td>Nombre del garante</td>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-eye txtSuccess" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
									  </td>
									</tr>
								  </tbody>
								</table>
							</div>
						</div>
					</div>
				    <div role="tabpanel" class="tab-pane fade" id="aspects">
				    	<div class="row">
				    		<div class="col-sm-12">
				    			<h4>Aspectos econ�micos</h4>		
				    		</div>
				    	</div>	
				    	<div class="row mt20">
				    		<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar titulo
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Titulo del proyecto</label>
									<input type="text" class="form-control" placeholder="Ingrese titulo del proyecto" tabindex="1" autofocus>
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar tipo de proyecto
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Tipo de proyecto</label>
									<input type="text" class="form-control" placeholder="Ingrese tipo de proyecto" tabindex="2">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar sector econ�mico
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Sector econ�mico</label>
									<input type="text" class="form-control" placeholder="Ingrese sector econ�mico" tabindex="3" autofocus>
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar activdad econ�mica
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Actividad econ�mica</label>
									<input type="text" class="form-control" placeholder="Ingrese activdad econ�mica" tabindex="4">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar rubro
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Rubro</label>
									<input type="text" class="form-control" placeholder="Ingrese rubro" tabindex="5" autofocus>
								</div>
							</div>
				    	</div>
				    	<hr>
				    	<div class="row">
				    		<div class="col-sm-12">
				    			<h4>Aspectos financieros</h4>		
				    		</div>
				    	</div>	
				    	<div class="row mt20">
				    		<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar importe solicitado
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Importe solicitado</label>
									<input type="text" class="form-control" placeholder="Ingrese importe solicitado" tabindex="6">
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar plazo solicitado
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Plazo solicitado</label>
									<input type="text" class="form-control" placeholder="Ingrese plazo solicitado" tabindex="7">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar periodo de gracia
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Periodo de gracia solicitado</label>
									<input type="text" class="form-control" placeholder="Ingrese periodo de gracia solicitado" tabindex="8">
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar fecha de otorgamiento del cr�dito
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<div class="control-group">
										<label for="date-picker-2" class="control-label">Fecha de otorgamiento del cr�dito</label>
										<div class="controls">
											<div class="input-group">
												<input id="date-picker-2" type="text" class="date-picker form-control" tabindex="9" />
												<label for="date-picker-2" class="input-group-addon btn">
													<span class="fa fa-calendar"></span>
												</label>
											</div>
										</div>
									</div>								
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar importe otorgado
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Importe otorgado</label>
									<input type="text" class="form-control" placeholder="Ingrese importe otorgado" tabindex="10">
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar plazo otorgado
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Plazo otorgado</label>
									<input type="text" class="form-control" placeholder="Ingrese plazo otorgado" tabindex="11">
								</div>
							</div>
				    	</div>
				    </div>
				    <div role="tabpanel" class="tab-pane fade" id="forms">
				    	<div class="row">
				    		<div class="col-sm-12">
				    			<h4>Documentaci�n a presentar</h4>
				    		</div>
				    	</div>
				    	<div class="row mt20">
							<div class="col-sm-4">
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="1"> Formulario 1
									</label>
								</div>
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="2"> Formulario 2
									</label>
								</div>
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="3"> Formulario 3
									</label>
								</div>									
							</div>
							<div class="col-sm-4">
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="4"> Formulario 4
									</label>
								</div>
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="5"> Formulario 5
									</label>
								</div>
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="6"> Formulario 6
									</label>
								</div>									
							</div>
							<div class="col-sm-4">
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="7"> Formulario 7
									</label>
								</div>
								<div class="form-group pos-rel">
									<label class="checkbox">
									  <input type="checkbox" tabindex="8"> Formulario 8
									</label>
								</div>								
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar destino de la inversi�n
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Destino de la inversi�n</label>
									<textarea class="form-control" placeholder="Ingrese estado de situaci�n"></textarea>
								</div>
							</div> 
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-hover table-condensed table-responsive table-tiny">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Tipo <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Fecha de emisi�n <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th class="txtC">Acciones</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td>Fianza</td>
									  <td>5/5/2004</td>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-print txtBlue" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-pencil txtSuccess"></i></button>
									  </td>
									</tr>
									<tr>
									  <td>Contrato</td>
									  <td>5/11/2012</td>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-print txtBlue" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-pencil txtSuccess"></i></button>
									  </td>
									</tr>
								  </tbody>
								</table>
								<div class="row mt20">
									<div class="col-sm-12 txtR">
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-file-text-o"></i> Cargar formulario
										</button>
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-file-text"></i> Cargar formulario extra
										</button>
									</div>	
								</div>
							</div>						
						</div>
				    </div>
				    <div role="tabpanel" class="tab-pane fade" id="payments">
				    	<div class="row">
							<div class="col-sm-12">
								<div class="row head-small">
									<div class="col-sm-6">
										<h4>�timos pagos</h4>
									</div>
									<div class="col-sm-6 txtR">
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-plus-circle"></i> Cargar pago
										</button>
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-calendar-o"></i> Ver calendario de pagos
										</button>
									</div>	
								</div>
								<table class="table table-hover table-condensed table-responsive table-payments">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		N� <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>Vencimientos</th>
									  <th>Monto cuota</th>
									  <th>Fecha de pago</th>
									  <th>Cobro</th>
									  <th class="txtC">Acciones</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td>1</td>
									  <th>01/01/2015</th>
									  <th>$1008,2</th>
									  <th>15/01/2015</th>
									  <th>$1010</th>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-eye txtSuccess" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-pencil txtDanger"></i></button>
									  </td>
									</tr>
									<tr>
									  <td>2</td>
									  <th>01/01/2015</th>
									  <th>$1008,2</th>
									  <th>15/01/2015</th>
									  <th>$1010</th>
									  <td class="txtC">
										<button type="button" class="btn btn-link" onclick=""><i class="fa fa-eye txtSuccess" ></i></button>
										<button type="button" class="btn btn-link"><i class="fa fa-pencil txtDanger"></i></button>
									  </td>
									</tr>
								  </tbody>
								</table>
							</div>						
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<div class="row head-small">
									<div class="col-sm-6">
										<h4>Contactos</h4>
									</div>
									<div class="col-sm-6 txtR">
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-plus-circle"></i> Cargar contacto
										</button>
										<button type="button" class="btn btn-primary" onclick="">
											<i class="fa fa-eye"></i> Ver todos los ontactos
										</button>
									</div>	
								</div>
								<table class="table table-hover table-condensed table-responsive table-small">
								  <thead>
									<tr>
									  <th>
									  	<a href="javascript:void(0);">
									  		<!-- cambiar a fa-caret-up -->
									  		Fecha <i class="fa fa-caret-down pull-right"></i>
									  	</a>
									  </th>
									  <th>Observaciones</th>							  
									  <th class="txtC">Acciones</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <th>01/01/2015</th>
									  <th>Se solicita informe del INTA, se recibe informe viable de INTA</th>
									  <td class="txtC">
										<button type="button" class="btn btn-link"><i class="fa fa-pencil txtDanger"></i></button>
									  </td>
									</tr>
									<tr>
									  <td>01/01/2015</td>
									  <td>Se solicita informe del INTA, se recibe informe viable de INTA</td>
									  <td class="txtC">
										<button type="button" class="btn btn-link"><i class="fa fa-pencil txtDanger"></i></button>
									  </td>
									</tr>
								  </tbody>
								</table>
							</div>						
						</div>


				    </div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-right">
							<div class="form-group">
								<button type="button" class="btn btn-primary">
									<i class="fa fa-plus"></i> {{buttonName}}
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script>
		$("#goToProjectsLink").addClass("active");
	</script>
</body>
</html>