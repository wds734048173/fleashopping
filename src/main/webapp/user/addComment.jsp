<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/10 0010
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Get Shit Done Bootstrap Wizard by Creative Tim</title>
    <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="../manager/js/jquery.min.js" ></script>
    <link rel="shortcut icon" type="image/x-icon" href="../sale/imges/logo.ico">
    <link rel="stylesheet" type="text/css" href="../sale/css/style.css">
    <script type="text/javascript" src="../sale/js/jquery.min.js"></script>
    <link href="../sale/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../sale/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />
    <link href="../sale/css/demo.css" rel="stylesheet" />


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

<%--页面背景及上方头像--%>

        <div class="logo-container">
            <div class="logo">
                <img src="../sale/imges/new_logo.png">
            </div>
            <div class="brand" style="color: black">
                <h1>感谢您的好评</h1>
            </div>
        </div>


    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="wizard-container">
                    <div class="card wizard-card" data-color="green" id="wizard">

                        <form action="/privateComment.do?method=addComment" method="post">
                            <div class="form-group hidden ">
                                <label for="customerid" class="control-label">用户id:</label>
                                <input type="text" class="form-control" id="customerid" name="customerid" value="<%=session.getAttribute("CustomerId")%>">
                            </div>

                            <div class="form-group hidden">
                                <label for="bookid" class="control-label">书籍id:</label>
                                <input type="text" class="form-control" id="bookid" name="bookid" value="<%=request.getAttribute("bookid")%>">
                            </div>
                            <div class="form-group hidden">
                                <label for="bookname" class="control-label">书籍名称:</label>
                                <input type="text" class="form-control" id="bookname" name="bookname" value="<%=request.getAttribute("bookname")%>">
                            </div>
                            <div class="form-group hidden ">
                                <label for="username" class="control-label">用户名称:</label>
                                <input type="text" class="form-control" id="username" name="username" value="<%=session.getAttribute("username")%>">
                            </div>
                            <div class="wizard-header"><h3>填写你的评价</h3></div>
                            <div class="wizard-navigation">
                                <ul>
                                    <li><a href="#facilities" data-toggle="tab">评价等级</a></li>
                                    <li><a href="#description" data-toggle="tab">评价内容</a></li>
                                </ul>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane" id="location">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h4 class="info-text" style="color: black">开始你的评价</h4>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane" id="facilities">
                                    <h4 class="info-text">告诉我您的评价等级</h4>
                                    <div class="row">
                                        <div class="col-sm-5 col-sm-offset-1">
                                            <div class="form-group">
                                                <label>评价等级</label>
                                                <select class="form-control" name="commentgrade">
                                                    <option disabled="" selected="">- 等级 -</option>
                                                    <option value="0">好评</option>
                                                    <option value="1">中评 </option>
                                                    <option value="2">差评</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane" id="description">
                                    <div class="row">
                                        <h4 class="info-text"> 给我们具体的描述 </h4>
                                        <div class="col-sm-6 col-sm-offset-1">
                                            <div class="form-group">
                                                <label for="commentcontent"></label>
                                            <textarea  class="form-control" placeholder="" rows="9" id="commentcontent" name="commentcontent"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Example</label>
                                                <p class="description">"这本书贼拉好看，书本质量好的一匹，价钱实惠"</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-footer">
                                <div class="pull-right">
                                    <input type='button' class='btn btn-next btn-fill btn-success btn-wd btn-sm' name='next' value='下一步' />
                                    <input type='button' class='btn btn-finish btn-fill btn-success btn-wd btn-sm' name='finish' value='提交' />

                                </div>
                                <div class="pull-left">
                                    <a class="btn btn-primary btn-warning active" href="/order.do?method=getOrderAll">返回订单中心</a>
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='上一步' />
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div> <!-- wizard container -->
            </div>
        </div> <!-- row -->
    </div> <!--  big container -->

    <div class="footer">
        <div class="container" style="color:black;">
            祝您阅读愉快
        </div>
    </div>
</div>

</body>

<!--   Core JS Files   -->
<script src="../sale/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="../sale/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../sale/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

<!--  Plugin for the Wizard -->
<script src="../sale/js/gsdk-bootstrap-wizard.js"></script>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="../sale/js/jquery.validate.min.js"></script>

</html>

