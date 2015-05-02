<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="personApp">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>INTI</title>
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
				<div class="dropdown" dropdown>
					  <a type="button" data-toggle="dropdown">
					  	<span data-ng-show="searchedPersonCategory == 'ALL'">
						    Todos
					    </span>
					    <span data-ng-hide="searchedPersonCategory == 'ALL'">
						    {{searchedPersonCategory}} 
					    </span>
					    <i class="fa fa-chevron-down"></i>
					  </a>
					  <ul class="dropdown-menu" role="menu">
					  	<li ng-click="selectCategory('ALL')"><a href="javascript:void(0);">TODOS</a></li>
					    <li ng-click="selectCategory('EVALUADORES INTI')"><a href="javascript:void(0);">EVALUADORES INTI</a></li>
				        <li ng-click="selectCategory('ASESORES CAFESG')"><a href="javascript:void(0);">ASESORES CAFESG</a></li>
				        <li ng-click="selectCategory('TITULAR/CODEUDOR')"><a href="javascript:void(0);">TITULAR/CODEUDOR</a></li>
					  </ul>
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
						<i class="fa fa-close"></i> Eliminar filtro
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
						  <th>Apellido</th>
						  <th>Nombre</th>
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
						  <td  style="cursor: pointer">{{person.surname}}</td>
						  <td  style="cursor: pointer">{{person.name}}</td>
						  <td  style="cursor: pointer">{{person.identityNumber}}</td>
						  <td  style="cursor: pointer">{{person.formattedBirthDate}}</td>
						  <td  style="cursor: pointer">{{person.genderName}}</td>
						  <td  style="cursor: pointer">{{person.phone}}</td>
						  <td  style="cursor: pointer">{{person.cellPhone}}</td>
						  <td class="txtPerson">
							<button type="button" class="btn btn-link" ng-click="goToEditPerson(person)"><i class="fa fa-pencil txtSuccess"></i></button>
							<button type="button" class="btn btn-link" ng-click="deletePerson(person)"><i class="fa fa-trash txtDanger"></i></button>
							<button type="button" class="btn btn-link" ng-click="goToDetail(person)"><i class="fa fa-eye txtSuccess"></i></button>	
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