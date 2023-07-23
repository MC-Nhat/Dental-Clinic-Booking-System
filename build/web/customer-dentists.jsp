<%-- 
    Document   : viewDentistByUser
    Created on : Jun 9, 2023, 7:43:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>DentCare</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@100;300;400;500;800&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">


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
    
    <style>
        .fixed-image {
          width: 400px;
          height: 400px;
        }
    </style>

</head>

<body>
    <jsp:include page="headerUser.jsp"></jsp:include>


    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->


    <!-- Hero Start -->
    <div class="container-fluid bg-primary py-5 hero-header mb-5">
        <div class="row py-3">
            <div class="col-12 text-center">
                <h1 class="display-3 text-white animated zoomIn">Nha sĩ</h1>
                <a href="" class="h4 text-white">Trang chủ</a>
                <i class="far fa-circle text-white px-2"></i>
                <a href="" class="h4 text-white">Nha sĩ</a>
            </div>
        </div>
    </div>
    <!-- Hero End -->


    <!-- Team Start -->
    
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row g-5" id="dentist-list">
                <!-- Start tạo cuộc hẹn -->
                
                <div class="col-lg-4 wow slideInUp" data-wow-delay="0.1s" style="">
                    <div class="section-title bg-light rounded h-100 p-5">
                        <h5 class="position-relative d-inline-block text-primary text-uppercase">Nha sĩ của chúng tôi</h5>
                        <h1 class="display-6 mb-4">Gặp gỡ nha sĩ có kinh nghiệm và được chứng nhận của chúng tôi</h1>
                        <a href="appointment.html" class="btn btn-primary py-3 px-5">Cuộc hẹn</a>
                    </div>
                </div>
                <!-- end tạo cuộc hẹn -->
                
                <!-- dentist -->
                <c:set var="listDentist" value="${requestScope.listDentist}"></c:set>     
                <c:forEach var="dentist" items="${listDentist}">
                    <div class="col-lg-4 wow slideInUp" data-wow-delay="0.3s"  style="">
                        <div class="team-item">
                            <div class="position-relative rounded-top" style="z-index: 1;">
                                <img class="img-fluid rounded-top w-100 fixed-image" src="${dentist.img}" alt="">
                                <div class="position-absolute top-100 start-50 translate-middle bg-light rounded p-2 d-flex">
                                    <a href="MainController?action=showProfileDentistController&iddentist=${dentist.id}" class="btn btn-primary px-1">Xem chi tiết</a>
                                </div> 
                            </div>
                            <div class="team-text position-relative bg-light text-center rounded-bottom p-4 pt-5">
                                <h4 class="mb-2">${dentist.fullName}</h4>
                                <p class="text-primary mb-0">${dentist.roleDentist}</p>
                            </div>
                        </div>
                    </div>    
                </c:forEach> 
      
                
            </div>
        </div>  
        <div class="row g-5">
            <div class="col-sm-12" style="text-align: center; padding-top: 30px">
                <div class="see-all">
                    <button class="see-all-btn" onclick="loadMoreDentistByCustomer()" style="font-size: 18px; padding: 10px 20px;">Xem Thêm</button>
                </div>
            </div>
        </div>
    </div> 
                
    <!-- Team End -->
    

    <!-- Newsletter Start -->
    <div class="container-fluid position-relative pt-5 wow fadeInUp" data-wow-delay="0.1s" style="z-index: 1;">
        <div class="container">
            <div class="bg-primary p-5">
                <form class="mx-auto" style="max-width: 600px;">
                    <div class="input-group">
                        <input type="text" class="form-control border-white p-3" placeholder="Email của bạn">
                        <button class="btn btn-dark px-4">Đăng ký</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Newsletter End -->

    <!-- Footer Start -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>          
    <script>
        function loadMoreDentistByCustomer() {
            var amount = document.getElementsByClassName("team-item").length;
            $.ajax({
                url: "/SWP391-SE1743/LoadMoreDentistByCustomerController",
                type: "get", //send it through get method
                data: {
                    exits: amount
                },
                success: function (data) {
                    var row = document.getElementById("dentist-list");
                    row.innerHTML += data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    </script>
</body>

</html>
