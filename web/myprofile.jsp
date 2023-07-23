<%-- 
    Document   : myprofile
    Created on : May 24, 2023, 7:05:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <c:set var="u" value="${sessionScope.User}"></c:set>
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-7 col-6">
                            <h4 class="page-title">Thông Tin Của Tôi</h4>
                        </div>

                        <div class="col-sm-5 col-6 text-right m-b-30">
                            <a href="editProfile.jsp" class="btn btn-primary btn-rounded"><i class="fa fa-plus"></i> Chỉnh Sửa</a>
                        </div>
                    </div>
                    <div class="card-box profile-header">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="profile-view">
                                    <div class="profile-img-wrap">
                                        <div class="profile-img">
                                            <a href="#"><img class="avatar" src="" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="profile-basic">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="profile-info-left">
                                                    <h3 class="user-name m-t-0 mb-0">${u.getFullName()}</h3>
                                                <div class="staff-id">ID Nhân Sự: ${u.getId()}</div>
                                                <div class="staff-id">Chức vụ: Admin</div>

                                                <div class="staff-msg"><a href="MainController?action=changePassPage" class="btn btn-primary btn-rounded">Thay đổi mật khẩu</a></div>

                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <ul class="personal-info">
                                                <li>
                                                    <span class="title">Số Điện Thoại:</span>
                                                    <span class="text"><a href="#">${u.getPhoneNumber()}</a></span>
                                                </li>
                                                <li>
                                                    <span class="title">Email:</span>
                                                    <span class="text"><a href="#">${u.getEmail()}</a></span>
                                                </li>
                                                <li>
                                                    <span class="title">Giới tính:</span>
                                                    <span class="text">${u.getGender()}</span>
                                                </li>
                                                <li>
                                                    <span class="title">Vai Trò:</span>
                                                    <c:choose>
                                                        <c:when test = "${u.getRoleID() ==  1}" ><span class="text">Admin</span></c:when>
                                                        <c:when test = "${u.getRoleID() ==  3}" ><span class="text">Marketing</span></c:when>
                                                        <c:otherwise><span class="text">Chăm Sóc Khách Hàng</span></c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>                        
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </body>
</html>