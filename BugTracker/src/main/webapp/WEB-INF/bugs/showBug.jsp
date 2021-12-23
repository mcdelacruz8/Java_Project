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
<link type="text/css" rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.19.1/css/mdb.min.css" />
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
		<!-- Try a different way -->
		<div class="d-flex justify-content-center">
			<div class="desc">
				<div class="card" style="width: 50rem; border-radius: 2rem;">
					<!-- <img src="../images/styling_show_page_err.png" class="card-img-top"
					alt="ssbp_err" style="border-radius: 3rem; height: 200px"> -->
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
		<!-- Try a different way -->
		<!-- Description section -->

		<!-- Some Bug Fun -->
		<div class="position-relative">
			<div style="height: 100px; width: 400px">

				<h4 class="position-fixed"
					style="bottom: 220px; left: 60px; display: inline-block">SQUISH!</h4>
				<img src="../images/blue_bug.png" alt="bug blue"
					class="position-fixed bug-img"
					style="border-radius: 3rem; height: 200px;" onclick="remove(this)">
			</div>
		</div>
		<!-- Some Bug Fun -->

		<!-- Some More Bug Fun -->
		<div class="position-relative">
			<div style="height: 100px; width: 400px">

				<h4 class="position-fixed"
					style="top: 220px; right: 60px; display: inline-block">SQUISH!</h4>
				<img src="../images/red_bug.png" alt="bug red"
					class="position-fixed bug-img"
					style="border-radius: 3rem; height: 120px; top: 180px; right: 50px; display: inline-block"
					onclick="remove(this)">
			</div>
		</div>
		<!-- Some More Bug Fun -->

		<!-- EVEN More Bug Fun -->
		<div class="position-relative">
			<div style="height: 100px; width: 400px">

				<h5 class="position-fixed"
					style="bottom: 220px; right: 170px; display: inline-block">SQUISH!</h5>
				<img src="../images/funny_bug.jpeg" alt="bug funny"
					class="position-fixed bug-img"
					style="border-radius: 3rem; height: 120px; width: 150px; bottom: 180px; right: 140px; display: inline-block"
					onclick="remove(this)">
			</div>
		</div>
		<!-- EVEN More Bug Fun -->



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