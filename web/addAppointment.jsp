
    <%-- 

    Document   : addAppointment
    Created on : May 21, 2023, 2:31:08 PM
    Author     : ADMIN
--%>
<%@page import="DAL.UserDAO"%>
<%@page import="DAL.DentistDAO"%>
<%@page import="Models.User"%>
<%@page import="Models.Dentist"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">


    <!-- add-doctor24:06-->
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
        <div class="main-wrapper">
            <jsp:include page="headerMarketing.jsp"></jsp:include>

            <c:set var="listPatient" value="${UserDAO.getAllPatient()}"></c:set>
            <c:set var="listDentist" value="${DentistDAO.getAllDentist()}"></c:set>

            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <h4 class="page-title">Thêm Lịch Hẹn</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <form action="MainController" method="post"> 
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="patient">Bệnh nhân<span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="createNamePatientAppoint" required="" oninput="filterOptions('patient')">
                                            <select id="patient" name="patient" onchange="displaySelectedOption('patient')">
                                                <option disabled selected>Chọn Bệnh nhân</option>
                                                <c:forEach var="patient" items="${listPatient}">
                                                    <option value="${patient.getId()}">${patient.getFullName()} (ID: ${patient.getId()})</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="dentist">Nha sĩ <span class="text-danger">*</span></label>
                                            <input class="form-control" type="text" name="createNameDentistAppoint" required="" oninput="filterOptions('dentist')">
                                            <select id="dentist" name="dentist" onchange="displaySelectedOption('dentist')">
                                                <option disabled selected>Chọn Nha sĩ</option>
                                                <c:forEach var="dentist" items="${listDentist}">
                                                    <option value="${dentist.getId()}">${dentist.getFullName()} (ID: ${dentist.getId()})</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Ngày khám</label>
                                            <input class="form-control" type="date" name="createDateAppoint" required="">
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Tình trạng Bệnh nhân</label>
                                            <textarea class="form-control" rows="3" cols="30" name="createDescriptionAppoint" required=""></textarea>
                                        </div>
                                    </div>

                                    <div class="m-t-20 text-center">
                                        <button class="btn btn-primary submit-btn" type="submit" name="action" value="createAppoint">Tạo lịch hẹn</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script>
            function filterOptions(selectId) {
                var inputElement = document.getElementsByName("createName" + capitalizeFirstLetter(selectId) + "Appoint")[0];
                var selectElement = document.getElementById(selectId);
                var inputValue = inputElement.value.toLowerCase();
                var options = selectElement.options;

                for (var i = 0; i < options.length; i++) {
                    var optionText = options[i].text.toLowerCase();
                    if (optionText.includes(inputValue)) {
                        options[i].style.display = "block";
                    } else {
                        options[i].style.display = "none";
                    }
                }
            }

            function displaySelectedOption(selectId) {
                var selectElement = document.getElementById(selectId);
                var inputElement = document.getElementsByName("createName" + capitalizeFirstLetter(selectId) + "Appoint")[0];
                var selectedOption = selectElement.options[selectElement.selectedIndex].text;
                inputElement.value = selectedOption;
            }

            function capitalizeFirstLetter(string) {
                return string.charAt(0).toUpperCase() + string.slice(1);
            }
        </script>
    </body>
</html>
