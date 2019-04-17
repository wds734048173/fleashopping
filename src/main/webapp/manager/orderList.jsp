<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>订单列表</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap-datetimepicker.min.css">
    <script type="text/javascript" src="/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript">
        //修改订单状态
        function updateOrderState(orderId,state) {
            if(state == 3){
                var isUpdate = confirm("确定发货吗？");
            }else if(state == 6){
                var isUpdate = confirm("确定作废吗？");
            }
            if (isUpdate) {
                //查询条件
                var searchOrderNo = $("#searchOrderNo").val();
                var searchOrderState = $("#searchOrderState").val();
                var currentPage = $("#currentPage").val();
                var url = "/order.do?method=updateOrderState&orderId=" + orderId + "&state=" + state + "&searchOrderNo=" + searchOrderNo + "&searchOrderState=" + searchOrderState + "&currentPage=" + currentPage;
                $(".content").load(url);
            } else {
                return;
            }
        }

        //查看订单详情
        function getOrderInfo(orderId) {
            var url = "/order.do?method=getOrderInfo&orderId=" + orderId;
            $(".content").load(url);
        }

        //查询的手动提交方式
        function search(currentPage) {
            var searchOrderNo = $("#searchOrderNo").val();
            var searchOrderState = $("#searchOrderState").val();
            if(currentPage == null){
                var currentPage = $("#currentPage").val();
            }else{
                var currentPage = currentPage;
            }
            var url = "/order.do?method=getOrderlist&currentPage="+currentPage+"&searchOrderNo="+searchOrderNo+"&searchOrderState="+searchOrderState;
            $(".content").load(url);
        }

        $('#searchOrderCtime').datetimepicker({
            format: 'yyyy-mm-dd',
            language:"zh-CN",
            minView:"month",
            autoclose:true,
            todayBtn:true
        })
    </script>
</head>
<body>
<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
<div class="modal-body">
    <div class="form-group row">
        <div class="col-xs-3">
            <label for="searchOrderNo" >订单编号:</label>
            <input type="text" class="myinput"  placeholder="" id="searchOrderNo" name="searchOrderNo" value="${condition.name}">
        </div>
        <div class="col-xs-3">
            <label for="searchOrderCtime" >下单日期:</label>
            <input type="text" class="myinput"  placeholder="" id="searchOrderCtime" name="searchOrderCtime" value="${condition.date}">
        </div>
        <div class="col-xs-2">
            <label for="searchOrderState">订单状态</label>
            <select class=" myinput" name="searchOrderState" id="searchOrderState">
                <option value="" <c:if test="${empty condition.state}" > selected </c:if> >全部</option>
                <option value="1" <c:if test="${condition.state} == 1" > selected </c:if> >未付款</option>
                <option value="2" <c:if test="${condition.state} == 2" > selected </c:if> >已付款</option>
                <option value="3" <c:if test="${condition.state} == 3" > selected </c:if> >已发货</option>
                <option value="4" <c:if test="${condition.state} == 4" > selected </c:if> >已收货</option>
                <option value="5" <c:if test="${condition.state} == 5" > selected </c:if> >已评价</option>
                <option value="6" <c:if test="${condition.state} == 6" > selected </c:if> >已作废</option>
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
        <th hidden>订单id</th>
        <th>订单编号</th>
        <th>原价</th>
        <th>运费</th>
        <th>实付金额</th>
        <th>状态</th>
        <th>创建时间</th>
        <%--<th>修改时间</th>--%>
        <th>客户名称</th>
        <th>操作</th>
        </thead>
        <tbody>
            <c:forEach begin="0" end="${orderList.size()}" var="order" items="${orderList}" step="1">
                <tr>
                    <td hidden>${order.id}</td>
                    <td>${order.no}</td>
                    <td>${order.price}</td>
                    <td>${order.freight}</td>
                    <td>${order.money}</td>
                    <td>${order.stateStr}</td>
                    <td><fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                    <%--<td>${order.rtime}</td>--%>
                    <td>${order.customerName}</td>
                    <td>
                        <a class="btn btn-default getOrderInfo" href="#" role="button"  name="getOrderInfo"  onclick="getOrderInfo(${order.id})">订单详情</a>
                        <%--已付款的订单可发货--%>
                        <c:choose>
                            <c:when test="${order.state == 2}">
                                <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},3)">发货</a>
                            </c:when>
                            <%--未付款的订单可取消订单--%>
                            <c:when test="${order.state == 1}">
                                <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},6)">作废</a>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%--分页插件--%>
<c:if test="${orderList.size() != 0}">
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
</html>

