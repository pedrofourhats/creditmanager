<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="personApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
	<!-- SCRIPTS -->
	<%@ include file="../../include/scripts.jsp" %>
	<script>
	    var personsPage = <%= request.getAttribute("personsPage") %>; 
		personsPage.pagesToShow = function () {
	        var pages = [];
	        var firstPage;
	        var lastPage;

	        if (personsPage.totalPages < 8) {
	            firstPage = 1;
	            lastPage = personsPage.totalPages;
	        } else if (personsPage.pageIndex < 4) {
	            firstPage = 1;
	            lastPage = 7;
	        } else if (personsPage.pageIndex > personsPage.totalPages - 3) {
	            lastPage = self.personsPage.totalPages;
	            firstPage = lastPage - 6;
	        } else {
	            firstPage = personsPage.pageIndex - 3;
	            lastPage = personsPage.pageIndex + 3;
	        }

	        for (var i = firstPage; i <= lastPage; i++) {
	            pages.push(i);
	        }

	        return pages;
	    };
    </script>
	
	<!-- STYLESHEET -->
	<%@ include file="../../include/styles.jsp" %>
</head>
<body>
	<%@ include file="../../include/header.jsp" %>
	
	<section ng-controller="personsListController">
		<div class="container">
			<ol class="breadcrumb">
			  <li><a href="#"><i class="fa fa-angel-right"></i> Personas</a></li>
			  <li class="active"><i class="fa fa-angel-right"></i> Listado de personas</li>
			</ol>
			<div class="pull-left">
				<div class="form-group">
					<button type="button" class="btn btn-primary" onclick="redirect('person/create');">
						<i class="fa fa-plus-circle"></i> Nueva persona
					</button>
				</div>
			</div>
			<div class="pull-right form-inline">
				<div class="form-group">
					<label>Buscar persona</label>
					<input class="form-control" ng-model="searchedKeyword">
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" ng-click="search()" ng-disabled="!searchedKeyword">
						<i class="fa fa-search"></i> Buscar
					</button>
					<button type="button" class="btn btn-primary" ng-click="deleteSearch()" ng-show="isSearching">
						<i class="fa fa-search"></i> Eliminar filtro
					</button>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-hover table-condensed table-responsive table-persons">
					  <thead>
						<tr>
						  <th>
						  	<!-- <a href="javascript:void(0);">
						  		<!-- cambiar a fa-caret-up -->
						  		Nombre<!-- <i class="fa fa-caret-down pull-right"></i> -->
						  	<!-- </a> -->
						  </th>
						  <th>Apellido</th>
						  <th>Documento</th>
						  <th>Nacimiento</th>
						  <th>Genero</th>
						  <th>Telefono</th>
						  <th>Celular</th>
						  <th class="txtC">Acciones</th>
						</tr>
					  </thead>
					  <tbody>
						<tr ng-repeat="person in personsPage.elements">
						  <td ng-click="goToDetail(person)">{{person.name}}</td>
						  <td ng-click="goToDetail(person)">{{person.surname}}</td>
						  <td>{{person.identityNumber}}</td>
						  <td>{{person.birthDate}}</td>
						  <td>{{person.genderName}}</td>
						  <td>{{person.phone}}</td>
						  <td>{{person.cellPhone}}</td>
						  <td class="txtC">
							<button type="button" class="btn btn-link" ng-click="goToEditPerson(person)"><i class="fa fa-pencil txtSuccess"></i></button>
							<button type="button" class="btn btn-link" ng-click="deletePerson(person)"><i class="fa fa-trash txtDanger"></i></button>
						  </td>
						</tr>
					  </tbody>
					</table>
					<nav>
					  <ul class="pagination pul l-right">
						<li>
							<a href="javascript:void(0);" ng-show="personsPage.pageIndex != 1" ng-click="goToPage(personsPage.pageIndex - 1)"><i class="fa fa-chevron-left"></i></a>
						</li>
						<li ng-repeat="pageNumber in personsPage.pagesToShow()" ng-class="{active: pageNumber == personsPage.pageIndex}">
							<a href="javascript:void(0);" ng-click="goToPage(pageNumber)">{{pageNumber}}</a>
						</li>
						<li>
							<a href="javascript:void(0);" ng-show="personsPage.pageIndex != personsPage.totalPages" ng-click="goToPage(personsPage.pageIndex + 1)"><i class="fa fa-chevron-right"></i></a>
						</li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</section>
	
	<footer>
	</footer>

	<script src="<%=scriptPageContext %>/static/scripts/viewmodels/persons/personsList.js" type="text/javascript"></script>
	<script>
		$("#goToPersonsLink").addClass("active");
	</script>
</body>
</html>