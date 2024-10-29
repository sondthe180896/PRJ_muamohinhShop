<%-- 
    Document   : HomePage
    Created on : Jun 24, 2024, 10:27:52 AM
    Author     : hihihihaha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List, java.util.ArrayList, model.Product"%>
<!DOCTYPE html>
<html lang="en">
    <head>

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
        <link rel="stylesheet" href="scss/style.scss">
        <style>
            .pagination .page-item.active .page-link {
                background-color: #5ecaf0;
                border-color: #5ecaf0;
            }

            .pagination .page-link {
                color: #5ecaf0;
            }

            .pagination .page-link:hover {
                color: #fff;
                background-color: #5ecaf0;
                border-color: #5ecaf0;
            }
            .card {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 15px;
                margin-bottom: 20px;
            }

            .card-header {
                background-color: #007bff;
                color: white;
                padding: 10px;
                font-weight: bold;
            }

            .category_block {
                padding: 0;
            }

            .list-group-item {
                border: none;
                padding: 10px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .list-group-item:hover {
                background-color: #f0f0f0;
            }

            .list-group-item.active-category {
                background-color: #007bff;
                color: white;
            }

            .list-group-item a {
                text-decoration: none;
                color: inherit;
            }

            .list-group-item.active-category a {
                color: white;
            }
            #loctimkiem{
                margin-top: 15px;
                display: flex;
                justify-content: space-evenly;
            }
            .filterform{
                display: flex;
                justify-content: space-evenly;
            }
        </style>
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
                <a href="home"><img src="images/logo.png" alt="alt" style="width: 200px"/></a>
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
        <c:if test="${sessionScope.account != null}">
            <h1 class="hello-nav" style="text-align: center; color: #5ecaf0; font-family: Georgia, serif;">
                Welcome ${sessionScope.account.name}
            </h1>
        </c:if>
        <section id="home-section" class="hero">
            <div class="home-slider owl-carousel" style="height: 300px">
                <div class="slider-item" style="background-image: url(images/bg_3.jpg);height: 300px">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                            <div class="col-md-12 ftco-animate text-center" style="height: 300px">
                                <h3 class="mb-2" style="color: white">muamohinh</h3>
                                <h2 class="subheading mb-4">We deliver Car Model</h2>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="slider-item" style="background-image: url(images/bg_2.jpg);height: 300px">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                            <div class="col-md-12 ftco-animate text-center" style="height: 300px">
                                <h3 class="mb-2" style="color: white">muamohinh</h3>
                                <h2 class="subheading mb-4">We deliver Car Model</h2>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM-->
    <center>
        <div id="loctimkiem">
            <div class="card bg-light mb-4" style="width: 100%;">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-filter"></i> Filter Products</div>
                <div class="card-body">
                    <form class="filterform" action="filterproductsv" method="GET">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="form-group">
                                            <label for="category">Select Category:</label>
                                            <select class="form-control" id="category" name="cid">
                                                <option value="">Select a category...</option>
                                                <c:forEach items="${listC}" var="category">
                                                    <option value="${category.cid}" ${tag == category.cid ? 'selected' : ''}>${category.cname}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <label for="brand">Select Brand:</label>
                                            <select class="form-control" id="brand" name="brand">
                                                <option value="">Select a brand...</option>
                                                <option value="Toyota">Toyota</option>
                                                <option value="Ford">Ford</option>
                                                <option value="Chevrolet">Chevrolet</option>
                                                <option value="Ferrari">Ferrari</option>
                                                <option value="BMW">BMW</option>
                                                <option value="Audi">Audi</option>
                                                <option value="Lamborghini">Lamborghini</option>
                                                <option value="Mercedes-Benz">Mercedes-Benz</option>
                                                <option value="Porsche">Porsche</option>
                                                <option value="Tesla">Tesla</option>
                                                <option value="Honda">Honda</option>
                                                <option value="Nissan">Nissan</option>
                                                <option value="Hyundai">Hyundai</option>
                                                <option value="Kia">Kia</option>
                                                <option value="Jeep">Jeep</option>
                                                <option value="Mazda">Mazda</option>
                                                <option value="Subaru">Subaru</option>
                                                <option value="RAM">RAM</option>
                                                <option value="GMC">GMC</option>
                                                <option value="McLaren">McLaren</option>
                                                <option value="Aston Martin">Aston Martin</option>
                                                <option value="Bugatti">Bugatti</option>
                                                <option value="Volkswagen">Volkswagen</option>
                                                <option value="Dodge">Dodge</option>
                                                <option value="Chrysler">Chrysler</option>
                                                <option value="Jaguar">Jaguar</option>
                                                <!-- Add more options as needed -->
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <label for="price1">Price from:</label>
                                            <input type="text" class="form-control" id="price1" name="price1"
                                                   placeholder="Min Price">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <label for="price2">Price to:</label>
                                            <input type="text" class="form-control" id="price2" name="price2"
                                                   placeholder="Max Price">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary btn-filter">Filter</button>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </center>
    <!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM--><!--LỌC SẢN PHẨM-->


    <!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN-->

    <!--
            <div id="loctimkiem">
                <div class="card bg-light mb-4" style="width: 30%;">
                    <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                    <div class="card-body">
                        <form action="category" method="GET">
                            <div class="form-group">
                                <label for="category">Select Category:</label>
                                <select class="form-control" id="category" name="cid">
                                    <option value="">Select a category...</option>
    <c:forEach items="${listC}" var="category">
        <option value="${category.cid}" ${tag == category.cid ? 'selected' : ''}>${category.cname}</option>
    </c:forEach>
</select>
</div>
<button type="submit" class="btn btn-primary">Filter</button>
</form>
</div>
</div>


<div class="card bg-light mb-4" style="width: 30%;">
<div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Brands</div>
<div class="card-body">
<form action="ProductByBrand" method="GET">
<div class="form-group">
<label for="brand">Select Brand:</label>
<select class="form-control" id="brand" name="brand">
    <option value="">Select a brand...</option>
    <option value="Toyota">Toyota</option>
    <option value="Ford">Ford</option>
    <option value="Chevrolet">Chevrolet</option>
    <option value="Ferrari">Ferrari</option>
    <option value="BMW">BMW</option>
    <option value="Audi">Audi</option>
    <option value="Lamborghini">Lamborghini</option>
    <option value="Mercedes-Benz">Mercedes-Benz</option>
    <option value="Porsche">Porsche</option>
    <option value="Tesla">Tesla</option>
    <option value="Honda">Honda</option>
    <option value="Nissan">Nissan</option>
    <option value="Hyundai">Hyundai</option>
    <option value="Kia">Kia</option>
    <option value="Jeep">Jeep</option>
    <option value="Mazda">Mazda</option>
    <option value="Subaru">Subaru</option>
    <option value="RAM">RAM</option>
    <option value="GMC">GMC</option>
    <option value="McLaren">McLaren</option>
    <option value="Aston Martin">Aston Martin</option>
    <option value="Bugatti">Bugatti</option>
    <option value="Volkswagen">Volkswagen</option>
    <option value="Dodge">Dodge</option>
    <option value="Chrysler">Chrysler</option>
    <option value="Jaguar">Jaguar</option>
     Add more options as needed 
</select>
</div>
<button type="submit" class="btn btn-primary">Filter</button>
</form>
</div>
</div>


<div class="card bg-light mb-4" style="width: 30%;">
<div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Price Range</div>
<div class="card-body">
<form action="ProductByPrice" method="GET">
<div class="form-group">
<label for="price1">Price from:</label>
<input type="text" class="form-control" id="price1" name="price1" placeholder="Min Price">
</div>
<div class="form-group">
<label for="price2">Price to:</label>
<input type="text" class="form-control" id="price2" name="price2" placeholder="Max Price">
</div>
<button type="submit" class="btn btn-primary">Filter</button>
</form>
</div>

</div>
</div><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN--><!--LỌC TỪNG PHẦN-->
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading" style="font-size: 50px">Our Products</span>
                </div>
            </div>   		
        </div>
        <div class="container">
            <div class="row mt-4">        
                <c:choose>
                    <c:when test="${not empty listP}">
                        <c:forEach var="product" items="${listP}">
                            <div class="col-md-4 mb-4">
                                <div class="card h-100">
                                    <a href="detail?pid=${product.id}">  <!-- Thêm liên kết cho ảnh -->
                                        <img src="${not empty product.image ? product.image : 'images/default-product.jpg'}" 
                                             class="card-img-top" alt="${product.name}" style="height: 275px">
                                    </a>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">
                                            <a href="detail?pid=${product.id}" class="text-dark">  <!-- Thêm liên kết cho tên -->
                                                ${product.name}
                                            </a>
                                        </h5>
                                        <p class="card-text">
                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="đ"/>
                                        </p>
                                        <div class="d-flex justify-content-around">
                                            <a href="detail?pid=${product.id}" class="btn btn-outline-secondary btn-sm">
                                                <i class="ion-ios-menu"></i> Details
                                            </a>
                                            <a href="#" onclick="addToCart(${product.id}); return false;" class="btn btn-primary btn-sm">
                                                <i class="ion-ios-cart"></i> Add to Cart
                                            </a>
                                            <a href="${pageContext.request.contextPath}/wishlist?action=add&productId=${product.id}" class="btn btn-outline-danger btn-sm">
                                                <i class="ion-ios-heart"></i> Wishlist
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-12 text-center">
                            <p>No products available at the moment.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Pagination -->
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="home?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </section>
    <c:if test="${not empty latestProduct}">
        <section class="ftco-section img" style="background-image: url('${latestProduct.image}');">
            <div class="container">
                <div class="row justify-content-end">
                    <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate" style="background-color: rgba(255, 255, 255, 0.8); padding: 20px; border-radius: 10px;">
                        <span class="subheading" style="font-size: 50px; color: red">Newest Product</span>
                        <h2 class="mb-4" style=" color: coral">Deal of the day</h2>
                        <p style="color: black">${latestProduct.description}</p>
                        <div class="product">
                            <a href="detail?pid=${latestProduct.id}">
                                <h3 style="text-align: center; color: black">${latestProduct.name}</h3>
                                <p style="text-align: center; color: black">${latestProduct.description}</p>
                                <p style="text-align: center; color: black">Price: <fmt:formatNumber value="${latestProduct.price}" type="currency" currencySymbol="đ"/></p>
                            </a>
                        </div>
                        <div id="timer" class="d-flex mt-5">
                            <div class="time pl-3" style=" color: red" id="hours"></div>
                            <div class="time pl-3" style=" color: red" id="minutes"></div>
                            <div class="time pl-3" style=" color: red" id="seconds"></div>
                        </div>
                    </div> 
                </div>                            
            </div>
        </section>      
    </c:if>









    <section class="ftco-section testimony-section">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate text-center">
                    <span class="subheading">Testimony</span>
                    <h2 class="mb-4">Our satisfied customer says</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
                </div>
            </div>

        </div>
    </section>

    <hr>

    <section class="ftco-section ftco-partner">
        <div class="container">
            <div class="row">
                <div class="col-sm ftco-animate">
                    <a href="#" class="partner"><img src="images/partner-1.png" class="img-fluid" alt="Colorlib Template"></a>
                </div>
                <div class="col-sm ftco-animate">
                    <a href="#" class="partner"><img src="images/partner-2.png" class="img-fluid" alt="Colorlib Template"></a>
                </div>
                <div class="col-sm ftco-animate">
                    <a href="#" class="partner"><img src="images/partner-3.png" class="img-fluid" alt="Colorlib Template"></a>
                </div>
                <div class="col-sm ftco-animate">
                    <a href="#" class="partner"><img src="images/partner-4.png" class="img-fluid" alt="Colorlib Template"></a>
                </div>
                <div class="col-sm ftco-animate">
                    <a href="#" class="partner"><img src="images/partner-5.png" class="img-fluid" alt="Colorlib Template"></a>
                </div>
            </div>
        </div>
    </section>
    <section class="ftco-section">
        <div class="container">
            <div class="row no-gutters ftco-services">
                <div class="col-md-4 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-shipped"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Free Shipping</h3>
                            <span>On order over $100</span>
                        </div>
                    </div>      
                </div>
<!--                <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-diet"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Always Fresh</h3>
                            <span>Product well package</span>
                        </div>
                    </div>    
                </div>-->
                <div class="col-md-4 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-award"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Superior Quality</h3>
                            <span>Quality Products</span>
                        </div>
                    </div>      
                </div>
                <div class="col-md-4 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-customer-service"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Support</h3>
                            <span>24/7 Support</span>
                        </div>
                    </div>      
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
                                                        // Nếu đã đăng nhập, thực hiện thêm vào giỏ hàng
                                                        window.location.href = 'addToCart?productID=' + productId;
                                                    } else {
                                                        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
                                                        window.location.href = 'login.jsp';
                                                    }
                                                }
    </script>
</body>
</html>
