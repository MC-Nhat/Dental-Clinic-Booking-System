<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : May 19, 2023, 9:27:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>Login</title>
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="lib/twentytwenty/twentytwenty.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="lib/twentytwenty/jquery.event.move.js"></script>
        <script src="lib/twentytwenty/jquery.twentytwenty.js"></script>

        <!-- Customized Login Stylesheet -->
        <link rel="stylesheet" href="css/login.css">
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
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
            <a href="index.jsp" class="navbar-brand p-0">
                <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.jsp" class="nav-item nav-link">Trang Chủ</a>
                    <a href="aboutus.jsp" class="nav-item nav-link active">Về Chúng Tôi</a>
                    <a href="ServiceUserController" class="nav-item nav-link">Dịch Vụ</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Khác</a>
                        <div class="dropdown-menu m-0">
                            <a href="price.html" class="dropdown-item">Bảng giá</a>
                            <a href="MainController?action=showDentist" class="dropdown-item">Nha sĩ của chúng tôi</a>
                            <a href="testimonial.html" class="dropdown-item">Chứng thực</a>
                            <a href="index.jsp" class="dropdown-item">Cuộc hẹn</a>
                        </div>
                    </div>

                    <a href="contact.jsp" class="nav-item nav-link">Liên Hệ</a>

                </div>
                <button type="button" class="btn text-dark" data-bs-toggle="modal" data-bs-target="#searchModal"><i
                        class="fa fa-search"></i></button>
                <a href="appointment.html" class="btn btn-primary py-2 px-4 ms-3">Đăng Ký Cuộc Hẹn</a>
            </div>
        </nav>
        <div class="login-wrap">
            <div class="login-html">
                <h4 class="tab" style="color: white">Tôi cần thêm thông tin để có thể liên hệ bạn</h4>
                <div class="login-form">
                    <c:set var="id" value="${requestScope.id}"></c:set>
                    <c:set var="name" value="${requestScope.name}"></c:set>
                    <c:set var="email" value="${requestScope.email}"></c:set>
                    <c:set var="loginByGg" value="${requestScope.logbygg}"></c:set>
                    <c:set var="loginByFb" value="${requestScope.logbyfb}"></c:set>
                    <c:if test="${not empty message}">
                        <script>
                            alert('${message}');
                        </script>
                    </c:if>
                    <c:if test="${loginByGg}">
                        <form action="MainController" method="post">
                            <div class="group">
                                <label class="label">Họ Và Tên</label>
                                <input style="border-radius: 0" name="accountName" type="text" class="input" value="" required="">
                            </div>
                            <div class="group">
                                <label class="label">Email</label>
                                <input style="border-radius: 0" name="gmail" type="text" class="input" value="${email}" readonly>
                            </div>
                            <div class="group">
                                <label class="label">Số Điện Thoại</label>
                                <input style="border-radius: 0" name="numberPhone" type="text" class="input" value="" required="">
                            </div>
                            <style>
                                .radio-group {
                                    display: inline-block;
                                    color: white;
                                }

                                .radio-group label {
                                    margin-right: 10px;
                                }
                            </style>                            
                            <div class="group">
                                <label class="label" style="margin-bottom: 5px;">Giới Tính</label>
                                <div class="radio-group">
                                    <input style="border-radius: 0" type="radio" name="gender" id="genderMale" value="Nam" checked>
                                    <label for="genderMale">Nam</label>
                                </div>
                                <div class="radio-group">
                                    <input style="border-radius: 0" type="radio" name="gender" id="genderFemale" value="Nữ">
                                    <label for="genderFemale">Nữ</label>
                                </div>
                            </div>
                            <div class="group">
                                <button style="background-color: #06A3DA; border-radius: 0;" type="submit" class="button" name="action" value="logbygg">Tiếp tục</button>
                            </div>
                            <input name="idGoogle" type="hidden" value="${id}">
                        </form>
                    </c:if>
                    <c:if test="${loginByFb}">
                        <form action="MainController" method="POST">
                            <div class="group">
                                <label class="label">Họ Và Tên</label>
                                <input style="border-radius: 0" name="accountName" type="text" class="input" value="${name}" required="">
                            </div>
                            <div class="group">
                                <label class="label">Email</label>
                                <input style="border-radius: 0" id="gmaillogbyfb" name="gmail" type="text" class="input" value="" required pattern="[a-zA-Z0-9._%+-]+@gmail\.com">
                            </div>
                            <div class="group">
                                <label class="label">Số Điện Thoại</label>
                                <input style="border-radius: 0" name="numberPhone" type="text" class="input" value="" required="">
                            </div>
                            <div class="group">
                                <label class="label">Giới Tính</label>
                                <select style="border-radius: 0" name="gender" class="input" aria-label="Default select example">
                                    <option value="Nam">Nam</option>
                                    <option value="Nữ">Nữ</option>
                                </select>
                            </div>
                            <div class="group">
                                <button style="background-color: #06A3DA; border-radius: 0;" type="submit" class="button" name="action" value="logbyfb">Tiếp tục</button>
                            </div>
                            <input name="idFacebook" type="hidden" value="${id}">
                        </form>                        
                    </c:if>
                </div>
            </div>
        </div>
        <div id="popup1" class="overlay">
            <div class="popup">
                <h2>Thành Công</h2>
                <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                <div class="content">
                    Chúc Sức Khỏe.
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>            
        <script>
                    document.getElementById('gmaillogbyfb').addEventListener('change', function () {
                    var gmail = document.getElementById('gmaillogbyfb').value;
                    $.ajax({
                    url: '/SWP391-SE1743/MainController',
                            method: 'POST',
                            data: {
                            action: 'Check Appointment Date',
                                    gmail: gmail
                            },
                            success: function (response, status, xhr) {
                            if (xhr.status === 200) {
                            option.disabled = true;
                            option.style.color = 'gray';
                            }
                            },
                            error: function (error) {
                            console.error('Error: ' + error);
                            }
                    });
                    timeSelect.appendChild(option);
                    }
                    }
                    } else {
                    // Nếu không chọn ngày hẹn, ẩn phần tử chọn thời gian hẹn
                    document.getElementById('timeSelection').style.display = 'none';
                    }
                    });
        </script>
    </body>
</html>
