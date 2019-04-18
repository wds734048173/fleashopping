
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
            var searchGoodsName = $("#searchGoodsName").val();
            var searchCommentGrade = $("#searchCommentGrade option:selected").val();
            if(currentPage == null){
                var currentPage = $("#currentPage").val();
            }else{
                var currentPage = currentPage;
            }
            var url = "/comment.do?method=getCommentListByCondition&currentPage="+currentPage+"&searchGoodsName="+searchGoodsName+"&searchCommentGrade="+searchCommentGrade;
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
            <label for="searchCommentGrade">评论等级</label>
            <select class="myinput" name="searchCommentGrade" id="searchCommentGrade">
                <option value="-1" <c:if test="${condition.grade == -1}" > selected </c:if>>全部</option>
                <option value="0" <c:if test="${condition.grade == 0}" > selected </c:if>>好评</option>
                <option value="1" <c:if test="${condition.grade == 1}" > selected </c:if>>一般</option>
                <option value="2" <c:if test="${condition.grade == 2}" > selected </c:if>>差评</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <input type="button" class="btn btn-primary" id="search" value="查询" onclick="search(null)"/>
    </div>
</div>
<div class="modal-body">
    <table class="table table-hover table-bordered" style="table-layout: fixed;">
        <thead>
        <th>图片</th>
        <th>商品名称</th>
        <th>商品销售价格</th>
        <th>评论等级</th>
        <th>评论内容</th>
        <th>回复内容</th>
        <th>评论时间</th>
        </thead>
        <tbody>
        <c:forEach begin="0" end="${commentList.size()}" items="${commentList}" var="comment" step="1">
            <tr>
                <%--注意el表达式与java实体类中字段的对应关系--%>
                <td><img src="${comment.GPic}" style="height: 50px;width: 50px;"></td>
                <td>${comment.GName}</td>
                <td>${comment.spricereal}</td>
                <td>${comment.gradeStr}</td>
                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis" title="${comment.comment}">${comment.comment}</td>
                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis" title="${comment.reply}">${comment.reply}</td>
                <td><fmt:formatDate value="${comment.ctime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%--分页插件--%>
<c:if test="${commentList.size() != 0}">
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
