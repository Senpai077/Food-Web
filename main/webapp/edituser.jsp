<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        /* Add your CSS styles here */

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }

        h1 {
            text-align: center;
            font-size: 24px;
        }

        .navbar {
            background-color: #007BFF;
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
            border: 2px solid transparent;
            border-radius: 5px;
        }

        .navbar-button:hover {
            background-color: #0056b3;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info img {
            width: 32px;
            height: 32px;
            margin-right: 10px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[readonly] {
            background-color: #f4f4f4;
            cursor: not-allowed;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <h1>Edit User</h1>
    <c:set var="userlogin" value="${userlogin}" scope="session" />

    <div class="navbar">
        <a class="navbar-button home-button" href="admin.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
        <div class="user-info">
            <img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt="User Icon">
            <span>Welcome, ${sessionScope.loginuser.getName()}</span>
        </div>
        <a class="navbar-button" href="login">Logout</a>
    </div>
    <form:form action="updateuser" modelAttribute="user">
        <label for="id">ID:</label>
        <form:input path="id" readonly="true" id="id" /><br><br>

        <label for="name">Name:</label>
        <form:input path="name" id="name" /><br><br>

        <label for="email">Email:</label>
        <form:input path="email" id="email" /><br><br>

        <label for="phoneNumber">Phone:</label>
        <form:input path="phoneNumber" id="phoneNumber" /><br><br>

        <label for="password">Password:</label>
        <form:input path="password" id="password" /><br><br>

        <label>Role:</label>
        <form:radiobutton path="role" value="BRANCHMANAGER" label="BRANCH MANAGER" />
        <form:radiobutton path="role" value="CUSTOMER" label="CUSTOMER" />
        <form:radiobutton path="role" value="STAFF" label="STAFF" /><br><br>

        <button>Edit</button><br><br>
    </form:form>
</body>

</html>
