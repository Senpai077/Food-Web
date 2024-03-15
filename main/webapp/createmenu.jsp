<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Create Menu</title>
    <style>
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
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
            vertical-align: middle;
            margin-right: 5px;
            height : 24px;
            width : 24x;
        }

        /* Form styles */
        h1 {
            text-align: center;
            margin-top: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        form select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        form button {
            background-color: #e50914;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            padding: 10px 20px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #d10812;
        }
    </style>
</head>
<body>
    <c:set var="userlogin" value="${userlogin}" scope="session" />
    <div class="navbar">
        <a class="navbar-button home-button"
            href="branchmanager.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
        <div class="user-info">
            <img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt="User Icon">
            <span>Welcome, ${sessionScope.userlogin.getName()}</span>
        </div>
        <a class="navbar-button" href="login">Logout</a>
    </div>
    <h1>Create Menu</h1>
    <form:form action="savemenu" modelAttribute="menu">
        <div class="form-group">
            <label for="branchManager">Branch Manager</label>
            <%-- <form:select path="user.id">
                <form:options items="${branchManagers}" itemValue="id" itemLabel="name" />
            </form:select> --%>
             <form:input path="user.id" value="${userlogin.getId()}" readonly="true"/><br><br>
        </div>
        <button>Create Menu</button>
    </form:form>
</body>
</html>
