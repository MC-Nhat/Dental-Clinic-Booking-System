<%-- 
    Document   : employee
    Created on : May 20, 2023, 6:22:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <!-- employees23:21-->
    <head>
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
                            <div class="col-sm-4 col-3">
                                <h4 class="page-title">Quản Lý Nhân Viên</h4>
                            </div>
                            <div class="col-sm-8 col-9 text-right m-b-20">
                                <a href="addEmployee.jsp" class="btn btn-primary float-right btn-rounded"><i class="fa fa-plus"></i> Thêm Nhân Viên</a>
                            </div>
                        </div>
                        <div class="row filter-row">
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group form-focus">
                                    <label class="focus-label">Tên Nhân Viên</label>
                                    <input oninput="searchByName(this)" type="text" class="form-control floating">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3">
                                <div class="form-group form-focus select-focus">
                                    <label class="focus-label">Vai Trò</label>
                                    <select class="select floating" onchange="searchByRole(this.options[this.selectedIndex].value)">
                                        <option value="0">Chọn Role</option>
                                    <c:forEach items="${LIST_ROLE}" var="r">
                                        <option value="${r.getId()}">${r.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table">
                                    <thead>
                                        <tr>
                                            <th style="min-width:200px;">Tên</th>
                                            <th>ID Nhân Viên</th>
                                            <th>Email</th>
                                            <th>Số Điện Thoại</th>
                                            <th>Vị Trí</th>
                                            <th>Giới Tính</th>
                                            <th class="text-right">Tùy chọn</th>
                                        </tr>
                                    </thead>
                                    <tbody id="content">
                                        <c:forEach items="${requestScope.LIST_EMPLOYEES}" var="e">
                                            <tr>
                                                <td>
                                                    <img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle" alt=""> <strong style="font-weight: 500">${e.getFullName()}</strong>
                                                </td>
                                                <td>${e.getId()}</td>
                                                <td>${e.getEmail()}</td>
                                                <td>${e.getPhoneNumber()}</td>
                                                <td style="padding: 0">
                                                    <c:choose>
                                                        <c:when test = "${e.getRoleID() ==  1}" ><span style="border: none; background: none; font-size: 13px; text-align: left;font-weight: 500 " class="custom-badge status-green">Admin</span></c:when>
                                                        <c:when test = "${e.getRoleID() ==  3}" ><span style="border: none; background: none; font-size: 13px; text-align: left;font-weight: 500" class="custom-badge status-orange">Marketing</span></c:when>
                                                        <c:otherwise><span style="border: none; background: none; font-size: 13px; text-align: left;font-weight: 500" class="custom-badge status-purple">Chăm sóc Khách Hàng</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${e.getGender()}</td>
                                                <!--<td> ${e.getGender().equals("Nam") ? "<span class='custom-badge status-blue'>Nam</span>":"<span class='custom-badge status-pink'>Nữ</span>"}</td>-->
                                                <td class="text-right">
                                                    <div class="dropdown dropdown-action">
                                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                        <div class="dropdown-menu dropdown-menu-right">
                                                            <form action="GetEmployeeByIDController" method="POST">
                                                                <button class="dropdown-item">
                                                                    <i class="fa fa-pencil m-r-5"></i>
                                                                    Chỉnh Sửa
                                                                </button>
                                                                <input type="hidden" name="id" value="${e.getId()}">
                                                                <a class="dropdown-item delete-employee" ><i class="fa fa-trash-o m-r-5"></i>Xóa</a>
                                                            </form>

                                                            <!--<a class="dropdown-item delete-employee" data-toggle="modal" data-target="#delete_employee"><i class="fa fa-trash-o m-r-5"></i>Delete</a>-->
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                            <div class="col-sm-12 col-12 text-right m-b-20">
                                <div id="contentPage">
                                    <ul class="pagination float-right ">
                                        <c:forEach var="i" begin="1" end="${END_PAGE}">
                                            <li class="page-item ${CLICK == i ?"active":""}"><a class="page-link" href="GetEmployeesController?index=${i}&click=${i}">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="delete_employee" class="modal fade delete-modal" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body text-center">
                            <img src="assets/img/sent.png" alt="" width="50" height="46">
                            <h3>Are you sure want to delete this Employee?</h3>
                            <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
                                <button type="submit" class="btn btn-danger">Delete</button>
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
                                        document.querySelectorAll('.delete-employee').forEach(function (item) {
                                            item.addEventListener('click', function (event) {
                                                event.preventDefault();
                                                var employeeRow = this.closest('tr');
                                                var employeeID = employeeRow.querySelector('td:nth-child(2)').textContent;
                                                var comfirmation = confirm("Bạn có chắc muốn xóa chứ?");
                                                if (comfirmation) {
                                                    url = "MainController?action=DeleteEmployee&id=" + employeeID;
                                                    window.location.href = url;
                                                }
                                            });
                                        });
                                        function searchByRole(roleID) {
                                            $.ajax({
                                                url: '/SWP391-SE1743/MainController',
                                                data: {
                                                    action: 'Search Employee By Role',
                                                    id: roleID
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
                                        function searchByName(text) {
                                            $.ajax({
                                                url: '/SWP391-SE1743/MainController',
                                                data: {
                                                    action: 'Search Employee By Name',
                                                    name: text.value
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
                                        let pagingLink = document.querySelectorAll('.paging-link');
                                        function activeWork() {
                                            pagingLink.forEach(element => {
                                                element.classList.remove('is-active');
                                                this.classList.add('is-active');
                                            });
                                        }
                                        pagingLink.forEach(element => {
                                            element.addEventListener('click', activeWork);
                                        });

        </script>
    </body>
</html>