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
    <title>Title</title>
</head>
<body>
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
        <th>操作</th>
        </thead>
        <tbody>
        <c:forEach begin="0" end="${orderList.size()}" var="order" items="${orderList}" step="1">
            <tr>
                <td hidden>${order.id}</td>
                <td>${order.no}</td>
                <td>${order.pricereal}</td>
                <td>${order.freightreal}</td>
                <td>${order.moneyreal}</td>
                <td>${order.stateStr}</td>
                <td><fmt:formatDate value="${order.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td>
                    <a class="btn btn-default getOrderInfo" href="#" role="button"  name="getOrderInfo"  onclick="getOrderInfo(${order.id})">订单详情</a>
                        <%--已付款的订单可发货--%>
                        <%--<c:choose>
                            <c:when test="${order.state == 2}">
                                <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},3)">发货</a>
                            </c:when>
                            &lt;%&ndash;未付款的订单可取消订单&ndash;%&gt;
                            <c:when test="${order.state == 1}">
                                <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},6)">作废</a>
                            </c:when>
                        </c:choose>--%>
                    <c:if test="${order.state == 1}">
                        <a class="btn btn-default updateOrderState" href="#" role="button"  name="updateOrderState" onclick="updateOrderState(${order.id},6)">作废</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
