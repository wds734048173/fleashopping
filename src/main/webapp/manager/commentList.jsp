
<%--
  Created by IntelliJ IDEA.
  User: WDS
  Date: 2018/12/3
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>评价信息列表</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="js/jquery.min.js" ></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            //新增
            $("#addComment").click(function () {
                $('#addcommentModel').modal({
                    keyboard: false,
                    show: true
                })
            })

            //保存
            $("#save").click(function () {
                var commentId = $("#commentId").val();
                var BookId = $("#BookId").val();
                var BookName = $("#BookName").val();
                var CustomerId = $("#CustomerId").val();
                var UserName = $("#UserName").val();
                var commentContent = $("#commentContent").val();
                var commentGrade = $("#commentGrade").val();
                //查询条件
                var searchBookName = $("#searchBookName").val();
                var currentPage = $("#currentPage").val();
                var url = "/comment.do?method=addComment&searchBookName="+searchBookName+"&currentPage="+currentPage+"&commentId="+commentId+"&BookId="+BookId+"&BookName="+BookName+"&CustomerId="+CustomerId+"&UserName="+UserName+"&commentContent="+commentContent+"&commentGrade="+commentGrade;
                //进去对应selvet
                $(".content").load(url);
                $(".modal-backdrop").remove();
            })
            //修改
            $(".updateComment").click(function () {
                var id = $(this).parent().parent().children("td:eq(0)").text();
                document.getElementById("gridSystemModalLabel").innerHTML = "修改评语";
                $.ajax({
                    //通过id获取评语信息
                    url:"/comment.do?method=getCommentById&commentId=" + id,
                    success:function (data) {
                        var comment = eval(data);
                        $("#commentId").val(comment.commentId);
                        $("#BookId").val(comment.bookId);
                        $("#BookName").val(comment.bookName);
                        $("#CustomerId").val(comment.customerId);
                        $("#UserName").val(comment.userName);
                        $("#Commentdate").val(comment.commentdate);
                        $("#commentContent").val(comment.commentcontent);
                        $("#commentGrade").val(comment.commentgrade);
                    }
                })
                $('#addcommentModel').modal({
                    keyboard: false,
                    show:true
                })
            })
            //删除
            $(".deleteComment").click(function () {
                var isDelete = confirm ("确定删除吗?");
                if(isDelete){
                    var id = $(this).parent().parent().children("td:eq(0)").text();
                    //查询条件
                    var searchBookName = $("#searchBookName").val();
                    var currentPage = $("#currentPage").val();
                    var url = "/comment.do?method=deleteComment&bookId=" + id + "&searchBookName=" + searchBookName + "&currentPage=" + currentPage;
                    $(".content").load(url);
                }else{
                    return;
                }
            })
        })

        //查询的手动提交方式
        function search(currentPage) {
            var name = $("#searchBookName").val();
            if(currentPage == null){
                var currentPage = $("#currentPage").val();
            }else{
                var currentPage = currentPage;
            }
            var url = "/comment.do?method=getCommentlist&currentPage="+currentPage+"&searchBookName="+name;
            $(".content").load(url);
        }
    </script>

</head>
<body>
<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}">
<div class="modal-body">
    <div class="form-group row">
        <div class="col-xs-3">
            <label for="searchBookName" >图书名称:</label>
            <input type="text" class="myinput"  placeholder="" id="searchBookName" name="searchBookName" value="${condition.name}">
        </div>
    </div>
    <div class="form-group">
        <input type="button" class="btn btn-primary" id="search" value="查询" onclick="search(null)"/>
    </div>
</div>
<div class="modal-body">
    <table class="table table-hover table-bordered">
        <thead>
        <th style="display: none">订单评价id</th>
        <th style="display: none">图书编号</th>
        <th>图书名</th>
        <th style="display: none">评论客户编号</th>
        <th >评论客户名</th>
        <th>评论时间</th>
        <th>评论内容</th>
        <th>评论等级</th>
        </thead>
        <tbody>
        <c:forEach begin="0" end="${commentListCur.size()}" items="${commentListCur}" var="commentList" step="1">
            <tr>
                <td style="display: none">${commentList.commentId}</td>
                <td style="display: none">${commentList.bookId}</td>
                <td>${commentList.bookName}</td>
                <td style="display: none">${commentList.customerId}</td>
                <td>${commentList.userName}</td>
                <td><fmt:formatDate value="${commentList.commentdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                <td>${commentList.commentcontent}</td>
                <td>${commentList.commentgradeStr}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--新增模态框插件--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="addcommentModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel">新增评价</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="/bookType.do?method=addComment" id="addForm">
                    <div class="form-group hidden">
                        <label for="commentId" class="control-label">订单评价id:</label>
                        <input type="text" class="form-control" id="commentId" name="commentId">
                    </div>
                    <div class="form-group">
                        <label for="BookId" class="control-label">图书编号:</label>
                        <input type="text" class="form-control" id="BookId" name="BookId">
                    </div>
                    <div class="form-group">
                        <label for="BookName" class="control-label">图书名称:</label>
                        <input type="text" class="form-control" id="BookName" name="BookName">
                    </div>
                    <div class="form-group">
                        <label for="CustomerId" class="control-label">评论客服编号:</label>
                        <input type="text" class="form-control" id="CustomerId" name="CustomerId">
                    </div>
                    <div class="form-group">
                        <label for="UserName" class="control-label">评论客服名:</label>
                        <input type="text" class="form-control" id="UserName" name="UserName">
                    </div>
                    <div class="form-group hidden">
                        <label for="Commentdate" class="control-label">评论客服名:</label>
                        <input type="text" class="form-control" id="Commentdate" name="Commentdate">
                    </div>
                    <div class="form-group">
                        <label for="commentContent" class="control-label">评语:</label>
                        <input type="text" class="form-control" id="commentContent" name="commentContent">
                    </div>
                    <div class="form-group">
                        <label for="commentGrade" class="control-label">评论等级:</label>
                        <input type="text" class="form-control" id="commentGrade" name="commentGrade">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<%--分页插件--%>
<c:if test="${commentListCur.size() != 0}">
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
