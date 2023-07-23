<%-- 
    Document   : appointments
    Created on : May 29, 2023, 8:01:15 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">


    <!-- appointments23:19-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="headerMarketing.jsp"></jsp:include>

            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-4 col-4">
                            <h4 class="page-title">Lịch Hẹn</h4>
                        </div>
                        <div class="col-sm-4 col-4">
                            <form action="MainController" method="post">
                                Từ <input type="date" name="from" placeholder="dd/mm/yyyy"> 
                                Đến <input type="date" name="to" placeholder="dd/mm/yyyy">
                                <button type="submit" value="searchAppointmentByDate" name="action">Tìm Kiếm</button>
                            </form>
                        </div>
<!--                        <div class="col-sm-4 col-4 text-right m-b-20">
                            <a href="MainController?action=CreateAppointmentPage" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Thêm Cuộc Hẹn</a>
                        </div>-->
                    </div>                                      
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Họ và Tên Bệnh Nhân</th>
                                            <th>Bác sĩ</th>
                                            <th>Ngày Khám</th>
                                            <th>Trạng thái</th>
<!--                                            <th class="text-right">Action</th>-->
                                        </tr>
                                    </thead>
                                    
                                <c:set var="listAppointment" value="${requestScope.listAppointment}"></c:set>
                                <c:if test="${empty listAppointment}">
                                    <tbody>
                                        <tr style="color: red">
                                            <td>
                                                Không Tìm Thấy!!!
                                            </td>                       
                                        </tr>
                                    </tbody>    
                                </c:if>
                                    
                                <c:if test="${not empty listAppointment}">
                                    <tbody>
                                        <c:forEach var="appoint" items="${listAppointment}">
                                            <tr>
                                                <td>${appoint.id}</td>
                                                <td><img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle m-r-5" alt="">${appoint.userName}</td>
                                                <td>${appoint.dentistName}</td>
                                                <td>${appoint.date}</td>
                                                <td>
                                                    <c:if test="${appoint.status == true}">
                                                        <span class="custom-badge status-red">Đã hoàn thành</span>
                                                    </c:if>
                                                    <c:if test="${appoint.status == false}">
                                                        <span class="custom-badge status-green">Đang chờ</span>
                                                    </c:if>
                                                </td>
<!--                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="edit-appointment.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_appointment"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </td>-->
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </c:if>
                                    
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        
    </body>


    <!-- appointments23:20-->
</html>