<html>
<head>
<style type="text/css">
/* Reset some default styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Apply a background color to the entire page */
body {
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
    text-align: center;
}

/* Style the header */
header {
    background-color: #ff5722;
    color: #fff;
    padding: 20px 0;
}

header h1 {
    font-size: 36px;
}

/* Style the main content section */
main {
    padding: 20px;
}

/* Style the message section */
.message {
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    padding: 20px;
    margin-bottom: 20px;
}

.message p {
    font-size: 18px;
    color: #333;
}

/* Style the buttons section */
.buttons {
    display: flex;
    justify-content: center;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    margin: 0 10px;
    background-color: #ff5722;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 18px;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #e64a19;
}

/* Style the footer */
footer {
    background-color: #333;
    color: #fff;
    padding: 10px 0;
}

footer p {
    font-size: 14px;
}

</style>

</head>
<body>
 <header>
        <h1>Welcome to the Food App</h1>
    </header>
    <main>
        <section class="message">
            <p>Discover delicious dishes and satisfy your cravings!</p>
        </section>
        <section class="buttons">
            <a href="login" class="btn">Sign In</a>
            <a href="signup" class="btn">Sign Up</a>
        </section>
    </main>
    <footer>
        <p>&copy; 2023 Food App</p>
    </footer>
</body>
</html>
