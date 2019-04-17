<%--
  Created by IntelliJ IDEA.
  User: WDS
  Date: 2018/12/3
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>注册界面</title>
    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" media="screen" href="/manager/css/style.css">
    <link rel="stylesheet" type="text/css" href="/manager/css/reset.css"/>
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript">
        function register() {
            var username = $("#username").val();
            var password1 = $("#password1").val();
            var password2 = $("#password2").val();
            if(username == null || username == ""){
                alert("请输入用户名");
                return;
            }
            if(password1 == null || password1 == ""){
                alert("请输入密码");
                return;
            }
            if(password2 == null || password2 == ""){
                alert("请再次输入密码");
                return;
            }
            if(password1 != password2){
                alert("两次输入的密码不一致");
                return;
            }
            var url = "/register.do?method=updatePwd&username="+username+"&password="+password1;
            window.location.href= url;
        }
    </script>
</head>
<body>
<div id="particles-js">
    <div class="login">
        <div class="login-top">修改密码</div>
        <div class="login-center clearfix">
            <div class="login-center-input">
                <input type="text" name="username" id="username" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
                <div class="login-center-input-text">用户名</div>
            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-input">
                <input type="password" name="password1" id="password1" value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
                <div class="login-center-input-text">密码</div>
            </div>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-input">
                <input type="password" name="password2" id="password2" value="" placeholder="请再次输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请再次输入您的密码'"/>
                <div class="login-center-input-text">密码</div>
            </div>
        </div>
        <br>
        <div class="login-button" onclick="register()" >修改</div>
    </div>
    <div class="sk-rotating-plane"></div>
</div>
</body>
</html>
