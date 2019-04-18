$(function () {
    //登录界面账户输入框失去焦点
    (function login_validate() {
        $(".username #username").blur(function() {
            accountReg = /^[a-zA-Z0-9_-]{6,16}$/;
            if($(this).val() == "" || $(this).val() == "请输入您的账号") {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("账号不能为空！");
                console.log("账号不能为空");
                return;
            } else if(!accountReg.test($(".box1 .account").val())) {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("账号不存在!");
            } else {
                $(this).addClass("correctInput");
                $(this).removeClass("errorInput");
                $(this).next().empty();
            }
        });
        // 登录界面密码输入框失去焦点
        $(".username #password").blur(function() {
            reg = /^[A-Za-z0-9]{6}$/
            if($(this).val() == "") {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("密码不能为空！");
            }  else {
                $(this).addClass("correctInput");
                $(this).removeClass("errorInput");
                $(this).next().empty();
            }
        });
    })();
    // 注册页面的提示文字
    (function register() {
        //用户名失去焦点
        $(".regist_main #username").blur(function() {
            accountReg = /^[a-zA-Z0-9_-]{6,16}$/;
            if($(this).val() == "" || $(this).val() == "请输入您的账号") {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("账号不能为空！");
                console.log("账号不能为空");
                return;
            } else if(!accountReg.test($(".box1 .account").val())) {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("账号不存在!");
            } else {
                $(this).addClass("correctInput");
                $(this).removeClass("errorInput");
                $(this).next().empty();
            }
        });
        // 注册界面手机号栏失去焦点
        $(".regist_main #telphone").blur(function() {
            phoneReg = /^[1][3,4,5,7,8][0-9]{9,13}$/;
            if($(this).val() == "") {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("手机号码不能为空!");
                return;
            } else if(!phoneReg.test($(this).val())) {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("请输入正确的手机号码!");
            } else {
                $(this).addClass("correctInput");
                $(this).next().empty();
            }
        });

        // 注册界面密码栏失去焦点
        $(".regist_main #password1").blur(function() {
            reg = /^[A-Za-z0-9]{6}$/
            if(reg.test($(this).val())==""){
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("密码不能为空！");
                console.log("登录界面的密码是不是为空了？？？")
            }else if(!reg.test($(this).val())) {
                $(this).addClass("errorInput");
                $(this).next().css("display", "block").html("请输入6位包含数字或字母的密码！");
            } else {
                $(this).removeClass("errorInput");
                $(this).next().empty();
                $(this).addClass("correctInput");
            }
        });
        // 注册界面确认密码失去焦点
        $(".regist_main #password2").blur(function() {
            var pwd1 = $('.regist_main #password1').val();
            var pwd2 = $(this).val();
            if(pwd1 == "") {
                $(this).removeClass("errorInput");
                $(this).next().html("确认密码不能为空！");
                $(this).addClass("errorInput");
                return;
            } else if(pwd1 != pwd2) {
                $(this).addClass("errorInput");
                $(this).removeClass("correctInput");
                $(this).next().css("display", "block").html("两次密码输入不一致！");
            } else {
                $(this).removeClass("errorInput");
                $(this).addClass("correctInput");
                $(this).next().empty();
            }
        });
    })();
})