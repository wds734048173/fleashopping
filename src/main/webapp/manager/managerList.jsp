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
        $(function () {
            //删除
            $(".deleteManager").click(function () {
                var isDelete = confirm ("确定删除吗？");
                if(isDelete){
                    var id = $(this).parent().parent().children("td:eq(0)").text();
                    //查询条件
                    var searchAdminName = $("#searchAdminName").val();
                    var searchAdminPwd = $("#searchAdminPwd").val();
                    var searchAdminFlag = $("#searchAdminFlag").val();
                    var searchCtime = $("#searchCtime").val();
                    var searchRtime = $("#searchRtime").val();
                    var currentPage = $("#currentPage").val();
                    var url = "/manager.do?method=deleteManager&AdminId=" + id +"&searchAdminName=" + searchAdminName
                        +"&searchAdminPwd=" + searchAdminPwd+"&searchAdminFlag=" + searchAdminFlag
                        +"&searchCtime=" + searchCtime+"&searchRtime=" + searchRtime
                        + "&currentPage=" + currentPage;
                    $(".content").load(url);
                }else{
                    return;
                }
            })
        })


        //查询的手动提交方式
        function managersearch(currentPage) {
            var searchAdminName = $("#searchAdminName").val();
            if(currentPage == null){
                var currentPage = $("#currentPage").val();
            }else{
                var currentPage = currentPage;
            }
            var url = "/manager.do?method=getManagerList&currentPage="+currentPage+"&searchAdminName=" + searchAdminName;
            $(".content").load(url);
        }
    </script>
</head>
<body>
<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
<div class="modal-body">
        <div class="form-group row">
            <div class="col-xs-3">
                <label for="searchAdminName" >管理员姓名:</label>
                <input type="text" class="myinput"  placeholder="" id="searchAdminName" name="searchAdminName" value="${condition.name}">
            </div>
        </div>
    <div class="form-group">
        <input type="button" class="btn btn-primary" id="search" value="查询" onclick="managersearch(null)"/>
    </div>
</div>
<div class="modal-body">
    <table class="table table-hover table-bordered">
        <thead>
        <th hidden>管理员编号</th>
        <th>管理员名称</th>
        <%--<th>权限标志</th>--%>
        <th>注册时间</th>
        <th>修改内容</th>
        <th>操作</th>
        </thead>
        <tbody>
        <c:forEach begin="0" end="${managerList.size()}" var="manager" items="${managerList}" step="1">
            <tr>
                <td hidden>${manager.adminId}</td>
                <td>${manager.adminName}</td>
                <%--<td>${manager.adminFlag}</td>--%>
                <td><fmt:formatDate value="${manager.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td><fmt:formatDate value="${manager.rtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td>
                    <a class="btn btn-default deleteManager" href="#" role="button"  name="deleteManager">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--分页插件--%>
<c:if test="${managerList.size() != 0}">
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
