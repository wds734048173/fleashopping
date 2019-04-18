<%@ page import="org.lanqiao.domain.Customer" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/9/009
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <link rel="stylesheet" type="text/css" href="../sale/css/login.css">
    <link rel="stylesheet" href="../bootstrap/css/bookshop.css"/>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>

    <script type="text/javascript" src="../sale/js/jquery.min.js"></script>
    <script type="text/javascript" src="../sale/js/login.js"></script>
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
    <header>
        <div class="top center">
            <div class="left fl">
                <ul>
                    <%--点击进入反馈页面--%>

                    <li><a href="/reply.do?method=getHomeList">问题反馈</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="right fr">
                <%
                    String name = (String) session.getAttribute("name");
                %>
                <div class="gouwuche fr"><a href="/order.do?method=getOrderAll">我的订单</a></div>
                <div class="fr">
                    <ul>
                        <li>欢迎您：<%=name%></li>
                        <li>|</li>
                        <li><a href="/logout.do">退出登录</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </header>
    <div class="grzxbj">
        <div class="selfinfo center">
            <div class="lfnav fl">
                <div class="ddzx">个人中心</div>
                <div class="ddzx"><a href="/order.do?method=getOrderAll">订单中心</a></div>
                <%--<div class="ddzx">--%>
                    <%--<a href="/privateComment.do?method=selectByCustomerId&customerid=<%=session.getAttribute("CustomerId")%>">我的评价</a>--%>
                <%--</div>--%>
                <div class="ddzx">
                    <a href="/reply.do?method=myReply" class="success">我的反馈</a>
                </div>
                <div class="ddzx">
                    <a href="../sale/index.jsp" class="success">返回首页</a>
                </div>


            </div>
            <div class="rtcont fr">
                <div class="ddzxbt">我的个人信息</div>
                <%
                    Customer customer = (Customer) request.getAttribute("Customer");
                %>

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
</body>
</html>
