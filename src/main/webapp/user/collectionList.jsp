<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2019/4/19
  Time: 14:20
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
        <th hidden>收藏id</th>
        <th hidden>商品id</th>
      <%--  <th>图片</th>
        <th>商品名称</th>--%>
  <%--      <th>分类</th>
        <th>状态</th>
        <th>原价</th>
        <th>销售价</th>--%>
        <th>收藏时间</th>
        <th>操作</th>
        </thead>
        <tbody>
        <c:forEach begin="0" end="${collectionList.size()}" var="collection" items="${collectionList}" step="1">
            <tr>
                <td hidden>${collection.id}</td>
                <td>${collection.GId}</td>
             <%--   <td><img src="${collection.uid}" style="width: 50px;height: 50px;"></td>
                <td>${collection.gid}</td>--%>
               <%-- <td>${goods.classStr}</td>
                <td>${goods.stateStr}</td>
                <td>${goods.ypricereal}</td>
                <td>${goods.spricereal}</td>--%>
                <td><fmt:formatDate value="${collection.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td>
                    <a class="btn btn-default" href="/goods.do?method=detail&goodsId=${collection.GId}" role="button">详情</a>
                    <a class="btn btn-default" href="/collection.do?method=removeCollection&collectionId=${collection.id}" role="button">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
