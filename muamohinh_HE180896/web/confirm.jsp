<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        .message {
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .button {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body >
    <div class="container">
        <h1>Order Confirmation</h1>
        
        <%
        String confirmationMessage = (String) session.getAttribute("orderConfirmation");
        if (confirmationMessage != null && !confirmationMessage.isEmpty()) {
        %>
            <div class="message">
                <%= confirmationMessage %>
            </div>
        <%
            // Clear the message from the session
            session.removeAttribute("orderConfirmation");
        }
        %>
        
        <p>Thank you for your order. We will process it as soon as possible.</p>
        
        <a href="home" class="button">Return to Home</a>
    </div>
</body>
</html>