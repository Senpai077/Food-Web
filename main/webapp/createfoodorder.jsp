<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Food Product</title>
<style type="text/css">
/* Style for the body */
body {
    font-family: Arial, sans-serif;
    background-color: rgb(247, 223, 178);

}

/* Style for the heading */
h1 {
    font-size: 24px;
    margin: 20px 0;
    color: #333;
}

/* Style for the form container */
form {
   width: 100%;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: rgb(247, 223, 178);
    
}

/* Style for form labels */
form label {
    display: block;
    font-weight: bold;
    margin-top: 20px;
}

/* Style for form inputs */
form input[type="text"],
form input[type="email"],
form input[type="tel"],
form input[type="number"] {
    width: 50%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
}

/* Style for radio buttons */
form input[type="radio"] {
    margin-right: 5px;
    display: inline;
    
}

/* Style for each food item box */
.food-item-box {
    width: 20%;
    margin: 10px;
    padding: 10px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    text-align: center;
    display: inline-block;
    background-color: rgb(255, 185, 54);
}

/* Style for the Create button */
form button {
    display: block;
    margin: 20px auto;
    padding: 10px 20px;
 background-color: rgb(255, 170, 13);
	    color: #fff;
    border: none;
    border-radius: 3px;
    font-size: 16px;
    cursor: pointer;
}

form button:hover {
   background-color: rgb(177, 115, 0);
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
	            background-color: rgb(255, 170, 13);
	
}

.navbar-button {
	text-decoration: none;
	color: white;
	padding: 10px 20px;
	border-radius: 3px;
	font-size: 16px;
            background-color: rgb(255, 197, 90);
	
}

.navbar-button:hover {
            background-color: rgb(177, 115, 0);
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
form input[type="checkbox"] {
    transform: scale(1.5); /* Increase the size of the checkbox */
    margin-right: 5px;
}
.radio-buttons {
    display: inline-block;
    vertical-align: middle;
    margin: 20px; /* Adjust spacing as needed */
    width : 200px;
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
<form:form action="savefoodOrder" modelAttribute="foodOrder">
    
    
        Name : <form:input path="customerName" />
        <br>
        <br>
        Email : <form:input path="customerEmail" />
        <br>
        <br>
        phone : <form:input path="customerNumber" />
        <br>
        <br> 
   
   <div class="radio-buttons">
  			  Order status:<br><br>
  			  
  			  <table>
  			  	<tr>
  			  		<td><form:radiobutton path="status" value="PENDING"  /></td>
  			  		<td><b>PENDING</b></td>
  			  	</tr>
  			  	<tr>
  			  		<td> <form:radiobutton path="status" value="ONTHEWAY" /></td>
  			  		<td><b>ONTHEWAY</b></td>
  			  	</tr>
  			  	<tr>
  			  		<td> <form:radiobutton path="status" value="DELIVERED"  /></td>
  			  		<td><b>DELIVERED</b></td>
  			  	</tr>
  			  	<tr>
  			  		<td><form:radiobutton path="status" value="PREPARING" /></td>
  			  		<td><b>PREPARING</b></td>
  			  	</tr>
  			  
  			  </table>
    		        		 
    		  
		</div><br>
    	<br> 
    <div class="food-items-container">
        <c:forEach var="foodProduct" items="${menu.getFoodProducts() }">
            <div class="food-item-box">
            <p> select your order</p>
                <h3>${foodProduct.getName()}</h3>
                <p>Type: ${foodProduct.getType()}</p>
                <p>Price: ${foodProduct.getPrice()}</p>
                <p>Availability: ${foodProduct.getAvailabilty()}</p>
                <p>About: ${foodProduct.getAbout()}</p>
                <input type="number" name="quantity_${foodProduct.getId()}" placeholder="Quantity">
                <input type="checkbox" name="order_items" value="${foodProduct.getId()}">
            </div>
        </c:forEach>
    </div>
    <form:button>Create</form:button>
    <br>
    <br>
</form:form>
</body>
</html>
