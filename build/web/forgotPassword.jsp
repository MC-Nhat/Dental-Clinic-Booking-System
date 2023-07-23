<%-- 
    Document   : forgotPassword
    Created on : Jun 3, 2023, 6:28:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    </head>

    <body>
        <div class="main-wrapper account-wrapper">
            <div class="account-page">
                <div class="account-center">
                    <div class="account-box">
                        <form class="form-signin" action="MainController" method="POST">
                            <div class="account-logo">
                                <a href="index.jsp"><img src="assets/img/logo.png" alt=""></a>
                            </div>
                            <div class="form-group">
                                <label>Nhập Email Của Bạn</label>
                                <input type="text" class="form-control" name="gmail" autofocus>
                                <small style="color: red; margin-top: .3rem; font-size: 1rem">${requestScope.EMAIL_FAIL}</small>
                            </div>
                            <div class="form-group text-center">
                                <button class="btn btn-primary account-btn" type="submit" name="action" value="sendMail">Xác nhận Email</button>
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
    </body>


    <!-- forgot-password24:03-->
</html>