<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%@ page import="com.util.General" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">

<head>
    <title>职业生涯规划信息</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/demo.css">
    <link rel="stylesheet" href="assets/css/tbtn.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/xiaologo.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/xiaologo.png">
    <link rel="stylesheet" href="assets/css/table.css">
    <!-- 对css文件的调用-->
</head>


<body>

<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <h3 class="page-title">职业生涯规划信息</h3>
            <div id="toastr-demo" class="panel">
                <div class="panel-body">
                    <div>

                        <form action="" method="get" name="" id="Form">
                            <table border="1" cellpadding="0" cellspacing="0">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>职工编号</th>
                                    <th>职工姓名</th>
                                    <th>就职公司</th>
                                    <th>入职日期</th>
                                    <th>离职时间</th>
                                    <th>编辑</th>
                                </tr>
                                <!--通过request请求获取数据并进行表格绘制-->
                                <%
                                    int pageCount = 0;
                                    String buf = request.getAttribute("page").toString();
                                    int curPage = Integer.valueOf(buf);
                                    try {
                                        //通过request请求获取数据并进行表格绘制
                                        ResultSet resultSet = (ResultSet) request.getAttribute("data");
                                        resultSet.last();
                                        int rowCount = resultSet.getRow();
                                        //将获取的数据进行分页处理
                                        pageCount = rowCount / 10 + (rowCount % 10 > 0 ? 1 : 0);
                                        if (curPage < 1) curPage = 1;
                                        if (curPage > pageCount) curPage = pageCount;
                                        int cnt = (curPage - 1) * 10, upper = curPage * 10;
                                        resultSet.absolute(cnt);
                                        //将获取的数据进行表格绘制
                                        while (++cnt <= upper && resultSet.next()) {
                                            out.println("<tr>");
                                            out.println("<th class='start'>" + cnt + "</th>");
                                            //按照列进行排列   每次几列排成一行
                                            out.println("<th>" + General.zeroExtend(resultSet.getInt("s_id")) + "</th>");
                                            out.println("<th>" + resultSet.getString("s_name") + "</th>");
                                            out.println("<th>" + resultSet.getString("c_company") + "</th>");
                                            out.println("<th>" + resultSet.getDate("c_hiredate") + "</th>");
                                            out.println("<th>" + resultSet.getDate("c_leavedate") + "</th>");
                                            //插入删除和修改按钮
                                            out.println("<td><input type='button' class='tbtn orange' value='删除' onClick=\"location.href='delete?tn=career&pk=s_id&id=" + resultSet.getInt("s_id") + "'\"/></td>");
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
                                %><!-- 数据的传送-->
                                </thead>

                            </table>
                            <div class="anniu">
                                <ul id="menu1">
                                    <li>
                                        <%
                                            //通过页面间的链接进行页面跳转
                                            out.println(String.format("<a href='%s' class='tbtn white'>上一页</a>", "table?name=career&page=" + String.valueOf(curPage - 1)));
                                        %>

                                    </li>
                                    <%
                                        } catch (Exception e) {
                                        e.printStackTrace();
                                        }
                                        for (int i = 1; i <= pageCount; i++) {
                                        //根据前面获取的页数对表格进行分页绘制
                                        if (i == curPage) out.println(String.format("<li><a href='%s' class='tbtn blue'>%s</a></li>", "table?name=career&page=" + String.valueOf(i), String.valueOf(i)));
                                        else out.println(String.format("<li><a href='%s' class='tbtn white'>%s</a></li>", "table?name=career&page=" + String.valueOf(i), String.valueOf(i)));
                                        }
                                    %>
                                    <li>
                                        <%
                                            out.println(String.format("<a href='%s' class='tbtn white'>下一页</a>", "table?name=career&page=" + String.valueOf(curPage + 1)));
                                        %>
                                    </li><!-- 上一页下一页-->
                                </ul>
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
<!-- 对js文件的调用-->
</body>

</html>