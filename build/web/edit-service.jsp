<%-- 
    Document   : edit-service
    Created on : May 21, 2023, 2:49:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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

            @media screen and (max-width: 700px){
                .box{
                    width: 70%;
                }
                .popup{
                    width: 70%;
                }
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.User.getRoleID() != 1}"><c:redirect url="login.jsp"/></c:if>
            <div class="main-wrapper">
            <jsp:include page="header.jsp"></jsp:include>
                <div class="page-wrapper">
                    <div class="content">

                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <h4 class="page-title">Chỉnh Sửa Dịch Vụ</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <div class="row">
                                <fmt:setLocale value = "vi_VN"/>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label>ID <span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" readonly="" value="${detail.id}" name="id" >
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label>Tên dịch vụ <span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" value="${detail.name}" name="name" id="name">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group"> 
                                        <label>Mô tả <span class="text-danger">*</span></label>
                                        <textarea rows="7" class="form-control" type="text"  name="mota" id="mota">${detail.mota}</textarea>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label>Giá tiền <span class="text-danger">*</span></label>
                                        <!--value="<fmt:formatNumber value="${detail.price}" type="currency"/>"-->
                                        <input class="form-control" type="text" value="${detail.price}" type="currency" name="price" id="price">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="display-block">Trạng Thái</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="status" name="status" id="product_active" value="true" checked>
                                    <label class="form-check-label" for="product_active">
                                        Đang hoạt động
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="status" name="status" id="product_inactive" value="false">
                                    <label class="form-check-label" for="product_inactive">
                                        Ngừng hoạt động
                                    </label>
                                </div>
                            </div>
                            <div class="m-t-20 text-center"> 
                                <button onclick="editService(this, ${detail.id})" class="btn btn-primary submit-btn">LƯU</button>
                            </div>
                        </div>
                        <div id="popup1" class="overlay">
                            <div class="popup">
                                <h2>Thành Công</h2>
                                <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                                <div class="content">
                                    Đã Cập Nhật Thông Tin Dịch Vụ Thành Công.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                                    function editService(btn, id) {
                                        console.log(btn);

                                        let name = document.getElementById('name').value;
                                        let mota = document.getElementById('mota').value;
                                        let price = document.getElementById('price').value;
                                        let status = document.querySelector('input[name=status]:checked').value;
                                        console.log(name);
                                        $.ajax({
                                            url: '/SWP391-SE1743/MainController',
                                            data: {
                                                action: 'UpdateService',
                                                id: id,
                                                name: name,
                                                mota: mota,
                                                price: price,
                                                status: status
                                            },
                                            success: function (data) {
                                                const div = document.querySelector('.overlay');
                                                div.classList.add('active');
                                            },
                                            error: function (error) {
                                                console("Fail");
                                            },
                                            type: 'GET'
                                        });
                                    }
                                    function closePopUp() {
                                        const div = document.querySelector('.overlay');
                                        div.classList.remove('active');
                                    }
        </script>
    </body>
</html>