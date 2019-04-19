<%@ page import="org.lanqiao.domain.Goods" %><%--
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
    <link rel="shortcut icon" type="image/x-icon" href="imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../user/css/style.css">
    <script type="text/javascript" src="../user/js/jquery.min.js"></script>
    <style>
        /*在主要内容不足以铺满整个屏幕的情况下，footer居于屏幕低部显示，
使得整个页面占满屏幕。而当主要内容高度大于整个屏幕高度的时候，
footer跟随主要内容进行显示；*/
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

    <script type="text/javascript">
        $(function () {
            //立即购买
            $("#addOrder").click(function () {
                var goodsId = $("#goodsId").val();
                alert("立即购买"+goodsId);
                var url = "/order.do?method=placeOrder&goodsId="+goodsId;
                window.location.href = url;
            })
            //加入收藏
            $("#addCollection").click(function () {
                var goodsId = $("#goodsId").val();
                alert("加入收藏" + goodsId);
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
                        <li><a href="../user/login.jsp" target="_blank">登录</a></li>
                        <li>|</li>
                        <%--注册页面--%>
                        <li><a href="../user/register.jsp" target="_blank" >注册</a></li>
                    </ul>
                </div>
                <%
                }else {
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
                <%
                    }
                %>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </header>
    <%--中间代码--%>
    <div class="xiangqing">
        <div class="neirong w">
            <div class="xiaomi6 fl">${goods.name}</div>
            <div class="clear"></div>
        </div>
    </div>
    <form action="/collection.do?method=addCollection" method="post">
        <div class="jieshao mt20 w">
            <div class="left fl"><img src="${goods.pic}" style="background-size:cover;width: 500px;height: 500px;margin: 30px 0 0 30px"></div>
            <div class="right fr">
                <input hidden id="goodsId" name="goodsId" value="${goods.id}">
                <div class="h3 ml20 mt20">${goods.name}</div>
                <br><br><br>
                <div class="jianjie mr40 ml20">所属分类：${goods.classStr}</div>
                <br><br><br>
                <div class="jiage ml20 mt10">售价：${goods.spricereal}元</div>
                <br><br><br>
                <div class="jianjie mr40 ml20">原价:${goods.ypricereal}元</div>
                <br><br><br><br><br><br><br><br><br>
                <div class="xiadan ml20 mt20">
                    <input class="jrgwc" type="button" name="jrgwc" value="加入收藏" id="addCollection"/>
                    <input class="jrgwc" type="button" name="jrgwc" value="立即购买" id="addOrder"/>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </form>
    <div class="xiadan ml20 mt20"></div>
    <div style="height: 200px">
        <div class="xiangqing">
            <div class="neirong w">
                <div class="xiaomi6 fl">概述</div>
            </div>
        </div>
        <div class="w f1">
            <div class="ml40 ftbc" style="color: #011737;float: left" >${goods.remark}</div>
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
