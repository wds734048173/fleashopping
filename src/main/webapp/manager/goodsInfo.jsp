<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: WDS
  Date: 2018/12/10
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品信息</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="modal-dialog">
    <form method="post" action="" id="addForm">
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
            <label for="remark" class="control-label">图书介绍:</label>
            <input type="text" class="form-control" id="remark" name="remark" disabled value="${goods.remark}">
        </div>
        <div class="form-group">
            <label class="control-label">商品图片:</label>
            <img src="${goods.pic}" width="200px" height="200px">
        </div>
    </form>
</div>
</body>
</html>
