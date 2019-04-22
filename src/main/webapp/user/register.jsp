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
    <link rel="stylesheet" type="text/css" href="../user/css/login.css">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <script type="text/javascript"  src="../user/js/jquery.min.js"></script>
    <script type="text/javascript" src="../user/js/login.js"></script>
</head>
<style>
</style>
<body>
<%--页眉--%>
<header>
    <div class="top center" style="background: #333">
        <div class="left fl">
            <ul>
                <li><a href="../user/index.jsp" target="_self">首页</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <div class="fr">
                <ul>
                    <%--注册页面--%>
                    <li><a href="../user/register.jsp"  target="_self">注册</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<form  method="post" action="/user.do?method=addUser">
    <div class="regist">
        <div class="regist_center ">
            <div class="regist_top">
                <div class="left fl">会员注册</div>
                <div class="right fr"><a href="../user/index.jsp" target="_self">首页</a></div>
                <div class="clear"></div>
                <div class="xian center"></div>
            </div>
            <div style="margin-left: 15%;">
                <div class="regist_main center">
                    <div class="username check-height">
                        <label for="username">&nbsp;&nbsp;&nbsp;&nbsp;用户名</label>
                        <input class="shurukuang" type="text" name="username" placeholder="请输入用户名（字母、数字）" id="username"/>
                        <span class="error" style="float: none"></span>
                    </div>
                    <div class="username check-height">
                        <label for="password1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码</label>
                        <input class="shurukuang" type="password" name="password1" placeholder="请输入6位以上密码" id="password1"/>
                        <span class="error" style="float: none"></span>
                    </div>
                    <div class="username check-height">
                        <label for="password2">确认密码</label>
                        <input class="shurukuang" type="password" name="password2" placeholder="请确认你的密码" id="password2"/>
                        <span class="error" style="float: none"></span>
                    </div>
                    <div class="username check-height">
                        <label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;别</label>
                        <%--性别：--%>
                        <div style="margin-left: 58px ; display: inline ">
                            <input type="radio" name="sex" value="0">男
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sex" value="1">女
                        </div>
                    </div>
                    <div class="username check-height">
                        <label for="realname">真实姓名</label>
                        <input class="shurukuang" type="text" name="realname" placeholder="请填写正确的真实姓名" id="realname"/>
                        <span class=""></span>
                    </div>
                    <div class="username check-height">
                        <label for="collage">学校名称</label>
                        <input class="shurukuang" type="text" name="collage" placeholder="请填写正确的学校名称" id="collage"/>
                        <span class=""></span>
                    </div>
                    <div class="username check-height">
                        <label for="telphone">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;&nbsp;话</label>
                        <input class="shurukuang" type="text" name="telphone" placeholder="请填写正确的手机号" id="telphone"/>
                        <span class="error" style="float: none"></span>
                    </div>

                    <div class="username check-height">
                        <label for="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;箱</label>
                        <input class="shurukuang" type="text" name="email" placeholder="请填写正确的邮箱地址" id="email"/>
                        <span class=""></span>
                    </div>

                    <div class="username check-height">
                        <label for="address">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;&nbsp;址</label>
                        <input class="shurukuang" type="text" name="address" placeholder="请填写正确的收货地址" id="address"/>
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
<footer>
    <div class="copyright">简体 | 繁体 | English | 常见问题</div>
    <div class="copyright">公司版权所有-京ICP备10046444-<img src="../user/imges/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>
</footer>
</body>
</html>
