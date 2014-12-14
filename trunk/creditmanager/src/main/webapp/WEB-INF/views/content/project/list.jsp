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
			<ol class="breadcrumb">
			  <li><a href="#"><i class="fa fa-angel-right"></i> Proyectos</a></li>
			  <li class="active"><i class="fa fa-angel-right"></i> Listado de proyectos</li>
			</ol>
			<div class="pull-left">
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="redirect('project/create');">
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
					<div class="dropdown">
					  <a id="" type="button" data-toggle="dropdown">
					    T�tulo
					    <i class="fa fa-chevron-down"></i>
					  </a>
					  <ul class="dropdown-menu">
					    <li><a href="#">Nuevo</a></li>
				          <li><a href="#">Activo</a></li>
				          <li><a href="#">Pendiente</a></li>
				          <li><a href="#">Cancelado</a></li>
					  </ul>
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
						  <th>
						  	<a href="javascript:void(0);">
						  		<!-- cambiar a fa-caret-up -->
						  		T�tulo <i class="fa fa-caret-down pull-right"></i>
						  	</a>
						  </th>
						  <th>
						  	<a href="javascript:void(0);">
						  		<!-- cambiar a fa-caret-up -->
						  		Tipo <i class="fa fa-caret-down pull-right"></i>
						  	</a>
						  </th>
						  <th>
						  	<a href="javascript:void(0);">
						  		<!-- cambiar a fa-caret-up -->
						  		Sector <i class="fa fa-caret-down pull-right"></i>
						  	</a>
						  </th>
						  <th>
						  	<a href="javascript:void(0);">
						  		<!-- cambiar a fa-caret-up -->
						  		Rubro <i class="fa fa-caret-down pull-right"></i>
						  	</a>
						  </th>
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
							<button type="button" class="btn btn-link" onclick="redirect('project/detail');"><i class="fa fa-pencil txtSuccess"></i></button>
							<button type="button" class="btn btn-link"><i class="fa fa-trash txtDanger"></i></button>
						  </td>
						</tr>
						<tr>
						  <td>2</td>
						  <td>Jacob</td>
						  <td>Thornton</td>
						  <td>@fat</td>
						  <td class="txtC">
							<button type="button" class="btn btn-link" onclick="redirect('project/detail');"><i class="fa fa-pencil txtSuccess"></i></button>
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
	
	<script>
		$("#goToProjectsLink").addClass("active");
	</script>
</body>
</html>