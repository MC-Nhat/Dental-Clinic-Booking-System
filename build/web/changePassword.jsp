<%-- 
    Document   : changePassword
    Created on : Jun 3, 2023, 1:14:54 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">


    <!-- edit-doctor24:06-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
    </head>

    <body>
        <c:if test="${sessionScope.User.getRoleID() != 1 && sessionScope.User.getRoleID() != 5}"><c:redirect url="login.jsp"/></c:if>
            <div class="main-wrapper">

            <jsp:include page="header.jsp"></jsp:include>\

            <c:set var="u" value="${sessionScope.User}"></c:set>

                <div class="page-wrapper">
                    <div class="content">
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <h4 class="page-title">Thay đổi mật khẩu</h4>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <form action="MainController" method="post">

                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>Email Hiện Tại <span class="text-danger">*</span></label>
                                                <input class="form-control" value="${u.email}" name="EmailNow" rows="3" cols="30" readonly></input>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Nhập Mật Khẩu Hiện Tại <span class="text-danger">*</span></label>
                                            <input class="form-control" type="password" name="PassNow" required="">
                                        </div>
                                        <h6 style="color: red">${requestScope.report1}</h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Nhập Mật Khẩu Mới <span class="text-danger">*</span></label>
                                            <input class="form-control" type="password" name="PassNew" required="">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Nhập Lại Mật Khẩu Mới <span class="text-danger">*</span></label>
                                            <input class="form-control" type="password" name="PassNewAgain" required="">
                                        </div>
                                        <h6 style="color: red">${requestScope.report2}</h6>
                                    </div>

                                    <div class="m-t-20 text-center">
                                        <button class="btn btn-primary submit-btn" name="action" value="saveChangePass">Lưu</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </body>


    <!-- edit-doctor24:06-->
</html>