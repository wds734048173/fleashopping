<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.domain.Goods" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/7/007
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        String goodsClassName=  request.getParameter("goodsClassName");
        List<Goods> goodsList= (List<Goods>) request.getAttribute("goodsList");
    %>
    <title><%=goodsClassName%></title>
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <style>
        html,body{
            height: 100%;
            margin: 0;
            padding: 0;
        }

        /*需将主区域内容（不包括footer）设置为此class，一般为div*/
        .page{
            box-sizing: border-box;/*为元素指定的任何内边距和边框都将在已设定的宽度和高度内进行绘制*/
            min-height: 100%;
            padding-bottom: 25px;
        }
        footer{
            height: 25px;
            margin-top: -25px;
            opacity: 0.5;
            color: #5E5E5E;
        }
        /*footer 结束*/
        .footer {
            background: #3F3E3E;
        }

        * {
            margin: 0;
            padding: 0;
            border: 0 solid #000000;
        }

        div {
            display: block;
        }

        .w1200 {
            width: 1200px;
            margin: 0 auto;
        }

        .footet-jiesao {
            height: 100px;
            font-size: 14px;
        }

        .footet-jiesao>div {
            height: 100%;
        }

        .footer-logo-box {
            vertical-align: middle;
            line-height: 100px;
            margin-right: 60px;
        }

        .fl {
            float: left;
        }

        .footer-logo {
            width: 192px;
            height: 74px;
            vertical-align: middle;
            margin-top: -10px;
        }

        .footer-slogan {
            color: #EC7043;
            font-size: 14px;
            border-left: 1px solid #EC7043;
            padding-left: 13px;
            margin-left: 18px;
        }

        .footer-function {
            height: 100%;
            line-height: 100px;
        }

        .footer-function a {
            height: 22px;
            border-right: 1px #6C6C6C solid;
            font-size: 14px;
            color: #9A9A9A;
            padding: 0 10px;
        }

        a {
            color: #666666;
            text-decoration: none;
        }

        .footer-function a:last-child {
            border: none;
        }

        .footer-kefu {
            line-height: 100px;
            margin-right: 10px;
        }

        .footer-kefu .lxkf {
            margin-right: 40px;
        }

        .footer-kefu a {
            color: #9A9A9A;
            font-size: 12px;
        }

        .footer-kefu a .iconfont {
            color: #FF8B36;
        }

        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;
        }
        .footer-bottom-size {
            font-size: 14px;
            color: #999999;
            height: 48px;
            line-height: 48px;
            text-align: center;
            background: #333333;
        }
        html, body, h1, h2, h3, h4, input, p, ul {
            margin: 0;
            padding: 0;
        }
        p {
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }
        body {
            font-family: "PingFang SC", "Lantinghei SC", "Microsoft YaHei", "HanHei SC", "Helvetica Neue", "Open Sans", Arial, "Hiragino Sans GB", 微软雅黑, STHeiti, "WenQuanYi Micro Hei", SimSun, sans-serif;
            color: rgb(173, 173, 173);
            background: rgb(250, 250, 250);
        }

    </style>
</head>
<body>
    <header>
        <div class="top center">
            <div class="left fl">
                <ul>
                    <li><a href="../user/index.jsp">返回首页</a></li>
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
                        <li><a href="/user/login.jsp" target="_blank">登录</a></li>
                        <li>|</li>
                        <%--注册页面--%>
                        <li><a href="/user/register.jsp" target="_blank" >注册</a></li>
                    </ul>
                </div>
                <%
                }else {
                %>
                <div class="fr">
                    <ul>
                        <li>欢迎您：<%=realname%></li>
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
        <div class="biaoti center"><%=goodsClassName%></div>
        <c:if test="${goodsList.size() == 0}">
            <div class="main center">
                <span>还没有好的商品，请等待商家发布商品！</span>
            </div>
        </c:if>
        <c:if test="${goodsList.size() != 0}">
            <div class="main center">
                <c:forEach var="i" begin="0" end="${titleCount-1}" step="1">
                    <c:if test="${goodsList.size()/5 >= i}">
                        <c:forEach begin="${i * 5}" end="${(i+1)*5}" var="goods" items="${goodsList}" step="1">
                            <div class="mingxing fl">
                                <div class="sub_mingxing"><a href="/bookinfo.do?method=detail&bookId=${goods.id}"><img src="${goods.pic}" alt=""></a></div>
                                <div class="pinpai"><a href="/bookinfo.do?method=detail&bookId=${goods.id}">${goods.name}</a></div>
                                <div class="youhui">${goods.remark}<%--<%=goods.getRemark().substring(0,9)%>--%></div>
                                <div class="jiage">${goods.spricereal}元</div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${goodsList.size()/5 < i}">
                        <c:forEach begin="${i * 5}" end="${goodsList.size() - i * 5}" var="goods" items="${goodsList}" step="1">
                            <div class="mingxing fl">
                                <div class="sub_mingxing"><a href="/bookinfo.do?method=detail&bookId=${goods.id}"><img src="${goods.pic}" alt=""></a></div>
                                <div class="pinpai"><a href="/bookinfo.do?method=detail&bookId=${goods.id}">${goods.name}</a></div>
                                <div class="youhui">${goods.remark}<%--<%=goods.getRemark().substring(0,9)%>--%></div>
                                <div class="jiage">${goods.spricereal}元</div>
                            </div>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </div><div class="clear"></div>
        </c:if>
    </div>

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
