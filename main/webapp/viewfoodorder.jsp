<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<style type="text/css">
<style type="text/css">
/* Style for the body */
body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
}

/* Style for the navbar */
.navbar {
    background-color: #e74226;
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
    background-color: #b8311e;
}

.logout-button:hover, .blue-button:hover {
    background-color: #ff6037;
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

/* Style for the table */
.branch-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.branch-table th, .branch-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.branch-table th {
    background-color: #e74226;
    color: white;
}

.branch-table tr:nth-child(even) {
    background-color: #fff;
}

.branch-table tr:nth-child(odd) {
    background-color: #f2f2f2;
}

.branch-table td a {
    text-decoration: none;
    color: #e74226;
}

.branch-table td a:hover {
    text-decoration: underline;
}

/* Page styles */
.food-order-form {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
}

h3 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #e74226;
}
.blue-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #e74226;
    color: white;
    text-decoration: none;
    border-radius: 3px;
    transition: background-color 0.3s;
}

.blue-button:hover {
    background-color: #b8311e;
}
</style>


</head>
<body>
<c:set var="userlogin" value="${userlogin}" scope="session" />
<div class="navbar">
 <c:if test="${userlogin.role eq 'STAFF'}">
    <a class="home-button" href="staff.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
    </c:if> 
 <c:if test="${userlogin.role eq 'CUSTOMER'}">
    <a class="home-button" href="customer.jsp?sessionId=${sessionScope.userlogin.getId()}">Home</a>
    </c:if> 
    <div class="user-info">
        <img src="https://cdn1.iconfinder.com/data/icons/human-resources-1-6/128/1-1024.png" alt="User Icon"> <span>Welcome, ${sessionScope.userlogin.getName()}</span>
    </div>
    <a class="logout-button" href="login">Logout</a>
</div>

    <form action="update-food-order">
        <table class="branch-table">
            <tr>
                <th>Product ID</th>
                <th>Customer Name</th>
                <th>Customer Number</th>
                <th>Order Email</th>
                <th>Order Date</th>
                <th>Order Status</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Order Created By</th>
                 <c:if test="${userlogin.role eq 'STAFF'}">
                <th>Edit</th>
                <th>Delete</th>
                 </c:if>
            </tr>

            <c:forEach var="foodOrder" items="${foodOrders}">
                <tr>
                    <td>${foodOrder.getId()}</td>
                    <td>${foodOrder.getCustomerName()}</td>
                    <td>${foodOrder.getCustomerNumber()}</td>
                    <td>${foodOrder.getCustomerEmail()}</td>
                    <td>${foodOrder.getOrderDeliveryTime()}</td>
                    <td>${foodOrder.getStatus()}</td>
                    <td>${foodOrder.getItems().size()}</td>
                    <td>${foodOrder.getTotalPrice()}</td>
                    <td>${foodOrder.getUser().getName()}</td>
                        <c:if test="${userlogin.role eq 'STAFF'}">
                    <td><a href="editfoodOrder?id=${foodOrder.getId()}">Edit</a></td>
                    <td><a href="deletefoodOrder?id=${foodOrder.getId()}">Delete</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </form>
    <c:if test="${userlogin.role eq 'STAFF'}">
    <a class="blue-button" href="createfoodorder">Create Food Order</a>
</c:if>  


</body>
</html>
