<%@ page import="org.lanqiao.domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="org.lanqiao.utils.PageModel" %>
<%@ page import="org.lanqiao.dao.ICommentDao" %>
<%@ page import="org.lanqiao.dao.impl.CommentDaoImpl" %>
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
    <title>个人评价管理中心</title>
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="../manager/js/jquery.min.js" ></script>
    <link rel="shortcut icon" type="image/x-icon" href="../sale/imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <script type="text/javascript" src="../sale/js/jquery.min.js"></script>
    
    <script type="text/javascript">
        $(function (){
            //修改
            $(".updateBtn").click(function () {
                var id =  $(this).parent().parent().children("td:eq(0)").text();
                $('#addCommentModel').modal({
                    keyboard: false,
                    show:true
                })
                //点击修改的时候获取修改的评论id
                    $("#commentid").val(id)
            })
            $("#save").click(function () {
                $("#updateFrom").submit();
                $('#addBookTypeModel').modal({
                    keyboard: true,
                    show:false
                })
            })
        })
    </script>
</head>
<body>
<header>
    <div class="top center">
        <div class="left fl">
            <ul>
                <li><a href="../sale/index.jsp">返回首页</a></li>
                <li>|</li>
                <%--点击进入反馈页面--%>
                <li><a href="">问题反馈</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="right fr">
            <%
                String name = (String) session.getAttribute("name");
                if (name == null){
            %>
            <%--购物车页面--%>
            <div class="gouwuche fr"><a href="../sale/login.jsp">购物车</a></div>
            <div class="fr">
                <ul>
                    <%--登录页面--%>
                    <li><a href="/sale/login.jsp" target="_blank">登录</a></li>
                    <li>|</li>
                    <li><a href="/customer.do?method=getMyInfo&id=<%=session.getAttribute("CustomerId")%>" target="_blank">个人中心</a></li>
                    <li>|</li>
                    <%--注册页面--%>
                    <li><a href="/sale/register.jsp" target="_blank" >注册</a></li>
                </ul>
            </div>
            <%
            }else {
            %>
            <div class="gouwuche fr"><a href="/bookshop.do?method=getCartItemList&CustomerId=<%=session.getAttribute("CustomerId")%>">购物车</a></div>
            <div class="fr">
                <ul>
                    <li>欢迎您：<%=name%></li>
                    <li>|</li>
                    <li><a href="/logout.do">退出登录</a></li>
                </ul>
            </div>
            <%
                }
            %>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</header>

<div class="grzxbj">
    <div class="catbox">
            <div class="ddzxbt" style="color: black"><h2>我的评价</h2></div>

                <br><br>
                <br>

                <%--//通过评级等级查询自己的评价--%>
                <a class="btn btn-primary  active " href="/privateComment.do?method=selectByCustomerId&customerid=<%=request.getAttribute("customerid")%>" role="button" id="option1">全部</a>
                <a class="btn btn-primary  active " href="/privateComment.do?method=findByGrade&commentgrade=0&customerid=<%=request.getAttribute("customerid")%>" role="button" id="option2">好评</a>
                <a class="btn btn-primary  active " href="/privateComment.do?method=findByGrade&commentgrade=1&customerid=<%=request.getAttribute("customerid")%>" role="button" id="option3">中评</a>
                <a class="btn btn-primary  active " href="/privateComment.do?method=findByGrade&commentgrade=2&customerid=<%=request.getAttribute("customerid")%>" role="button" id="option4">差评</a>

                <br>
                <br>

                <table class="table table-hover ">
                    <thead >
                    <td class="success">评价的id</td>
                    <td class="success">评价等级</td>
                    <td class="success">评价内容</td>
                    <td class="success">书籍名称</td>
                    <td colspan="2" id="CommentOperation" class="success">操作</td>
                    </thead>
                    <tbody>
                    <tr>
                            <%
        List<Comment> commentList = (List<Comment>)request.getAttribute("prcommentList");
        for(Comment comment : commentList){
    %>
                    <tr>
                        <td><%=comment.getCommentId()%></td>
                        <td><%=comment.getCommentgrade()%></td>
                        <td><%=comment.getCommentcontent()%></td>
                        <td><%=comment.getBookName()%></td>
                        <td>
                            <a class="btn btn-primary btn-warning active updateBtn " href="#" role="button" >修改</a>
                            <a class="btn btn-primary btn-danger active deleteBtn" href="/privateComment.do?method=deleteComment&CommentId=<%=comment.getCommentId()%>" role="button"  >删除</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>

                </table>
    </div>
</div>


<%--新增模态框插件--%>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="addCommentModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel" style="color: black">新增评价</h4>
            </div>
            <div class="modal-body">

                <form method="post" action="/privateComment.do?method=updateComment" id="updateFrom">

                    <div class="form-group hidden">
                        <label for="customerid" class="control-label">用户id:</label>
                        <input type="text" class="form-control" id="customerid" name="customerid" value="<%=request.getAttribute("customerid")%>">
                    </div>
                    <div class="form-group hidden">
                        <label for="commentid" class="control-label ">评论id:</label>
                        <input type="text" class="form-control" id="commentid" name="commentid">
                    </div>

                    <div class="form-group">
                        <label for="commentgrade" class="control-label" style="color: black">评级等级:</label>
                        <input type="text" class="form-control" id="commentgrade" name="commentgrade">
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="commentcontent" class="control-label"style="color: black">评价内容:</label>
                        <input type="text" class="form-control" id="commentcontent" name="commentcontent">
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

</body>
</html>
