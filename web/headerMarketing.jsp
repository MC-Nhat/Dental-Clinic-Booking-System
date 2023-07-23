<%-- 
    Document   : header
    Created on : May 22, 2023, 1:56:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
</head>
<body>

    <div class="header">
        <div class="header-left">
            <a href="#" class="logo">
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
                    <a class="dropdown-item" href="myprofile.jsp">Tài Khoản</a>
                    <a class="dropdown-item" href="MainController?action=Logout">Đăng Xuất</a>
                </div>
            </li>
        </ul>
        <div class="dropdown mobile-user-menu float-right">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="profile.html">My Profile</a>
                <a class="dropdown-item" href="edit-profile.html">Edit Profile</a>
                <a class="dropdown-item" href="settings.html">Settings</a>
                <a class="dropdown-item" href="MainController?action=Logout">Logout</a>
            </div>
        </div>
    </div>
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">

                <c:set var="activeLink" value="${sessionScope.activeLink}"></c:set>
                <c:set var="option" value="${sessionScope.option}"></c:set>

                <c:set var="dashboardLink" value="dashboardLink"></c:set>
                <c:set var="dentistLink" value="dentistLink"></c:set>
                <c:set var="patientLink" value="patientLink"></c:set>
                <c:set var="serviceLink" value="serviceLink"></c:set>
                <c:set var="employeeLink" value="employeeLink"></c:set>
                <c:set var="dsnv" value="dsnv"></c:set>
                <c:set var="feedbackLink" value="feedbackLink"></c:set>
                <c:set var="feedbackDentistLink" value="feedbackDentistLink"></c:set>
                <c:set var="feedbackServiceLink" value="feedbackServiceLink"></c:set>
                <c:set var="appointmentLink" value="appointmentLink"></c:set>

                <c:if test="${activeLink eq dashboardLink}">
                    <c:set var="dashboardLink" value="active"></c:set>
                </c:if>
                <c:if test="${activeLink eq dentistLink}">
                    <c:set var="dentistLink" value="active"></c:set>
                </c:if>
                <c:if test="${activeLink eq patientLink}">
                    <c:set var="patientLink" value="active"></c:set>
                </c:if>
                <c:if test="${activeLink eq serviceLink}">
                    <c:set var="serviceLink" value="active"></c:set>
                </c:if>
                <c:if test="${activeLink eq appointmentLink}">
                    <c:set var="appointmentLink" value="active"></c:set>
                </c:if>

                <c:if test="${activeLink eq employeeLink}">
                    <c:set var="employeeLink" value="active"></c:set>
                    <c:if test="${option eq dsnv}">
                        <c:set var="employeeLink2" value="#888888"></c:set>
                        <c:set var="employeeLink3" value="#888888"></c:set>
                    </c:if>
                </c:if>

                <c:if test="${activeLink eq feedbackLink}">
                    <c:set var="feedbackLink" value="active"></c:set>
                    <c:if test="${option eq feedbackDentistLink}">
                        <c:set var="feedbackServiceLink" value="#888888"></c:set>
                    </c:if>
                    <c:if test="${option eq feedbackServiceLink}">
                        <c:set var="feedbackDentistLink" value="#888888"></c:set>
                    </c:if>
                </c:if>

                <ul>        
                    <li class="menu-title">Main</li>

                    <li class="${dentistLink}">
                        <a href="MainController?action=marketingdentist"><i class="fa fa-user-md"></i> <span>Bác Sĩ</span></a>
                    </li>

                    <li class="${appointmentLink}">
                        <a href="MainController?action=searchAppointmentByDate"><i class="fa fa-calendar"></i> <span>Lịch Hẹn</span></a>
                    </li>
                    <li class="${serviceLink}">
                        <a href="MainController?action=ServiceMarketing"><i class="fa fa-cube"></i> <span>Dịch Vụ</span></a>
                    </li>

<!--                    <li class="submenu ${employeeLink}">
                        <a href="#"><i class="fa fa-user"></i> <span> Nhân Viên </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="MainController?action=GetEmployees&index=1&click=1" style="color: ${employeeLink1}">Danh Sách Nhân Viên</a></li>
                            <li><a href="holidays.html" style="color: ${employeeLink2}">Ngày Nghỉ</a></li>
                            <li><a href="attendance.html" style="color: ${employeeLink3}">Điểm Danh</a></li>
                        </ul>
                    </li>-->

                    <li class="submenu ${feedbackLink}">
                        <a href="#"><i class="fa fa-comment"></i> <span> Phản hồi </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="MainController?action=View Feedback Dentist" onclick="event.stopPropagation();" style="color: ${feedbackDentistLink}">Nha sĩ</a></li>
                            <li><a href="MainController?action=View Feedback Service" style="color: ${feedbackServiceLink}">Dịch vụ</a></li>
                        </ul>
                    </li>                        
                </ul>
            </div>
        </div>
    </div>

</body>
</html>
