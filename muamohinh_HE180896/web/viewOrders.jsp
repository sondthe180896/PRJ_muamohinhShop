<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Your Orders</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
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
            .btn-pay {
                background-color: #5ecaf0;
                color: white;
            }
            .btn-pay:hover {
                background-color: #72a438;
            }
            .btn-delete {
                background-color: #c74f50;
                color: white;
            }
            .btn-delete:hover {
                background-color: #fb0303;
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
            <h1>Your Orders</h1>
            <c:if test="${empty orders}">
                <p class="text-center">You have no orders.</p>
            </c:if>
            <c:if test="${not empty orders}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Total Price</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.orderDate}</td>
                                <td><fmt:formatNumber value="${order.totalPrice}" type="number" pattern="#,##0" var="formattedPrice" />
                                    ${formattedPrice}</td>
                                <td>${order.status}</td>
                                <td>
                                    <c:if test="${order.status eq 'Pending'}">
                                        <a href="payment?orderId=${order.id}" class="btn btn-pay btn-sm">Pay</a>
                                        <a href="deleteOrder?orderId=${order.id}" class="btn btn-delete btn-sm" onclick="return confirm('Are you sure you want to delete this order?')">Delete</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <a href="home" class="button-secondary btn btn-back"">Return to Home</a>
        </div>
    </body>
    <!--</html>-->