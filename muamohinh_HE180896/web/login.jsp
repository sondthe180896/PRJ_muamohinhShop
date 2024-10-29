
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, java.util.ArrayList"%>
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
                <h1>Login Form</h1>
                <p style="color: red">${requestScope.key}</p>
                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                <form class="login-form" action="login" method="post">
                    <input type="text" name="username" placeholder="Username" value="${cookie.cuser.value}" required/>
                    <input type="password" name="password" placeholder="Password" value="${cookie.cpass.value}" required/>
                    <input type="checkbox" 
                    ${(cookie.crem!=null?'checked':'')}
                    id="rem" name="rem" value="ON">
                        <label for="rem">Remember me</label>
                   
                    <button>Login</button>
                    <p class="message"><a href="signup.jsp">Signup now</a></p>
                </form>
            </div>
        </div>
    </center>
</body>
</html>
