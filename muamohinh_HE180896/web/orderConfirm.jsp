<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
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
        .confirmation-box {
            background-color: white;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
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
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="confirmation-box">
                    <h1>Order Confirmation</h1>
                    <p>${sessionScope.orderConfirmation}</p>
                    <a href="viewOrder" class="btn btn-back">Back to Orders</a>
                </div>
            </div>v
</body>
</html>