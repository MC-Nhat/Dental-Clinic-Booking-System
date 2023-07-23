<%-- 
    Document   : bill
    Created on : Jun 9, 2023, 10:02:31 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/search-bar.css">

    </head>
    <body>

        <c:if test="${sessionScope.User.getRoleID() != 1}"><c:redirect url="index.jsp"/></c:if>
        <jsp:include page="header.jsp"></jsp:include>

            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-5 col-4">
                            <h4 class="page-title">Quản Lý Hoá Đơn</h4>
                        </div>
                    </div>
                    <form action="MainController" method="post">
                        <div class="row filter-row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Từ</label>
                                    <div class="cal-icon">
                                        <input class="form-control floating datetimepicker" type="text" name="from">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Đến</label>
                                    <div class="cal-icon">
                                        <input class="form-control floating datetimepicker" type="text" name="to">
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6 col-md-3">
                                <div class="form-group form-focus select-focus">
                                    <select class="floating" name="status">
                                        <option value="byall">Chọn Trạng Thái</option>
                                        <option value="bynot">Chưa Thánh Toán</option>
                                        <option value="bydone">Đã Thanh Toán</option>
                                    </select>
                                    <!-- <a href="MainController?action=Search" type="submit" name="action" class="btn btn-success float-lg-right" > Tìm Kiếm </a>  -->
                                    <button type="submit" value="Search" name="action" class="btn btn-success float-lg-right">
                                        <span>Tìm kiếm</span>
                                </div>
                            </div>

                        </div>
                    </form>

                <fmt:setLocale value = "vi_VN"/>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-striped custom-table mb-0">
                                <thead>
                                    <tr>
                                        <th>Số Hoá Đơn</th>
                                        <th>Bệnh Nhân</th>
                                        <th>Ngày Tạo</th>
                                        <th>Mô tả</th>
                                        <th>Giá Tiền</th>
                                        <th>Trạng Thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${sessionScope.Search!=null}">
                                        <c:set var="list" value="${sessionScope.Search}"></c:set>
                                    </c:if>
                                    <c:if test="${sessionScope.Search==null}">
                                        <c:set var="list" value="${requestScope.loadbill}"></c:set>
                                    </c:if>

                                    <c:forEach var="ac" items="${requestScope.loadbill}">
                                        <tr>
                                            <td><c:out value="${ac.getId()}"></c:out></td>
                                            <td><c:out value="${ac.getUsername() }"></c:out></td>

                                                <td><c:out value="${ac.getTreatmentDate() }"></c:out></td>
                                            <td><c:out value="${ac.getDescription() }"></c:out></td>
                                            <td><fmt:formatNumber value="${ac.getPrice()}" type = "currency"/></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test = "${ac.isStatus() ==  true}" ><span class="custom-badge status-green">Đã thanh toán</span></c:when>
                                                    <c:otherwise><span class="custom-badge status-orange"">Chưa thanh toán</span></c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
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
                </body>
                </html>
