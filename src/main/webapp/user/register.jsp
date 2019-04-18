<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/7/007
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/login.css">
    <script type="text/javascript"  src="../sale/js/jquery.min.js"></script>
    <script type="text/javascript" src="../sale/js/login.js"></script>
</head>
<style>
</style>
<body>
<form  method="post" action="/customer.do?method=addCustomer">
    <div class="regist">
        <div class="regist_center ">
            <div class="regist_top">
                <div class="left fl">会员注册</div>
                <div class="right fr"><a href="./index.jsp" target="_self">首页</a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <div style="margin-left: 15%;">
                <div class="regist_main center">
                    <div class="username check-height">
                        <label for="user">&nbsp;&nbsp;&nbsp;&nbsp;用户名</label>
                        <input class="shurukuang" type="text" name="username" placeholder="请输入用户名（字母、数字）" id="user"/>
                        <span class="error" style="float: none"></span>
                    </div>
                    <div class="username check-height">
                        <label for="password1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码</label>
                        <input class="shurukuang" type="password" name="password" placeholder="请输入6位以上密码" id="password1"/>
                        <span class="error" style="float: none"></span>
                    </div>
                    <div class="username check-height">
                        <label for="password2">确认密码</label>
                        <input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码" id="password2"/>
                        <span class="error" style="float: none"></span>
                    </div>
                    <div class="username check-height">
                        <label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;别</label>
                        <%--性别：--%>
                        <div style="margin-left: 85px ; display: inline ">
                            <input type="radio" name="radio1" value="男">男
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="radio1" value="女">女
                        </div>

                    </div>
                    <div class="username check-height">
                        <label for="name">真实姓名</label>
                        <input class="shurukuang" type="text" name="name" placeholder="请填写正确的真实姓名" id="name"/>
                        <span class=""></span>
                    </div>

                    <div class="username check-height">
                        <label for="phonenum">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;&nbsp;话</label>
                        <input class="shurukuang" type="text" name="tel" placeholder="请填写正确的手机号" id="phonenum"/>
                        <span class="error" style="float: none"></span>
                    </div>

                    <div class="username check-height">
                        <label for="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;箱</label>
                        <input class="shurukuang" type="text" name="email" placeholder="请填写正确的邮箱地址" id="email"/>
                        <span class=""></span>
                    </div>

                    <div class="username check-height">
                        <label for="addr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;&nbsp;址</label>
                        <input class="shurukuang" type="text" name="addr" placeholder="请填写正确的邮箱地址" id="addr"/>
                        <span class=""></span>
                    </div>
                </div>
                <div class="regist_submit">
                    <input class="submit" type="submit" name="submit" value="立即注册" >
                </div>
            </div>
        </div>
    </div>
</form>
</div>
</body>
</html>
