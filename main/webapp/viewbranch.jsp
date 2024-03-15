<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Branch</title>
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
    .branch-table {
        border: 2px solid red;
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }

    .branch-table th,
    .branch-table td {
        border: 2px solid red;
        padding: 8px;
        text-align: left;
    }

    .branch-table th {
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
</head>
<body>
  
  
  <c:set var="userlogin" value="${userlogin}" scope="session" />

<div class="navbar">
    <a class="navbar-button home-button" href="admin.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
    <div class="user-info">
        <img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt="User Icon">
        <span>Welcome, ${sessionScope.userlogin.getName()}</span>
    </div>
   
    <a class="navbar-button" href="login">Logout</a>
</div>

<table class="branch-table">
    <tr>
        <th>Branch ID</th>
        <th>Branch Name</th>
        <th>Branch Email</th>
        <th>Branch Phone</th>
        <th>Branch Address</th>
        <th>Branch Manager</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach var="branch" items="${branches}">
        <tr>
            <td>${branch.getId()}</td>
            <td>${branch.getName()}</td>
            <td>${branch.getEmail()}</td>
            <td>${branch.getPhoneNumber()}</td>
            <td>${branch.getAddress()}</td>
            <td>${branch.getUser().getName()}</td>
            <td><a href="editbranch?id=${branch.getId()}">Edit</a></td>
            <td><a href="deletebranch?id=${branch.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
</table>

<a class="blue-button" href="createbranch">Add</a>

    
</body>
</html>