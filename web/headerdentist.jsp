<%-- 
    Document   : headerdentist
    Created on : Jun 14, 2023, 5:01:00 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/Chart.bundle.js"></script>
        <script src="assets/js/chart.js"></script>
        <script src="assets/js/app.js"></script>
        <style>
            :root {
                --green: #009ce7;
                --white: #fff;
                --light-white: #aaa;
                --black: #3d3d3d;
                --light-bg: #4b4b4b;
                --box-shadow: .5rem .5rem 0 rgba(22, 160, 100, .2);
            }

            .btn {
                display: inline-block;
                background-color: var(--light-bg);
                cursor: pointer;
                color: var(--white);
                font-size: 1rem;
                padding: .5rem 1.2rem;
                border: 0;
            }

            .btn:hover {
                transition: .2s;
                background-color: var(--white);
                color: var(--black);
            }

            .top {
                display: flex;
                margin: 1rem 0;
                gap: 1rem
            }

            .top h2 {
                margin: 0;
            }


            .top a{
                background-color: var(--white);
                color: var(--black);
                font-size: 1rem;
                padding: .2rem;
                transition: .5s;
            }
            .top a:hover{
                transform: translateY(-5px);
            }
            .main-title {
                display: grid;
            }
            .items{
                margin-top: 1rem;
            }
            .items-info img {
                width: 130px;
                height: 130px;
            }

            .items-info {
                display: flex;
                gap: 1rem;
                padding-bottom: .8rem;
                border-bottom: solid .1rem #009ce7;
            }

            .items-info h3 {
                font-size: 1.4rem;
                color: var(--green);
                margin: 0;
            }

            .items-info h3 span {
                font-size: 1.3rem;
                color: black;
            }


            .items-info h2 {
                color: tan;
                font-size: 1rem;
                display: inline;
            }

            .button-4 {
                appearance: none;
                background-color: #FAFBFC;
                border: 1px solid rgba(27, 31, 35, 0.15);
                border-radius: 6px;
                box-shadow: rgba(27, 31, 35, 0.04) 0 1px 0, rgba(255, 255, 255, 0.25) 0 1px 0 inset;
                box-sizing: border-box;
                color: #24292E;
                cursor: pointer;
                display: inline-block;
                font-family: -apple-system, system-ui, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji";
                font-size: 14px;
                font-weight: 500;
                line-height: 20px;
                list-style: none;
                padding: 6px 16px;
                position: relative;
                transition: background-color 0.2s cubic-bezier(0.3, 0, 0.5, 1);
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                vertical-align: middle;
                white-space: nowrap;
                word-wrap: break-word;
            }

            .button-4:hover {
                background-color: #F3F4F6;
                text-decoration: none;
                transition-duration: 0.1s;
            }

            .button-4:disabled {
                background-color: #FAFBFC;
                border-color: rgba(27, 31, 35, 0.15);
                color: #959DA5;
                cursor: default;
            }

            .button-4:active {
                background-color: #EDEFF2;
                box-shadow: rgba(225, 228, 232, 0.2) 0 1px 0 inset;
                transition: none 0s;
            }

            .button-4:focus {
                outline: 1px transparent;
            }

            .button-4:before {
                display: none;
            }

            .button-4:-webkit-details-marker {
                display: none;
            }
            .btnLink{
                background: none;
                border: none;
                cursor: pointer;
                color: #009ce7;
                text-decoration: underline;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">
            <div class="header">
                <div class="header-left">
                    <a href="index-2.html" class="logo">
                        <img src="assets/img/logo.png" width="35" height="35" alt=""> <span>DentCare</span>
                    </a>
                </div>
                <a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
                <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
                <ul class="nav user-menu float-right">


                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                            <span class="user-img">
                                <img class="rounded-circle" src="assets/img/user.jpg" width="24" alt="Admin">
                                <span class="status online"></span>
                            </span>
                            <span>${sessionScope.User.getFullName()}</span>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="myprofile.jsp">Tài Khoản Của Tôi</a>
                            <a class="dropdown-item" href="MainController?action=Logout">Đăng Xuất</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">

                        <c:set var="activeLink" value="${sessionScope.activeLink}"></c:set>
                        <c:set var="option" value="${sessionScope.option}"></c:set>
                        <c:set var="dentistappointmentLink" value="dentistappointmentLink"></c:set>
                        <c:set var="viewpatientsofdentistLink" value="viewpatientsofdentistLink"></c:set>
                        <c:if test="${activeLink eq dentistappointmentLink}">
                            <c:set var="dentistappointmentLink" value="active"></c:set>
                        </c:if>
                        <c:if test="${activeLink eq viewpatientsofdentistLink}">
                            <c:set var="viewpatientsofdentistLink" value="active"></c:set>
                        </c:if>
                        <ul>       
                            <li class="menu-title">Main</li>
                            <li class="${dentistappointmentLink}">
                                <a  href="GetAppointmentController"><i class="ri-calendar-todo-fill"></i> <span>Lịch Hẹn</span></a>
                            </li>  
                            <li class="${viewpatientsofdentistLink}">
                                <a  href="MainController?action=ViewTreatmentByCustomer&id=${sessionScope.User.getId()}"><i class="ri-empathize-fill"></i> <span>Bệnh Nhân</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>                     
    </body>
</html>
