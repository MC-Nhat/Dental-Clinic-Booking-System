<%-- 
    Document   : patient
    Created on : 20-May-2023, 22:17:43
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Models.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <c:if test="${sessionScope.User.getRoleID() != 1}"><c:redirect url="login.jsp"/></c:if>
        <div class="main-wrapper">
                     <jsp:include page="header.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-4 col-3">
                            <h4 class="page-title" >Quản Lý Bệnh Nhân</h4>
                        </div>
                        <div>
                            <form action="MainController" method="get">
                                <div class="row filter-row">
                                    <div class="form-group form-focus">
                                        <label class="focus-label">Tên Bệnh Nhân</label>
                                        <input  oninput="txtSearch(this)" type="text" name="txtSearch"  class="form-control floating " size="30">

                                        <input class="btn btn-success btn-block float-lg-left" type="submit" value="Tìm kiếm" name="action" size="30">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-12 col-9 text-right m-b-20">
                            <a href="add-patient.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Thêm Bệnh Nhân</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-border table-striped custom-table datatable mb-0">

                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Họ và Tên</th>
                                            <th>Số điện thoại</th>
                                            <th>Email</th>
                                            <th>Roll</th>
                                            <th>Trạng thái</th>
                                            <th class="text-right">Hành động</th>
                                        </tr> 
                                    </thead>
                                    <tbody>
                                        <c:if test="${sessionScope.search!=null}">
                                            <c:set var="list" value="${sessionScope.search}"></c:set>
                                        </c:if>
                                        <c:if test="${sessionScope.search==null}">
                                            <c:set var="list" value="${requestScope.patient}"></c:set>
                                        </c:if>
                                        <c:forEach var="acc" items="${list}">
                                            <tr>
                                                <td><c:out value="${acc.getId()}"></c:out></td>
                                                <td><c:out value="${acc.getFullName() }"></c:out></td>

                                                    <td><c:out value="${acc.getPhoneNumber() }"></c:out></td>
                                                <td><c:out value="${acc.getEmail() }"></c:out></td>
                                                <td><c:out value="${acc.getRoll() }"></c:out></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test = "${acc.isStatus() ==  true}" ><span class="custom-badge status-green">Đang Hoạt Động</span></c:when>
                                                        <c:otherwise><span class="custom-badge status-grey">Ngừng Hoạt Động</span></c:otherwise>
                                                    </c:choose>
                                                </td>


                                                    <td class="text-right">
                                                        <div class="dropdown dropdown-action">
                                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                            <div class="dropdown-menu dropdown-menu-right">
        <!--                                                        <a class="dropdown-item" href="editPatientServlet?id=${p.getId()}"><i class="fa fa-pencil m-r-5"></i> Edit</a>-->
                                                            <a class="dropdown-item" href="MainController?action=deletePatient&sid=${acc.getId()}"><i class="fa fa-trash-o m-r-5"></i> Xóa bệnh nhân</a>

                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <c:set var="currentPage" value="${requestScope.current}" ></c:set>

                                        <div class="row" >
                                            <div class="col-sm-12 col-12 text-right m-b-20">
                                                <div>
                                                    <ul class="pagination float-right">
                                                    <c:if test="${currentPage > 1}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="Patient?page=${currentPage - 1}&click=true" tabindex="-1">Previous</a>
                                                        </li>
                                                    </c:if>

                                                    <c:choose>
                                                        <c:when test="${currentPage <= 3}">
                                                            <c:forEach var="i" begin="1" end="3">
                                                                <li class="page-item ${click == i ? "active":""}">
                                                                    <a class="page-link" href="Patient?page=${i}&click=true">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:when test="${currentPage > 3}">
                                                            <c:forEach var="i" begin="4" end="6">
                                                                <li class="page-item ${click == i ? "active":""}">
                                                                    <a class="page-link" href="Patient?page=${i}&click=true">${i}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:if test="${currentPage < 6}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="Patient?page=${currentPage + 1}&click=true">Next</a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>                  
                            </tbody>
                            </body>
                            </html>
