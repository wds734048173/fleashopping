<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WDS
  Date: 2018/12/3
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品分类列表</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            //获取商品详情
            /*$(".getGoodsInfo").click(function () {
                var id = $(this).parent().parent().children("td:eq(0)").text();
                $(".content").load("/goods.do?method=getGoodsById&goodsId="+id);
            })*/
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
                    var currentPage = $("#currentPage").val();
                    var url = "/goods.do?method=DownGoodsById&goodsId=" + id + "&searchGoodsName=" + searchGoodsName +"&searchGoodsClassId="+searchGoodsClassId+"&searchGoodsState="+searchGoodsState + "&currentPage=" + currentPage;
                    $(".content").load(url);
                }else{
                    return;
                }
            })
        })

        //查询的手动提交方式
        function search(currentPage) {
            var searchGoodsName = $("#searchGoodsName").val();
            var searchGoodsClassId = $("#searchGoodsClassId option:selected").val();
            var searchGoodsState = $("#searchGoodsState option:selected").val();
            if(currentPage == null){
                var currentPage = $("#currentPage").val();
            }else{
                var currentPage = currentPage;
            }
            var url = "/goods.do?method=getGoodsListByCondition&currentPage="+currentPage+"&searchGoodsName="+searchGoodsName+"&searchGoodsClassId="+searchGoodsClassId+"&searchGoodsState="+searchGoodsState;
            $(".content").load(url);
        }
    </script>
</head>
<body>
<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
<div class="modal-body">
    <div class="form-group row">
        <div class="col-xs-3">
            <label for="searchGoodsName" >商品名称:</label>
            <input type="text" class="myinput"  placeholder="" id="searchGoodsName" name="searchGoodsName" value="${condition.name}">
        </div>
        <div class="col-xs-3">
            <label for="searchGoodsClassId">商品分类</label>
            <select class="myinput" name="searchGoodsClassId" id="searchGoodsClassId">

            </select>
        </div>
        <div class="col-xs-3">
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
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%--新增模态框插件--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="addGoodsModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">商品详情</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="/goods.do?method=addGoods" id="addForm">
                    <div class="form-group hidden">
                        <label for="goodsId" class="control-label">商品id:</label>
                        <input type="text" class="form-control" id="goodsId" name="goodsId" disabled value="${goods.id}">
                    </div>
                    <div class="form-group">
                        <label for="goodsName" class="control-label">商品名称:</label>
                        <input type="text" class="form-control" id="goodsName" name="goodsName" disabled value="${goods.name}">
                    </div>
                    <div class="form-group">
                        <label for="goodsClassId" class="control-label">商品分类:</label>
                        <input type="text" class="form-control" id="goodsClassId" name="goodsClassId"  disabled value="${goods.classStr}">
                    </div>
                    <div class="form-group">
                        <label for="ypricereal" class="control-label">原价:</label>
                        <input type="number" class="form-control" id="ypricereal" name="ypricereal" disabled value="${goods.ypricereal}">
                    </div>
                    <div class="form-group">
                        <label for="spricereal" class="control-label">销售价:</label>
                        <input type="number" class="form-control" id="spricereal" name="spricereal" disabled value="${goods.spricereal}">
                    </div>
                    <div class="form-group">
                        <label for="remark" class="control-label">商品介绍:</label>
                        <input type="text" class="form-control" id="remark" name="remark" disabled value="${goods.remark}">
                    </div>
                    <div class="form-group">
                        <label class="control-label">商品图片:</label>
                        <img src="${goods.pic}" width="200px" height="200px" id="pic">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" class="btn btn-primary" id="save">保存</button>--%>
            </div>
        </div>
    </div>
</div>
<%--分页插件--%>
<c:if test="${goodsList.size() != 0}">
    <center>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li  onclick="search(${pm.startPage})"><a href="javascript:void(0);"><span>首页</span></a></li>
                <li  onclick="search(${pm.prePageNum})">
                    <a href="javascript:void(0);"  aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach step="1" var="i" begin="1" end="${pm.totalPageNum}">
                <li  onclick="search(${i})"><a href="javascript:void(0);"><span <c:if test="${i==pm.currentPageNum}"> style = 'color:red;' </c:if>> ${i}</span></a></li>
                </c:forEach>
                <li onclick="search(${pm.nextPageNum})">
                    <a href="#" class="page"  aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <%--实现方法一，但是目前不可以--%>
                <li onclick="search(${pm.endPage})"><a href="javascript:void(0);"><span>尾页</span></a></li>
            </ul>
        </nav>
    </center>
</c:if>
</body>
<script type="text/javascript">
    $(function(){
        $("#searchGoodsClassId").append("<option value='-1'>全部</option>")
        //获取图书分类
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
