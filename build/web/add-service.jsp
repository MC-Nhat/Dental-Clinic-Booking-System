<%-- 
    Document   : add-service
    Created on : May 22, 2023, 9:09:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <style>

            h1 {
                text-align: center;
                font-family: Tahoma, Arial, sans-serif;
                color: #06D85F;
                margin: 80px 0;
            }

            .box {
                width: 40%;
                margin: 0 auto;
                background: rgba(255,255,255,0.2);
                padding: 35px;
                border: 2px solid #fff;
                border-radius: 20px/50px;
                background-clip: padding-box;
                text-align: center;
            }

            .button {
                font-size: 1em;
                padding: 10px;
                color: #fff;
                border: 2px solid #06D85F;
                border-radius: 20px/50px;
                text-decoration: none;
                cursor: pointer;
                transition: all 0.3s ease-out;
            }
            .button:hover {
                background: #06D85F;
            }

            .overlay {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                background: rgba(0, 0, 0, 0.7);
                transition: opacity 500ms;
                visibility: hidden;
                opacity: 0;
            }
            .overlay:target {
                visibility: visible;
                opacity: 1;
            }
            .active{
                visibility: visible;
                opacity: 1;
            }
            .popup {
                margin: 70px auto;
                padding: 20px;
                background: #fff;
                border-radius: 5px;
                width: 30%;
                position: relative;
                transition: all 5s ease-in-out;
            }

            .popup h2 {
                margin-top: 0;
                color: #333;
                font-family: Tahoma, Arial, sans-serif;
            }
            .popup .close {
                position: absolute;
                top: 20px;
                right: 30px;
                transition: all 200ms;
                font-size: 30px;
                font-weight: bold;
                text-decoration: none;
                color: #333;
            }
            .popup .close:hover {
                color: #06D85F;
            }
            .popup .content {
                max-height: 30%;
                overflow: auto;
            }

            @media screen and (max-width: 700px){
                .box{
                    width: 70%;
                }
                .popup{
                    width: 70%;
                }
            }
        </style>
    </head>
    <body>
        <c:if test="${sessionScope.User.getRoleID() != 1}"><c:redirect url="login.jsp"/></c:if>
            <div class="main-wrapper">

            <jsp:include page="header.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Thêm Dịch Vụ</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group" id="formFullName">
                                            <label>Tên dịch vụ <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" id="name" required="">
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group" id="formEmail">
                                            <label>Mô tả <span class="text-danger">*</span></label>
                                            <textarea rows="7" class="form-control" type="text"  name="mota" id="mota" required=""></textarea>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group" id="formPhoneNumber">
                                            <label>Giá tiền <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" id="price" required="">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="display-block">Status</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="status" name="status" id="product_active" value="true" checked>
                                        <label class="form-check-label" for="product_active">
                                            Active
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="status" name="status" id="product_inactive" value="false">
                                        <label class="form-check-label" for="product_inactive">
                                            Inactive
                                        </label>
                                    </div>
                                </div>
                                <div class="m-t-20 text-center"> 
                                    <a onclick="addService(this)" class="btn btn-primary submit-btn">Tạo</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="popup1" class="overlay">
                    <div class="popup">
                        <h2>Thành Công</h2>
                        <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                        <div class="content">
                            Đã Thêm Mới Dịch Vụ Thành Công.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                            function addService() {
                                let name = document.getElementById('name').value;
                                let mota = document.getElementById('mota').value;
                                let price = document.getElementById('price').value;
                                let status = document.querySelector('input[name=status]:checked').value;
                                let labels = Array.from(document.getElementsByClassName('errorMessage'));
                                labels.forEach(element => {
                                    element.remove();
                                });
                                if (name === '' || name.length < 5) {
                                    let fullNameForm = document.getElementById('formFullName');
                                    fullNameForm.innerHTML += '<label class="errorMessage" style="color: red;">Tên không được để trống</label>';
                                } else if (mota === '' || mota.length < 5) {
                                    let fullMoTaForm = document.getElementById('formEmail');
                                    fullMoTaForm.innerHTML += '<label class="errorMessage" style="color: red;">Mô tả không được để trống</label>';
                                } else if (price === '') {
                                    let phoneNumberForm = document.getElementById('formPhoneNumber');
                                    phoneNumberForm.innerHTML += '<label class="errorMessage" style="color: red;">Giá tiền không được để trống</label>';
                                } else {
                                    $.ajax({
                                        url: '/SWP391-SE1743/MainController',
                                        data: {
                                            action: 'AddService',
                                            name: name,
                                            mota: mota,
                                            price: price,
                                            status: status
                                        },
                                        success: function (data) {
                                            const div = document.querySelector('.overlay');
                                            div.classList.add('active');
                                        },
                                        error: function (error) {
                                            console("Fail");
                                        },
                                        type: 'GET'
                                    });
                                }
                            }
                            function closePopUp() {
                                const div = document.querySelector('.overlay');
                                div.classList.remove('active');
                            }
        </script>
    </body>
</html>