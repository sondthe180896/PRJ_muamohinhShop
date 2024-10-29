<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
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
        .payment-box {
            background-color: white;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .btn-confirm {
            background-color: #5ecaf0;
            color: white;
        }
        .btn-confirm:hover {
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
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="payment-box">
                    <h1>Payment for Order #${order.id}</h1>
                    <p class="text-center mb-4">Total Amount: <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="vnd"/></p>
                    <form action="payment" method="post">
                        <input type="hidden" name="orderId" value="${order.id}">
                        
                        <div class="form-group">
                            <label for="name">Full Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="address">Delivery Address:</label>
                            <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label for="phone">Phone Number:</label>
                            <input type="tel" class="form-control" id="phone" name="phone" required>
                        </div>
                        
                        <div class="text-center mt-4">
                            <input type="submit" value="Confirm Payment" class="btn btn-confirm btn-lg">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>