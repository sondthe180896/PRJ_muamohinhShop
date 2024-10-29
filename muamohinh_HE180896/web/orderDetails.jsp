<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Order Details</title>
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
            <h1>Order Details</h1>
            <h2>Order ID: ${order.id}</h2>
            <p>Order Date: ${order.orderDate}</p>
            <p>Total Price: <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="đ"/></p>
            <p>Status: ${order.status}</p>
            
            <h3>Payment Information</h3>
            <p>Name: ${paymentInfo.name}</p>
            <p>Address: ${paymentInfo.address}</p>
            <p>Phone: ${paymentInfo.phone}</p>

            <h3>Order Items</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orderItems}" var="item">
                        <tr>
                            <td>${item.productId}</td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="đ"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <a href="viewOrders" class="btn btn-back">Back to Orders</a>
        </div>
    </body>
</html>
