<%-- 
    Document   : aboutus
    Created on : Jun 8, 2023, 4:40:37 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>

        <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@100;300;400;500;800&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
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
                        <h1 class="display-3 text-white animated zoomIn">Về Chúng Tôi</h1>
                        <a href="" class="h4 text-white">Trang Chủ</a>
                        <i class="far fa-circle text-white px-2"></i>
                        <a href="" class="h4 text-white">Thông Tin</a>
                    </div>
                </div>
            </div>
            <!-- Hero End -->


            <!-- About Start -->
            <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-lg-7">
                            <div class="section-title mb-4">
                                <h5 class="position-relative d-inline-block text-primary text-uppercase">Về Chúng Tôi</h5>
                                <h1 class="display-5 mb-0">Phòng khám nha khoa tốt nhất thế giới mà bạn có thể tin tưởng</h1>
                            </div>
                            <h4 class="text-body fst-italic mb-4">Nha sĩ luôn rất thân thiện, chu đáo và tận tình giải đáp mọi thắc mắc của khách hàng.</h4>
                            <p class="mb-4">Khách hàng sẽ cảm thấy rất yên tâm và tin tưởng khi được điều trị tại phòng khám của chúng tôi. Các thiết bị và trang thiết bị y tế tại đây cũng được cập nhật và tiên tiến, giúp cho quá trình điều trị của khách hàng diễn ra thuận lợi và hiệu quả hơn.</p>
                            <div class="row g-3">
                                <div class="col-sm-6 wow zoomIn" data-wow-delay="0.3s">
                                    <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Giành nhiều giải thưởng</h5>
                                    <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Đội ngũ nhân viên chuyên nghiệp</h5>
                                </div>
                                <div class="col-sm-6 wow zoomIn" data-wow-delay="0.6s">
                                    <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Mở cửa 24/7</h5>
                                    <h5 class="mb-3"><i class="fa fa-check-circle text-primary me-3"></i>Giá cả hợp lý</h5>
                                </div>
                            </div>
                            <a href="appointment.html" class="btn btn-primary py-3 px-5 mt-4 wow zoomIn" data-wow-delay="0.6s">Đặt lịch hẹn</a>
                        </div>
                        <div class="col-lg-5" style="min-height: 500px;">
                            <div class="position-relative h-100">
                                <img class="position-absolute w-100 h-100 rounded wow zoomIn" data-wow-delay="0.9s" src="img/about.jpg" style="object-fit: cover;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- About End -->


            <!-- Newsletter Start -->
            <div class="container-fluid position-relative pt-5 wow fadeInUp" data-wow-delay="0.1s" style="z-index: 1;">
                <div class="container">
                    <div class="bg-primary p-5">
                        <form class="mx-auto" style="max-width: 600px;">
                            <div class="input-group">
                                <input type="text" class="form-control border-white p-3" placeholder="Your Email">
                                <button class="btn btn-dark px-4">Đăng ký</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Newsletter End -->
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>