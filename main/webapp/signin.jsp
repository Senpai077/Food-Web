<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<style type="text/css">
/* Reset some default styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    display: flex;
    flex-direction : column;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Container styles */
.container {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 300px;
    text-align: center;
}

/* Header styles */
h1 {
    color: #e84a27;
    font-size: 24px;
    margin-bottom: 20px;
}

/* Input styles */
input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

/* Button styles */
button {
    background-color: #e84a27;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #d43f1f;
}

/* Sign-up link */
a {
    color: #e84a27;
    text-decoration: none;
    font-size: 14px;
}

a:hover {
    text-decoration: underline;
}
/* Form container */
.container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f7f7f7;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

/* Form header */
.container h1 {
    font-size: 24px;
    margin-bottom: 20px;
}

/* Form fields */
.form-group {
    margin-bottom: 15px;
    text-align: left;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input[type="text"],
.form-group input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

/* Error message */
.error-message {
    background-color: #f44336;
    color: white;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 15px;
}

/* Submit button */
button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 3px;
    cursor: pointer;
}

/* Submit button hover effect */
button:hover {
    background-color: #0056b3;
}

/* Sign up link */
.signup-link {
    font-size: 14px;
    color: #007bff;
    text-decoration: none;
}

/* Sign up link hover effect */
.signup-link:hover {
    text-decoration: underline;
}

</style>
</head>
<body>

	<br><c:if test="${not empty errorMessage}">
    <div class="error-message">
        <p>${errorMessage}</p>
    </div>
</c:if>


	<form:form action="loginin" modelAttribute="user">
		
		<br><h1>Sign-in form</h1>
		<div>
			<label for="email">
				Email</label>
				<form:input path="email" id="email" required="true" />
		</div>
		<div>
			<label for="password">Password</label>
			<form:password path="password" id="password" required="true" />
		</div>
		<button>
			<span>Log-In</span>
		</button>
		<p>
			Not a user? <a href="signup">Sign Up</a>
		</p>
	</form:form>





</body>
</html>