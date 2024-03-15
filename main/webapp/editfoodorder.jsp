<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit food order</title>
<style type="text/css">
/* Style for the body */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}

/* Style for the heading */
h1 {
    font-size: 24px;
    margin: 20px 0;
    color: #333;
}

/* Style for the form container */
form {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Style for form labels */
form label {
    display: block;
    font-weight: bold;
    margin-top: 10px;
}

/* Style for form inputs */
form input[type="text"],
form input[type="email"],
form input[type="tel"],
form input[type="number"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
}

/* Style for radio buttons */
form input[type="radio"] {
    margin-right: 5px;
}

/* Style for the table */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
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

table td input[type="number"] {
    width: 50px;
    text-align: center;
}

table td input[type="checkbox"] {
    margin: 0 auto;
    display: block;
}

/* Style for the Create button */
form button {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
    background-color: #0077cc;
    color: #fff;
    border: none;
    border-radius: 3px;
    font-size: 16px;
    cursor: pointer;
}

form button:hover {
    background-color: #0055aa;
}

</style>
</head>
<body>
<c:set var="userlogin" value="${userlogin}" scope="session" />
<div class="navbar">
		<a class="navbar-button home-button" href="staff.jsp?sessionId=${sessionScope.userlogin.getId()}"> Home </a>
		<div class="user-info">
			<img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt="User Icon"> <span>Welcome,${sessionScope.userlogin.getName()}</span>
		</div>
		<a class="navbar-button" href="login"> Logout </a>
	</div>
   <h1>Edit form</h1>
  <form:form action="updatefoodOrder" modelAttribute="foodOrder">
  
    Id : <form:input path="id" readonly="true"/>
		<br>
		<br>
    Name : <form:input path="customerName" />
		<br>
		<br>
   Email : <form:input path="customerEmail" readonly="true"/>
		<br>
		<br>
   phone : <form:input path="customerNumber" />
		<br>
		<br>
  
   Bill amount : <form:input path="totalPrice" readonly="true"/>
		<br>
		<br>
  
   staff id : <form:input path="user.id" readonly="true"/>
		<br>
		<br>
    Order status
  <form:radiobutton path="status" value="PENDING" label="PENDING" />
		<form:radiobutton path="status" value="ONTHEWAY" label="ONTHEWAY" />
		<form:radiobutton path="status" value="DELIVERD" label="DELIVERD" />
		<form:radiobutton path="status" value="PREPARING" label="PREPARING" />
		<br>
		<br>
   
    <form:button>edit</form:button>
  </form:form>
</body>
</html>