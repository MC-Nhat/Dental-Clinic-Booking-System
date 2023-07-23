<%-- 
    Document   : headerConsultant
    Created on : May 31, 2023, 5:18:44 PM
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
                        <li class="active">
                            <a  href="#"><i class="ri-customer-service-2-line"></i> <span>Danh Sách tư vấn</span></a>
                        </li>                        
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4 col-4">
                        <h4 class="page-title">Danh Sách Tư Vấn</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-striped custom-table">
                                <thead>
                                    <tr>
                                        <th>Họ Và Tên</th>
                                        <th >Số điện thoại</th>
                                        <th>
                                            <form action="SortDateAdvisoryController" method="POST">
                                                <button class="btnLink" style="text-align: center">Ngày Đăng Kí</button>
                                                <input type="hidden" name="sortBy" value="${requestScope.SORT_BY}">
                                            </form>
                                        </th>
                                        <th>Mô Tả</th>
                                        <th  style="text-align: center">Chỉnh Sửa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="a" items="${ADVISORY_LIST}">
                                        <tr id="${a.getId()}">
                                            <td style="display: none">${a.getId()}</td>
                                            <td>${a.getFullName()}</td>
                                            <td style="font-weight: 500">0${a.getPhoneNumber()}</td>
                                            <td>${a.getAdvisoryDate()}</td>
                                            <td>${a.getDescription()}</td>
                                            <td class="text-right">
                                                <button class="button-4 completed-advisory" role="button">Hoàn Thành</button>
                                                <input type="hidden" value="${a.getId()}">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        document.querySelectorAll('.completed-advisory').forEach(function (item) {
            item.addEventListener('click', function (event) {
                event.preventDefault();
                var advisoryRow = this.closest('tr');
                var advisoryID = advisoryRow.querySelector('td:first-child').textContent;
                var comfirmation = confirm("Bạn có chắc muốn hoàn thành chứ?");
                if (comfirmation) {
                    $.ajax({
                        url: '/SWP391-SE1743/CompletedAdvisoryController',
                        data: {
                            action: 'Complete Advisory',
                            id: advisoryID
                        },
                        success: function (data) {
                            let advisory = document.getElementById(advisoryID);
                            advisory.remove();
                        },
                        error: function (error) {
                            console("Fail");
                        },
                        type: 'POST'
                    });
                }
            });
        });
    </script>

</body>
</html>