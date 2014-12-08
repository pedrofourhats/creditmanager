<header>
	<div class="container container-header">
		<div class="pull-left">
			<h1 class="logo"></h1>
		</div>
		<div class="pull-right">
<!--	 	<button type="button" class="btn btn-default btn-exit"> -->
<!-- 			<i class="fa fa-sign-out"></i> Salir -->
<!--	 	</button> -->
			<!-- ACÁ CAMBIEN UN BOTON POR UN ANCHOR PARA EL LOGOUT -->
			<a class="btn btn-default btn-exit" href='<c:url value="j_spring_security_logout" />'> 
				<i class="fa fa-sign-out"></i> Salir
			</a>
		</div>
	</div>
</header>

<nav class="main-nav">
	<div class="container">
		<ul>
			<li id="goToProjectsLink">
				<a href="javascript:void(0)" onclick="redirect('project/list');">
	        		<span>PROYECTOS</span>
	        	</a>
			</li>
			<li id="goToPersonsLink">
				<a href="javascript:void(0)" onclick="redirect('person/list');">
	        		<span>PERSONAS</span>
	        	</a>
			</li>
			<li id="goToFormsLink">
				<a href="javascript:void(0)" onclick="redirect('form');">
	        		<span>FORMULARIOS</span>
	        	</a>
			</li>
			<li id="goToReportsLink">
				<a href="javascript:void(0)" onclick="redirect('report');">
	        		<span>REPORTES</span>
	        	</a>
			</li>					
		</ul>
	</div>
</nav>
