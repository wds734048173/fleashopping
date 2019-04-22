
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/9/009
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人中心-我的个人信息</title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <link rel="stylesheet" type="text/css" href="../user/css/login.css">
    <link rel="stylesheet" href="../bootstrap/css/bookshop.css"/>
    <link rel="stylesheet" type="text/css" href="/user/css/index.css">
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bookshop.css">
    <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>

    <script type="text/javascript" src="../user/js/jquery.min.js"></script>
    <%--<script type="text/javascript">
        $(function () {
            $("#chphone").click(function () {
                var flag = window.confirm("确定要修改电话吗？");
                if (flag){
                    alert("请修改电话信息");
                    $(this).prev().removeAttr("readonly");
                }
            });
            $("#chem").click(function () {
                var flag = window.confirm("确定要修改邮箱吗？");
                if (flag){
                    alert("请修改邮箱信息");
                    $(this).prev().removeAttr("readonly");
                }
            });
            $("#chaddr").click(function () {
                var flag = window.confirm("确定要修改地址吗？");
                if (flag){
                    alert("请修改地址信息");
                    $(this).prev().removeAttr("readonly");
                }
            })
            $("#chname").click(function () {
                var flag = window.confirm("确定要修改真实姓名吗？");
                if (flag){
                    alert("请修改真实姓名");
                    $(this).prev().removeAttr("readonly");
                }
            });

            $("#save").click(function () {
                //真实名称
                var realname = $("#realname").val().trim();
                //性别
                var sex = $("input[name='sex']:checked").val();
                //联系电话
                var telphone = $("#telphone").val().trim();
                //邮箱
                var email = $("#email").val().trim();
                if (realname.length > 20) {
                    alert("真实名称多于20字，请重新输入");
                    return;
                }
                if (!(/^1[3|4|5|6|7|8][0-9]\d{8}$/.test(telphone))) {
                    alert("手机号格式错误，请重新输入");
                    return;
                }
                if (!(/^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g).test(email)) {
                    alert("邮箱格式错误，请重新输入");
                    return;
                }
                var url = "/manager/updateUser?realname=" + realname + "&sex=" + sex + "&telphone=" + telphone + "&email=" + email;
                $(".content").load(url);
            })
        })
    </script>--%>
</head>
<body>
<%--页眉--%>
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="../user/index.jsp">首页</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <%
                String realname = (String) session.getAttribute("realname");
            %>
            <div class="fr">
                <ul>
                    <li>欢迎您：<%=realname%></li>
                    <li>|</li>
                    <li><a href="/user.do?method=getMyInfo" target="_blank">个人中心</a></li>
                    <li>|</li>
                    <li><a href="/logout.do">退出登录</a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<div class="xiantiao"></div>
    <%--中间代码--%>
    <div class="grzxbj">
        <%--左侧导航栏--%>
        <div class="selfinfo center">
            <div class="lfnav fl">
                <div class="ddzx"><li class="ml40 action"><a href="/user.do?method=getUserInfo">我的个人信息</a></li></div>
                <div class="ddzx"><li class="ml40"><a href="/goods.do?method=getOwnGoodsList">我发布的商品</a></li></div>
                <div class="ddzx"><li class="ml40"><a href="/collection.do?method=getCollectionList">我收藏的商品</a></li></div>
                <div class="ddzx"><li class="ml40"><a href="/order.do?method=getSaleOrderList">我卖出的订单</a></li></div>
                <div class="ddzx"><li class="ml40"><a href="/order.do?method=getBuyerOrderList">我买到的订单</a></li></div>
            </div>
            <%--右侧代码--%>
            <div class="rtcont fr">
                <div class="ddzxbt">我的个人信息</div>
                <form action="/user.do?method=updateUser" method="post">
                    <div class="login-main center mt20" style="margin-top: 30px">
                        <input hidden name="userId" value="${user.id}" id="userId"/>
                        <div class="username check-height">
                            <label for="username" style="color: black">用户名</label>
                            <input class="shurukuang" type="text" name="username" placeholder="请输入用户名（字母、数字）" id="username" readonly value="${user.username}"/>
                            <span class="error"></span>
                        </div>
                        <div class="username check-height">
                            <label for="realname" style="color: black">真实姓名</label>
                            <input class="shurukuang" type="text" name="realname" placeholder="请填写正确的真实姓名" id="realname" value="${user.realname}"/>
                            <%--<input class="jrgwc" type="button" value="立即修改" id="chname">--%>
                            <span class="error"></span>
                        </div>

                        <div class="username check-height">
                            <label for="telphone" style="color: black">电话</label>
                            <input class="shurukuang" type="text" name="telphone" placeholder="请填写正确的手机号" id="telphone" value="${user.telphone}"/>
                            <%--<input class="jrgwc" type="button" value="立即修改" id="chphone">--%>
                            <span class="error"></span>
                        </div>

                        <div class="username check-height">
                            <label for="email" style="color: black">邮箱</label>
                            <input class="shurukuang" type="text" name="email" placeholder="请填写正确的邮箱地址" id="email" value="${user.email}"/>
                            <%--<input class="jrgwc" type="button" value="立即修改" id="chem">--%>
                            <span class="error"></span>
                        </div>

                        <div class="username check-height">
                            <label for="address" style="color: black">地址</label>
                            <input class="shurukuang" type="text" name="address" placeholder="请填写正确的邮寄地址" id="address" value="${user.address}"/>
                            <%--<input class="jrgwc" type="button" value="立即修改" id="chaddr">--%>
                            <span class="error"></span>
                        </div>
                        <div class="regist_submit">
                            <input class="jrgwc btn btn-primary btn-warning active" type="submit" name="submit" value="保存" >
                        </div>
                    </div>
                </form>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>

<%--页脚--%>
<div class="footer">
    <div class="footer-content">
        <div class="w1200">
            <div class="footet-jiesao clearfix">
                <div class="fl footer-logo-box">
                    <img src="/user/imges/new_logo.png" class="footer-logo">
                    <span class="footer-slogan">买书看书 · 不求人</span>
                </div>
                <div class="fl footer-function">
                    <a href="#" rel="nofollow">关于我们</a>
                    <a href="#" rel="nofollow">用户协议</a>
                    <a href="#" rel="nofollow">最新信息</a>
                    <a href="#" rel="nofollow">意见反馈</a>
                </div>
                <div class="fr footer-kefu">
                    <a href="javascript:void(0)" rel="nofollow" class="lxkf">
                        <i class="iconfont">&#xe601;</i>
                        立即联系
                    </a>
                    <a rel="nofollow">
                        <i class="iconfont">&#xe61a;</i>
                        021-61097639
                    </a>
                </div>
            </div>
        </div>
        <div class="w1200">
            <p class="footer-bottom-size">© 2018 在线买书 晋ICP备17020445号-1
                <span id="exec_time"></span>|
                <span id="load_time"></span>
                <a class="shgongshang" rel="nofollow" href="#">
                    <img src="" alt="">山西工商</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
