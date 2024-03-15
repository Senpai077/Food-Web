<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>create branch</title>
<style type="text/css">
/* Global styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

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

/* Container styles */
.container {
    background-color: white;
    padding: 20px;
    margin: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* Form styles */
.form-group {
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.btn-primary {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-primary:hover {
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

<div class="container">
    <h1>Register Branch</h1>
    <form:form action="savebranch" modelAttribute="branch">
        <div class="form-group">
            <label for="name">Branch Name</label>
            <form:input path="name" id="name" class="form-control" />
        </div>
        <div class="form-group">
            <label for="email">Branch Email</label>
            <form:input path="email" id="email" class="form-control" />
        </div>
        <div class="form-group">
            <label for="phoneNumber">Branch Phone</label>
            <form:input path="phoneNumber" id="phoneNumber" class="form-control" />
        </div>
        <div class="form-group">
            <label for="address">Branch Address</label>
            <form:input path="address" id="address" class="form-control" />
        </div>
        <div class="form-group">
            <label for="user">Branch Manager</label>
            <form:select path="user.id" class="form-control">
                <form:options items="${branchManagers}" itemValue="id" itemLabel="name" />
            </form:select>
        </div>
        <button class="btn btn-primary">Create Branch</button>
    </form:form>
</div>

</body>
</html>