<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en" class="fullscreen-bg">
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/css/table.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/xiaologo.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/xiaologo.png">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <div class="logo text-center"><img src="assets/img/logo.png" alt="Klorofil Logo"></div>
                            <p class="lead">登陆你的账号</p>
                        </div>
                        <form class="form-auth-small" action="loginVerification" method="post">
                            <div class="form-group">
                                <label class="control-label sr-only">账户</label>
                                <input type="text" class="form-control" name="username" value="">
                            </div>
                            <div class="form-group">
                                <label class="control-label sr-only">密码</label>
                                <input type="password" class="form-control" name="password" value="">
                            </div>
                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left">
                                    <input type="checkbox">
                                    <span>记住密码</span>
                                </label>
                            </div>
                            <%--<input type="submit" value="登陆" class="btn btn-primary btn-lg btn-block"/>--%>
                            <button type="submit" class="btn btn-primary btn-lg btn-block">登陆</button>
                            <div class="bottom">
                                <span class="helper-text"><i class="fa fa-lock"></i> <a
                                        href="http://captive.lucien.ink">忘记密码?</a></span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                        <h1 class="heading">Beyond technology</h1>
                        <p>(超越技术)</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

</html>
