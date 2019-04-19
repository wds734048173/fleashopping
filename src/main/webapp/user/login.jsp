<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/7/007
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../user/css/login.css">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <script type="text/javascript"  src="../user/js/jquery.min.js"></script>
    <script type="text/javascript" src="../user/js/login.js"></script>
    <script type="text/javascript" >
        <%
            String success=(String) request.getAttribute("success");
            if (success=="success"){
        %>
            $(function () {
                alert("注册成功请登录！！")
            });
        <%
            }
        %>
    </script>
</head>
<body>
    <%--页眉--%>
    <header>
        <div class="top center" style="background: #333">
            <div class="left fl">
                <ul>
                    <li><a href="../user/index.jsp">首页</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="right fr">
                <div class="fr">
                    <ul>
                        <%--注册页面--%>
                        <li><a href="../user/register.jsp" target="_blank" >注册</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </header>
    <div>
        <div class="form center" >
            <div class="login">
                <div class="login_center">
                    <div class="login_top">
                        <div class="left fl">会员登录</div>
                        <div class="right fr">您还不是我们的会员？<a href="../user/register.jsp" target="_self">立即注册</a></div>
                        <div class="clear"></div>
                        <div class="xian center"></div>
                    </div>
                    <form method="post" action="/login.do?method=userLogin">
                    <div class="login_main center">
                        <div class="username">
                            用户名:&nbsp;<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名" id="user"/>
                            <span class="error"></span>
                        </div>
                        <div class="username">
                            密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码" id="password"/>
                            <span class="error"></span>
                        </div>
                    </div>
                    <span>
                        <%if(request.getAttribute("message")!= null){
                            out.print(request.getAttribute("message"));
                        }else {
                            out.print("&nbsp");
                        }
                        %>
                    </span>
                    <div class="login_submit">
                        <input class="submit" type="submit" name="submit" value="立即登录" >
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="copyright">简体 | 繁体 | English | 常见问题</div>
        <div class="copyright">公司版权所有-京ICP备10046444-<img src="../user/imges/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>
    </footer>
</body>
</html>
