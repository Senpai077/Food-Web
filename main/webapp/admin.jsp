<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style type="text/css">
/* Reset some default styles */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

/* Body styles */
body {
	font-family: "Arial", sans-serif;
	background-color: #f5f5f5;
	margin: 0;
}

/* Navbar styles */
.navbar {
	background-color: #007bff;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
	height: 60px;
}

.navbar-button {
	text-decoration: none;
	color: white;
	padding: 10px 20px;
	border-radius: 3px;
	font-size: 16px;
}

.navbar-button:hover {
	background-color: #0056b3;
}

.user-info {
	display: flex;
	align-items: center;
	color: white;
}

.user-info img {
	width: 24px;
	height: 24px;
	margin-right: 5px;
}

/* Wrapper styles */
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.inner {
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* Button styles */
button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 3px;
	cursor: pointer;
	margin-top: 10px;
	width: 200px; /* Set a fixed width for all buttons */
	height: 40px; /* Set a fixed height for all buttons */
}

button span a {
	text-decoration: none;
	color: white;
}

button:hover {
	background-color: #0056b3;
}
</style>
<title>Admin page</title>
</head>
<body>

	<c:set var="userlogin" value="${userlogin}" scope="session" />
<c:set var="userid" value="${param.sessionId}" />
<c:set var="userlogin" value="${sessionScope.userlogin}" />
	<div class="navbar">
		<a class="navbar-button home-button" href="admin.jsp?sessionId=${sessionScope.userlogin.getId()}"> Home </a>
		<div class="user-info">
			<img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt="User-Icon"> <span>Welcome,${sessionScope.userlogin.getName()}</span>
		</div>
		<a class="navbar-button" href="login"> Logout </a>
	</div>
	<div class="wrapper">
		<div class="inner">
			<button>
				<span><a href="createbranch">Create Branch</a></span>
			</button>
			<button>
				<span><a href="findbranch">View Branch</a></span>
			</button>
			<button>
				<span><a href="finduser">View User</a></span>
			</button>

		</div>
	</div>


</body>
</html>