<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.domain.Book" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/7/007
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String type= (String) request.getParameter("typename");
        List<Book> bookList= (List<Book>) request.getAttribute("books");
    %>
    <title><%=type%></title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
</head>
<body>
    <header>
        <div class="top center">
            <div class="left fl">
                <ul>
                    <li><a href="sale/index.jsp">返回首页</a></li>
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
                        <li><a href="/sale/login.jsp" target="_blank">登录</a></li>
                        <li>|</li>
                        <%--注册页面--%>
                        <li><a href="/sale/register.jsp" target="_blank" >注册</a></li>
                    </ul>
                </div>
                <%
                }else {
                %>
                <div class="gouwuche fr"><a href="/bookshop.do?method=getCartItemList&CustomerId=<%=session.getAttribute("CustomerId")%>">购物车</a></div>
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
    <div class="danpin center">
        <div class="biaoti center"><%=type%></div>
        <div class="main center">
            <%
                for (Book book:bookList){
            %>
            <div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
                <div class="sub_mingxing"><a href="/bookinfo.do?method=detail&bookId=<%=book.getBookId()%>" target="_blank"><img src="<%=book.getBookPic()%>" alt=""></a></div>
                <div class="pinpai"><a href="/bookinfo.do?method=detail&bookId=<%=book.getBookId()%>" target="_blank"><%=book.getBookName()%></a></div>
                <div class="youhui"><%=book.getBookOutline().substring(0,9)%></div>
                <div class="jiage"><%=book.getBookPrice()%>元起</div>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <footer class="mt20 center">

    </footer>
</body>
</html>
