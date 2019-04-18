<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.domain.Reply" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10/010
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户反馈</title>
    <link rel="shortcut icon" type="image/x-icon" href="../sale/imges/book.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <script type="text/javascript" src="../sale/js/jquery.min.js"></script>
</head>
<body>
    <header>
        <div class="top center">
            <div class="left fl">
                <ul>
                    <%--点击进入反馈页面--%>
                    <li><a href="../sale/index.jsp">首页</a></li>
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
                <div class="gouwuche fr"><a href="/bookshop.do?method=getCartItemList&id=<%=session.getAttribute("CustomerId")%>" target="_blank">购物车</a></div>
                <div class="fr">
                    <ul>
                        <li>欢迎您：<%=name%></li>
                        <li>|</li>
                        <li><a href="/customer.do?method=getMyInfo&id=<%=session.getAttribute("CustomerId")%>" target="_blank">个人中心</a></li>
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
    <div class="xiantiao"></div>
    <div class="gwcxqbj">
        <div class="gwcxd center">
            <div class="top2 center ft20">
                <div class="sub_top fl">留言类型</div>
                <div class="sub_top fl">留言主题</div>
                <div class="sub_top fl" style="margin-left: 100px">留言内容</div>
                <div class="sub_top fl" style="margin-left: 190px">留言客户名</div>
                <div class="sub_top fr" style="float: left">留言日期</div>
                <div class="clear"></div>
            </div>
            <%
                List<Reply> replyList = (List<Reply>) request.getAttribute("replyList");
                for (Reply reply:replyList){
            %>
            <div class="content2 center">
                <div class="sub_content fl"><%=reply.getReplyType()%></div>
                <div class="sub_content fl " style="margin-left: 162px"><%=reply.getReplytitle()%></div>
                <div class="sub_content fl ft20"><%=reply.getReplycontent()%></div>
                <div class="sub_content fl"><%=reply.getCustomername()%>  </div>
                <div class="sub_content fl "><%=reply.getCtime().toString().substring(5,10)%></div>
                <div class="clear"></div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
