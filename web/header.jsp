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
    <style>
        .post-link {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <c:set var="u" value="${sessionScope.User}"></c:set>
        <div class="header">
            <div class="header-left">
                <a href="admin.jsp" class="logo">
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
                    <c:choose>                  
                        <c:when test = "${u.getRoleID() ==  5}" ><a class="dropdown-item" href="profileUser.jsp">Tài Khoản</a></c:when>
                        <c:otherwise><a class="dropdown-item" href="myprofile.jsp">Tài Khoản</a></c:otherwise>
                    </c:choose>

                    <form action="MainController">
                        <button class="dropdown-item" name="action" value="Logout">Đăng Xuất</button>
                    </form>
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
                <c:set var="billLink" value="billLink"></c:set>
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
                
                <c:if test="${activeLink eq billLink}">
                    <c:set var="billLink" value="active"></c:set>
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
                    <li class="${dashboardLink}">
                        <a href="/SWP391-SE1743/dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                    </li>
                    <li class="${dentistLink}">
                        <a href="#" onclick="submitForm('dentist')"><i class="fa fa-user-md"></i> <span>Bác Sĩ</span></a>
                    </li>
                    <li class="${patientLink}">
                        <a href="#" onclick="submitForm('patient')"><i class="fa fa-wheelchair"></i> <span>Bệnh Nhân</span></a>
                    </li>
                    <li class="${serviceLink}">
                        <a href="#" onclick="submitForm('service')"><i class="fa fa-cube"></i> <span>Dịch Vụ</span></a>
                    </li>

                    <li class="submenu ${employeeLink}">
                        <a href="#"><i class="fa fa-user"></i> <span> Nhân Viên </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li>
                                <a href="#" id="employeeLink" onclick="submitForm('employees')" style="color: ${employeeLink1}">Danh Sách Nhân Viên</a>
                            </li>
                        </ul>
                    </li>
                    <li class="submenu ${billLink}">
                        <a href="#"><i class="fa fa-money"></i> <span> Tài Khoản </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="#" onclick="submitForm('bill')">Hoá Đơn</a></li>
                            <!--                            <li><a href="payments.html">Thanh Toán</a></li>-->
                        </ul>
                    </li>
                    <li class="submenu ${feedbackLink}">
                        <a href="#"><i class="fa fa-comment"></i> <span> Phản hồi </span> <span class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="#" onclick="submitForm('feedbackDentist')" style="color: ${feedbackDentistLink}">Nha sĩ</a></li>
                            <li><a href="#" onclick="submitForm('feedbackService')" style="color: ${feedbackServiceLink}">Dịch vụ</a></li>
                        </ul>
                    </li>                       
                </ul>
            </div>
        </div>
    </div>
    <script>
        function submitForm(message) {
            var form;
            if (message === "employees") {
                form = document.createElement("form");
                form.method = "POST";
                form.action = "GetEmployeesController";
                form.style.display = "none";

                var input1 = document.createElement("input");
                input1.type = "hidden";
                input1.name = "index";
                input1.value = "1";

                var input2 = document.createElement("input");
                input2.type = "hidden";
                input2.name = "click";
                input2.value = "1";

                form.appendChild(input1);
                form.appendChild(input2);

                document.body.appendChild(form);
            }
            else if(message === "dentist"){
                form = document.createElement("form");
                form.method = "POST";
                form.action = "DentistController";
                form.style.display = "none";
                
                document.body.appendChild(form);
            }
            else if(message === "patient"){
                form = document.createElement("form");
                form.method = "POST";
                form.action = "Patient";
                form.style.display = "none";
                
                document.body.appendChild(form);
            }
            else if(message === "service"){
                form = document.createElement("form");
                form.method = "POST";
                form.action = "loadServiceController";
                form.style.display = "none";
                
                document.body.appendChild(form);
            }
            else if(message === "bill"){
                form = document.createElement("form");
                form.method = "POST";
                form.action = "BillController";
                form.style.display = "none";
                
                document.body.appendChild(form);
            }
            else if(message === "feedbackDentist"){
                form = document.createElement("form");
                form.method = "POST";
                form.action = "ViewFeedbackDentistController";
                form.style.display = "none";
                
                document.body.appendChild(form);
            }            
            else if(message === "feedbackService"){
                form = document.createElement("form");
                form.method = "POST";
                form.action = "ViewFeedbackServiceController";
                form.style.display = "none";
                
                document.body.appendChild(form);
            }

            form.submit();
        }
    </script>
</body>
</html>