<%@ page import="org.lanqiao.domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.utils.PageModel" %>
<%@ page import="org.lanqiao.dao.ICommentDao" %>
<%@ page import="org.lanqiao.dao.impl.CommentDaoImpl" %>
<%@ page import="org.lanqiao.domain.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/7 0007
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍评价中心</title>
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/css/bookshop.css"/>
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">

    <script type="text/javascript" src="../sale/js/jquery.min.js" ></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
</head>

<body>

<%
    Book book = (Book) request.getAttribute("bookDetail");
%>
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="../user/index.jsp">返回首页</a></li>
                <li>|</li>
                <%--点击进入反馈页面--%>
                <li><a href="">问题反馈</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <%
                String name = (String) session.getAttribute("name");
                if (name == null){
            %>
            <%--购物车页面--%>
            <div class="gouwuche fr"><a href="../sale/login.jsp">购物车</a></div>
            <div class="fr">
                <ul>
                    <%--登录页面--%>
                    <li><a href="../sale/login.jsp" target="_blank">登录</a></li>
                    <li>|</li>
                    <li><a href="/customer.do?method=getMyInfo&id=<%=session.getAttribute("CustomerId")%>" target="_blank">个人中心</a></li>
                    <li>|</li>
                    <%--注册页面--%>
                    <li><a href="../sale/register.jsp" target="_blank" >注册</a></li>
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

    <h2 style="color: black">书籍评论中心</h2>
    <br><br><br>

    <a class="btn btn-primary  active " href="/privateComment.do?method=selectByBookId&bookid=<%=request.getAttribute("bookid")%>" role="button" id="option1">全部</a>
    <a class="btn btn-primary  active " href="/privateComment.do?method=findBybkGrade&commentgrade=0&bookid=<%=request.getAttribute("bookid")%>" role="button" id="option2">好评</a>
    <a class="btn btn-primary  active " href="/privateComment.do?method=findBybkGrade&commentgrade=1&bookid=<%=request.getAttribute("bookid")%>" role="button" id="option3">中评</a>
    <a class="btn btn-primary  active " href="/privateComment.do?method=findBybkGrade&commentgrade=2&bookid=<%=request.getAttribute("bookid")%>" role="button" id="option4">差评</a>
    <br><br><br>
<table class="table table-hover ">

    <thead >
    <td class="success">用户</td>
    <td class="success">评价等级</td>
    <td class="success">评价内容</td>
    <td class="success">书籍名称</td>
    </thead>
    <tbody>
    <tr>

    <%
        List<Comment> commentList = (List<Comment>)request.getAttribute("bkcommentList");
        for(Comment comment : commentList){
    %>

    <tr>
        <td><%=comment.getUserName()%></td>
        <td><%=comment.getCommentgrade()%></td>
        <td><%=comment.getCommentcontent()%></td>
        <td><%=comment.getBookId()+"<br>"+comment.getBookName()%></td>

        </td>
    </tr>
    <%
        }
    %>
    </tbody>

</table>
</div>

</body>
</html>
