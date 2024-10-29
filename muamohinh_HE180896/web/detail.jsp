<%-- 
    Document   : detail
    Created on : Jun 25, 2024, 3:27:12 PM
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
    </head>
    <body class="goto-here">
        <script>
            var isLoggedIn = ${sessionScope.account != null};
        </script>

        <div class="py-1 bg-primary">
            <div class="container">
                <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
                    <div class="col-lg-12 d-block">
                        <div class="row d-flex">
                            <div class="col-md pr-4 d-flex topper align-items-center">
                                <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                                <span class="text">+84 88 69 20 143</span>
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
                <a href="home"><img src="images/logo.png" alt="alt" style="width: 200px"/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"><a href="home" class="nav-link">Home</a></li>

                        <c:if test="${sessionScope.account.role == 1}">
                            <li class="nav-item"><a href="manageracc" class="nav-link">Manager Account</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account.role == 2}">
                            <li class="nav-item"><a href="manager" class="nav-link">Manager Product</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">
                            <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                            </c:if>

                        <c:if test="${sessionScope.account != null}">                         
                            <li class="nav-item"><a href="logout" class="nav-link">Logout</a></li>
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
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item cta cta-colored"><a href="cart" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- END nav -->

        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_3.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="index.html">Product</a></span> <span>Product Single</span></p>
                        <h1 class="mb-0 bread">Product Single</h1>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 ftco-animate">
                        <a href="#" class="image-popup"><img src="${detail.image}" class="img-fluid" alt="Colorlib Template"></a>
                    </div>
                    <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                        <h3>${detail.name}</h3>
                        <!--                        <div class="rating d-flex">
                                                    <p class="text-left mr-4">
                                                        <a href="#" class="mr-2">5.0</a>
                                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                        <a href="#"><span class="ion-ios-star-outline"></span></a>
                                                    </p>
                                                    <p class="text-left mr-4">
                                                        <a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">Rating</span></a>
                                                    </p>
                                                    <p class="text-left">
                                                        <a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">Sold</span></a>
                                                    </p>
                                                </div>-->
                        <div class="product-details">
                            <p class="price">
                                <strong>Giá: </strong><span><fmt:formatNumber value="${detail.price}" type="currency" currencySymbol="đ"/></span>
                            </p>

                            <p class="description">
                                <strong>Mô tả: </strong> ${not empty detail.description ? detail.description : 'Không có mô tả'}
                            </p>

                            <p class="brand">
                                <strong>Thương hiệu: </strong> ${not empty detail.brand ? detail.brand : 'Không có thông tin'}
                            </p>

                            <p class="stock">
                                <strong>Còn: </strong> ${detail.stock} sản phẩm
                            </p>

                            <p class="scale">
                                <strong>Kích thước: </strong> ${not empty detail.scale ? detail.scale : 'Không có thông tin'}
                            </p>
                        </div>
                        <p></p>
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <div class="form-group d-flex">
                                    <div class="select-wrap">
                                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="input-group col-md-6 d-flex mb-3">
                                <span class="input-group-btn mr-2">
                                    <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                        <i class="ion-ios-remove"></i>
                                    </button>
                                </span>
                                <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
                                <span class="input-group-btn ml-2">
                                    <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                        <i class="ion-ios-add"></i>
                                    </button>
                                </span>
                            </div>
                            <div class="w-100"></div>
                        </div>
                        <p><a href="#" onclick="addToCart(${detail.id})" class="btn btn-black py-3 px-5">Add to Cart</a></p>
                    </div>
                </div>
            </div>
        </section>



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
                            function addToCart(productId) {
                                if (isLoggedIn) {
                                    var quantity = document.getElementById('quantity').value;
                                    window.location.href = 'addToCart?productID=' + productId + '&quantity=' + quantity;
                                } else {
                                    window.location.href = 'login.jsp';
                                }
                            }

                            $(document).ready(function () {
                                var quantitiy = 0;
                                $('.quantity-right-plus').click(function (e) {
                                    e.preventDefault();
                                    var quantity = parseInt($('#quantity').val());
                                    if (quantity < 100) {
                                        $('#quantity').val(quantity + 1);
                                    }
                                });

                                $('.quantity-left-minus').click(function (e) {
                                    e.preventDefault();
                                    var quantity = parseInt($('#quantity').val());
                                    if (quantity > 1) {
                                        $('#quantity').val(quantity - 1);
                                    }
                                });
                            });
        </script>

    </body>
</html>