<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%@ page import="com.util.General" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">

<head>
    <title>岗位调动</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/demo.css">
    <link rel="stylesheet" href="assets/css/table.css">
    <link rel="stylesheet" href="assets/css/tbtn.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/xiaologo.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/xiaologo.png">
    <style type="text/css">
        select {
            border-radius: 1em;
            width: 5em;
        }

        .myinput {
            border-radius: 2em;
            height: 1.4em;
            width: 10em;
        }
    </style>
</head>
<body>
<div class='main'>
    <div class='main-content'>
        <div class='container-fluid'>
            <h3 class='page-title'>岗位调动管理</h3>
            <div id='toastr-demo' class='panel'>
                <div class='panel-body'>
                    <div class='container-fluid'>
                        <div class='row-fluid'>
                            <div class='span12'>
                                <form action='transfer' method='post'>
                                    <textarea name='type' style='display: none'>post</textarea>
                                    <legend>员工编号</legend>
                                    <input type='text' name='s_id' class='myinput' required='required' />
                                    <br><br>
                                    <legend>员工姓名</legend>
                                    <input type='text' name='s_name' class='myinput' required='required' />
                                    <br><br>
                                    <legend>岗位</legend>
                                    <select name='p_id'>
                                        <%
                                            try {
                                                ResultSet resultSet = General.listAll("post");
                                                while (resultSet.next()) {
                                                    out.println("<option value='" + resultSet.getObject("p_id") + "'>" + resultSet.getObject("p_name") + "</option>");
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </select>
                                    <br><br>
                                    <button type='submit' class='tbtn white'>提交</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <h3 class='page-title'>添加岗位</h3>
            <div id='toastr-demo1' class='panel'>
                <div class='panel-body'>
                    <div class='container-fluid'>
                        <div class='row-fluid'>
                            <div class='span12'>
                                <form action='transfer' method='post'>
                                    <textarea name='type' style='display: none'>postAdd</textarea>
                                    <legend>岗位名称</legend>
                                    <input type='text' name='p_name' class='myinput' required='required' />
                                    <br><br>
                                    <button type='submit' class='tbtn green'>提交</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
</body>
</html>