<%--
  Created by IntelliJ IDEA.
  User: WDS
  Date: 2018/12/3
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8" />
        <title>首页</title>
        <link rel="stylesheet" href="css/page.css" />
        <script type="text/javascript" src="/manager/js/jquery.min.js" ></script>
        <script type="text/javascript" src="/manager/js/index.js" ></script>
        <style type="text/css">
            .myinput{
                border: #808080 1px solid;/* 设置输入边框的颜色粗细 */
                font-size: 12px;/* 设置输入框中字体的大小 */
                height: 30px;/* 设置输入框的高度 */
                border-radius: 5px; /* 设置输入框圆角的大小 */
                color: #000000;/* 输入框中文字的颜色 */
                display: inline;/* 使input框在同一行信息，不会换行显示，不使用float: left;样式，应为该样式会让input框周围的其它标签样式乱掉 */
                width: 130px;
            }
        </style>
    </head>
    <body>
        <div class="left">
            <div class="bigTitle">网上书店后台管理系统</div>
            <div class="lines">
                <div onclick="pageClick(this)" class="active"><img src="/manager/img/icon-1.png" />分类管理</div>
                <div onclick="pageClick(this)"><img src="/manager/img/icon-4.png" />商品管理</div>
                <div onclick="pageClick(this)"><img src="/manager/img/icon-3.png" />订单管理</div>
                <div onclick="pageClick(this)"><img src="/manager/img/icon-4.png" />用户信息管理</div>
                <div onclick="pageClick(this)"><img src="/manager/img/icon-5.png" />评价信息</div>
                <div onclick="pageClick(this)"><img src="/manager/img/icon-5.png" />信息反馈</div>
            </div>
        </div>
        <div class="top">
            <div class="leftTiyle" id="flTitle">分类管理</div>
            <div class="thisUser">当前用户：<%=session.getAttribute("username")%></div>
            <div style="float: right;"><input style="line-height: normal;margin-top: 37px;" type="button" width="100px" height="50px" id="exit" onclick="exit()" value="退出登录"/></div>
        </div>
        <div class="content"></div>
        <div style="text-align:center;"></div>
    </body>
    <script type="text/javascript">
        $(function(){
            $(".content").load("/bookType.do?method=getBookTypelist");
        })
        function exit() {
            var url = "/register.do?method=exit";
            window.location.href= url;
        }
    </script>
</html>