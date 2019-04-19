
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
    <title>个人中心</title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <link rel="stylesheet" type="text/css" href="../user/css/login.css">
    <link rel="stylesheet" href="../bootstrap/css/bookshop.css"/>
    <link rel="stylesheet" type="text/css" href="/user/css/index.css">
    <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>

    <script type="text/javascript" src="../user/js/jquery.min.js"></script>
    <script type="text/javascript" src="../user/js/login.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#chphone").click(function () {
                var flag = window.confirm("确定要修改吗？");
                if (flag){
                    $(this).prev().removeAttr("readonly");
                }else {
                    alert("请修改框内信息");
                }
            });
            $("#chem").click(function () {
                var flag = window.confirm("确定要修改吗？");
                if (flag){
                    $(this).prev().removeAttr("readonly");
                }else {
                    alert("请修改框内信息");
                }
            });
            $("#chaddr").click(function () {
                var flag = window.confirm("确定要修改吗？");
                if (flag){
                    $(this).prev().removeAttr("readonly");
                }else {
                    alert("请修改框内信息");
                }
            })
        })
    </script>
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
                    <li><a href="/userIndex.do?method=getMyInfo" target="_blank">个人中心</a></li>
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
                <form action="/customer.do?method=updateCustomer" method="post">
                    <div class="login-main center mt20" style="margin-top: 30px">
                        <input hidden name="CustomerId" value="<%=session.getAttribute("CustomerId")%>"/>
                    <div class="username check-height">
                        <label for="user" style="color: black">用户名</label>
                        <input class="shurukuang" type="text" name="username" placeholder="请输入用户名（字母、数字）" id="user" readonly value="<%=customer.getCustomerName()%>"/>
                        <span class="error"></span>
                    </div>
                    <div class="username check-height">
                        <label for="name" style="color: black">真实姓名</label>
                        <input class="shurukuang" type="text" name="name" placeholder="请填写正确的真实姓名" id="name" readonly value="<%=customer.getCustomertruename()%>"/>
                        <span class="error"></span>
                    </div>

                    <div class="username check-height">
                        <label for="phonenum" style="color: black">电话</label>
                        <input class="shurukuang" type="text" name="tel" placeholder="请填写正确的手机号" id="phonenum" readonly value="<%=customer.getCustomerTel()%>"/>
                        <input class="jrgwc" type="button" value="立即修改" id="chphone">
                        <span class="error"></span>
                    </div>

                    <div class="username check-height">
                        <label for="email" style="color: black">邮箱</label>
                        <input class="shurukuang" type="text" name="email" placeholder="请填写正确的邮箱地址" id="email" readonly value="<%=customer.getCustomerEmail()%>"/>
                        <input class="jrgwc" type="button" value="立即修改" id="chem">
                        <span class="error"></span>
                    </div>

                    <div class="username check-height">
                        <label for="addr" style="color: black">地址</label>
                        <input class="shurukuang" type="text" name="addr" placeholder="请填写正确的邮寄地址" id="addr" readonly value="<%=customer.getCustomerAddr()%>"/>
                        <input class="jrgwc" type="button" value="立即修改" id="chaddr">
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
