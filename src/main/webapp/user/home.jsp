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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主页</title>
   <%-- <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>user/imges/book.ico">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>user/css/style.css">--%>
    <link rel="shortcut icon" type="image/x-icon" href="/user/imges/book.ico">
    <link rel="stylesheet" type="text/css" href="/user/css/style.css">
    <link rel="stylesheet" type="text/css" href="/user/css/index.css">
    <script type="text/javascript" src="/user/js/jquery.min.js"></script>
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
                        <li><a href="/user.do?method=getMyInfo" target="_blank">个人中心</a></li>
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
                    <a href="/home.do?method=bookList&goodsClassId=<%=goodsClass.getId()%>&goodsClassName=<%=goodsClass.getName()%>"><%=goodsClass.getName()%></a>
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
                                <div class="xuangou_right fr"><a href="/goods.do?method=detail&goodsId=<%=goods.getId()%>" target="_blank">选购</a></div>
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

    <%--商品列表--%>
    <div class="danpin center">
        <div class="biaoti center">好物推荐</div>
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
                            <div class="sub_mingxing"><a href="/goods.do?method=detail&goodsId=${goods.id}"><img src="${goods.pic}" alt=""></a></div>
                            <div class="pinpai"><a href="/goods.do?method=detail&goodsId=${goods.id}">${goods.name}</a></div>
                            <div class="youhui">${goods.remark}</div>
                            <div class="jiage">${goods.spricereal}元</div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${goodsList.size()/5 < i}">
                    <c:forEach begin="${i * 5}" end="${goodsList.size() - i * 5}" var="goods" items="${goodsList}" step="1">
                        <div class="mingxing fl">
                            <div class="sub_mingxing"><a href="/goods.do?method=detail&goodsId=${goods.id}"><img src="${goods.pic}" alt=""></a></div>
                            <div class="pinpai"><a href="/goods.do?method=detail&goodsId=${goods.id}">${goods.name}</a></div>
                            <div class="youhui">${goods.remark}</div>
                            <div class="jiage">${goods.spricereal}元</div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:forEach>
            </div><div class="clear"></div>
        </c:if>
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
