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
										Debe ingresar un número de proyecto
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Número de proyecto</label>
									<input type="text" class="form-control" placeholder="Ingrese número de documento" tabindex="2">
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
									<label>Número de services</label>
									<input type="text" class="form-control" placeholder="Ingrese número de services" tabindex="3">
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar situación
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Estado de situación</label>
									<input type="text" class="form-control" placeholder="Ingrese estado de situación">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar evaluador según services
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
									    <li><a href="#">Evaluador 1</a></li>
								          <li><a href="#">Evaluador 2</a></li>
									  </ul>
									</div>
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
									    <li><a href="#">Evaluador 1</a></li>
								          <li><a href="#">Evaluador 2</a></li>
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
										Debe ingresar destino de la inversión
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Destino de la inversión</label>
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
									  <th>N°</th>
									  <th>Nombre</th>
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
									  <th>N°</th>
									  <th>Nombre</th>
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
				    			<h4>Aspectos económicos</h4>		
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
										Debe ingresar sector económico
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Sector económico</label>
									<input type="text" class="form-control" placeholder="Ingrese sector económico" tabindex="3" autofocus>
								</div>
								<div class="form-group">
									<!-- VALIDACIÓN -->
									<div class="tooltip top" role="tooltip">
									  <div class="tooltip-arrow"></div>
									  <div class="tooltip-inner">
										Debe ingresar activdad económica
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<label>Actividad económica</label>
									<input type="text" class="form-control" placeholder="Ingrese activdad económica" tabindex="4">
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
										Debe ingresar fecha de otorgamiento del crédito
									  </div>
									</div>
									<!-- end VALIDACIÓN -->
									<div class="control-group">
										<label for="date-picker-2" class="control-label">Fecha de otorgamiento del crédito</label>
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
				    	FORMULARIOS
				    </div>
				    <div role="tabpanel" class="tab-pane fade" id="payments">
				    	CONTACTOS Y PAGOS
				    </div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-right">
							<div class="form-group">
								<button type="button" class="btn btn-primary">
									<i class="fa fa-plus"></i> Cargar proyecto
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