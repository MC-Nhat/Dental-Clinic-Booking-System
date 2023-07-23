<%-- 
    Document   : addtreatmentcourse
    Created on : Jun 18, 2023, 4:58:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
    </head>
    <style>
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
        <c:if test="${sessionScope.User.getRoleID() != 2}"><c:redirect url="login.jsp"/></c:if>
            <div class="main-wrapper">

            <jsp:include page="headerdentist.jsp"></jsp:include>
                <div class="page-wrapper">
                    <div class="content">
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <h3 class="page-title">Tạo Liệu Trình Mới</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2"> 
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <strong><label>Tên Liệu Trình<span class="text-danger">*</span></label></strong>
                                            <input class="form-control" type="text" id="treatmentName" required="">                                    
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group" id="form-Roll">
                                            <strong><label>Mã Bệnh Nhân<span class="text-danger">*</span></label></strong>
                                            <input class="form-control" value="${requestScope.Roll}" type="text" id="roll" required="">
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="m-t-20 text-center">
                                            <button onclick="createTreatmentCourse(this)" style="background: #009ce7" class="btn submit-btn">Tạo Mới</button>
                                        </div>
                                    </div>    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="popup1" class="overlay">
                    <div class="popup">
                        <h2>Thành Công</h2>
                        <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                        <div class="content">
                            Đã Thêm Mới Liệu Trình Thành Công. Chúc Sức Khỏe.
                            <a href="MainController?action=ViewTreatmentByCustomer&id=${sessionScope.User.getId()}">Xem danh sách liệu trình</a>
                    </div>
                </div>
            </div>
        </div>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                            function createTreatmentCourse() {
                                let small = document.querySelector(".errorMessage");
                                if (small !== null) {
                                    small.remove();
                                }
                                let roll = document.getElementById("roll");
                                let treatmentName = document.getElementById("treatmentName");
                                console.log(roll.value);
                                $.ajax({
                                    url: '/SWP391-SE1743/AddTreatmentCourseController',
                                    data: {
                                        roll: roll.value,
                                        treatmentName: treatmentName.value
                                    },
                                    success: function (response) {
                                        const div = document.querySelector('.overlay');
                                        div.classList.add('active');
                                    },
                                    error: function (xhr, textStatus, errorThrown) {
                                        if (xhr.status === 400) {
                                            let formRoll = document.getElementById("form-Roll");
                                            formRoll.innerHTML += '<label class=\"errorMessage\" style=\"color: red;\">Không tìm thấy bệnh nhân phù hợp</label>';
                                        }
                                    },
                                    type: 'POST'
                                });
                            }
        </script>
    </body>
</html>
