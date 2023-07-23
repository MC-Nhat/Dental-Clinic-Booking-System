<%-- 
    Document   : editDentist
    Created on : May 21, 2023, 1:11:41 PM
    Author     : ADMIN
--%>

<%@page import="DAL.DentistDAO"%>
<%@page import="Models.Dentist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">


    <!-- edit-doctor24:06-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
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
                            <div class="col-lg-8 offset-lg-2">
                                <h4 class="page-title">Chỉnh sửa bác sĩ</h4>
                            </div>
                        </div>

                    <%
                        String dentistID = request.getParameter("dentistID");
                        DentistDAO dentistDAO = new DentistDAO();
                        Dentist dentist = dentistDAO.getDentistByID(dentistID);
                    %>  
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form action="MainController" method="get">
                                <input type="hidden" name="editIDDentist" value="<%= dentist.getId()%>">
                                <input type="hidden" name="editEmailDentistReal" value="<%= dentist.getEmail()%>">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Họ và Tên <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" value="<%= dentist.getFullName()%>" name="editNameDentist">
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Email <span class="text-danger">*</span></label>
                                            <input class="form-control" type="email" name="editEmailDentist" value="<%= dentist.getEmail()%>" readonly>
                                        </div>
                                        <h6 style="color: red">${requestScope.reportEmail}</h6>
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Số Điện Thoại (10 số) </label>
                                            <input class="form-control" type="text" name="editPhoneDentist" pattern="[0-9]{10}" value="<%= dentist.getPhoneNumber()%>">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Ảnh Đại Diện</label>
                                            <div class="profile-upload">
                                                <div class="upload-img">
                                                    <img alt="" src="<%= dentist.getImg()%>">
                                                </div>
                                                <div class="upload-input">
                                                    <input type="file" name="editImageDentist" class="form-control"  >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="gender">Giới tính:</label>
                                            <select id="gender" name="gender">
                                                <%
                                                if (dentist.getGender().equals("Nam")) {
                                                %>
                                                    <option value="Nam">Nam</option>
                                                    <option value="Nữ">Nữ</option>
                                                    <option value="Khác">Khác</option>
                                                <%   
                                                }else if(dentist.getGender().equals("Nữ")){
                                                %>
                                                    <option value="Nữ">Nữ</option>
                                                    <option value="Nam">Nam</option>
                                                    <option value="Khác">Khác</option>
                                                <%  
                                                }else {
                                                %>
                                                    <option value="Khác">Khác</option>
                                                    <option value="Nam">Nam</option>
                                                    <option value="Nữ">Nữ</option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Kinh nghiệm</label>
                                            <textarea class="form-control" name="editExperienceDentist" placeholder="<%= dentist.getExperience()%>" rows="3" cols="30"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Bằng cấp</label>
                                            <textarea class="form-control" name="editDegreeDentist" placeholder="<%= dentist.getDegree()%>" rows="3" cols="30"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="display-block">Trạng thái</label>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="editStatusDentist" id="doctor_active" value="1" checked>
                                                <label class="form-check-label" for="doctor_active">
                                                    Đã kích hoạt
                                                </label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="editStatusDentist" id="doctor_inactive" value="0">
                                                <label class="form-check-label" for="doctor_inactive">
                                                    Chưa kích hoạt
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="m-t-20 text-center">
                                            <button class="btn btn-primary submit-btn" name="action" value="saveDentist">CẬP NHẬT</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </body>
    <!-- edit-doctor24:06-->
</html>
