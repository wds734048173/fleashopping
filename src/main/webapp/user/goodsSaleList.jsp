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
    <script type="text/javascript">
        $(function () {
            //修改
            $(".getGoodsInfo").click(function () {
                var id = $(this).parent().parent().children("td:eq(0)").text();
                // document.getElementById("gridSystemModalLabel").innerHTML = "修改商品分类";
                $.ajax({
                    //通过id获取商品分类信息
                    url:"/goods.do?method=getGoodsById&goodsId="+id,
                    success:function (data) {
                        var goods = eval(data);
                        $("#goodsId").val(goods.id);
                        $("#goodsName").val(goods.name);
                        $("#goodsClassId").val(goods.classStr);
                        $("#ypricereal").val(goods.ypricereal);
                        $("#spricereal").val(goods.spricereal);
                        $("#remark").val(goods.remark);
                        $("#pic").attr("src",goods.pic);
                    }
                })
                $('#addGoodsModel').modal({
                    keyboard: false,
                    show:true
                })
            })
            //下架
            $(".downGoods").click(function () {
                var isDown = confirm ("确定下架吗？");
                if(isDown){
                    var id = $(this).parent().parent().children("td:eq(0)").text();
                    //查询条件
                    var searchGoodsName = $("#searchGoodsName").val();
                    var searchGoodsClassId = $("#searchGoodsClassId option:selected").val();
                    var searchGoodsState = $("#searchGoodsState option:selected").val();
                    var url = "/goods.do?method=DownGoodsSaleById&goodsId=" + id + "&searchGoodsName=" + searchGoodsName +"&searchGoodsClassId="+searchGoodsClassId+"&searchGoodsState="+searchGoodsState;
                    window.location.href = url;
                }else{
                    return;
                }
            })
            //上架
            $(".upGoods").click(function () {
                var isUp = confirm ("确定上架吗？");
                if(isUp){
                    var id = $(this).parent().parent().children("td:eq(0)").text();
                    //查询条件
                    var searchGoodsName = $("#searchGoodsName").val();
                    var searchGoodsClassId = $("#searchGoodsClassId option:selected").val();
                    var searchGoodsState = $("#searchGoodsState option:selected").val();
                    var url = "/goods.do?method=UpGoodsSaleById&goodsId=" + id + "&searchGoodsName=" + searchGoodsName +"&searchGoodsClassId="+searchGoodsClassId+"&searchGoodsState="+searchGoodsState;
                    window.location.href = url;
                }else{
                    return;
                }
            })
        })

        //查询的手动提交方式
        function search() {
            var searchGoodsName = $("#searchGoodsName").val();
            var searchGoodsClassId = $("#searchGoodsClassId option:selected").val();
            var searchGoodsState = $("#searchGoodsState option:selected").val();
            var url = "/goods.do?method=getOwnGoodsList&searchGoodsName="+searchGoodsName+"&searchGoodsClassId="+searchGoodsClassId+"&searchGoodsState="+searchGoodsState;
            window.location.href = url;
        }
    </script>
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
                <div class="form-group row">
                    <div class="col-xs-4">
                        <label for="searchGoodsName" >商品名称:</label>
                        <input type="text" class="myinput"  placeholder="" id="searchGoodsName" name="searchGoodsName" value="${condition.name}">
                    </div>
                    <div class="col-xs-4">
                        <label for="searchGoodsClassId">商品分类</label>
                        <select class="myinput" name="searchGoodsClassId" id="searchGoodsClassId">

                        </select>
                    </div>
                    <div class="col-xs-4">
                        <label for="searchGoodsState">商品状态</label>
                        <select class="myinput" name="searchGoodsState" id="searchGoodsState">
                            <option value="-1" <c:if test="${condition.state == -1}" > selected </c:if>>全部</option>
                            <option value="0" <c:if test="${condition.state == 0}" > selected </c:if>>上架</option>
                            <option value="1" <c:if test="${condition.state == 1}" > selected </c:if>>下架</option>
                            <option value="2" <c:if test="${condition.state == 2}" > selected </c:if>>卖出</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <input type="button" class="btn btn-primary" id="search" value="查询" onclick="search(null)"/>
                </div>
            </div>
            <div class="modal-body">
                <table class="table table-hover table-bordered">
                    <thead>
                    <th hidden>商品id</th>
                    <th>图片</th>
                    <th>商品名称</th>
                    <th>分类</th>
                    <th>状态</th>
                    <th>原价</th>
                    <th>销售价</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach begin="0" end="${goodsList.size()}" var="goods" items="${goodsList}" step="1">
                        <tr>
                            <td hidden>${goods.id}</td>
                            <td><img src="${goods.pic}" style="width: 50px;height: 50px;"></td>
                            <td>${goods.name}</td>
                            <td>${goods.classStr}</td>
                            <td>${goods.stateStr}</td>
                            <td>${goods.ypricereal}</td>
                            <td>${goods.spricereal}</td>
                            <td>
                                <a class="btn btn-default getGoodsInfo" href="#" role="button"  name="getGoodsInfo">详情</a>
                                <c:if test="${goods.state == 0}">
                                    <a class="btn btn-default downGoods" href="#" role="button"  name="downGoods">下架</a>
                                </c:if>
                                <c:if test="${goods.state == 1}">
                                    <a class="btn btn-default upGoods" href="#" role="button"  name="upGoods">上架</a>
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

<script type="text/javascript">
    $(function(){
        $("#searchGoodsClassId").append("<option value='-1'>全部</option>")
        //获取分类
        $.ajax({
            url:"/goodsClass.do?method=getGoodsClassListForSelect",
            success:function (data) {
                var goodsClassList = eval(data);
                <c:choose>
                <c:when test="${not empty condition.goodsClassId}">
                $.each(goodsClassList,function (index,obj) {
                    var goodsClass = eval(obj);
                    var str = "";
                    if(goodsClass.id == ${condition.goodsClassId}){
                        str = "<option value="+goodsClass.id +"  selected>"+goodsClass.name+"</option>";
                    }else{
                        str = "<option value="+goodsClass.id +">"+goodsClass.name+"</option>";
                    }
                    $("#searchGoodsClassId").append(str);
                });
                </c:when>
                <c:otherwise>
                $.each(goodsClassList,function (index,obj) {
                    var goodsClass = eval(obj);
                    var str = "<option value="+goodsClass.id +">"+goodsClass.name+"</option>";
                    $("#searchGoodsClassId").append(str);
                });
                </c:otherwise>
                </c:choose>
            }
        })
    })
</script>
</html>
