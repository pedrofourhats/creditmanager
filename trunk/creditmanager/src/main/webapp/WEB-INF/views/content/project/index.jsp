<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html ng-app="projectApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	<script type="text/javascript" src="<%=scriptPageContext %>/static/scripts/common/fileUpload.js"></script>
	<script type="text/javascript" src="<%=scriptPageContext %>/static/scripts/viewmodels/projects/projects.js"></script>
	<script type="text/javascript" src="<%=scriptPageContext %>/static/scripts/viewmodels/projects/projectDetail.js"></script>
	<script type="text/javascript" src="<%=scriptPageContext %>/static/scripts/common/pager.js"></script>
	<script type="text/javascript" src="<%=scriptPageContext %>/static/js/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="<%=scriptPageContext %>/static/js/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="<%=scriptPageContext %>/static/js/jquery.fileupload.js"></script>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<div ng-view></div>
	
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
		        TÃ­tulos <span class="badge"><i class="fa fa-times"></i></span>
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