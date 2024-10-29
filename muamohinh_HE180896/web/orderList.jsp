<%-- 
    Document   : orderList
    Created on : Jul 6, 2024, 10:13:27 PM
    Author     : hihihihaha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Your Orders</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: 'Poppins', Arial, sans-serif;
            }
            .container {
                margin-top: 50px;
            }
            h1 {
                color: #5ecaf0;
                text-align: center;
                margin-bottom: 30px;
            }
            table {
                background-color: white;
            }
            th {
                background-color: #5ecaf0;
                color: white;
            }
            .btn-back {
                background-color: #5ecaf0;
                color: white;
                margin-top: 20px;
            }
            .btn-back:hover {
                background-color: turquoise;
            }
        </style>
    </head>
    <body>
        <div class="py-1 bg-primary">
            <div class="container">
                <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                    <div class="col-lg-12 d-block">
                        <div class="row d-flex">
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                                <span class="text">+ 8488 6920 143</span>
                            </div>
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                                <span class="text">thaison02004@gmail.com</span>
                            </div>
                            <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
                                <span class="text">3-5 Business days delivery &amp; Free Returns</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <h1>Customer Orders</h1>
            <c:if test="${empty orders}">
                <p class="text-center">You have no orders.</p>
            </c:if>
            <c:if test="${not empty orders}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>User ID</th>
                            <th>Total Price</th>
                            <th>Order Date</th>
                            <th>Status</th>
                            <th>View details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.userId}</td>
                                <td>${order.totalPrice}</td>
                                <td>${order.orderDate}</td>
                                <td>${order.status}</td>
                                <td>
                                    <a href="viewOrderDetails?orderId=${order.id}" class="btn btn-info btn-sm">View Details</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <a href="home" class="btn btn-back">Return to Home</a>
        </div>
    </body>
</html>