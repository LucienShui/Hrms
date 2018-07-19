<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<style>
    .yanse {
        position: absolute;
        background-color: darkgoldenrod;
        border: blue solid 5px;
        height: 100%;
        text-align: left;
    }
</style>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <title>首页</title>
    <meta charset="UTF-8">
    <title></title>
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

    <link rel='stylesheet prefetch' href='assets/css/jquery-ui.css'>
    <link rel='stylesheet' href='assets/css/style1.css'>
</head>

<body>
<div style="text-align:center;clear:both">
</div>
<aside class="sidebar">
    <div id="leftside-navigation" class="nano">
        <ul class="nano-content">
            <!--对菜单栏进行排列-->
            <li>
                <a href="main.jsp" class="" target="main"><i class="fa fa-home"></i> <span>首页</span></a>
            </li>
            <li>
                <a href="table?name=employee" class="" target="main"><i class="fa fa-cog"></i> <span>在职员工</span></a>
            </li>
            <li>
                <a href="table?name=department" class="" target="main"><i class="fa fa-cog"></i> <span>部门管理</span></a>
            </li>
            <li>
                <a href="table?name=post" class="" target="main"><i class="fa fa-cog"></i> <span>岗位管理</span></a>
            </li>
            <li class="sub-menu">
                <a target="main" href="javascript:void(0);"><i class="fa fa-bar-chart-o"></i><span>异动管理</span><i
                        class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a target="main" href="employeeEntry.jsp"><i class="fa fa-bar-chart-o"></i> <span>员工入职管理</span></a>
                    </li>
                    <li>
                        <a target="main" href="employeeResign.jsp"><i class="fa fa-bar-chart-o"></i> <span>员工离职管理</span></a>
                    </li>
                    <li>
                        <a target="main" href="departmentTransfer.jsp"><i class="fa fa-bar-chart-o"></i>
                            <span>部门调动管理</span></a>
                    </li>
                    <li>
                        <a target="main" href="postTransfer.jsp"><i class="fa fa-bar-chart-o"></i>
                            <span>岗位调动管理</span></a>
                    </li>
                </ul>
            </li>

            <li class="sub-menu">
                <a target="main" href="javascript:void(0);"><i class="fa fa-cogs"></i><span>员工信息中心</span><i
                        class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a target="main" href="table?name=career"><i class="fa fa-bar-chart-o"></i>
                            <span>职业生涯规划信息</span></a>
                    </li>
                    <li>
                        <a target="main" href="table?name=foreign"><i class="fa fa-bar-chart-o"></i> <span>外语能力信息</span></a>
                    </li>
                    <li>
                        <a target="main" href="table?name=family"><i class="fa fa-bar-chart-o"></i>
                            <span>家庭成员及社会关系</span></a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a target="main" href="javascript:void(0);"><i class="fa fa-bar-chart-o"></i><span>报表管理</span><i
                        class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li>
                        <a target="main" href="table?name=employeeNew"><i class="fa fa-bar-chart-o"></i>
                            <span>新聘员工表</span></a>
                    </li>
                    <li>
                        <a target="main" href="table?name=employeeResignList"><i class="fa fa-bar-chart-o"></i> <span>离职员工表</span></a>
                    </li>
                    <li>
                        <a target="main" href="table?name=departmentTransList"><i class="fa fa-bar-chart-o"></i> <span>部门调动表</span></a>
                    </li>
                    <li>
                        <a target="main" href="table?name=postTransList"><i class="fa fa-bar-chart-o"></i>
                            <span>岗位调动表</span></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</aside>
<div class="clearfix"></div>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="assets/vendor/chartist/js/chartist.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
<script src='js/jquery.min.js'></script>
<script src='js/jquery-ui.min.js'></script>
<script src="js/index.js"></script>
</body>

</html>