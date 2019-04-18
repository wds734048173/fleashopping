<%@ page import="org.lanqiao.domain.GoodsClass" %>
<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.domain.Goods" %>
<%--<%@ page import="org.lanqiao.domain.User" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6/006
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>user/imges/book.ico">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/css/style.css">
    <script type="text/javascript" src="<%=basePath%>user/js/jquery.min.js"></script>
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
                    <li><a href="../user/index.jsp">首页</a></li>
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
    <%--导航栏--%>
    <div class="banner_y center" style="background: url('imges/1.jpg')">
        <div class="nav">
            <ul>
                <%
                    List<GoodsClass> goodsClassList = (List<GoodsClass>) request.getAttribute("goodsClassList");
                    List<Goods> goodsList = (List<Goods>) request.getAttribute("goodsList");
                    for (GoodsClass goodsClass:goodsClassList){
                %>
                <li>
                    <a href="/home.do?method=booklist&typeId=<%=goodsClass.getId()%>&typename=<%=goodsClass.getName()%>"><%=goodsClass.getName()%></a>
                    <div class="pop">
                        <div class="left fl">
                            <%
                                int firstNum = 6;
                                if(goodsList.size() < 6){
                                    firstNum = goodsList.size();
                                }
                                for (int i = 0; i < firstNum; i++){
                                    Goods goods = goodsList.get(i);
                                    if (goods.getClassId() == goodsClass.getId()){
                                        String goodsName = goods.getName();
                                        if(goodsName.length() > 10){
                                            goodsName = goods.getName().substring(0,10);
                                        }
                            %>
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="" title="<%=goods.getName()%>">
                                        <div class="img fl"><%--<img src="<%=goods.getPic()%>" alt="">--%></div>
                                        <span class="fl"><%=goodsName%></span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/goods.do?method=detail&bookId=<%=goods.getId()%>" target="_blank">选购</a></div>
                                <div class="clear"></div>
                            </div>
                            <%
                                    }
                                }
                            %>
                        </div>
                        <div class="clear"></div>
                    </div>

                </li>
                <%
                    }
                %>
            </ul>

        </div>
    </div>
    <div class="danpin center">
        <div class="biaoti center">好物推荐</div>
        <div class="main center">
            <%
                for (int i=0;i<5;i++){
                   Goods goods= goodsList.get(i);
            %>
            <div class="mingxing fl">
                <div class="sub_mingxing"><a href="/bookinfo.do?method=detail&bookId=<%=goods.getId()%>"><img src="<%=goods.getPic()%>" alt=""></a></div>
                <div class="pinpai"><a href="/bookinfo.do?method=detail&bookId=<%=goods.getId()%>"><%=goods.getName()%></a></div>
                <div class="youhui"><%=goods.getRemark().substring(0,9)%></div>
                <div class="jiage"><%=goods.getSpricereal()%>元起</div>
            </div>
            <%
                }
            %>
            <div class="clear"></div>
        </div>
        <div class="main center">
            <%
                for (int i=5;i<10;i++){
                    Goods goods= goodsList.get(i);
            %>
            <div class="mingxing fl">
                <div class="sub_mingxing"><a href="/bookinfo.do?method=detail&bookId=<%=goods.getId()%>"><img src="<%=goods.getPic()%>" alt=""></a></div>
                <div class="pinpai"><a href="/bookinfo.do?method=detail&bookId=<%=goods.getId()%>"><%=goods.getName()%></a></div>
                <div class="youhui"><%=goods.getRemark().substring(0,9)%></div>
                <div class="jiage"><%=goods.getSpricereal()%>元</div>
            </div>
            <%
                }
            %>
            <div class="clear"></div>
        </div>
    </div>


    <div class="footer">
        <div class="footer-content">
            <div class="w1200">
                <div class="footet-jiesao clearfix">
                    <div class="fl footer-logo-box">
                        <img src="imges/new_logo.png" class="footer-logo">
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
