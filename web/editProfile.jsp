<%-- 
    Document   : editProfile
    Created on : May 27, 2023, 4:33:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <!-- edit-profile23:03-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
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
        </style>
    </head>

    <body>
        <div class="main-wrapper">
            <c:set var="u" value="${sessionScope.User}"></c:set>
                <div class="page-wrapper">
                    <div class="content">
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="page-title">Chỉnh Sửa Thông Tin</h4>
                            </div>
                        </div>
                        <div class="card-box">
                            <h3 class="card-title">Thông Tin Cơ Bản</h3>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="profile-img-wrap">
                                        <img class="inline-block" src="assets/img/user.jpg" alt="user">
                                        <div class="fileupload btn">
                                            <span class="btn-text">chỉnh sửa</span>
                                            <input class="upload" type="file">
                                        </div>
                                    </div>
                                    <div class="profile-basic">
                                        <div class="row" >
                                            <div style="margin-bottom: 15px" class="col-md-6" id="formName">
                                                    <label class="focus-label">Họ Tên</label>
                                                    <input id="name" type="text" class="form-control floating" value="${u.getFullName()}">
                                        </div>
                                        <div style="margin-bottom: 15px" class="col-md-6">
                                                <label class="focus-label">Email</label>
                                                <input id="email" type="text" class="form-control floating" value="${u.getEmail()}" disabled="">
                                        </div>
                                        <div style="margin-bottom: 15px" class="col-md-6" id="formPhoneNumber">
                                                <label class="focus-label">Số điện thoại</label>
                                                <input id="phoneNumber" class="form-control floating" type="number" value="0${u.getPhoneNumber()}">
                                        </div>
                                        <div class="col-md-6">
                                                <label class="focus-label">Giới Tính</label>
                                                <select id="gender" class="select form-control floating">
                                                    <option value="Nam">Nam</option>
                                                    <option value="Nữ">Nữ</option>
                                                    <option value="Khác">Khác</option>
                                                </select>
                                        </div>
                                        <div class="col-md-6">
                                                <label class="focus-label">Vai Trò</label>
                                                <c:choose>
                                                    <c:when test = "${u.getRoleID() ==  1}" ><input class="form-control floating" type="text" value="Admin"
                                                           disabled=""></c:when>
                                                    <c:when test = "${u.getRoleID() ==  3}" ><input class="form-control floating" type="text" value="Marketing"
                                                           disabled=""></c:when>
                                                    <c:otherwise><input class="form-control floating" type="text" value="Chăm Sóc Khách Hàng"
                                                           disabled=""></c:otherwise>
                                                </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center m-t-20">
                        <button onclick="saveProfile(this,${u.getId()})" class="btn btn-primary submit-btn" type="button">CẬP NHẬT</button>
                    </div>
                    <div id="popup1" class="overlay">
                        <div class="popup">
                            <h2>Thành Công</h2>
                            <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                            <div class="content">
                                Đã Cập Nhật Thông Tin. Chúc Sức Khỏe.<br>
                                <a href="myprofile.jsp">Xem Thông Tin Tài Khoản</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script>
                                function saveProfile(btn, user) {
                                    let name = document.getElementById('name');
                                    let phoneNumber = document.getElementById('phoneNumber');
                                    let gender = document.getElementById('gender');
                                    if (name.value.length <= 4) {
                                        let formName = document.getElementById('formName');
                                        formName.innerHTML += '<label class="errorMessage" style="color: red;">Họ Tên phải nhiều hơn 4 kí tự </label>';
                                    } else if (phoneNumber.value.length < 10) {
                                        let formPhoneNumber = document.getElementById('formPhoneNumber');
                                        formPhoneNumber.innerHTML += '<label class="errorMessage" style="color: red;">Số Điện Thoại không phù hợp</label>';
                                    } else {
                                        $.ajax({
                                            url: '/SWP391-SE1743/EditMyProfileController',
                                            data: {
                                                action: 'Edit My Profile',
                                                id: user,
                                                name: name.value,
                                                phoneNumber: phoneNumber.value,
                                                gender: gender.value
                                            },
                                            success: function (data) {
                                                const div = document.querySelector('.overlay');
                                                div.classList.add('active');
                                            },
                                            error: function (error) {
                                                console("Fail");
                                            },
                                            type: 'POST'
                                        });
                                    }

                                }
        </script>
    </body>
</html>