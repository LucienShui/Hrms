<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">

<head>
    <title>东软人力资源管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
</head>
<frameset rows="10%,*">
    <frame src="head.jsp" scrolling="no" name="headmenu" id="headFrame" title=headFrame" framespacing="0"
           frameborder="no" border="0">
    <!-- 引用左边和主体部分 -->
    <frameset cols="15%,*" framespacing="0" frameborder="no" border="0">
        <frame src="left.jsp" scrolling="no" name="leftmenu" id="leftFrame" title="leftFrame">
        <frame src="main.jsp" name="main" noresize="noresize" id="mainFrame" title="mainFrame">
    </frameset>
</frameset>
</html>