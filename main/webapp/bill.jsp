<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Order Bill</title>
    <style>
        /* Your CSS styles for the bill page go here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        
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

        .bill-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        p {
            margin: 10px 0;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .payment-button, .delete-button {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 3px;
            cursor: pointer;
        }

        .payment-button {
            background-color: #0077cc;
            color: #fff;
        }

        .delete-button {
            background-color: #ff3030;
            color: #fff;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<c:set var="userlogin" value="${userlogin}" scope="session" />
<c:set var="foodOrder" value="${foodOrder}" scope="session" />
    <div class="navbar">
        <a class="navbar-button home-button" href="staff.jsp?sessionId=${sessionScope.userlogin.getId()}"> Home </a>
    </div>
    <form:form action="paymentdone" >
        <div class="bill-container">
            <h1>Food Order Bill</h1>
            <p><strong>Customer Name:</strong> ${sessionScope.foodOrder.customerName}</p>
            <p><strong>Email:</strong> ${sessionScope.foodOrder.customerEmail}</p>
            <p><strong>Phone Number:</strong> ${sessionScope.foodOrder.customerNumber}</p>
            <p><strong>Number of Items:</strong> ${sessionScope.foodOrder.items.size()}</p>
            <p><strong>Total Price:</strong> ${sessionScope.foodOrder.totalPrice}</p>
            
            <div class="button-container">
                <button type="submit" class="payment-button">Payment</button>
                <a href="deletefoodOrder?id=${foodOrder.getId()}" class="delete-button">CANCEL</a>
                <a href="staff.jsp?sessionId=${sessionScope.userlogin.getId()}" class="payment-button">COD</a>
            </div>
        </div>
    </form:form>
</body>
</html>
