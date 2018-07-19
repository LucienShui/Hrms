<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <title>东软人力资源管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
    <link rel="stylesheet" href="assets/css/table.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/xiaologo.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/xiaologo.png">
</head>

<body>
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <img src="assets/img/logo.png" alt="Klorofil Logo" class="img-responsive logo">
        </div>
        <!--左上角logo-->
        <div class="container-fluid">
            <%--<form class="navbar-form navbar-left">--%>
            <%--<div class="input-group">--%>
            <%--<input type="text" value="" class="form-control" placeholder="在这里输入你想要的内容">--%>
            <%--<span class="input-group-btn"><button type="button" class="btn btn-primary">搜索</button></span>--%>
            <%--</div>--%>
            <%--</form>--%>
            <!-- 搜索框 -->
            <div class="navbar-btn navbar-btn-right">
                <a class="btn btn-success update-pro" href="https://www.neusoft.com/cn/" target="_blank"><i
                        class="fa fa-rocket"></i> <span>公司官网</span></a>
            </div>
            <%--<div class="brand1">--%>
                <%--<marquee align=# width=400 class="imag2">--%>
                    <%--<img src="assets/img/img3.png" style="height: 30%; width: 70%;"/>--%>
                    <%--height="30%"width="70%" />--%>
                <%--</marquee>--%>
            <%--</div>--%>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <!--<li class="dropdown">
                        <a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
                            <i class="lnr lnr-alarm"></i>
                            <span class="badge bg-danger">5</span>
                        </a>
                        <ul class="dropdown-menu notifications">
                            <li>
                                <a href="#" class="notification-item"><span class="dot bg-warning"></span>System space is almost full</a>
                            </li>
                            <li>
                                <a href="#" class="notification-item"><span class="dot bg-danger"></span>You have 9 unfinished tasks</a>
                            </li>
                            <li>
                                <a href="#" class="notification-item"><span class="dot bg-success"></span>Monthly report is available</a>
                            </li>
                            <li>
                                <a href="#" class="notification-item"><span class="dot bg-warning"></span>Weekly meeting in 1 hour</a>
                            </li>
                            <li>
                                <a href="#" class="notification-item"><span class="dot bg-success"></span>Your request has been approved</a>
                            </li>
                            <li>
                                <a href="#" class="more">See all notifications</a>
                            </li>
                        </ul>
                    </li>-->
                    <!--通知 -->
                    <!--<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="lnr lnr-question-circle"></i> <span>帮助</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">基本用途</a>
                            </li>
                            <li>
                                <a href="#">数据</a>
                            </li>
                            <li>
                                <a href="#">安全</a>
                            </li>
                            <li>
                                <a href="#">修复</a>
                            </li>
                        </ul>
                    </li>
                    help-->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                           class="img-circle" alt="Avatar"> </a>
                    <li>
                        <a href="loginVerification?type=logout" target="_top"><i class="lnr lnr-exit"
                                                                                 style="color: cornflowerblue;"></i>
                            <span style="color: cornflowerblue;">注销</span></a>
                    </li>
                </ul>
                </li>
                <!--help标志-->
                <!-- <li>
                <a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
            </li> -->
                </ul>
            </div>
        </div>
    </nav>
</div>

<!-- END WRAPPER -->
<!-- Javascript -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="assets/vendor/chartist/js/chartist.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/scripts.js"></script>

</body>

</html>