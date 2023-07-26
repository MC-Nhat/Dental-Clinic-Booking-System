<%-- 
    Document   : service-2
    Created on : May 20, 2023, 6:59:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAL.ServiceDAO"%>
<%@page import="Models.Service"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
        <style>      
            .btnLink{
                background: none;
                border: none;
                cursor: pointer;
                color: #009ce7;
                font-weight: bold;
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
                            <div class="col-sm-4 col-3">
                                <h4 class="page-title">Quản Lý Dịch Vụ</h4>
                            </div>
                            <div class="col-sm-8 col-9 text-right m-b-20">
                                <a href="add-service.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Thêm Dịch Vụ</a>
                            </div>
                        </div>
                        <div class="row filter-row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Tìm Dịch Vụ</label>
                                    <input oninput="searchByName(this)" type="text" class="form-control floating">
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">

                                <div class="table-responsive">

                                    <table id="myTable" class="table table-border table-striped custom-table mb-0">
                                        <thead>
                                            <tr>
                                                <th><a href="#">ID </th>
                                                <th ><a href="#">Tên Dịch Vụ</th>
                                                <!--                                                <th>Mô Tả</th>-->
                                                <th>
                                                    <form action="SortServiceController" method="POST">
                                                        <button class="btnLink" style="">Giá Tiền</button>
                                                        <input type="hidden" name="page" value="${requestScope.current}">
                                                    <input type="hidden" name="count" value="${requestScope.count}">
                                                    <input type="hidden" name="flag" value="ad">
                                                </form>
                                            </th>
                                            <th><a href="#">Trạng Thái</th>
                                            <th class="text-right">Tùy Chọn</th>
                                        </tr>
                                    </thead>
                                    <tbody id="content">

                                        <fmt:setLocale value = "vi_VN"/>
                                        <c:forEach var="s" items="${sessionScope.ServiceList}">

                                            <tr>
                                                <td><c:out value="${s.getId()}"></c:out></td>
                                                <td><c:out value="${s.getName()}"></c:out></td>
<!--                                                        <td><c:out value="${s.getMota()}"></c:out></td>-->
                                                <td><fmt:formatNumber value="${s.getPrice()}" type = "currency"/></td>
                                                <c:if test="${s.isStatus()==true}">
                                                    <td><span class="custom-badge status-green">Đang Hoạt Động</span></td>
                                                </c:if>
                                                <c:if test="${s.isStatus()==false}">
                                                    <td><span class="custom-badge status-orange">Ngừng Hoạt Động</span></td>
                                                </c:if>
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <a class="dropdown-item" href="MainController?action=EditService&id=${s.getId()}"><i class="fa fa-pencil m-r-5"></i> Chỉnh sửa</a>
                                                            <a class="dropdown-item delete-service" ><i class="fa fa-trash-o m-r-5"></i>Xóa</a>
<!--                                                                    <a class="dropdown-item" data-toggle="modal" data-target="#delete_schedule" href="?id=${s.getId()}"><i class="fa fa-trash-o m-r-5"></i> Delete</a>-->
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <c:set var="currentPage" value="${requestScope.current}" ></c:set>
                        <div class="row">
                            <div class="col-sm-12 col-12 text-right m-b-20">
                                <div>
                                    <ul class="pagination float-right">
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="loadServiceController?page=${currentPage - 1}&click=true" tabindex="-1">Trước</a>
                                        </li>
                                    </c:if>

                                    <c:choose>
                                        <c:when test="${currentPage <= 3}">
                                            <c:forEach var="i" begin="${begin1}" end="${end1}">
                                                <li class="page-item ${click == i ? "active":""}">
                                                    <a class="page-link" href="loadServiceController?page=${i}&click=true">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${currentPage > 3}">
                                            <c:forEach var="i" begin="${begin2}" end="${end2}">
                                                <li class="page-item ${click == i ? "active":""}">
                                                    <a class="page-link" href="loadServiceController?page=${i}&click=true">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${currentPage > 6}">
                                            <c:forEach var="i" begin="${begin3}" end="${end3}">
                                                <li class="page-item ${click == i ? "active":""}">
                                                    <a class="page-link" href="loadServiceController?page=${i}&click=true">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="loadServiceController?page=${currentPage + 1}&click=true">Kế Tiếp</a>
                                        </li>
                                    </c:if>
                                </ul>
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
            document.querySelectorAll('.delete-service').forEach(function (item) {
                item.addEventListener('click', function (event) {
                    event.preventDefault();

                    // Lưu trữ thẻ <tr> chứa thông tin dịch vụ
                    var serviceRow = this.closest('tr');

                    // Lấy giá trị ID từ phần tử <td> trong thẻ <tr>
                    var serviceID = serviceRow.querySelector('td:first-child').textContent;
                    var comfirmation = confirm("Bạn có chắc muốn xóa chứ?");
                    if (comfirmation) {
                        url = "MainController?action=DeleteService&id=" + serviceID;
                        window.location.href = url;
                    }
                });
            });

            function searchByName(text) {
                $.ajax({
                    url: '/SWP391-SE1743/MainController',
                    data: {
                        action: 'Search Service By Name',
                        name: text.value
                    },
                    success: function (data) {
                        let row = document.getElementById("content");
                        row.innerHTML = data;
                    },
                    error: function (error) {
                        console("Fail");
                    },
                    type: 'GET'
                });
            }

        </script>

    </body>

</html>
