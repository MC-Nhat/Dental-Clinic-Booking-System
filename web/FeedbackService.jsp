<%-- 
    Document   : FeedbackService
    Created on : May 22, 2023, 6:49:06 PM
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
        <link rel="stylesheet" type="text/css" href="assets/css/search-bar.css">


        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
    </head>

    <body>
        <c:set var="role" value="${sessionScope.role}" />
        <c:set var="isAdmin" value="${role eq 1}" />
        <c:set var="isMarketing" value="${role eq 3}" />
        <div class="main-wrapper">



            <c:if test="${isAdmin}">
                <jsp:include page="header.jsp"></jsp:include>
                    <div class="page-wrapper">
                        <div class="content">
                            <div class="row">
                                <div class="col-sm-4 col-3">
                                    <h4 class="page-title">Phản Hồi Về Dịch Vụ</h4>
                                </div>
                                <div class="col-sm-8 col-9 text-right m-b-20">
                                    <div class="form-row">
                                        <input oninput="searchByName(this)" class="form-input" type="text" name="txt" placeholder="Tìm Kiếm">
                                        <select class="form-select" name="searchby">
                                            <option value="bycustomername">Theo Tên Khách Hàng</option>
                                            <option value="byservicename">Theo Tên Dịch Vụ</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table id="myTable" class="table table-border table-striped custom-table mb-0">
                                            <thead>
                                                <tr>
                                                    <th><a href="#">Feedback ID</a></th>
                                                    <th><a href="#">Tên Khách Hàng</a></th>
                                                    <th><a href="#">Tên Dịch Vụ</a></th>
                                                    <th><a href="#">Đánh Giá</a></th>
                                                    <th><a href="#">Nội dung</a></th>
                                                    <th class="text-right">Chỉnh sửa</th>
                                                </tr>

                                            </thead>
                                            <tbody id="content">
                                            <c:forEach var="feedback" items="${sessionScope.list}">
                                                <tr class="feedbackServiceList">
                                                    <td><c:out value="${feedback.getId()}"></c:out></td>
                                                    <td><c:out value="${feedback.getNameCustomer()}"></c:out></td>
                                                    <td><c:out value="${feedback.getNameService()}"></c:out></td>
                                                        <td class="rating">
                                                        <c:set var="rating" value="${feedback.getRate()}" /> <!-- Số điểm rating -->
                                                        <c:forEach begin="1" end="5" var="star">
                                                            <span class="star">
                                                                <c:choose>
                                                                    <c:when test="${star <= rating}">
                                                                        <span style='color: gold;'>★</span>  <!-- Hiển thị ngôi sao đã chọn -->
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        &#9734; <!-- Hiển thị ngôi sao chưa chọn -->
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </c:forEach>
                                                    </td>
                                                    <td><c:out value="${feedback.getComment()}"></c:out></td>
                                                        <td class="text-right">
                                                            <div class="dropdown dropdown-action">
                                                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                                <div class="dropdown-menu dropdown-menu-right">
                                                                    <a class="dropdown-item delete-schedule" href="#" data-toggle="modal" data-target="#delete_schedule"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                            </c:forEach>                                        
                                        </tbody>
                                    </table>
                                    <span style="color: red;">
                                        <%= (request.getAttribute("RESPONSE") == null) ? "" : (String) request.getAttribute("RESPONSE")%>
                                    </span>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="see-all">
                                                <button class="see-all-btn" onclick="loadMoreFeedbackService()">Xem Thêm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>



            <c:if test="${isMarketing}">
                <jsp:include page="headerMarketing.jsp"></jsp:include>
                    <div class="page-wrapper">
                        <div class="content">
                            <div class="row">
                                <div class="col-sm-4 col-3">
                                    <h4 class="page-title">Phản Hồi Về Dịch Vụ</h4>
                                </div>
                                <div class="col-sm-8 col-9 text-right m-b-20">
                                    <div class="form-row">
                                        <input oninput="searchByName(this)" class="form-input" type="text" name="txt" placeholder="Tìm Kiếm">
                                        <select class="form-select" name="searchby">
                                            <option value="bycustomername">Theo Tên Khách Hàng</option>
                                            <option value="byservicename">Theo Tên Dịch Vụ</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <table id="myTable" class="table table-border table-striped custom-table mb-0">
                                            <thead>
                                                <tr>
                                                    <th><a href="#">Feedback ID</a></th>
                                                    <th><a href="#">Tên Khách Hàng</a></th>
                                                    <th><a href="#">Tên Dịch Vụ</a></th>
                                                    <th><a href="#">Đánh Giá</a></th>
                                                    <th><a href="#">Nội dung</a></th>
                                                </tr>
                                            </thead>
                                            <tbody id="content">
                                            <c:forEach var="feedback" items="${sessionScope.list}">
                                                <tr class="feedbackServiceList">
                                                    <td><c:out value="${feedback.getId()}"></c:out></td>
                                                    <td><c:out value="${feedback.getNameCustomer()}"></c:out></td>
                                                    <td><c:out value="${feedback.getNameService()}"></c:out></td>
                                                        <td class="rating">
                                                        <c:set var="rating" value="${feedback.getRate()}" /> <!-- Số điểm rating -->
                                                        <c:forEach begin="1" end="5" var="star">
                                                            <span class="star">
                                                                <c:choose>
                                                                    <c:when test="${star <= rating}">
                                                                        <span style='color: gold;'>★</span>  <!-- Hiển thị ngôi sao đã chọn -->
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        &#9734; <!-- Hiển thị ngôi sao chưa chọn -->
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </c:forEach>
                                                    </td>
                                                    <td><c:out value="${feedback.getComment()}"></c:out></td>
                                                    </tr>
                                            </c:forEach>                                        
                                        </tbody>
                                    </table>
                                    <span style="color: red;">
                                        <%= (request.getAttribute("RESPONSE") == null) ? "" : (String) request.getAttribute("RESPONSE")%>
                                    </span>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="see-all">
                                                <button class="see-all-btn" onclick="loadMoreFeedbackService()">Xem Thêm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                
            </c:if>
        </div>

        <script src="assets/js/title_sort.js"></script>                        

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/popper.min.js"></script>

        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script>
                                                    function loadMoreFeedbackService() {
                                                        var amount = document.getElementsByClassName("feedbackServiceList").length;
                                                        var text = document.getElementsByName("txt")[0].value;
                                                        var isSearch = document.getElementsByName("txt")[0].value !== ""; // Kiểm tra xem đã nhập từ khóa tìm kiếm hay chưa
                                                        var searchBy = document.getElementsByName("searchby")[0].value;
                                                        $.ajax({
                                                            url: "/SWP391-SE1743/LoadMoreFeedbackServiceController",
                                                            type: "get", //send it through get method
                                                            data: {
                                                                exits: amount,
                                                                issearch: isSearch,
                                                                txt: text,
                                                                searchby: searchBy
                                                            },
                                                            success: function (data) {
                                                                var row = document.getElementById("content");
                                                                row.innerHTML += data;
                                                            },
                                                            error: function (xhr) {
                                                                //Do Something to handle error
                                                            }
                                                        });
                                                    }
        </script>        
        <script>
// Lắng nghe sự kiện click của nút "Delete" cho từng mục
            $(document).on('click', '.delete-schedule', function (event) {
                event.preventDefault();

                // Lưu trữ thẻ <tr> chứa thông tin phản hồi
                var feedbackRow = $(this).closest('tr');

                // Lấy giá trị ID từ phần tử <td> trong thẻ <tr>
                var feedbackId = feedbackRow.find('td:first-child').text();

                // Hiển thị bảng thông báo xác nhận xóa
                var confirmation = confirm("Bạn có chắc chắn muốn xóa?");

                // Kiểm tra sự chấp nhận của người dùng
                if (confirmation) {
                    // Gửi yêu cầu AJAX để xóa phần tử
                    var xhr = new XMLHttpRequest();
                    xhr.open('GET', 'MainController?action=Delete%20Feedback%20Service&id=' + feedbackId);
                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            // Xóa phần tử khỏi giao diện
                            feedbackRow.remove();
                        } else {
                            console.error('Đã xảy ra lỗi khi xóa phản hồi.');
                        }
                    };
                    xhr.send();
                } else {
                    // Xử lý khi người dùng không đồng ý xóa
                    console.log('Hủy xóa');
                    // Có thể thực hiện các hành động khác tại đây (ví dụ: tắt form)
                }
            });            
        </script>
        <script>
            function searchByName(text) {
                var searchBy = document.getElementsByName("searchby")[0].value;
                $.ajax({
                    url: '/SWP391-SE1743/MainController',
                    data: {
                        action: 'Search Feedback Service',
                        txt: text.value,
                        searchby: searchBy
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