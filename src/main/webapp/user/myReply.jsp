<%@ page import="org.lanqiao.domain.Reply" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10/010
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的反馈</title>
    <link rel="shortcut icon" type="image/x-icon" href="../sale/imges/book.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <script type="text/javascript" src="../sale/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".checkDel").click(function () {
                var flag = confirm("确定要删除吗？");
                if (flag){
                    var id = $(this).next().val();
                    $(".checkDel").attr('href','/reply.do?method=deleteMyReply&replyId='+id);
                }
            });
        })
    </script>
</head>
<body>
    <header>
        <div class="top center">
            <div class="left fl">
                <ul>
                    <%--点击进入反馈页面--%>
                    <li><a href="../sale/index.jsp">首页</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="right fr">
                <%
                    String name = (String) session.getAttribute("name");
                    SimpleDateFormat format = new SimpleDateFormat("MM-dd");
                %>
                <div class="gouwuche fr"><a href="/customer.do?method=getMyInfo&id=<%=session.getAttribute("CustomerId")%>">个人中心</a></div>
                <div class="fr">
                    <ul>
                        <li>欢迎您：<%=name%></li>
                        <li>|</li>
                        <li><a href="/logout.do">退出登录</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </header>
    <div class="xiantiao"></div>
    <div class="gwcxqbj">
        <div class="gwcxd center">
            <div class="top2 center ft20">
                <div class="sub_top fl">留言类型</div>
                <div class="sub_top fl">留言主题</div>
                <div class="sub_top fl" style="margin-left: 100px">留言内容</div>
                <div class="sub_top fl" style="margin-left: 190px">留言客户名</div>
                <div class="sub_top fr" style="float: left">留言日期</div>
                <div class="sub_top fr" style="float: left;margin-left: 75px">操作</div>
                <div class="clear"></div>
            </div>
            <%
                List<Reply> replyList = (List<Reply>) request.getAttribute("replyList");
                for (Reply reply:replyList){
            %>
            <div class="content2 center">
                <div class="sub_content fl"><%=reply.getReplyType()%></div>
                <div class="sub_content fl " style="margin-left: 162px"><%=reply.getReplytitle()%></div>
                <div class="sub_content fl ft20"><%=reply.getReplycontent()%></div>
                <div class="sub_content fl"><%=reply.getCustomername()%>  </div>
                <div class="sub_content fl "><%=reply.getCtime().toString().substring(5,10)%></div>
                <div class="sub_content fl del"><a href="" class="checkDel" style="width: 60px;">删除</a><input value="<%=reply.getReplyId()%>" hidden> </div>
                <div class="clear"></div>
            </div>
            <%
                }
            %>
            <form action="/reply.do?method=addReply" method="post">
            <div class="content2 center">
                <div class="sub_content fl">
                    <select name="type">
                        <option value="赞美">赞美</option>
                        <option value="批评">批评</option>
                        <option value="鼓励">鼓励</option>
                    </select>
                </div>
                <div class="sub_content fl " style="margin-left: 162px">
                    <select name="title">
                        <option value="赞美">好评</option>
                        <option value="一般">一般</option>
                        <option value="差评">差评</option>
                    </select>
                </div>
                <div class="sub_content fl ft20">
                    <input type="text" placeholder="输入你的评论" name="content" maxlength="30"/>
                </div>
                <div class="sub_content fl">
                    <input type="text" value="<%=session.getAttribute("name")%>" readonly name="name"/>
                </div>
                <div class="sub_content fl ">
                    <input type="text" value="<%=format.format(new Date())%>" readonly name="CTime">
                </div>
                <div class="sub_content fl ">
                    <input type="submit" value="提交"/>
                </div>
                <div class="clear"></div>
            </div>
            </form>
        </div>
    </div>
</body>
</html>
