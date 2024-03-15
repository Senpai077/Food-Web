<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
/* Navbar styles */
.navbar {
	background-color: #007bff;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 20px;
}

.navbar-button {
	text-decoration: none;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.navbar-button:hover {
	background-color: #0056b3;
}

.user-info img {
	width: 24px;
	height: 24px;
	margin-right: 5px;
}

/* Table styles */
.user-table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

.user-table th, .user-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.user-table th {
	background-color: #f2f2f2;
}

/* Button styles */
.blue-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	margin-top: 20px;
	transition: background-color 0.3s;
}

.blue-button:hover {
	background-color: #0056b3;
}
</style>
<title>User</title>
</head>
<body>




	<c:set var="userlogin" value="${userlogin}" scope="session" />

	<div class="navbar">
		
		<c:if test="${userlogin.role eq 'BRANCHMANAGER'}">
    <a class="navbar-button home-button" href="branchmanager.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
</c:if>
		<c:if test="${userlogin.role eq 'ADMIN'}">
    <a class="navbar-button home-button" href="admin.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
</c:if>
		<div class="user-info">
			<img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt="User Icon"> <span>Welcome,
				${sessionScope.userlogin.getName()}</span>
		</div>
		<a class="navbar-button" href="login">Logout</a>
	</div>

	<table class="user-table">
		<tr>
			<th>User ID</th>
			<th>User Name</th>
			<th>Email</th>
			<th>Phone Number</th>
			<th>Role</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>

		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.getId()}</td>
				<td>${user.getName()}</td>
				<td>${user.getEmail()}</td>
				<td>${user.getPhoneNumber()}</td>
				<td>${user.getRole()}</td>
				<td><a href="edituser?id=${user.getId()}">Edit</a></td>
				<td><a href="deleteuser?id=${user.getId()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
 <c:if test="${userlogin.role eq 'BRANCHMANAGER'}">
    <a class="blue-button" href="createfoodorder">ADD FOOD PRODUCT</a>
</c:if>
</body>
</html>