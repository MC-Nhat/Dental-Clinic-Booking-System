<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@100;300;400;500;800&family=Poppins:wght@400;500;600;700&display=swap"
            rel="stylesheet">
        <style>
            body{
                background: url()
            }
        </style>
    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <div class="container">
                <div class="table-wrapper" style="background: #fff; padding: 20px 20px;">
                    <div class="table-title">

                        <div class="row">
                            <div class="col-sm-12" style="background: #06A3DA; border-radius: 6px; padding: 20px 25px;">
                                <h4 style="color: white;">Xem Dịch Vụ</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="editEmployeeModal">
                    <div class="modal-dialog" >
                        <div class="modal-content" style="background: #06A3DA; color: white;">
                            <form action="#" method="post">
                            <fmt:setLocale value = "vi_VN"/>
                            <div class="modal-header">						
                                <h4 class="modal-title"  style="color: white;">Chi Tiết Dịch Vụ</h4>

                            </div>
                            <div class="modal-body">	

                                <div class="form-group">
                                    <label>Tên dịch vụ</label>
                                    <input name="name" value="${name}" type="text" class="form-control" required readonly="">
                                </div>
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <textarea name="mota"  class="form-control" required readonly="">${mota}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Giá tiền</label>
                                    <input type="text" class="form-control" value='<fmt:formatNumber value="${price}" type="currency"/>' readonly>

                                </div>
                                <div class="form-group">
                                    <label>Phản hồi từ khách hàng</label>
                                    <textarea name="mota"  class="form-control" required readonly="">${cmt}</textarea>

                                </div>


                            </div>
                            <div class="modal-footer" style="background: white; ">
                                <input type="button" class="btn btn-default" value="Cancel" onclick="location.href = 'serviceUser.jsp';" />
                                <input type="submit" class="btn btn-success" style="background: #06A3DA;" value="Đặt Lịch Hẹn">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <jsp:include page="footer.jsp"></jsp:include>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>