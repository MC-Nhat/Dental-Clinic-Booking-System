<%-- 
    Document   : profileDentist
    Created on : May 20, 2023, 7:35:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <!-- profile22:59-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
    </head>

    <body>
         <c:if test="${sessionScope.User.getRoleID() != 1}"><c:redirect url="login.jsp"/></c:if>
        <div class="main-wrapper">
            <jsp:include page="header.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-7 col-6">
                            <h4 class="page-title">Hồ Sơ Nha Sĩ</h4>
                        </div>
                        
                        <c:set var="dentistByID" value="${requestScope.dentistByID}"></c:set>
                        <div class="col-sm-5 col-6 text-right m-b-30">
                            <a href="editDentist.jsp?dentistID=${dentistByID.id}" class="btn btn-primary btn-rounded"><i class="fa fa-plus"></i> Chỉnh sửa hồ sơ</a>
                        </div>
                    </div>
                    <div class="card-box profile-header">
                        <div class="row">
                            <div class="col-md-12">

                                <c:set var="dentistByID" value="${requestScope.dentistByID}"></c:set>


                                    <div class="profile-view">                   
                                        <div class="profile-img-wrap">
                                            <div class="profile-img">
                                                <a href="#"><img class="avatar" src="${dentistByID.img}" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="profile-basic">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="profile-info-left">
                                                    <h3 class="user-name m-t-0 mb-0">${dentistByID.fullName}</h3>
                                                    <small class="text-muted">Nha Sĩ</small>
                                                    <div class="staff-id">Mã Nhân Viên : ${dentistByID.id}</div>
                                                    <div class="staff-msg">
                                                        <a href="#" onclick="confirmDelete('${dentistByID.id}')" class="btn btn-primary">Xóa Nhân Viên</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <ul class="personal-info">
                                                    <li>
                                                        <span class="title">Số Điện Thoại:</span>
                                                        <span class="text"><a href="#">${dentistByID.phoneNumber}</a></span>
                                                    </li>
                                                    <li>
                                                        <span class="title">Email:</span>
                                                        <span class="text"><a href="#">${dentistByID.email}</a></span>
                                                    </li>
                                                    <li>
                                                        <span class="title">Bằng Cấp:</span>
                                                        <span class="text">${dentistByID.degree}</span>
                                                    </li>
                                                    <li>
                                                        <span class="title">Giới Tính</span>
                                                        <span class="text">${dentistByID.gender}</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <script src="assets/js/title_sort.js"></script>                        

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
            // Hàm xử lý sự kiện khi nhấp vào tùy chọn "Xóa"
            function confirmDelete(dentistID) {
                // Hiển thị hộp thoại xác nhận
                var result = confirm("Bạn có muốn xóa nhân viên này không?");

                // Nếu người dùng chọn "OK" trong hộp thoại xác nhận
                if (result) {
                    // Chuyển hướng tới trang xóa nhân viên
                    window.location.href = "MainController?action=deleteDentist&dentistID=" + dentistID;
                } else {
                    // Xử lý khi người dùng không đồng ý xóa
                    console.log('Hủy xóa');
                    // Có thể thực hiện các hành động khác tại đây (ví dụ: tắt form)
                }
            }
        </script>
    </body>
    <!-- profile23:03-->
</html>
