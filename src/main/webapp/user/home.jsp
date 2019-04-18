<%@ page import="org.lanqiao.domain.BookType" %>
<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.domain.Book" %>
<%@ page import="org.lanqiao.domain.Customer" %>
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
    <link rel="shortcut icon" type="image/x-icon" href="../sale/imges/book.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <script type="text/javascript" src="../sale/js/jquery.min.js"></script>
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
        })
    </script>
</head>
<body>
    <header>
        <div class="top center">
            <div class="left fl">
                <ul>
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
                        <li><a href="/customer.do?method=getMyInfo" target="_blank">个人中心</a></li>
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
                    List<BookType> typeList = (List<BookType>) request.getAttribute("typeList");
                    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
                    for (BookType bookType:typeList){
                %>
                <li>
                    <a href="/home.do?method=booklist&typeId=<%=bookType.getBookTypeId()%>&typename=<%=bookType.getBookTypeName()%>"><%=bookType.getBookTypeName()%></a>
                    <div class="pop">
                        <div class="left fl">
                            <%
                                int firstNum = 6;
                                if(bookList.size() < 6){
                                    firstNum = bookList.size();
                                }
                                for (int i = 0; i < firstNum; i++){
                                    Book book = bookList.get(i);
                                    if (book.getBookTypeid() == bookType.getBookTypeId()){
                                        String bookName = book.getBookName();
                                        if(bookName.length() > 10){
                                            bookName = book.getBookName().substring(0,10);
                                        }
                            %>
                            <div>
                                <div class="xuangou_left fl">
                                    <a href="" title="<%=book.getBookName()%>">
                                        <%--<div class="img fl"><img src="<%=book.getBookPic()%>" alt=""></div>--%>
                                        <span class="fl"><%=bookName%></span>
                                        <div class="clear"></div>
                                    </a>
                                </div>
                                <div class="xuangou_right fr"><a href="/bookinfo.do?method=detail&bookId=<%=book.getBookId()%>" target="_blank">选购</a></div>
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

        <div class="biaoti center">好书推荐</div>
        <div class="main center">
            <%
                for (int i=0;i<5;i++){
                   Book book= bookList.get(i);
            %>
            <div class="mingxing fl">
                <div class="sub_mingxing"><a href="/bookinfo.do?method=detail&bookId=<%=book.getBookId()%>"><img src="<%=book.getBookPic()%>" alt=""></a></div>
                <div class="pinpai"><a href="/bookinfo.do?method=detail&bookId=<%=book.getBookId()%>"><%=book.getBookName()%></a></div>
                <div class="youhui"><%=book.getBookOutline().substring(0,9)%></div>
                <div class="jiage"><%=book.getBookPrice()%>元起</div>
            </div>
            <%
                }
            %>
            <div class="clear"></div>
        </div>
        <div class="main center">
            <%
                for (int i=5;i<10;i++){
                    Book book= bookList.get(i);
            %>
            <div class="mingxing fl">
                <div class="sub_mingxing"><a href="/bookinfo.do?method=detail&bookId=<%=book.getBookId()%>"><img src="<%=book.getBookPic()%>" alt=""></a></div>
                <div class="pinpai"><a href="/bookinfo.do?method=detail&bookId=<%=book.getBookId()%>"><%=book.getBookName()%></a></div>
                <div class="youhui"><%=book.getBookOutline().substring(0,9)%></div>
                <div class="jiage"><%=book.getBookPrice()%>元</div>
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
                        <a href="/site/publicity-page" rel="nofollow">关于我们</a>
                        <a href="/page/1" rel="nofollow">用户协议</a>
                        <a href="/new.html" target="_blank">最新信息</a>
                        <a class="feedback" href="javascript:void(0)" rel="nofollow">意见反馈</a>
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
                    <a class="shgongshang" rel="nofollow" href="https://218.242.124.22:8082/businessCheck/verifKey.do?serial=31000091310109a39a271a33581338001001-SAIC_SHOW_310000-20180529191514943297&signData=MEUCIQD6MewiSJbo/K3QqHOUQ32W0Sz5eIDH7e/Pj+NN6bV2bAIgcn+Om5EWFphn3dXtnJLthBaySLicwitlhKiXsP9lV9M=">
                        <img src="" alt="">山西工商</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
