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
    <title>用户信息列表</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">

        //查询的手动提交方式
        function search(currentPage) {
            var searchName = $("#searchName").val();
            var searchState = $("#searchState option:selected").val();
            if(currentPage == null){
                var currentPage = $("#currentPage").val();
            }else{
                var currentPage = currentPage;
            }
            var url = "/user.do?method=getUserListByCondition&currentPage="+currentPage+"&searchName="+searchName+"&searchState="+searchState;
            $(".content").load(url);
        }
    </script>
</head>
<body>
<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
<div class="modal-body">
    <div class="form-group row">
        <div class="col-xs-3">
            <label for="searchName" >用户名:</label>
            <input type="text" class="myinput"  placeholder="" id="searchName" name="searchName" value="${condition.name}">
        </div>
        <div class="col-xs-3">
            <label for="searchState">状态</label>
            <select class="myinput" name="searchState" id="searchState">
                <option value="-1" <c:if test="${condition.state == -1}" > selected </c:if>>全部</option>
                <option value="0" <c:if test="${condition.state == 0}" > selected </c:if>>启用</option>
                <option value="1" <c:if test="${condition.state == 1}" > selected </c:if>>停用</option>
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
            <th>用户编号</th>
            <th>用户名</th>
            <th>真实姓名</th>
            <th>性别</th>
            <th>电话</th>
            <th>E-mail</th>
            <th>状态</th>
            <th>所属学校</th>
            <th>注册时间</th>
        </thead>
        <tbody>
            <c:forEach begin="0" end="${userList.size()}" var="user" items="${userList}" step="1">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.realname}</td>
                    <td>${user.sex}</td>
                    <td>${user.telphone}</td>
                    <td>${user.email}</td>
                    <td>${user.state}</td>
                    <td>${user.collage}</td>
                    <td><fmt:formatDate value="${user.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<%--分页插件--%>
<c:if test="${userList.size() != 0}">
    <center>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li  onclick="search(${pm.startPage})"><a href="javascript:void(0);">首页</a></li>
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
                <li onclick="search(${pm.endPage})"><a href="javascript:void(0);">尾页</a></li>
            </ul>
        </nav>
    </center>
</c:if>
</body>
</html>
