<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%@ page import="com.util.General" %>
<%@ page import="com.sql.SqlEditor" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">

<head>
    <title>岗位管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/tbtn.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/xiaologo.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/xiaologo.png">
    <link rel="stylesheet" href="assets/css/table.css">
</head>

<body>
<div class="main">
    <div class="main-content">
        <div class="container-fluid">
            <h3 class="page-title">职业生涯</h3>
            <div class="panel">
                <div class="panel-body">
                    <div>
                        <table border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <th></th>
                                <th>就职公司</th>
                                <th>入职时间</th>
                                <th>离职时间</th>
                            </tr>
                            <%
                                try {
                                    List<Object> params = new ArrayList<>();
                                    int s_id = Integer.valueOf(request.getParameter("s_id"));
                                    params.add(s_id);
                                    SqlEditor sqlEditor = new SqlEditor();
                                    ResultSet resultSet = sqlEditor.query("select * from `career` where `s_id` = ? order by `c_hiredate` desc", params);
                                    int cnt = 0;
                                    while (resultSet.next()) {
                                        cnt = cnt + 1;
                                        out.println("<tr>");
                                        out.println("<th class='start'>" + cnt + "</th>");
                                        out.println(String.format("<th>%s</th>", resultSet.getString("c_company")));
                                        out.println(String.format("<th>%s</th>", resultSet.getDate("c_hiredate")));
                                        out.println(String.format("<th>%s</th>", resultSet.getDate("c_leavedate")));
                                        out.println("</tr>");
                                    }
                            %>
                        </table>
                    </div>
                </div>
            </div>
            <h3 class="page-title">外语能力</h3>
            <div class="panel">
                <div class="panel-body">
                    <div>
                        <table border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <th></th>
                                <th>外语种类</th>
                                <th>外语水平</th>
                            </tr>
                            <%
                                resultSet = sqlEditor.query("select * from `foreign` where `s_id` = ?", params);
                                cnt = 0;
                                while (resultSet.next()) {
                                    cnt = cnt + 1;
                                    out.println("<tr>");
                                    out.println("<th class='start'>" + cnt + "</th>");
                                    out.println(String.format("<th>%s</th>", resultSet.getString("fo_type")));
                                    out.println("<th>" + resultSet.getInt("fo_level") + "</th>");
                                    out.println("</tr>");
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
            <h3 class="page-title">家庭信息</h3>
            <div id="toastr-demo1" class="panel">
                <div class="panel-body">
                    <div id="bumenbiao1">
                        <table id="stuRecordTable1" border="1" cellpadding="0" cellspacing="0">
                            <tr>
                                <th></th>
                                <th>家庭成员</th>
                                <th>社会关系</th>
                            </tr>
                            <%
                                    resultSet = sqlEditor.query("select * from `family` where `s_id` = ?", params);
                                    cnt = 0;
                                    while (resultSet.next()) {
                                        cnt = cnt + 1;
                                        out.println("<tr>");
                                        out.println("<th class='start'>" + cnt + "</th>");
                                        out.println(String.format("<th>%s</th>", resultSet.getString("fa_member")));
                                        out.println(String.format("<th>%s</th>", resultSet.getString("fa_relation")));
                                        out.println("</tr>");
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </table>
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