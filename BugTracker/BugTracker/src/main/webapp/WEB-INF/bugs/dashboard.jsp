<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.19.1/css/mdb.min.css" />
</head>
<body>
	<div class="container-fluid bg">
		<div class="row d-flex justify-content-evenly">
			<h1 class="d-flex justify-content-center mt-3 dash-title col-9">
				Greetings
				<c:out value="${userName}! "></c:out>				
				 What would you like to do today?
			</h1>
		</div>
		
		<!-- nav bar -->
		<div>
			<nav class="nav mt-3 d-flex flex-column">
				<a class="nav-link" href="/dashboard">Home</a> <a class="nav-link"
					href="/bugs/new">Add Bug</a> <a class="nav-link" href="/logout">Logout</a>
			</nav>
		</div>
		<!-- nav bar -->
		
		<div class="d-flex justify-content-center">
		
		<div class="bugs-container">
			<table class="table table-dark table-striped table-hover">
				<thead>
					<tr>
						<th>Bug Name:</th>
						<th>Assigned Employee:</th>
						<th>Location:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bug" items="${bugs}">
						<tr>
							<td><a href="/bugs/${bug.id}"><c:out value="${bug.name}" /></a></td>
							<td><c:out value="${bug.user.firstName}" /></td>
							<td><c:out value="${bug.location}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		</div>
		
	</div>





	<!-- JQuery -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

	<script src="/js/script.js"></script>

</body>
</html>