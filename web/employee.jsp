<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%@ page import="com.util.General" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">

<head>
    <title>在职员工</title>
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
            <h3 class="page-title">在职员工</h3>
            <div class="panel">
                <div class="panel-body">
                    <div>
                        <form action="" method="get" name="" id="Form">
                            <table border="1" cellpadding="0" cellspacing="0">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>职工编号</th>
                                    <th>职工姓名</th>
                                    <th>就职部门</th>
                                    <th>就职岗位</th>
                                    <th>查看</th>
                                </tr>
                                <%
                                    int pageCount = 0;
                                    String buf = request.getAttribute("page").toString();
                                    int curPage = Integer.valueOf(buf);
                                    try {
                                        ResultSet resultSet = (ResultSet) request.getAttribute("data");
                                        resultSet.last();
                                        int rowCount = resultSet.getRow();
                                        pageCount = rowCount / 10 + (rowCount % 10 > 0 ? 1 : 0);
                                        if (curPage < 1) curPage = 1;
                                        if (curPage > pageCount) curPage = pageCount;
                                        int cnt = (curPage - 1) * 10, upper = curPage * 10;
                                        resultSet.absolute(cnt);
                                        while (++cnt <= upper && resultSet.next()) {
                                            out.println("<tr>");
                                            out.println("<th class='start'>" + cnt + "</th>");
                                            out.println("<th>" + General.zeroExtend(resultSet.getInt("s_id")) + "</th>");
                                            out.println("<th>" + resultSet.getString("s_name") + "</th>");
                                            out.println("<th>" + resultSet.getString("d_name") + "</th>");
                                            out.println("<th>" + resultSet.getString("p_name") + "</th>");
                                            out.println(String.format("<td><input type='button' class='tbtn blue' value='详情' onClick=\"location.href='table?name=employeeDetail&s_id=%s'\"/></td>", resultSet.getInt("s_id")));
                                            out.println("</tr>");
                                        }
                                        while (cnt <= upper) {
                                            out.println("<tr>");
                                            out.println("<th class='start'>" + cnt + "</th>");
                                            cnt++;
                                            out.println("<th></th>");
                                            out.println("<th></th>");
                                            out.println("<th></th>");
                                            out.println("<th></th>");
                                            out.println("<th></th>");
                                            out.println("<th></th>");
                                            out.println("</tr>");
                                        }
                                %>
                                </thead>

                            </table>
                            <div class="anniu">
                                <ul id="menu1">
                                    <li>
                                        <%
                                            out.println(String.format("<a href='%s' class='tbtn white'>上一页</a>", "table?name=employee&page=" + String.valueOf(curPage - 1)));
                                        %>

                                    </li>
                                    <%
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                        for (int i = 1; i <= pageCount; i++) {
                                            if (i == curPage) out.println(String.format("<li><a href='%s' class='tbtn blue'>%s</a></li>", "table?name=employee&page=" + String.valueOf(i), String.valueOf(i)));
                                            else out.println(String.format("<li><a href='%s' class='tbtn white'>%s</a></li>", "table?name=employee&page=" + String.valueOf(i), String.valueOf(i)));
                                        }
                                    %>
                                    <li>
                                        <%
                                            out.println(String.format("<a href='%s' class='tbtn white'>下一页</a>", "table?name=employee&page=" + String.valueOf(curPage + 1)));
                                        %>
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>