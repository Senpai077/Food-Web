<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<style type="text/css">
/* Style for the body and navbar */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.navbar {
    background-color: #333;
    overflow: hidden;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
}

.home-button, .logout-button, .blue-button {
    color: white;
    text-decoration: none;
    padding: 10px 20px;
    border-radius: 3px;
}

.home-button:hover {
    background-color: #555;
}

.logout-button:hover, .blue-button:hover {
    background-color: #0077cc;
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

/* Table styles */
table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 20px;
    border: 2px solid red;
}

table th, table td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
}

table th {
    background-color: #0077cc;
    color: #fff;
}

table td a {
    text-decoration: none;
    color: #0077cc;
}

table td a:hover {
    text-decoration: underline;
}

/* Page styles */
h1 {
    text-align: center;
}

.blue-button {
    display: inline-block;
    padding: 10px 20px;
    margin: 10px;
    background-color: #0077cc;
    color: #fff;
    text-decoration: none;
    border-radius: 3px;
}

.blue-button:hover {
    background-color: #0055aa;
}

</style>
</head>
<body>
<c:set var="userlogin" value="${userlogin}" scope="session" />
<div class="navbar">
    <a class="home-button" href="branchmanager.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
    <div class="user-info">
        <img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt=""> <span>Welcome, ${sessionScope.userlogin.getName()}</span>
    </div>
    <a class="logout-button" href="login">Logout</a>
</div>
<h1>Menu ID: ${menu.getId()}</h1>
<table>
    <tr>
        <th>Product ID</th>
        <th>Product Name</th>
        <th>Product Type</th>
        <th>Product Price</th>
        <th>Product Availability</th>
        <th>About</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="foodProduct" items="${menu.getFoodProducts()}">
        <tr>
            <td>${foodProduct.getId()}</td>
            <td>${foodProduct.getName()}</td>
            <td>${foodProduct.getType()}</td>
            <td>${foodProduct.getPrice()}</td>
            <td>${foodProduct.getAvailabilty()}</td>
            <td>${foodProduct.getAbout()}</td>
            <td><a href="editproduct?id=${foodProduct.getId()}">Edit</a></td>
            <td><a href="deletemenu?id=${foodProduct.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<a class="blue-button" href="creatproduct">ADD</a><br>

</body>
</html>
