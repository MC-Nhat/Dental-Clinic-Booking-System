<%-- 
    Document   : invoiceView
    Created on : Jun 13, 2023, 1:19:25 AM
    Author     : Admin
--%>

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
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!--[if lt IE 9]>
                    <script src="assets/js/html5shiv.min.js"></script>
                    <script src="assets/js/respond.min.js"></script>
            <![endif]-->
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="main-wrapper">
            <div class="page-wrapper">
                <div class="content">
                    <div class="row">
                        <div class="col-sm-5 col-4">
                            <h4 class="page-title">Hoá Đơn</h4>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row custom-invoice">
                                        <div class="col-6 col-sm-6 m-b-20">
                                            <img src="assets/img/logo.png" class="inv-logo" alt="">
                                            <ul class="list-unstyled">
                                                <h1 class="m-0 text-primary"><i class="fa fa-tooth me-2"></i>DentCare</h1>
                                            </ul>
                                        </div>
                                        <div class="col-6 col-sm-6 m-b-20">
                                            <div class="invoice-details">
                                                <h3 class="text-uppercase">Hoá Đơn #ID-01</h3>
                                                <ul class="list-unstyled">
                                                    <li>Ngày Trả: <span>13/6/2023</span></li>
                                                    <li>Hạn Trả: <span>16/6/2023</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!--                                    <div class="row">
                                                                            <div class="col-sm-6 col-lg-6 m-b-20">
                                    
                                                                                <h5>Hoá Đơn:</h5>
                                                                                <ul class="list-unstyled">
                                                                                    <li>
                                                                                        <h5><strong>Barry Cuda</strong></h5>
                                                                                    </li>
                                                                                    <li><span>Global Technologies</span></li>
                                                                                    <li>5754 Airport Rd</li>
                                                                                    <li>Coosada, AL, 36020</li>
                                                                                    <li>United States</li>
                                                                                    <li>888-777-6655</li>
                                                                                    <li><a href="#">barrycuda@example.com</a></li>
                                                                                </ul>
                                    
                                                                            </div>
                                                                            <div class="col-sm-6 col-lg-6 m-b-20">
                                                                                <div class="invoices-view">
                                                                                    <span class="text-muted">Payment Details:</span>
                                                                                    <ul class="list-unstyled invoice-payment-details">
                                                                                        <li>
                                                                                            <h5>Total Due: <span class="text-right">$288.2</span></h5>
                                                                                        </li>
                                                                                        <li>Bank name: <span>Profit Bank Europe</span></li>
                                                                                        <li>Country: <span>United Kingdom</span></li>
                                                                                        <li>City: <span>London E1 8BF</span></li>
                                                                                        <li>Address: <span>3 Goodman Street</span></li>
                                                                                        <li>IBAN: <span>KFH37784028476740</span></li>
                                                                                        <li>SWIFT code: <span>BPT4E</span></li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover" >
                                            <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Dịch Vụ</th>
                                                    <th>Mô Tả</th>
                                                    <th>Giá Tiền</th>
                                                    <th>Số Lượng</th>
                                                    <th>Tổng Tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr >
                                                    <td>1</td>
                                                    <td>Lấy Tuỷ</td>
                                                    <td>Răng hỏng tuỷ nặng cần lấy sạch tuỷ</td>
                                                    <td>200.000đ</td>
                                                    <td>1</td>
                                                    <td>200.000đ</td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <div class="row invoice-payment">
                                            <div class="col-sm-7">
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="m-b-20">
                                                    <h6>Tổng Tiền</h6>
                                                    <div class="table-responsive no-border">
                                                        <table class="table mb-0">
                                                            <tbody>
                                                                <tr>
                                                                    <th>Thanh Toán</th>
                                                                    <td class="text-right text-primary">
                                                                        <h5>200.000đ</h5>
                                                                    </td>
                                                                   
                                                                    
                                                                </tr>
                                                                <tr>
                                                                    <th>QR Thanh Toán</th>
                                                                    <td class="text-right text-primary" >
                                                                        <img style="max-height: 200px;" src="assets/img/QR.jpg" class="inv-logo" alt="">
                                                                    </td>
                                                                   
                                                                    
                                                                </tr>
                                                            </tbody>

                                                        </table>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="invoice-info">
                                            <h5>Lời Dặn Của Bác Sĩ</h5>
                                            <p class="text-muted"> -Hạn chế ăn đồ ăn cứng và phải vệ sinh răng miệng thường xuyên.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="sidebar-overlay" data-reff=""></div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
</html>
