<%-- 
    Document   : editemployee
    Created on : May 21, 2023, 9:42:38 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- edit-employee24:07-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
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
    </head>

    <body>
        <c:if test="${sessionScope.User.getRoleID() != 1}"><c:redirect url="login.jsp"/></c:if>
            <div class="main-wrapper">

            <jsp:include page="header.jsp"></jsp:include>
                <div class="page-wrapper">
                    <div class="content">
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <h4 class="page-title">Chi Tiết Nhân Viên</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <div class="row">
                                <c:set var="e" value="${EMPLOYEE}"></c:set>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Họ Tên <span class="text-danger">*</span></label>
                                            <input value="${e.getFullName()}" id="fullName" class="form-control" type="text">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Email <span class="text-danger">*</span></label>
                                        <input value="${e.getEmail()}" id="email" class="form-control" type="email">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Mật Khẩu</label>
                                        <input disabled="" value="${e.getPassword()}" class="form-control" type="password">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Mã Nhân Viên <span class="text-danger">*</span></label>
                                        <input disabled="" value="${e.getId()}" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Số Điện Thoại </label>
                                        <input value="${e.getPhoneNumber()}" id="phoneNumber" class="form-control" type="text" pattern="[0-9]{10}">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Vị Trí</label>
                                        <select id="role" class="select">
                                            <c:forEach var="r" items="${LIST_ROLE}">
                                                <option <c:if test="${e.getRoleID() == r.getId()}">selected=""</c:if> value="${r.getId()}">${r.getName()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Giới Tính</label>
                                        <select id="gender" class="select">
                                            <option value="Nam">Nam</option>
                                            <option value="Nữ">Nữ</option>
                                            <option value="Khác">Khác</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="display-block">Trạng Thái</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="status" name="status" id="employee_active" <c:if test="${e.isStatus() == true}">checked=""</c:if> value="true"/>
                                        <label class="form-check-label" for="employee_active">
                                            Đang Hoạt Động
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" id="status" name="status" id="employee_inactive" <c:if test="${e.isStatus() == false}">checked=""</c:if> value="false"/>
                                        <label class="form-check-label" for="employee_inactive">
                                            Ngừng Hoạt Động
                                        </label>
                                    </div>
                                </div>
                                <div class="m-t-20 text-center">
                                    <button onclick="editEmployee(this, ${e.getId()})" class="btn btn-primary submit-btn">LƯU</button>
                            </div>
                        </div>
                        <div id="popup1" class="overlay">
                            <div class="popup">
                                <h2>Thành Công</h2>
                                <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                                <div class="content">
                                    Đã Cập Nhật Thông Tin Nhân Viên Thành Công. Chúc Sức Khỏe.
                                </div>
                                <a href="#" onclick="submitForm()">Xem nhân viên</a>
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
                                    function editEmployee(btn, id) {
                                        console.log(btn);
                                        let name = document.getElementById('fullName').value;
                                        let email = document.getElementById('email').value;
                                        let phoneNumber = document.getElementById('phoneNumber').value;
                                        let role = document.getElementById('role').value;
                                        let gender = document.getElementById('gender').value;
                                        let status = document.querySelector('input[name=status]:checked').value;
                                        $.ajax({
                                            url: '/SWP391-SE1743/EditEmployeeController',
                                            data: {
                                                action: 'Edit Employee',
                                                id: id,
                                                name: name,
                                                email: email,
                                                phoneNumber: phoneNumber,
                                                role: role,
                                                gender: gender,
                                                status: status
                                            },
                                            success: function (data) {
                                                const div = document.querySelector('.overlay');
                                                div.classList.add('active');
                                            },
                                            error: function (error) {
                                                console("Fail");
                                            },
                                            type: 'POST'
                                        });
                                    }
                                    
                                    function closePopUp() {
                                        const div = document.querySelector('.overlay');
                                        div.classList.remove('active');
                                    }
                                    function submitForm() {
                                        var form = document.createElement("form");
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
                                        
                                        form.submit();
                                    }
        </script>

    </body>


    <!-- edit-employee24:07-->
</html>