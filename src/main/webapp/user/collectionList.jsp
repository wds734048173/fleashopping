<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2019/4/19
  Time: 14:20
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
            <div class="ddzx"><li class="ml40"><a href="/user.do?method=getUserInfo">我的个人信息</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/goods.do?method=getOwnGoodsList">我发布的商品</a></li></div>
            <div class="ddzx"><li class="ml40 action"><a href="/collection.do?method=getCollectionList">我收藏的商品</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/order.do?method=getSaleOrderList">我卖出的订单</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/order.do?method=getBuyerOrderList">我买到的订单</a></li></div>
        </div>
        <%--右侧代码--%>
        <div class="rtcont fr">
            <div class="ddzxbt">我的收藏商品</div>
            <div class="modal-body">
                <table class="table table-hover table-bordered">
                    <thead>
                    <th hidden>收藏id</th>
                    <th hidden>商品id</th>
                    <th>收藏时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach begin="0" end="${collectionList.size()}" var="collection" items="${collectionList}" step="1">
                        <tr>
                            <td hidden>${collection.id}</td>
                            <td><fmt:formatDate value="${collection.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>
                                <a class="btn btn-default" href="/goods.do?method=detail&goodsId=${collection.GId}" role="button">详情</a>
                                <a class="btn btn-default" href="/collection.do?method=removeCollection&collectionId=${collection.id}" role="button">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
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
