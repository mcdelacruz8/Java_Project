<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Bug</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" />
</head>
<body>
	<div class="container-fluid bg">
	
	<div class="row d-flex justify-content-evenly">
		<h1 class="d-flex justify-content-center mt-3 dash-title col-6">Edit Current Bug:</h1>
	</div>	
		
		
		<!-- nav bar -->
		<div>
			<nav class="nav mt-3 d-flex flex-column">
				<a class="nav-link" href="/dashboard">Home</a> 	
				<a class="nav-link" href="/bugs/new">Add Bug</a>
				<a class="nav-link" href="/logout">Logout</a>
			</nav>
		</div>
		<!-- nav bar -->
		
		<div class="d-flex justify-content-center">
		
		<div class="new-bug-container bg-dark">
		<form:form action="/bugs/${bug.id}/edit" method="post" modelAttribute="bug">
		<form:input type="hidden" path="user" value="${bug.getUser().getId()}"></form:input>
			<input type="hidden" name="_method" value="put">
			<p>
				<form:errors path="name" />
				<form:errors path="location" />
				<form:errors path="description" />
			</p>
			<p class="shadow p-3 mb-3 bg-white rounded">
				<form:label path="name" class="form-label">
			        Bug Name: 
			        <form:input path="name" class="form-control" />
				</form:label>
			</p>
			<p>
				<form:select path="user"
					class="form-select shadow p-3 mb-3 bg-white rounded">
					<option disabled selected value="">Assign an Employee:</option>
					<c:forEach items="${users}" var="user">
						<form:option value="${user.id}">
						${user.firstName}
					</form:option>
					</c:forEach>
				</form:select>
			</p>
			<p class="shadow p-3 mb-3 bg-white rounded">
				<form:label path="location" class="form-label">
			        Bug Location: 
			        <form:input path="location" class="form-control" />
				</form:label>
			</p>
			<p class="shadow p-3 mb-3 bg-white rounded">
				<form:label path="description" class="form-label">
			        Bug Description: 
			        <form:input path="description" class="form-control" />
				</form:label>
			</p>
			<form:input type="hidden" path="user" value="${user_id}" />
			<input type="submit" value="Update Bug"
				class="btn btn-outline-success shadow p-2 mb-2 rounded" />
		</form:form>
	</div>
	</div>
</div>
	
	
	
	
	

	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="/js/script.js"></script>
	
</body>
</html>