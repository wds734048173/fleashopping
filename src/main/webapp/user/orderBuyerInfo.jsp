<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: WDS
  Date: 2018/12/10
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心-我买到的订单</title>
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
            <div class="ddzx"><li class="ml40"><a href="/goods.do?method=getOwnGoodsList">我发布的商品</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/collection.do?method=getCollectionList">我收藏的商品</a></li></div>
            <div class="ddzx"><li class="ml40"><a href="/order.do?method=getSaleOrderList">我卖出的订单</a></li></div>
            <div class="ddzx"><li class="ml40  action"><a href="/order.do?method=getBuyerOrderList">我买到的订单</a></li></div>
        </div>
        <%--右侧代码--%>
        <div class="rtcont fr">
            <div class="ddzxbt">我买到的订单详情</div>
                <div class="modal-body">
                    <div class="col-xs-6">
                        <label for="orderNo" class="control-label">订单编号:</label>
                        <input type="text" class="form-control" id="orderNo" name="orderNo" value="${order.no}" disabled>
                    </div>
                    <div class="col-xs-6">
                        <label for="price" class="control-label">商品原价:</label>
                        <input type="text" class="form-control" id="price" name="price" value="${order.pricereal}" disabled>
                    </div>
                    <br>
                    <br>
                    <div class="col-xs-6">
                        <label for="freight" class="control-label">运费:</label>
                        <input type="text" class="form-control" id="freight" name="freight" value="${order.freightreal}" disabled>
                    </div>
                    <div class="col-xs-6">
                        <label for="money" class="control-label">商品实付金额:</label>
                        <input type="text" class="form-control" id="money" name="money" value="${order.moneyreal}" disabled>
                    </div>
                    <br>
                    <br>
                    <div class="col-xs-6">
                        <label for="stateStr" class="control-label">状态:</label>
                        <input type="text" class="form-control" id="stateStr" name="stateStr" value="${order.stateStr}" disabled>
                    </div>
                    <c:if test="${order.state == 1}">
                        <div class="col-xs-6">
                            <label for="ctime" class="control-label">创建时间:</label>
                            <input type="text" class="form-control" id="ctime" name="ctime" value="<fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                    </c:if>
                    <c:if test="${order.state == 2}">
                        <div class="col-xs-6">
                            <label for="ctime" class="control-label">创建时间:</label>
                            <input type="text" class="form-control" id="ctime" name="ctime" value="<fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">付款时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.paytime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                    </c:if>
                    <c:if test="${order.state == 3}">
                        <div class="col-xs-6">
                            <label for="ctime" class="control-label">创建时间:</label>
                            <input type="text" class="form-control" id="ctime" name="ctime" value="<fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">付款时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.paytime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">发货时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.sendtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                    </c:if>
                    <c:if test="${order.state == 4}">
                        <div class="col-xs-6">
                            <label for="ctime" class="control-label">创建时间:</label>
                            <input type="text" class="form-control" id="ctime" name="ctime" value="<fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">付款时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.paytime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">发货时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.sendtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">收货时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.receivetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                    </c:if>
                    <c:if test="${order.state == 5}">
                        <div class="col-xs-6">
                            <label for="ctime" class="control-label">创建时间:</label>
                            <input type="text" class="form-control" id="ctime" name="ctime" value="<fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">付款时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.paytime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">发货时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.sendtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">收货时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.receivetime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">评论时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.commenttime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                    </c:if>
                    <c:if test="${order.state == 6}">
                        <div class="col-xs-6">
                            <label for="ctime" class="control-label">创建时间:</label>
                            <input type="text" class="form-control" id="ctime" name="ctime" value="<fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                        <div class="col-xs-6">
                            <label for="rtime" class="control-label">取消时间:</label>
                            <input type="text" class="form-control" id="rtime" name="rtime" value="<fmt:formatDate value="${order.canceltime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>" disabled>
                        </div>
                    </c:if>
                    <br>
                    <br>

                    <div class="col-xs-6">
                        <label for="name" class="control-label">收货人姓名:</label>
                        <input type="text" class="form-control" id="name" name="name" value="${order.realname}" disabled>
                    </div>
                    <div class="col-xs-6">
                        <label for="phone" class="control-label">收货人电话:</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${order.telphone}" disabled>
                    </div>
                    <div class="col-xs-6">
                        <label for="address" class="control-label">收货人地址:</label>
                        <input type="text" class="form-control" id="address" name="address" value="${order.address}" disabled>
                    </div>
                </div>
                <div class="modal-body" style="margin-top: 150px;">
                    <h3>订单商品详情</h3>
                    <table class="table table-hover table-bordered">
                        <thead>
                        <th>商品图片</th>
                        <th>商品名称</th>
                        <th>原价</th>
                        <th>售价</th>
                        <%--<th>数量</th>--%>
                        </thead>
                        <tbody>
                            <c:forEach begin="0" end="${orderInfoList.size()}" var="orderInfo" items="${orderInfoList}" step="1">
                                <tr>
                                    <td><img src="${orderInfo.gpic}" width="50px;" height="50px;"></td>
                                    <td>${orderInfo.gname}</td>
                                    <td>${orderInfo.ypricereal}</td>
                                    <td>${orderInfo.spricereal}</td>
                                    <%--<td>${orderInfo.num}</td>--%>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
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
