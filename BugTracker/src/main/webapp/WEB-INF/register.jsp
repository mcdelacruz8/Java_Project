<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
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

		<div class="row d-flex justify-content-center">
			<h1 class="d-flex justify-content-center mt-3 title">Register New
				Employee</h1>
		</div>
		
		
		<div class="d-flex justify-content-center" style="height: 650px;">
		<div class="form-container-reg d-flex justify-content-center bg-dark text-white">
			<form:form action="/register" method="post" modelAttribute="newUser"
				class="col-8">
				<div class="form-group">
					<label>UserID:</label>
					<form:input path="userId" class="form-control" />
					<form:errors path="userId" class="text-danger" />
				</div>
				<div class="form-group">
					<label>First Name:</label>
					<form:input path="firstName" class="form-control" />
					<form:errors path="firstName" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Last Name:</label>
					<form:input path="lastName" class="form-control" />
					<form:errors path="lastName" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Confirm Password:</label>
					<form:password path="confirm" class="form-control" />
					<form:errors path="confirm" class="text-danger" />
				</div>
				
				<div class="d-flex justify-content-between mt-4">
					<div>
						<input type="submit" value="Register" class="btn btn-outline-success" />
					</div>
					<div class="mt-1">
						<a href="/login">back to login page</a>
					</div>
				</div>
			</form:form>
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