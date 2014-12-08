<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section>
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">
					<h3>CARGAR NUEVA PERSONA</h3>
					<h4>Complete el formulario</h4>
					<hr>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<!-- VALIDACIÓN, agregar active a tooltip -->
								<div class="tooltip top active" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar un nombre
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Nombre</label>
								<input type="text" class="form-control" placeholder="Ingrese nombre" tabindex="1" autofocus>
							</div>
						</div>	
						<div class="col-sm-6">								
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar apellido
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Apellido</label>
								<input type="text" class="form-control" placeholder="Ingrese nombre" tabindex="2">
							</div>								
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar un número de documento
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Tipo de documento</label>
								<div class="select-style">
									<select tabindex="3">
										<option>Elegir tipo</option>
										<option>DNI</option>
										<option>LC</option>
									</select>
									<i class="fa fa-chevron-down"></i>
								</div>
							</div>
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar un número de documento
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Número de documento</label>
								<input type="text" class="form-control" placeholder="Ingrese número de documento" tabindex="4">
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar fecha de nacimiento
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<div class="control-group">
									<label for="date-picker-2" class="control-label">Fecha de nacimiento</label>
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
									Debe ingresar genero
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Genero</label>
								<div class="select-style">
									<select tabindex="6">
										<option>Elegir genero</option>
										<option>Masculino</option>
										<option>Femenino</option>
									</select>
									<i class="fa fa-chevron-down"></i>
								</div>
							</div>								
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar celular
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Celular</label>
								<input type="text" class="form-control" placeholder="Ingrese celular" tabindex="7">
							</div>
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar email
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Email</label>
								<input type="email" class="form-control" placeholder="Ingrese email" tabindex="8">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-4">
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar provincia
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Provincia</label>
								<div class="select-style">
									<select tabindex="9">
										<option>Elegir provincia</option>
										<option>Ciudad de Buenos Aires</option>
										<option>Buenos Aires</option>
									</select>
									<i class="fa fa-chevron-down"></i>
								</div>
							</div>
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar localidad
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Localidad</label>
								<div class="select-style">
									<select tabindex="10">
										<option>Elegir localidad</option>
										<option>Mar del Plata</option>
										<option>Tandil</option>
									</select>
									<i class="fa fa-chevron-down"></i>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar dirección
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Dirección</label>
								<input type="text" class="form-control" placeholder="Ingrese dirección" tabindex="11">
							</div>
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar código postal
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Código postal</label>
								<input type="email" class="form-control" placeholder="Ingrese código postal" tabindex="12">
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar telefono
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Teléfono</label>
								<input type="text" class="form-control" placeholder="Ingrese teléfono" tabindex="1">
							</div>
							<div class="form-group">
								<!-- VALIDACIÓN -->
								<div class="tooltip top" role="tooltip">
								  <div class="tooltip-arrow"></div>
								  <div class="tooltip-inner">
									Debe ingresar teléfono laboral
								  </div>
								</div>
								<!-- end VALIDACIÓN -->
								<label for="exampleInputEmail1">Teléfono laboral</label>
								<input type="text" class="form-control" placeholder="Ingrese teléfono laboral" tabindex="1">
							</div>
						</div>							
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12">
							<div class="pull-right">
								<div class="form-group">
									<button type="button" class="btn btn-primary">
										<i class="fa fa-plus"></i> Cargar persona
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
	
	</footer>
	
	<script type="text">
		$(".date-picker").datepicker();

		$(".date-picker").on("change", function () {
			var id = $(this).attr("id");
			var val = $("label[for='" + id + "']").text();
			$("#msg").text(val + " changed");
		});
	</script>
	<script>
		$("#goToPersonsLink").addClass("active");
	</script>
</body>
</html>