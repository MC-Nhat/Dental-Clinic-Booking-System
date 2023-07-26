<%-- 
    Document   : view-treatmentcourse-of-dentist
    Created on : Jun 15, 2023, 7:13:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">

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
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/search-bar.css">
        <style>

        </style>
    </head>
    <body>idTreatment
        <jsp:include page="headerdentist.jsp"></jsp:include>
        <c:set var="TreatmentDetailList" value="${requestScope.TreatmentDetailList}"></c:set>
        <div class="tab-pane show active" id="solid-rounded-justified-tab1">
            <div class="page-wrapper">
                <div class="content">
                    
                     <div class="row">
                        <div class="col-sm-7 col-6">
                            <h4 class="page-title">Bệnh nhân: ${sessionScope.nameCus}</h4>
                        </div>

                        <div class="col-sm-5 col-6 text-right m-b-30">
                            <a href="add-treatmentcoursedetail.jsp" class="btn btn-primary btn-rounded"><i class="fa fa-plus"></i> Tạo ngày hẹn mới </a>
                        </div>
                    </div>
                        
                    <div class="row" style="text-align: center">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table">
                                    <thead>  
                                        <tr>
                                            <th><a href="#">Lần khám</a></th>
                                            <th><a href="#">Ngày Hẹn</a></th>
                                            <th><a href="#">Giờ Hẹn</a></th>
                                            <th><a href="#">Dịch Vụ</a></th>
                                            <th><a href="#">Ghi Chú</a></th>
                                            <th><a href="#">Trạng Thái Khám</a></th>
                                            <th><a href="#">Trạng Thái Thanh Toán</a></th>
                                            <th><a href="#">Chỉnh sửa</a></th>
                                        </tr>                                        
                                    </thead>
                                    <tbody id="content">
                                        <c:forEach var="listD" items="${TreatmentDetailList}" varStatus="status">
                                            <tr style="text-align: center">
                                                <td>${status.index + 1}</td>
                                                <td>${listD.treatmentdate}</td>
                                                <td>${listD.treatmenttime}</td>
                                                <td>${listD.nameService}</td>
                                                <td>${listD.description}</td>
                                                <c:if test="${listD.status == true}">
                                                    <td style="color: red; font-weight: bold;">Đã hoàn thành</td>
                                                    <c:if test="${listD.statusPaid == true}">
                                                        <td style="color: red; font-weight: bold;">Đã thanh toán</td>
                                                    </c:if>   
                                                    <c:if test="${listD.statusPaid == false}">
                                                        <td style="color: #35BA67; font-weight: bold;">Chưa thanh toán</td>
                                                    </c:if>
                                                    <td></td>
                                                </c:if>
                                                <c:if test="${listD.status == false}">
                                                    <td style="color: #35BA67; font-weight: bold;">Chưa hoàn thành</td>
                                                    <c:if test="${listD.statusPaid == true}">
                                                        <td style="color: red; font-weight: bold;">Đã thanh toán</td>
                                                    </c:if>   
                                                    <c:if test="${listD.statusPaid == false}">
                                                        <td style="color: #35BA67; font-weight: bold;">Chưa thanh toán</td>
                                                    </c:if>
                                                    <td><a href="edit-treatmentcoursedetail.jsp?idDetail=${listD.id}" style="color: black">Chỉnh sửa</a></td> 
                                                </c:if>
                                            </tr>
                                        </c:forEach>                                       
                                    </tbody>
                                </table>
                                <span style="color: red;">
                                    <%= (request.getAttribute("RESPONSE") == null) ? "" : (String) request.getAttribute("RESPONSE")%>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            
            
        </div>
    </body>
</html>
