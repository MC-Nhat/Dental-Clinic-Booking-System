<%-- 
    Document   : marketing-dentists
    Created on : 31-May-2023, 17:14:36
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo.png">
        <title>DentCare</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
         <div class="main-wrapper">
            <jsp:include page="headerMarketing.jsp"></jsp:include>
                
            
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-4 col-3">
                            <h4 class="page-title">Quản Lý Bác Sĩ</h4>
                        </div>
                        
                    </div>
                    <div id="showDentist" class="row doctor-grid">


                        <c:set var="listDentist" value="${requestScope.listDentist}"></c:set>     
                        <c:forEach var="dentist" items="${listDentist}">
                            <div class="dentistProduct col-md-4 col-sm-4  col-lg-3">
                                <div class="profile-widget">
                                    <div class="doctor-img">
                                        <a class="avatar" href="MainController?action=MarketingdentistProfile&dentistID=${dentist.id}"><img alt="" src="${dentist.img}"></a>
                                    </div>
                                    <h4 class="doctor-name text-ellipsis"><a href="MainController?action=dentistProfile&dentistID=${dentist.id}">${dentist.fullName}</a></h4>
                                    <div class="user-country">
                                        <i class="fa fa-map-marker"></i> ${dentist.degree}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="see-all">
                            <button class="see-all-btn" onclick="loadMoreDentist()">Load More</button>
                        </div>
                    </div>
                </div>
            </div>
                        
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>          
            <script>
                function loadMoreDentist(){
                     var amount = document.getElementsByClassName("dentistProduct").length;
                    $.ajax({
                        url: "/SWP391-SE1743/MarketingLoadMoreDentistController",
                        type: "get", //send it through get method
                        data: {
                            exits: amount
                        },
                        success: function (data) {
                            var row = document.getElementById("showDentist");
                            row.innerHTML += data;
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }
            </script>

    </body>
</html>
