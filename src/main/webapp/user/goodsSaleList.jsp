<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2019/4/19
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>个人中心-我发布的商品</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <link rel="stylesheet" type="text/css" href="/user/css/index.css">
    <script type="text/javascript" src="../user/js/jquery.min.js"></script>
    <script type="text/javascript" src="../bootstrap/js/bootstrap.js"></script>
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
            <div class="ddzx"><li class="ml40"><a href="user.do?method=getMyInfo">我的个人信息</a></li></div>
            <div class="ddzx"><li class="ml40 action"><a href="/goods.do?method=getOwnGoodsList">我发布的商品</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/collection.do?method=getCollectionList">我收藏的商品</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/order.do?method=getSaleOrderList">我卖出的订单</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/order.do?method=getBuyerOrderList">我买到的订单</a></li></div>
        </div>
        <%--右侧代码--%>
        <div class="rtcont fr">
            <div class="ddzxbt">我发布的商品</div>

            <div class="modal-body">
                <table class="table table-hover table-bordered">
                    <thead>
                    <th hidden>订单id</th>
                    <th>订单编号</th>
                    <th>原价</th>
                    <th>运费</th>
                    <th>实付金额</th>
                    <th>状态</th>
                    <th>创建时间</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach begin="0" end="${orderList.size()}" var="order" items="${orderList}" step="1">
                        <tr>
                            <td hidden>${order.id}</td>
                            <td>${order.no}</td>
                            <td>${order.pricereal}</td>
                            <td>${order.freightreal}</td>
                            <td>${order.moneyreal}</td>
                            <td>${order.stateStr}</td>
                            <td><fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td>
                                <a class="btn btn-default getOrderInfo" href="#" role="button"  name="getOrderInfo"  onclick="getOrderInfo(${order.id})">订单详情</a>
                                    <%--已付款的订单可发货--%>
                                    <%--<c:choose>
                                        <c:when test="${order.state == 2}">
                                            <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},3)">发货</a>
                                        </c:when>
                                        &lt;%&ndash;未付款的订单可取消订单&ndash;%&gt;
                                        <c:when test="${order.state == 1}">
                                            <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},6)">作废</a>
                                        </c:when>
                                    </c:choose>--%>
                                <c:if test="${order.state == 1}">
                                    <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},6)">作废</a>
                                </c:if>
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
