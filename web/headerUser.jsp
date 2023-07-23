
<%-- 
    Document   : headerUser
    Created on : Jun 8, 2023, 5:53:06 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@100;300;400;500;800&family=Poppins:wght@400;500;600;700&display=swap"
            rel="stylesheet">

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

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
    </head>
    <body>
        <c:set var="u" value="${sessionScope.User}"></c:set>
            <div id="spinner"
                 class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-grow text-primary m-1" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <div class="spinner-grow text-dark m-1" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
                <div class="spinner-grow text-secondary m-1" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Topbar Start -->
            <div class="container-fluid bg-light ps-5 pe-0 d-none d-lg-block">
                <div class="row gx-0">
                    <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                        <div class="d-inline-flex align-items-center">
                            <small class="py-2"><i class="far fa-clock text-primary me-2"></i>Giờ mở cửa: Thứ hai - Thứ sáu 8:00 sáng - 9:00 tối</small>
                        </div>
                    </div>
                    <div class="col-md-6 text-center text-lg-end">
                        <div class="position-relative d-inline-flex align-items-center bg-primary text-white top-shape px-5">
                            <div class="me-3 pe-3 border-end py-2">
                                <p class="m-0"><i class="fa fa-envelope-open me-2"></i>DentalClinic@gmail.com</p>
                            </div>
                            <div class="me-3 pe-3 border-end py-2">
                                <p class="m-0"><i class="fa fa-phone-alt me-2"></i>+84 374 312 384</p>
                            </div>
                            <div class="py-2">

                            <c:if test="${sessionScope.User != null}">
                                <a href="index.jsp" class="m-0" style="color: white">Đặt lịch hẹn</a>
                            </c:if>
                            <c:if test="${sessionScope.User == null}">
                                <a style="color:white;" href="login.jsp" class="m-0"><i class="fa fa-user"></i> Đăng Nhập </a>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm px-5 py-3 py-lg-0">
            <a href="index.jsp" class="navbar-brand p-0">
                <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.jsp" class="nav-item nav-link ${pageContext.request.requestURI.endsWith('index.jsp') ? 'active' : ''}">Trang Chủ</a>
                    <a href="aboutus.jsp" class="nav-item nav-link ${pageContext.request.requestURI.endsWith('aboutus.jsp') ? 'active' : ''}">Về Chúng Tôi</a>
                    <a href="ServiceUserController" class="nav-item nav-link ${pageContext.request.servletPath.endsWith('serviceUser.jsp') ? 'active' : ''}">Dịch Vụ</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown ">Xem Thêm</a>
                        <div class="dropdown-menu m-0">
                            <a href="MainController?action=showDentist" class="dropdown-item ${pageContext.request.servletPath.endsWith('customer-dentists.jsp') ? 'active' : ''}">
                                Nha sĩ của chúng tôi
                            </a>
                            <a href="index.jsp" class="dropdown-item ${pageContext.request.requestURI.endsWith('index.jsp') ? 'active' : ''}">
                                Cuộc hẹn
                            </a>
                        </div>
                    </div>
                    <a href="contact.jsp" class="nav-item nav-link ${pageContext.request.requestURI.endsWith('contact.jsp') ? 'active' : ''}">Liên hệ</a>
                </div>

                <button type="button" class="btn text-dark" data-bs-toggle="modal" data-bs-target="#searchModal"><i
                        class="fa fa-search"></i></button>

                <c:if test="${sessionScope.User != null}">
                    <div class=" nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                            <span class="user-img">
                                <img class="rounded-circle" src="assets/img/user.jpg" width="24" alt="Admin">
                                <span class="status online"></span>
                            </span>
                            <span>${sessionScope.User.getFullName()}</span>
                        </a>
                        <div class="dropdown-menu">
                            <c:choose>                  
                                <c:when test = "${u.getRoleID() ==  5}" >
                                    
                                    <form action="MainController" method="POST">
                                        <button class="dropdown-item" style="">Tài Khoản</button>
                                        <input type="hidden" name="id" value="${u.getId()}">
                                        <input type="hidden" name="action" value="TreatmentCourse">
                                    </form>
                                </c:when>
                                <c:otherwise><a class="dropdown-item" href="myprofile.jsp">Tài Khoản</a></c:otherwise>
                            </c:choose>
                            <form action="MainController">
                                <button class="dropdown-item" name="action" value="Logout">Đăng Xuất</button>
                            </form>
                        </div>
                    </div>
                </c:if>

            </div>
        </nav>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>

    </body>
</html>