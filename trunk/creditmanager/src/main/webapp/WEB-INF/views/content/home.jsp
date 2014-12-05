<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<% String stylePageContext = request.getContextPath(); %>
	<!-- SCRIPTS -->
	<script src="<%=stylePageContext %>/static/js/less-1.7.5.min.js" type="text/javascript"></script>
	<script src="<%=stylePageContext %>/static/js/jquery.min.js" type="text/javascript"></script>		
	<script src="<%=stylePageContext %>/static/js/bootstrap.js" type="text/javascript"></script>
	<!-- STYLESHEET -->
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/fwk/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="<%=stylePageContext %>/static/css/styles.css" />
</head>
<body>
	<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html lang="es">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Content-Type" content="text/html" />
		<title>INTI</title>
		
		<!-- Framework -->
		<link rel="stylesheet/less" type="text/css" href="less/fwk/bootstrap.less" />
		
		<!-- Font Awesome -->
		<link rel="stylesheet" type="text/css" href="less/font-awesome.css" />
		
		<!-- Custom Styles -->
		<link rel="stylesheet/less" type="text/css" href="less/styles.less" />
		
		<!-- Scripts -->
		<script src="js/less-1.7.5.min.js" type="text/javascript"></script>
		<script src="js/jquery.min.js" type="text/javascript"></script>		
		<script src="js/bootstrap.js" type="text/javascript"></script>
		
	</head>

	<body>

		<header>
			<div class="container container-header">
				<div class="pull-left">
					<h1 class="logo"></h1>
				</div>
				<div class="pull-right">
					<button type="button" class="btn btn-default btn-exit">
						<i class="fa fa-sign-out"></i> Salir
					</button>
				</div>
			</div>
		</header>
		
		<nav class="main-nav">
			<div class="container">
				<ul>
					<li class="active">
						<a href="">PROYECTOS</a>
					</li>
					<li>
						<a href="">PERSONAS</a>
					</li>
					<li>
						<a href="">FORMULARIOS</a>
					</li>
					<li>
						<a href="">REPORTES</a>
					</li>					
				</ul>
			</div>
		</nav>
		
		<section>
			<div class="container">
				<div class="pull-left">
					<div class="form-group">
						<button type="button" class="btn btn-primary">
							<i class="fa fa-plus-circle"></i> Nuevo proyecto
						</button>
					</div>
				</div>
				<div class="pull-right form-inline">
					<div class="form-group">
						<label for="exampleInputEmail1">Buscar por ID de proyecto</label>
						<input type="email" class="form-control" placeholder="ID de proyecto">
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary">
							<i class="fa fa-search"></i> Buscar
						</button>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-default">
							<i class="fa fa-search"></i> Busqueda avanzada
						</button>
					</div>
				</div>
			</div>
			
			<!-- BUSQUEDA AVANZADA -->
			<div class="container">
				<div class="pull-left form-inline">
					<div class="form-group">
						<input type="email" class="form-control" placeholder="Buscar por...">
					</div>
					<div class="form-group">
						<div class="select-style">
							<select>
								<option>Título</option>
								<optgroup label="Tipo">
									<option value="nuevo">Nuevo</option>
									<option value="activo">Activo</option>
									<option value="pendiente">Pendiente</option>
									<option value="cancelado">Cancelado</option>
								</optgroup>
								<option>Rubro</option>
							</select>
							<i class="fa fa-chevron-down"></i>
						</div>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary">
							<i class="fa fa-search"></i> Buscar
						</button>
					</div>
				</div>
				<div class="pull-right form-inline">					
					<div class="form-group">
						<button type="button" class="btn btn-primary">
							<i class="fa fa-print"></i> Imprimir
						</button>
					</div>
					<!-- esta opcion debe abrir modal -->
					<div class="form-group">
						<button type="button" class="btn btn-primary">
							<i class="fa fa-table"></i> Editar columnas
						</button>
					</div>
				</div>
			</div>
			<!-- end BUSQUEDA AVANZADA -->
			
			<div class="container">
				<div class="panel panel-default">
					<div class="panel-body">
						<table class="table table-hover table-condensed table-responsive table-product">
						  <thead>
							<tr>
							  <th>Título</th>
							  <th>Tipo</th>
							  <th>Sector</th>
							  <th>Rubro</th>
							  <th class="txtC">Acciones</th>
							</tr>
						  </thead>
						  <tbody>
							<tr>
							  <td>1</td>
							  <td>Mark</td>
							  <td>Otto</td>
							  <td>@mdo</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link"><i class="fa fa-pencil txtSuccess"></i></button>
								<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
							  </td>
							</tr>
							<tr>
							  <td>2</td>
							  <td>Jacob</td>
							  <td>Thornton</td>
							  <td>@fat</td>
							  <td class="txtC">
								<button type="button" class="btn btn-link"><i class="fa fa-pencil txtSuccess"></i></button>
								<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
							  </td>
							</tr>
						  </tbody>
						</table>
						<nav>
						  <ul class="pagination pull-right">
							<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
						  </ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
		
		<footer>
		
		</footer>
		
		<!-- MODAL -->
		<div class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title">Editar columnas</h4>
		      </div>
		      <div class="modal-body">
		        <div class="list-group">
			      <a href="#" class="list-group-item active">
			        Títulos <span class="badge"><i class="fa fa-times"></i></span>
			      </a>
			      <a href="#" class="list-group-item">Tipo <span class="badge"><i class="fa fa-times"></i></span></a>
			      <a href="#" class="list-group-item">Rubro <span class="badge"><i class="fa fa-times"></i></span></a>
			    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		        <button type="button" class="btn btn-primary">Aceptar</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
	</body>
</html>