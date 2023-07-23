<%-- 
    Document   : contact
    Created on : Jun 9, 2023, 4:26:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
    </head>
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
    </style>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <!-- Hero Start -->
            <div class="container-fluid bg-primary py-5 hero-header mb-5">
                <div class="row py-3">
                    <div class="col-12 text-center">
                        <h1 class="display-3 text-white animated zoomIn">Tư Vấn</h1>
                        <a href="" class="h4 text-white">Trang chủ</a>
                        <i class="far fa-circle text-white px-2"></i>
                        <a href="" class="h4 text-white">Tư Vấn</a>
                    </div>
                </div>
            </div>
            <!-- Hero End -->


            <!-- Contact Start -->
            <div class="container-fluid py-5">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-xl-4 col-lg-6 wow slideInUp" data-wow-delay="0.1s">
                            <div class="bg-light rounded h-100 p-5">
                                <div class="section-title">
                                    <h5 class="position-relative d-inline-block text-primary text-uppercase">Liên hệ chúng tôi</h5>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <img src="assets/img/QR.jpg"> 
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-6 wow slideInUp" data-wow-delay="0.3s">
                            <div class="row g-3">
                                <div class="col-12" id="formFullName">
                                    <input id="name" type="text" class="form-control border-0 bg-light px-4" placeholder="Họ và Tên" style="height: 55px;">
                                </div>
                                <div class="col-12" id="formPhoneNumber">
                                    <input id="phoneNumber" type="number" class="form-control border-0 bg-light px-4" placeholder="Số điện thoại" style="height: 55px;">
                                </div>
                                <div class="col-12">
                                    <textarea id="description" class="form-control border-0 bg-light px-4 py-3" rows="5" placeholder="Tin nhắn"></textarea>
                                </div>
                                <div class="col-12">
                                    <input onclick="createAdvisory()" class="btn btn-primary w-100 py-3" type="submit" value="Đăng Kí">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-12 wow slideInUp" data-wow-delay="0.6s">
                            <iframe class="position-relative rounded w-100 h-100"
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.166792671598!2d106.6856544749081!3d10.7985342893516!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528d0414c4783%3A0x37b1e9565024a8bd!2zTmhhIEtob2EgTuG7pSBDxrDhu51pIER1ecOqbg!5e0!3m2!1svi!2s!4v1684372378914!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                                    frameborder="0" style="min-height: 400px; border:0;" allowfullscreen="" aria-hidden="false"
                                    tabindex="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Contact End -->


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
            <div id="popup1" class="overlay">
                <div class="popup">
                    <h2>Đăng Kí Tư Vấn Thành Công</h2>
                    <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                    <div class="content">
                        Cảm ơn quý khách đã đăng kí tư vấn. Chúng tôi sẽ liên lạc cho quý khách trong thời gian sớm nhất. 
                    </div>
                    <a href="#">Xem thêm dịch vụ</a>
                </div>
            </div>
            <!-- Newsletter End -->
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                        function  createAdvisory() {
                            let name = document.getElementById("name");
                            let phoneNumber = document.getElementById("phoneNumber");
                            let description = document.getElementById("description");
                            let labels = Array.from(document.getElementsByClassName('errorMessage'));
                            labels.forEach(element => {
                                element.remove();
                            });
                            if (name.value === "") {
                                let fullNameForm = document.getElementById('formFullName');
                                fullNameForm.innerHTML += '<label class="errorMessage" style="color: red;">Họ và Tên không được để trống</label>';
                            } else if (phoneNumber.value === '' || phoneNumber.value.length !== 10) {
                                let phoneNumberForm = document.getElementById('formPhoneNumber');
                                phoneNumberForm.innerHTML += '<label class="errorMessage" style="color: red;">Số điện thoại không phù hợp</label>';
                            } else {
                                $.ajax({
                                    url: '/SWP391-SE1743/CreateAdvisoryController',
                                    data: {
                                        action: 'Create Advisory',
                                        name: name.value,
                                        description: description.value,
                                        phoneNumber: phoneNumber.value
                                    },
                                    success: function (data) {
                                        const div = document.querySelector('.overlay');
                                        div.classList.add('active');
                                    },
                                    error: function (error) {
                                        console.log("Fail");
                                    },
                                    type: 'POST'
                                });
                            }
                        }
                        function closePopUp() {
                            const div = document.querySelector('.overlay');
                            div.classList.remove('active');
                        }
        </script>
    </body>
</html>