<%-- 
    Document   : send-feedback
    Created on : Jun 28, 2023, 5:17:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link href="img/favicon.ico" rel="icon">
        <style>
            .rate1 {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate1:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate1:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate1:not(:checked) > label:before {
                content: '★ ';
            }
            .rate1 > input:checked ~ label {
                color: #ffc700;
            }
            .rate1:not(:checked) > label:hover,
            .rate1:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate1 > input:checked + label:hover,
            .rate1 > input:checked + label:hover ~ label,
            .rate1 > input:checked ~ label:hover,
            .rate1 > input:checked ~ label:hover ~ label,
            .rate1 > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }
            .rate2 {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate2:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate2:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate2:not(:checked) > label:before {
                content: '★ ';
            }
            .rate2 > input:checked ~ label {
                color: #ffc700;
            }
            .rate2:not(:checked) > label:hover,
            .rate2:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate2 > input:checked + label:hover,
            .rate2 > input:checked + label:hover ~ label,
            .rate2 > input:checked ~ label:hover,
            .rate2 > input:checked ~ label:hover ~ label,
            .rate2 > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }
        </style>
    </head>
    <body>
        <jsp:include page="headerUser.jsp"></jsp:include>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Đánh Giá</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form action="AddFeedBackController" method="POST">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Tên bác sĩ</label>
                                            <input class="form-control" value="${requestScope.Dentist.getFullName()}" disabled type="text">
                                        <div class="rate1">
                                            <input type="radio" id="star5" name="dentistRate" value="5" />
                                            <label for="star5" title="text">5 stars</label>
                                            <input type="radio" id="star4" name="dentistRate" value="4" />
                                            <label for="star4" title="text">4 stars</label>
                                            <input type="radio" id="star3" name="dentistRate" value="3" />
                                            <label for="star3" title="text">3 stars</label>
                                            <input type="radio" id="star2" name="dentistRate" value="2" />
                                            <label for="star2" title="text">2 stars</label>
                                            <input type="radio" id="star1" name="dentistRate" value="1" />
                                            <label for="star1" title="text">1 star</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label>Đánh Giá <span class="text-danger">*</span></label> 
                                        <textarea class="form-control" name="dentistFeedback" cols="30" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Tên Dịch Vụ</label>
                                        <input class="form-control" value="${requestScope.Service.getName()}" disabled type="text">
                                        <div class="rate2">
                                            <input type="radio" id="star10" name="serviceRate" value="5" />
                                            <label for="star10" title="text">5 stars</label>
                                            <input type="radio" id="star9" name="serviceRate" value="4" />
                                            <label for="star9" title="text">4 stars</label>
                                            <input type="radio" id="star8" name="serviceRate" value="3" />
                                            <label for="star8" title="text">3 stars</label>
                                            <input type="radio" id="star7" name="serviceRate" value="2" />
                                            <label for="star7" title="text">2 stars</label>
                                            <input type="radio" id="star6" name="serviceRate" value="1" />
                                            <label for="star6" title="text">1 star</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label>Đánh Giá <span class="text-danger">*</span></label>
                                        <textarea class="form-control" name="serviceFeedback" cols="30" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="m-t-20 text-center">
                                <button class="btn btn-primary submit-btn">Gửi</button>
                                <input type="hidden" name="dentistID" value="${requestScope.Dentist.getId()}">
                                <input type="hidden" name="serviceID" value="${requestScope.Service.getId()}">
                                <input type="hidden" name="treatmentCourseDetailID" value="${requestScope.treatmentCourseDetailID}">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
