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
				    <div role="tabpanel" class="tab-pane fade active" id="institutional">
				    	INSTITUCIONAL
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