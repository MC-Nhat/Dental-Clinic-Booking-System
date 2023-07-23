<%-- 
    Document   : confirmEmail
    Created on : Jun 4, 2023, 12:37:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


    <!-- forgot-password24:03-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
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

        <div class="main-wrapper account-wrapper">
            <div class="account-page">
                <div class="account-center">
                    <div class="account-box">
                        <form>
                            <div class="account-logo">
                                <a href="https://accounts.google.com/v3/signin/identifier?dsh=S-972331380%3A1685858268955187&ffgf=1&ifkv=Af_xneFEUhmDNwyUiNTGfIQP16MFBBaZZBtytQejB_6eBSoYZf0ZMwwksPC80SNo6F-hA5GoHlBJvg&service=mail&flowName=GlifWebSignIn&flowEntry=ServiceLogin" target="_blank"><img src="assets/img/gmail.png" ></a>
                            </div>
                            <div class="form-group" id="formCode">
                                <label>Nhập Mã Xác Nhận Của Bạn <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="maxacnhan" id="name" required="" >
                            </div>
                            <div class="form-group" id="formCode" style="display: none;">
                                <label>Mã Xác Nhận Của Bạn</label>
                                <input class="form-control" id="code"  value="${sessionScope.code}" readonly="" required="" >
                            </div>
                            <div class="form-group" id="formPassword">
                                <label>Nhập Mật Khẩu Mới</label>
                                <input type="password" class="form-control" id="password1" name="pass1" required="" >
                            </div>
                            <div class="form-group" id="formPassword">
                                <label>Nhập Lại Mật Khẩu</label>
                                <input type="password" class="form-control" id="password2" name="pass2" required="" >
                            </div>
                            <h6 style="color: red">${requestScope.report}</h6>

                            <div class="form-group text-center"> 
                                <a onclick="forgotPass(this)" class="btn btn-primary submit-btn">Xác nhận Mã</a>
                            </div>
                            <div class="text-center register-link">
                                <a href="login.jsp">Quay về đăng nhập</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                    function forgotPass() {
                        let c1 = document.getElementById('name').value;
                        let c2 = document.getElementById('code').value;
                        let p1 = document.getElementById('password1').value;
                        let p2 = document.getElementById('password2').value;
                        let labels = Array.from(document.getElementsByClassName('errorMessage'));
                        labels.forEach(element => {
                            element.remove();
                        });
                        if (c1 !== c2) {
                            let fullCodeForm = document.getElementById('formCode');
                            fullCodeForm.innerHTML += '<label class="errorMessage" style="color: red;">Mã xác nhận không đúng </label>';
                        } else if (p1 !== p2 || p1 === "") {
                            let fullPassForm = document.getElementById('formPassword');
                            fullPassForm.innerHTML += '<label class="errorMessage" style="color: red;">Mật khẩu không trùng nhau </label>';
                        } else {
                            $.ajax({
                                url: '/SWP391-SE1743/MainController',
                                data: {
                                    action: 'codeMail',
                                    pass: p1
                                },
                                success: function (data) {
                                    window.location.href = "login.jsp";
                                },
                                error: function (error) {
                                    console("Fail");
                                },
                                type: 'GET'
                            });
                        }
                    }
        </script>
    </body>

</html>
