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
							<div class="col-md-12">
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
					</div>
					<hr>

				    </div>
				    <div role="tabpanel" class="tab-pane fade" id="aspects">
				    	ASPECTOS
				    </div>
				    <div role="tabpanel" class="tab-pane" id="forms">
				    	FORMULARIOS
				    </div>
				    <div role="tabpanel" class="tab-pane" id="payments">
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