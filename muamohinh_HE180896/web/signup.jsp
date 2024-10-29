<%-- 
    Document   : signup
    Created on : Jun 3, 2024, 8:47:03 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="scss/styleLogin.css">
    </head>
    <body>
     <center>
        <div class="login-page">
            <div class="form">
                <h1>Sign Up Form</h1>
                <p style="color: red">${requestScope.key}</p>
                <form class="login-form" action="signup" method="post">
                    
                    <div class="name">
                        <input type="text" name="firstname" placeholder="First Name" value="" required/>
                        <input type="text" name="lastname" placeholder="Last Name" value="" required/>
                    </div>
                    <input type="email" name="email" placeholder="Email Address" value="" required/>
                    <input type="text" name="username" placeholder="Username" value="" required/>
                    <input type="password" name="password" placeholder="Password" value="" required/>
                    <button type="submit">Get Started</button>
                    <p class="message">Already registered? <a href="login.jsp">Login now</a></p>
                </form>
            </div>
        </div>
    </center>
</body>
</html>