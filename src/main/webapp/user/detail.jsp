<%@ page import="org.lanqiao.domain.Goods" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6/006
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Goods goods = (Goods) request.getAttribute("goods");
%>
<html>
<head>
    <title><%=goods.getName()%></title>
    <link rel="shortcut icon" type="image/x-icon" href="../user/imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <script type="text/javascript" src="../user/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/user/css/index.css">

    <script type="text/javascript">
        $(function () {
            //立即购买
            $("#addOrder").click(function () {
                var goodsId = $("#goodsId").val();
                var url = "/order.do?method=placeOrder&goodsId="+goodsId;
                window.location.href = url;
            })
            //加入收藏
            $("#addCollection").click(function () {
                var goodsId = $("#goodsId").val();
                var url = "/collection.do?method=addCollection&goodsId="+goodsId;
                window.location.href = url;
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
                    <li><a href="../user/index.jsp" target="_self">首页</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="right fr">
                <%
                    String realname = (String) session.getAttribute("realname");
                    if (realname == null){
                %>
                <div class="fr">
                    <ul>
                        <%--登录页面--%>
                        <li><a href="../user/login.jsp" target="_self">登录</a></li>
                        <li>|</li>
                        <%--注册页面--%>
                        <li><a href="../user/register.jsp" target="_self" >注册</a></li>
                    </ul>
                </div>
                <%
                }else {
                %>
                <div class="fr">
                    <ul>
                        <li>欢迎您：<%=realname%></li>
                        <li>|</li>
                        <li><a href="/user.do?method=getMyInfo" target="_self">个人中心</a></li>
                        <li>|</li>
                        <li><a href="/logout.do" target="_self">退出登录</a></li>
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
    <%--中间代码--%>
    <br>
    <div class="xiangqing">
        <div class="neirong w">
            <div class="xiaomi6 fl">${goods.name}</div>
            <div class="clear"></div>
        </div>
    </div>
    <form action="/collection.do?method=addCollection" method="post">
        <div class="jieshao mt20 w">
            <br>
            <div class="left fl"><img src="${goods.pic}" style="background-size:cover;width: 500px;height: 500px;margin: 30px 0 0 30px"></div>
            <div class="right fr">
                <input hidden id="goodsId" name="goodsId" value="${goods.id}">
                <br><br><br>
                <div class="h3 ml20 mt20" style="font-size: xx-large">${goods.name}</div>
                <br><br><br>
                <div class="jianjie mr40 ml20" style="font-size: x-large">所属分类：${goods.classStr}</div>
                <br><br><br>
                <div class="jiage ml20 mt10" style="font-size: xx-large">售价：${goods.spricereal}元</div>
                <br><br><br>
                <div class="jianjie mr40 ml20"style="font-size: x-large">原价:${goods.ypricereal}元</div>
                <br><br><br>
                <%--自己不能购买自己的产品--%>
                <c:if test="${userId==goods.UId}">
                    <div class="xiadan ml20 mt20">
                        <input class="jrgwc" type="button" name="jrgwc" value="加入收藏" id="addCollection" disabled style="background-color:grey;"/>
                        <input class="jrgwc" type="button" name="jrgwc" value="立即购买" id="addOrder" disabled style="background-color:grey;"/>
                    </div>
                </c:if>

                <%--不是自己商品，并且是上架状态，都可以收藏，下单--%>
                <c:if test="${userId!=goods.UId && goods.state==0}">
                    <div class="xiadan ml20 mt20">
                        <input class="jrgwc" type="button" name="jrgwc" value="加入收藏" id="addCollection"/>
                        <input class="jrgwc" type="button" name="jrgwc" value="立即购买" id="addOrder"/>
                    </div>
                </c:if>

                <%--已出售/下架的商品不能再次购买，但是应该可以收藏--%>
                <c:if test="${userId!=goods.UId && 0!=goods.state}">
                    <div class="xiadan ml20 mt20">
                        <input class="jrgwc" type="button" name="jrgwc" value="加入收藏" id="addCollection"/>
                        <input class="jrgwc" type="button" name="jrgwc" value="立即购买" id="addOrder" disabled style="background-color:grey;"/>
                    </div>
                </c:if>
            </div>
            <div class="clear"></div>
        </div>
    </form>
    <div>
        <div hidden style="height: 50px;">

        </div>
        <div class="xiangqing">
            <div class="neirong w">
                <div class="xiaomi6 fl">概述</div>
            </div>
        </div>
        <br>
        <div class="w f1">
            <div style="font-size: xx-large;color: black;" >
                <P style="text-indent:2em;">
                    ${goods.remark}
                </P>

            </div>
            <div class="clear"></div>
        </div>
        <br>
        <div class="clear"></div>
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
                        <a href="#" rel="nofollow" target="_self">关于我们</a>
                        <a href="#" rel="nofollow" target="_self">用户协议</a>
                        <a href="#" rel="nofollow" target="_self">最新信息</a>
                        <a href="#" rel="nofollow" target="_self">意见反馈</a>
                    </div>
                    <div class="fr footer-kefu">
                        <a href="javascript:void(0)" rel="nofollow" class="lxkf" target="_self">
                            <i class="iconfont">&#xe601;</i>
                            立即联系
                        </a>
                        <a rel="nofollow" target="_self">
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
                    <a class="shgongshang" rel="nofollow" href="#" target="_self">
                        <img src="" alt="">山西工商</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
