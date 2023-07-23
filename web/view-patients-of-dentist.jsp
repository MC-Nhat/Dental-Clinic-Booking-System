<%-- 
    Document   : view-patients-of-dentist
    Created on : Jun 15, 2023, 12:44:33 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .green-button {
                background-color: #009efb;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="main-wrapper">
            <jsp:include page="headerdentist.jsp"></jsp:include>
            
            <c:set var="idDentistTreatment" value="${sessionScope.idDentistTreatment}"></c:set>
                <div class="page-wrapper">
                    <div class="content">
                        <div class="row">
                            <div class="col-sm-4 col-3">
                                <h4 class="page-title">Danh Sách Liệu Trình</h4>
                            </div>
                            <div class="col-sm-8 col-9 text-right m-b-20">
                                <div class="form-row">
                                    <input  oninput="searchByName(this)" class="form-input" type="text" name="txtSearch" placeholder="Tìm Kiếm" value="<%= (request.getParameter("txt") == null) ? "" : request.getParameter("txt")%>">
                                    <button class="form-button">Theo Tên Khách Hàng</button>
                                </div>
                            </div>
                        </div>
                    <c:set var="TreatmentList" value="${requestScope.TreatmentList}"></c:set>
                        <div class="row" style="text-align: center">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table id="myTable" class="table table-border table-striped custom-table mb-0">
                                        <thead>
                                            <tr>
                                                <th><a href="#">ID Liệu trình</a></th>
                                                <th><a href="#">Tên Khách Hàng</a></th>
                                                <th><a href="#">Tên Liệu Trình</a></th>
                                                <th><a href="#">Trạng thái</a></th>
                                                <th><a href="#">Tùy chọn</a></th>
                                            </tr>                                        
                                        </thead>
                                        <tbody id="content">
                                        <c:forEach var="list" items="${TreatmentList}">
                                            <tr>
                                                <td>${list.getId()}</td>
                                                <td>${list.getNamecustomer()}</td>
                                                <td>${list.getNameTreatment()}</td>
                                                <c:if test="${list.isStatus() == true}">
                                                    <td style="color: red; font-weight: bold;">Đã hoàn thành</td>
                                                </c:if>
                                                <c:if test="${list.isStatus() == false}">
                                                    <td style="color: #35BA67; font-weight: bold;">Chưa hoàn thành</td>
                                                </c:if>
                                                <td><a href="MainController?action=ViewTreatmentDetailByCustomer&idTreatment=${list.getId()}&nameCus=${list.getNamecustomer()}" class="btn btn-primary">Chi tiết</a></td>
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

        </div>

        <script src="assets/js/title_sort.js"></script>                        

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/popper.min.js"></script>

        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
       
        <script>
            function searchByName(text) {
                $.ajax({
                    url: '/SWP391-SE1743/MainController',
                    data: {
                        action: 'SearchTreatmentCourse',
                        idDentistTreatment: ${idDentistTreatment},
                        txt: text.value
                    },
                    success: function (data) {
                        let row = document.getElementById("content");
                        row.innerHTML = data;
                    },
                    error: function (error) {
                        console("Fail");
                    },
                    type: 'POST'
                });
            }
        </script>
    </body>
</html>
