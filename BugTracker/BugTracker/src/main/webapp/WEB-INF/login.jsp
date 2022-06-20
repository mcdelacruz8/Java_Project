<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
	<div class="container-fluid bg ">
		<div class="row d-flex justify-content-center">

			<h1 class="d-flex justify-content-center mt-4 title col-7">
				<span style="font-weight: bold; font-style: italic;">THE </span>
				    ... Tracker of Bugs</h1>
			<!-- Form starts here -->
		</div>
		<div class="container d-flex justify-content-evenly mb-6">
			<div class="card comment position-relative" onclick="remove(this)"
				style="width: 20rem; border-radius: 3rem;">
				<img src="../images/bug_hover.jpeg" class="card-img-top "
					alt="bug hover" style="border-radius: 3rem;">

				<div class="card-body">
					<h4 class="card-title">Keep track of all the bugs you encounter!</h4>
					<p class=" card-text"><span style="color: red;">MESSAGE!</span> Site is used to log all bugs to prevent repeating errors.
						Click...
					<span class="font-italic">anywhere</span>
					...on this feature if you want it to disappear.
				</div>
			</div>

		

			<div class="col-6 form-container bg-dark text-white">
				<form:form action="/login" method="post" modelAttribute="newLogin">
					<div class="form-group">
						<label>UserID:</label>
						<form:input path="userId" class="form-control" />
						<form:errors path="userId" class="text-danger" />
					</div>
					<div class="form-group">
						<label>Password:</label>
						<form:password path="password" class="form-control" />
						<form:errors path="password" class="text-danger" />
					</div>
					<br>
					<div>
						<input type="submit" value="Login" class="btn btn-outline-success"
							style="border-radius: 3rem;" />
					</div>
				</form:form>
				<p class="mt-5">
					If New Employee <a href="/register">Click Here!</a>
				</p>
			</div>
		</div>
		<!-- Form ends here -->
	</div>




	<!-- JQuery -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>


	<script src="/js/script.js"></script>
</body>
</html>