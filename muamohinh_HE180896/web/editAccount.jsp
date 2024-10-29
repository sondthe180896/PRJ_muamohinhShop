<%-- 
    Document   : edit
    Created on : Jun 26, 2024, 7:52:21 AM
    Author     : hihihihaha
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>Edit Account</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">

                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="addProductForm" action="editacc" method="post">
                            <div id="errorMessages" class="alert alert-danger" style="display:none;"></div>
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${detail.id}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>UserName</label>
                                    <input value="${detail.username}" name="username" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input value="${detail.password}" name="password" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${detail.name}" name="name" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${detail.email}" name="email" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Role</label>
                                    <input value="${detail.role}" name="role" type="text" class="form-control" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
        <script>
            document.getElementById('addProductForm').addEventListener('submit', function (e) {
                var errorMessages = [];
                var errorDiv = document.getElementById('errorMessages');
                errorDiv.innerHTML = '';
                errorDiv.style.display = 'none';

                // Kiểm tra tên sản phẩm
                var name = document.getElementById('name').value;
                if (name.trim() === '') {
                    errorMessages.push('Tên sản phẩm không được để trống');
                }

                // Kiểm tra giá
                var price = document.getElementById('price').value;
                if (!Number.isInteger(Number(price)) || Number(price) <= 0) {
                    errorMessages.push('Giá phải là số nguyên dương');
                }

                // Kiểm tra số lượng trong kho
                var stock = document.getElementById('stock').value;
                if (isNaN(stock) || stock < 0 || !Number.isInteger(Number(stock))) {
                    errorMessages.push('Số lượng trong kho phải là số nguyên không âm');
                }

                // Thêm các kiểm tra khác tương tự cho các trường còn lại

                if (errorMessages.length > 0) {
                    e.preventDefault(); // Ngăn form được gửi đi
                    errorDiv.innerHTML = errorMessages.join('<br>');
                    errorDiv.style.display = 'block';
                }
            });
        </script>

    </body>
</html>