<%-- 
    Document   : addDentist
    Created on : May 21, 2023, 2:31:08 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- add-employee24:07-->

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
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
        </style>
    </head>

    <body>
    <c:if test="${sessionScope.User.getRoleID() != 1}"><c:redirect url="login.jsp"/></c:if>
        <jsp:include page="header.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Thêm Nhân Viên</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group" id="formFullName">
                                    <label>Họ và Tên<span class="text-danger">*</span></label>
                                    <input id="name" class="form-control" type="text" required="">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group" id="formEmail">
                                    <label>Email <span class="text-danger">*</span></label>
                                    <input id="email" class="form-control" type="email" required="">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group" id="formPassword">
                                    <label>Mật Khẩu</label>
                                    <input id="password1" class="form-control" type="password" required="">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Nhập Lại Mật Khẩu</label>
                                    <input id="password2" class="form-control" type="password" required="">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group" id="formPhoneNumber">
                                    <label>Số Điện Thoại(10 số) </label>
                                    <input id="phoneNumber" class="form-control" type="text" required="" pattern="[0-9]{10}">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Role</label>
                                    <select id="gender" class="select">
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                        <option value="Khác">Khác</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Role</label>
                                    <select id="role" class="select">
                                        <option value="1">Admin</option>
                                        <option value="3">Marketing</option>
                                        <option value="">Chăm Sóc Khách Hàng</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="m-t-20 text-center">
                            <a onclick="addEmployee(this)" class="btn btn-primary submit-btn">Tạo Nhân Viên</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="popup1" class="overlay">
            <div class="popup">
                <h2>Thành Công</h2>
                <a onclick="closePopUp(this)" class="close" href="#">&times;</a>
                <div class="content">
                    Đã Thêm Mới Nhân Viên Thành Công. Chúc Sức Khỏe.
                    <a href="MainController?action=ViewTreatmentByCustomer&id=${sessionScope.User.getId()}">Xem danh sách nhân viên</a>
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
                    function addEmployee() {
                        let name = document.getElementById('name');
                        let password1 = document.getElementById('password1');
                        let password2 = document.getElementById('password2');
                        let email = document.getElementById('email');
                        let phoneNumber = document.getElementById('phoneNumber');
                        let gender = document.getElementById("gender");
                        let role = document.getElementById('role');
                        let labels = Array.from(document.getElementsByClassName('errorMessage'));
                        labels.forEach(element => {
                            element.remove();
                        });
                        if (password1.value !== password2.value) {
                            let passwordForm = document.getElementById('formPassword');
                            passwordForm.innerHTML += '<label class="errorMessage" style="color: red;">Mật Khẩu Không Trùng Nhau</label>';
                        } else if ( !password1.value.match(/[A-Z]/) || !password1.value.match(/[0-9]/) || password1.value.length < 7) {
                            let passwordForm = document.getElementById('formPassword');
                            passwordForm.innerHTML += '<label class="errorMessage" style="color: red;">Mật khẩu phải dài hơn 7 kí tự phải chứa ít nhất 1 kí tự IN HOA và 1 Số</label>';
                        } else if (name.value === '' || name.value.length < 5) {
                            let fullNameForm = document.getElementById('formFullName');
                            fullNameForm.innerHTML += '<label class="errorMessage" style="color: red;">Họ và Tên không được để trống và dài hơn 5 kí tự</label>';
                        } else if (email.value === '' || !email.value.includes('@gmail.com')) {
                            let emailForm = document.getElementById('formEmail');
                            emailForm.innerHTML += '<label class="errorMessage" style="color: red;">Email không phù hợp</label>';
                        } else if (phoneNumber.value === '' || phoneNumber.value.length !== 10) {
                            let phoneNumberForm = document.getElementById('formPhoneNumber');
                            phoneNumberForm.innerHTML += '<label class="errorMessage" style="color: red;">Số điện thoại không phù hợp</label>';
                        } else {
                            $.ajax({
                                url: '/SWP391-SE1743/MainController',
                                data: {
                                    action: 'Add Employee',
                                    name: name.value,
                                    password: password1.value,
                                    email: email.value,
                                    phoneNumber: phoneNumber.value,
                                    gender: gender.value,
                                    role: role.value
                                },
                                success: function (data) {
                                    const div = document.querySelector('.overlay');
                                    div.classList.add('active');
                                    name.value = "";
                                    password1.value = "";
                                    password2.value = "";
                                    email.value = "";
                                    phoneNumber.value = "";
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