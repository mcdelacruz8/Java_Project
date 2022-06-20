<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Bug</title>
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
			<h1 class="d-flex justify-content-center mt-3 dash-title col-7">
				<c:out value="Details of ${bug.name}" />
				Bug :
			</h1>
		</div>

		<!-- nav bar -->
		<div>
			<nav class="nav mt-3 d-flex flex-column">
				<a class="nav-link" href="/dashboard">Home</a> <a class="nav-link"
					href="/bugs/new">Add Bug</a> <a class="nav-link"
					href="/bugs/${bug.id}/edit">Edit Bug</a> <a class="nav-link"
					href="/logout">Logout</a>
			</nav>
		</div>
		<!-- nav bar -->

		<!-- Description section -->
		<div class="d-flex justify-content-center">
			<div class="desc">
				<div class="card" style="width: 50rem; border-radius: 2rem;">
					<h5 class="card-header">Description Notes:</h5>
					<div class="card-body">
						<p class="card-text">
							<c:out value="${bug.description}"></c:out>
						</p>
					</div>
				</div>
			</div>
		</div>

		<div class="d-flex justify-content-center mt-5">
			<form action="/bugs/${bug.id}" method="post">
				     <input type="hidden" name="_method" value="delete">
				     <input type="submit" value="Solved!" class="btn btn-danger "
					style="border-radius: 3rem;">
			</form>
		</div>
		<!-- Description section -->

		<!-- Some Bug Fun -->
		<div class="position-relative">
			<div style="height: 100px; width: 400px">
				<img src="../images/blue_bug.png" alt="bug blue"
					class="position-fixed bug-img"
					style="border-radius: 3rem; height: 200px;" onclick="remove(this)">
			</div>
		</div>
		<!-- Some Bug Fun -->

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