<%--
  Created by IntelliJ IDEA.
  User: WDS
  Date: 2018/12/3
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link  type="text/css" href="/manager/css/pintuer.css" rel="stylesheet">
    <link type="text/css" href="/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="/manager/js/jquery.min.js"></script>
    <script type="text/javascript" src="/manager/js/pintuer.js"></script>
    <script type="text/javascript" src="/bootstrap/js/bootstrap.js"></script>
    <%--验证码--%>
    <link rel="stylesheet" type="text/css" href="/verify/css/verify.css">
    <script type="text/javascript" src="/verify/js/verify.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#mpanel4').slideVerify({
                type : 2,		//类型
                vOffset : 5,	//误差量，根据需求自行调整
                vSpace : 5,	//间隔
                imgName : ['3.jpg', '4.jpg','5.jpg','6.jpg','7.jpg'],
                imgSize : {
                    width: '320px',
                    height: '200px',
                },
                blockSize : {
                    width: '40px',
                    height: '40px',
                },
                barSize : {
                    width : '320px',
                    height : '40px',
                },
                ready : function() {
                },
                success : function() {
                    alert('验证成功！');
                    $("#mpanel4").hide();
                    $(".cheking").attr("value","1");
                    //......后续操作
                },
                error : function() {
                    alert('验证失败！');
                }
            });

            $(".control").click(function () {
                $(".control").hide();
                $("#mpanel4").show();
            })
        })



        function checkForm(form) {
            if($(".cheking").attr("value")==0){
                alert("请进行滑块验证！")
                return false;
            }
            if(form.username.value==""){
                alert("用户名不能为空！");
                form.username.focus();
                return false;
            }
            if(form.password.value==""){
                alert("密码不能为空！");
                form.password.focus()
                return false;
            }
            return true;
        }

    </script>
    <style type="text/css">
        .backgroundimage{
            width: 100%;
            height: 100%;
            background-image:url("/manager/img/icon-6.jpg") ;
            background-repeat: no-repeat;/*只显示一次*/
            background-size: cover;
            margin: auto;/*居中*/
        }
    </style>
</head>
<body>
<div class="backgroundimage">
    <div  align="center" style="height: 300px;padding-top: 200px;">
        <form action="/login.do?method=login" method="post"  onsubmit="return checkForm(this)">
            <div class="panel padding" style="width: 450px;text-align: left;background:rgba(255,255,37,0.03); ">
                <div class="text-center">
                    <br>
                    <h2><strong>网上书店后端登录</strong></h2></div>
                <div class="" style="padding:50px;width: 420px;text-align: center">
                    <div class="form-group">
                        <div class="field field-icon-right" >
                            <%--校验长度方法： data-validate="required:请填写账号,length#>=5:账号长度不符合要求"--%>
                            <input type="text" class="input" name="username" placeholder="登录账号" value="<%if(request.getAttribute("username")!=null)out.print(request.getAttribute("username"));%>"/>
                            <span class="icon icon-user"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input"  name="password" placeholder="登录密码" value="<%if(request.getAttribute("password")!=null)out.print(request.getAttribute("password"));%>"/>
                            <span class="icon icon-key"></span>
                        </div>
                    </div>
                    <%--验证码--%>
                    <div style="display: none" id="mpanel4"></div>
                    <input style="display: none" class="cheking" value="0">
                    <div class="form-group" style="width: 320px;">
                        <div class="col-sm-10">
                            <input type="button" class="control controlCursor form-control" value="点击进行验证（图片右上角刷新）" style="width: 320px;">
                        </div>
                    </div>
                    <span id="message" style="color: red;"><%if(request.getAttribute("message") != null)out.print(request.getAttribute("message"));%></span>
                    <div class="form-group">
                        <div class="field">
                            <button class="button button-block bg-main text-big">立即登录</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field text-center">
                            <p class="text-muted text-center"> <a class="" href="/manager/updatePwd.jsp"><small>忘记密码了？</small></a> | <a class="" href="/manager/register.jsp">注册新账号</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
