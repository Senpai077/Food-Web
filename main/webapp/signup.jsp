<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<style>
/* Styles for the container */
.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #ffffff;
	border: 1px solid #e0e0e0;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 4px;
}

/* Header styles */
.container h1 {
	text-align: center;
	font-size: 24px;
	margin-bottom: 20px;
}

/* Form input styles */
.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-size: 14px;
	font-weight: bold;
}

.form-control {
	width: 80%;
	padding: 10px;
	border: 1px solid #e0e0e0;
	border-radius: 4px;
	font-size: 16px;
}

/* Radio button styles */
.form-group input[type="radio"]:checked+label {
	color: #007BFF; /* Change the color to light blue */
	font-weight: bold; /* Optionally, make the text bold */
}

/* Button styles */
.btn-primary {
	background-color: #e50914;
	color: #fff;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	padding: 12px 20px;
	cursor: pointer;
}

.btn-primary:hover {
	background-color: #d10812;
}

/* Text centering styles */
.text-center {
	text-align: center;
	margin-top: 20px;
}

/* Link styles */
.text-center a {
	color: #e50914;
	text-decoration: none;
}

.text-center a:hover {
	text-decoration: underline;
}
</style>
</head>

<body>
	<c:set var="userlogin" value="${userlogin}" scope="session" />
	<c:set var="userid" value="${param.sessionId}" />
	<c:set var="userlogin" value="${sessionScope.userlogin}" />
	<div class="container">
		<h1>Register Form</h1>
		<form:form action="saveuser" modelAttribute="user">
			<div class="form-group">
				<label for="name">Name</label>
				<form:input path="name" id="name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<form:input path="email" id="email" class="form-control" />
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone</label>
				<form:input path="phoneNumber" id="phoneNumber" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<form:password path="password" id="password" class="form-control" />
			</div>
			

			<!--   <div class="form-group">
                <label>Role</label>
                <input type="radio" name="role" value="BRANCHMANAGER" required> Branch Manager
                <input type="radio" name="role" value="CUSTOMER" required> Customer
                <input type="radio" name="role" value="STAFF" required> Staff
            </div> 
             -->
            
			<button class="btn btn-primary">Sign Up</button>
		</form:form>
		
		<p class="text-center">
			Already a user? <a href="login">Sign In</a>
		</p>
	</div>
</body>

</html>
