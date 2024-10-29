<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Wishlist</title>
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
        <link rel="stylesheet" href="css/cart.css">

        <link rel="stylesheet" href="css/style.css">
        <style>
            .wishlist-actions {
                margin-top: 20px;
                text-align: right;
            }
            .empty-wishlist-message {
                text-align: center;
                font-size: 18px;
                color: #82ae46;
                margin-top: 50px;
            }
        </style>
    </head>

    <body class="goto-here">
        <script>
            var isLoggedIn = ${sessionScope.account != null};
        </script>
        <script>
            function confirmRemove(form) {
                if (confirm("Are you sure you want to remove this item from your wishlist?")) {
                    form.submit();
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
                    <li class="nav-item cta cta-colored" style="margin-bottom: 20px">
                        <a href="cart.jsp" class="nav-link">
                            <span class="icon-shopping_cart"></span>[${sessionScope.cart.totalQuantity}]
                        </a>
                    </li>
                </div>
            </div>
        </nav>
        <--<!-- END NAV -->


        <div class="container">
            <h1 class="hello-nav" style="text-align: center; color: #82ae46; font-family: Georgia, serif;">Your Wishlist</h1>

            <c:if test="${empty wishlistItems}">
                <p class="empty-wishlist-message">Your wishlist is empty.</p>
            </c:if>

            <c:if test="${not empty wishlistItems}">
                <table class="table">
                    <thead class="thead-primary">
                        <tr class="text-center">
                            <th>Product</th>
                            <th>Price</th>
                            <th>Add to Cart</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${wishlistItems}">
                            <tr>
                                <td>
                                    ${product.name}
                                    <br>
                                    <img src="${product.image}" alt="${product.name}" style="max-width: 100px; max-height: 100px;">
                                </td>
                                <td><fmt:formatNumber value="${product.price}" type="currency"/></td>
                                <td>
                                    <a href="#" onclick="addToCart(${product.id});
                                            return false;" class="btn btn-primary btn-sm">
                                        <i class="ion-ios-cart"></i> Add to Cart
                                    </a>
                                </td>
                                <td>
                                    <form action="removeFromWishlist" method="post" onsubmit="return confirmRemove(this);">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <button type="submit" class="btn btn-danger btn-sm">
                                            <i class="ion-ios-trash"></i> Remove
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="wishlist-actions">
                    <a href="home" class="btn btn-secondary">Continue Shopping</a>
                </div>
            </c:if>
        </div>

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