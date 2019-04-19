<%@ page import="org.lanqiao.domain.CartItem" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lyj
  Date: 2018/12/6
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购物车</title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" href="../bootstrap/css/bookshop.css"/>
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <script type="text/javascript" src="../sale/js/jquery.min.js"></script>
    <%--<script type="text/javascript" src="../bootstrap/js/bookshop.js"></script>--%>
    <script type="text/javascript">
    $(function(){
        //删除
        $(".delete").click(function () {
            var  isDelete = confirm("确定删除吗?");
            if (isDelete) {
                var id = $(this).parent().parent().children("td:eq(0)").text();
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
                <li><a href="/sale/index.jsp">首页</a></li>
                <li>|</li>
                <li><a href="/customer.do?method=getMyInfo&id=<%=session.getAttribute("CustomerId")%>" target="_blank">个人中心</a></li>
                <li>|</li>
                <%--点击进入反馈页面--%>
                <li><a href="/reply.do?method=getHomeList">问题反馈</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <%
                String name = (String) session.getAttribute("name");
                if (name == null){
            %>
            <%--购物车页面--%>
            <div class="gouwuche fr"><a href="/sale/login.jsp">购物车</a></div>
            <div class="fr">
                <ul>
                    <%--登录页面--%>
                    <li><a href="../sale/login.jsp" target="_blank">登录</a></li>
                    <li>|</li>
                    <%--注册页面--%>
                    <li><a href="../sale/register.jsp" target="_blank" >注册</a></li>
                </ul>
            </div>
            <%
            }else {
            %>
            <div class="fr">
                <ul>
                    <li>欢迎您：<%=name%></li>
                    <li>|</li>
                    <li><a href="/logout.do">退出登录</a></li>
                </ul>
            </div>
            <%
                }
            %>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>
<div class="catbox">

    <table id="cartTable">
        <thead>
        <tr>
            <th>商品名称</th>
            <th>商品图片</th>
            <th>价格</th>
            <th>原价</th>
            <th>商品ID</th>
            <th>数量</th>
            <th>小计</th>
            <th>操作</th>
        </tr>
        <%
            List<CartItem> cartItemList=(List<CartItem>) request.getAttribute("cartItemList");
            for(CartItem cu:cartItemList){%>
        <tr>
            <td class="goods"><%= cu.getBookName()%></td>
            <td class="pic"><img src="<%=cu.getBookPic()%>" width="100px" height="100px;"></td>
            <td class="price"><%=cu.getBookPrice()%></td>
            <td><%=cu.getBookMprice()%></td>
            <td><%=cu.getBookId()%></td>
            <td class="count"><%=cu.getOrdermount()%></td>
            <td class="subtotal"><%=cu.getBookPrice()*cu.getOrdermount()%></td>
            <td class="operation"><span class="delete"><a class="btn btn-default delete" href="/bookshop.do?method=delByCustomerId&CustomerId=<%=cu.getCustomerId()%>&BookId=<%=cu.getBookId()%>" role="button" name="delete">删除</a></span></td>
        </tr>
        <%}%>
        </thead>
    </table>
    <div class="foot" id="foot">
        <%if(cartItemList.size() == 0){
            %>
            <center><div><a href="/user/index.jsp">请您去首页选购商品</a></div></center>
                <%
        }%>
</body>
</html>