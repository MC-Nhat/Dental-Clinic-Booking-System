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
        <title>DentCare</title>
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
                    <a href="aboutus.jsp" class="nav-item nav-link">Về Chúng Tôi</a>
                    <a href="ServiceUserController" class="nav-item nav-link">Dịch Vụ</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Khác</a>
                        <div class="dropdown-menu m-0">
                            <a href="MainController?action=showDentist" class="dropdown-item">Nha sĩ của chúng tôi</a>
                            <a href="index.jsp" class="dropdown-item">Cuộc hẹn</a>
                        </div>
                    </div>

                    <a href="contact.jsp" class="nav-item nav-link">Liên Hệ</a>

                </div>
                <button type="button" class="btn text-dark" data-bs-toggle="modal" data-bs-target="#searchModal"><i
                        class="fa fa-search"></i></button>
                <a href="index.jsp" class="btn btn-primary py-2 px-4 ms-3">Đăng Ký Cuộc Hẹn</a>
            </div>
        </nav>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Đăng Nhập</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Đăng Kí</label>
                <div class="login-form">
                    <div class="sign-in-htm">
                        <form action="MainController" method="POST">
                            <div class="group">
                                <label for="user" class="label">Email</label>
                                <input style="border-radius: 0" id="user" name="accountName" type="text" class="input" value="${cookie.emailCookie.value}">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Mật Khẩu</label>
                                <input style="border-radius: 0" id="pass" name="password" type="password" class="input" data-type="password" value="${cookie.passwordCookie.value}">
                            </div>
                            <div class="group">
                                <input name="remember" id="check" type="checkbox" class="check" value="checked">
                                <label for="check"><span class="icon"></span> Nhớ Mật Khẩu</label></br>
                                <small style="color: #00E77F; margin-top: .3rem; font-size: 1rem">${requestScope.SIGNUP_SUCCESSFULLY}</small>
                                <small style="color: red; margin-top: .3rem; font-size: 1rem">${requestScope.SIGNUP_FAIL}</small>
                            </div>
                            <div class="group">
                                <button style="background-color: #06A3DA; border-radius: 0;" type="submit" class="button" name="action" value="Login">Đăng Nhập</button>
                            </div>
                            <div class="group">
                                <h3 style="color: white; text-align: center">Hoặc</h3>
                                <br>
                                <div>
                                    <a class="input" style="border-radius: 0; margin-bottom: 5px;"  href="https://www.facebook.com/dialog/oauth?client_id=254936600471264&redirect_uri=http://localhost:8084/SWP391-SE1743/login-facebook">
                                        <svg width="50" height="50" viewBox="0 0 50 50" style="margin-right: 5px;">
                                        <image xlink:href="img/iconfb.svg" width="50" height="50" />
                                        </svg>
                                        Đăng nhập bằng Facebook
                                    </a>
                                    <a class="input" style="border-radius: 0" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/SWP391-SE1743/login-google&response_type=code
                                       &client_id=48607043062-12cu71hg20p1gljop1vm7s6fjnjmcv3b.apps.googleusercontent.com&approval_prompt=force">
                                        <svg width="50" height="50" viewBox="0 0 50 50" style="margin-right: 5px;">
                                        <image xlink:href="img/icongg.svg" width="50" height="50" />
                                        </svg>
                                        Đăng nhập bằng Google
                                    </a> 
                                </div>
                            </div>

                        </form>
                        <div class="foot-lnk">
                            <a href="forgotPassword.jsp">Quên Mật Khẩu?</a>
                        </div>
                    </div>
                    <div class="sign-up-htm" >
                        <div class="group" id="formFullName">
                            <label for="user" class="label">Họ Và Tên</label>
                            <input style="border-radius: 0" id="fullName" name="fullName" type="text" class="input">
                        </div>
                        <div class="group" id="formEmail">
                            <label for="pass" class="label">Địa Chỉ Email</label>
                            <input style="border-radius: 0" id="email" name="email" type="text" class="input">
                        </div>
                        <div class="group" id="formPhoneNumber">
                            <label for="pass" class="label">Số Điện Thoại</label>
                            <input style="border-radius: 0" id="phoneNumber" name="phoneNumber" type="text" class="input">
                        </div>
                        <div class="group" id="formPassword">
                            <label for="pass" class="label">Mật Khẩu</label>
                            <input style="border-radius: 0" id="password1" name="password" type="password" class="input" data-type="password">
                        </div>
                        <div class="group">
                            <label for="pass" class="label">Nhập Lại Mật Khẩu</label>
                            <input style="border-radius: 0"  id="password2" type="password" class="input" data-type="password">
                        </div>
                        <div class="group" id="formSignUp">
                            <input onclick="signup(this)" style="background-color: #06A3DA; border-radius: 0;" type="submit" class="button" value="Đăng Kí">
                        </div>
                        <div class="foot-lnk">
                            <label style="cursor: pointer;" for="tab-1">Bạn Đã Là Thành Viên?</a>
                        </div>
                    </div>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                    function signup(btn) {
                        let name = document.getElementById('fullName');
                        let password1 = document.getElementById('password1');
                        let password2 = document.getElementById('password2');
                        let email = document.getElementById('email');
                        let phoneNumber = document.getElementById('phoneNumber');
                        let labels = Array.from(document.getElementsByClassName('errorMessage'));
                        labels.forEach(element => {
                            element.remove();
                        });
                        if (password1.value !== password2.value) {
                            let passwordForm = document.getElementById('formPassword');
                            passwordForm.innerHTML += '<label class="errorMessage" style="color: red;">Mật Khẩu Không Trùng Nhau</label>';
                        } else if (!password1.value.match('[a-z]') || !password1.value.match('[A-Z]') || !password1.value.match('[0-9]') || password1.value.length < 7) {
                            let passwordForm = document.getElementById('formPassword');
                            passwordForm.innerHTML += '<label class="errorMessage" style="color: red;">Mật khẩu phải dài hơn 7 kí tự phải chứ 1 ít nhất 1 kí tự HOA 1 số</label>';
                        } else if (name.value === '' || name.value.length < 5) {
                            let fullNameForm = document.getElementById('formFullName');
                            fullNameForm.innerHTML += '<label class="errorMessage" style="color: red;">Họ và Tên không được để trống</label>';
                        } else if (email.value === '' || !email.value.includes('@gmail.com')) {
                            let emailForm = document.getElementById('formEmail');
                            emailForm.innerHTML += '<label class="errorMessage" style="color: red;">Email không phù hợp</label>';
                        } else if (phoneNumber.value === '' || phoneNumber.value.length !== 10) {
                            let phoneNumberForm = document.getElementById('formPhoneNumber');
                            phoneNumberForm.innerHTML += '<label class="errorMessage" style="color: red;">Số điện thoại không phù hợp</label>';
                        } else {
                            $.ajax({
                                url: '/SWP391-SE1743/SignUpController',
                                data: {
                                    action: 'SignUp',
                                    fullName: name.value,
                                    password: password1.value,
                                    email: email.value,
                                    phoneNumber: phoneNumber.value
                                },
                                success: function (data) {
                                    if (data === 'success') {
                                        const div = document.querySelector('.overlay');
                                        div.classList.add('active');
                                        setTimeout(function () {
                                            location.reload();
                                        }, 2000);
                                    } else {
                                        let formSignUp = document.getElementById('formSignUp');
                                        formSignUp.innerHTML += '<label class="errorMessage" style="color: red; margin-top:5px">Email Đã Được Đăng Kí</label>';
                                    }
                                },
                                error: function (error) {
                                    console.log("Fail");
                                },
                                type: 'POST'
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