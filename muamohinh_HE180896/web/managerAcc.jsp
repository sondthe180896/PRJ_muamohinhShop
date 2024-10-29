<%-- 
    Document   : wishlist
    Created on : Jun 26, 2024, 1:22:01 AM
    Author     : hihihihaha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List, java.util.ArrayList, model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Vegefoods - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body class="goto-here">
        <script>
            function confirmRemove(link) {
                if (confirm("Are you sure you want to remove this item?")) {
                    window.location.href = link.href;
                }
                return false;
            }
        </script>
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
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a href="home"><img src="images/logo.png" alt="alt" style="width: 200px; height:
                                    60px"/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"><a href="home" class="nav-link">Home</a></li>

                        <c:if test="${sessionScope.account.role == 1}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Management
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="manager">Manage Products</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="manageracc">Manage Accounts</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="viewOrders">View All Orders</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account.role == 2}">
                            <li class="nav-item"><a class="nav-link" href="viewOrder?id=${sessionScope.account.id}">View Orders</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">
                            <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Settings
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="changePassword.jsp">Change Password</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="logout">Logout</a></li>
                                </ul>
                            </li>
                        </c:if>

                    </ul>

                    <!-- Phần tìm kiếm -->
                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-number">
                                    <i class="icon-search"></i>
                                </button>
                            </div>
                        </div>

                    </form>

                    <!-- Giỏ hàng -->
                    <li class="nav-item cta cta-colored" style="margin-bottom: 20px">
                        <a href="cart.jsp" class="nav-link">
                            <span class="icon-shopping_cart"></span>[${sessionScope.cart.totalQuantity}]
                        </a>
                    </li>

                </div>
            </div>
        </nav>
        <!-- END nav -->

        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_3.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"></span> <span>Manager Account</span></p>
                        <h1 class="mb-0 bread">Account</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-cart">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 navbar-brand">
                        <h2><b>Manage Account</b></h2>
                    </div>

                    <div class="col-sm-6" style="margin-bottom: 20px">
                        <a href="#addAccountModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a>

                    </div>


                    <div class="col-md-12 ftco-animate">
                        <div class="cart-list">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr class="text-center">

                                        <th>Username</th>
                                        <th>Password</th> 
                                        <th>Name</th> 
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listP}" var="o">
                                        <tr>

                                            <td>${o.username}</td>
                                            <td>${o.password}</td>
                                            <td>${o.name}</td>
                                            <td>${o.email}</td>
                                            <td>${o.role}</td>
                                            <td>
                                                <a href="loadAccount?pid=${o.id}" class="edit" data-toggle="modal">
                                                    <i class="material-icons" title="Edit">edit</i>
                                                </a>
                                                <a href="deleteacc?pid=${o.id}" class="delete" data-toggle="modal" onclick="return confirmRemove(this);" >
                                                    <i class="material-icons" title="Delete">delete</i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="addAccountModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addacc" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Username</label>
                                <input name="username" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input name="password" type="password" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <select name="role" class="form-select" aria-label="Default select example">
                                    <option value="1">Admin</option>
                                    <option value="2">User</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
            <div class="container py-4">
                <div class="row d-flex justify-content-center py-5">

                </div>
            </div>
        </section>
        <footer class="ftco-footer ftco-section">
        <div class="container">
            <div class="row">
                <div class="mouse">
                    <a href="#" class="mouse-icon">
                        <div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
                    </a>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">muamohinh</h2>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                            <li class="ftco-animate"><a href="home"><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="home"><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="home"><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4 ml-md-5">
                        <h2 class="ftco-heading-2">Menu</h2>
                        <ul class="list-unstyled">
                            <li><a href="home" class="py-2 d-block">Shop</a></li>
                            <li><a href="home" class="py-2 d-block">About</a></li>
                            <li><a href="home" class="py-2 d-block">Journal</a></li>
                            <li><a href="home" class="py-2 d-block">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Help</h2>
                        <div class="d-flex">
                            <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
                                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
                                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
                                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
                                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
                            </ul>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">FAQs</a></li>
                                <li><a href="#" class="py-2 d-block">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md">
                    <div class="ftco-footer-widget mb-4">
                        <h2 class="ftco-heading-2">Have a Questions?</h2>
                        <div class="block-23 mb-3">
                            <ul>
                                <li><span class="icon icon-map-marker"></span><span class="text">Thắng Lơi, Thường Tín, Hà Nội</span></li>
                                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+84 8869 20 143</span></a></li>
                                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">sondthe180896@fpt.edu.vn</span></a></li>
                                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">thaison02004@gmail.com</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

        <script>
                                                    $(document).ready(function () {

                                                        var quantitiy = 0;
                                                        $('.quantity-right-plus').click(function (e) {

                                                            // Stop acting like a button
                                                            e.preventDefault();
                                                            // Get the field name
                                                            var quantity = parseInt($('#quantity').val());

                                                            // If is not undefined

                                                            $('#quantity').val(quantity + 1);


                                                            // Increment

                                                        });

                                                        $('.quantity-left-minus').click(function (e) {
                                                            // Stop acting like a button
                                                            e.preventDefault();
                                                            // Get the field name
                                                            var quantity = parseInt($('#quantity').val());

                                                            // If is not undefined

                                                            // Increment
                                                            if (quantity > 0) {
                                                                $('#quantity').val(quantity - 1);
                                                            }
                                                        });

                                                    });

        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
    </body>
</html>