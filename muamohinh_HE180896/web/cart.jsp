<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
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
    </head>
    <body class="goto-here">
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
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown04">
                                <a class="dropdown-item" href="shop">Shop</a>

                                <a class="dropdown-item" href="cart.jsp">Cart</a>

                            </div>
                        </li>
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
            <h1 class="hello-nav" style="text-align: center; color: #82ae46; font-family: Georgia, serif;">Your Shopping Cart</h1>

            <c:if test="${empty sessionScope.cart.items}">
                <p class="empty-cart-message">Your cart is empty.</p>
            </c:if>

            <c:if test="${not empty sessionScope.cart.items}">
                <<table class="table">
                    <thead class="thead-primary">
                        <tr class="text-center">                      
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>                           
                            <th>Total</th>                                                               
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${sessionScope.cart.items}">
                            <tr>
                                <td>
                                    ${item.product.name}
                                    <br>
                                    <img src="${item.product.image}" alt="${item.product.name}" style="max-width: 100px; max-height: 100px;">
                                </td>
                                <td><fmt:formatNumber value="${item.product.price}" type="currency"/></td>
                                <td>
                                    <form action="updateCart" method="post" class="update-form">
                                        <input type="hidden" name="productId" value="${item.product.id}">
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" class="quantity-input">
                                        <input type="submit" value="Update" class="btn btn-secondary">
                                    </form>
                                </td>
                                <td><fmt:formatNumber value="${item.product.price * item.quantity}" type="currency"/></td>
                                <td>
                                    <form action="removeFromCart" method="post">
                                        <input type="hidden" name="productId" value="${item.product.id}">
                                        <input type="submit" value="Remove" class="btn btn-danger" >
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3">Total:</td>
                            <td><fmt:formatNumber value="${sessionScope.cart.totalPrice}" type="currency"/></td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>

                <div class="cart-actions">
                    <form action="checkout" method="post">
                        <input type="submit" value="Proceed to Checkout" class="btn btn-primary">
                    </form>
                    <a href="home" class="btn btn-secondary">Continue Shopping</a>
                </div>
            </c:if>
        </div>
    </body>
</html>