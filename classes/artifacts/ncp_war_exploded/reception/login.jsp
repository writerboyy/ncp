<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-登录</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script>

        $(document).ready(function () {
            var username = $('#userName');
            var password = $('#pwd');
            $('#login').click(function () {
                if (isName() && isPwd()) {
                    $.post(
                        "../user",
                        {
                            flag: 5,
                            k:2,
                            ck: $("#jizhu").is(":checked"),
                            userName: username.val(),
                            password: password.val()
                        },
                        function (msg) {
                            if (msg.judge==1) {
                                location.href = "index.jsp";
                            } else {
                                alert("用户名或密码错误!");
                            }
                        },
                        'json'
                    );
                }
            });

            function isName() {
                var name = username.val();
                var len = name.length;
                var temp = false;
                if (len < 3 || len > 12) {
                    temp = false;
                    $('.user_error').toggle();//切换元素状态
                }else {
                    temp = true;
                }
                return temp;
            }

            function isPwd() {
                var pwd1 = password.val();
                var temp = false;
                if (pwd1.length == 0) {
                    temp = false;
                    $('.pwd_error').toggle();//切换元素状态
                } else {
                    temp = true;
                }
                return temp;
            }

        });

    </script>
</head>
<body>
<div class="login_top clearfix">
    <a href="index.jsp" class="login_logo"><img src="images/logo02.png" width="126%" ></a>
</div>

<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">日夜兼程 · 急速送达</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="register.jsp">立即注册</a>
            </div>
            <div class="form_input">
                <input type="text" id="userName" name="username" class="name_input" value="${applicationScope.lastName}"
                       placeholder="请输入用户名">
                <div class="user_error">输入错误</div>
                <input type="password" id="pwd" name="password" class="pass_input" placeholder="请输入密码">
                <div class="pwd_error">输入错误</div>
                <div class="more_input clearfix">
                    <input type="checkbox" id="jizhu">
                    <label>记住用户名</label>
                    <a href="#">忘记密码</a>
                </div>
                <input type="submit" name="" id="login" value="登录" class="input_submit">
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="foot_link">
        <a id="tan1">关于我们</a>
        <span>|</span>
        <a id="tan2">联系我们</a>
    </div>
    <p>CopyRight © 2019 厦门浓郁技术有限公司 All Rights Reserved</p>
    <p>电话：010-8888888 厦kf13 1238888号</p>
</div>

</body>
<script>
    $(document).ready(function(){
        $("#tan1").click(function(){
            alert("开发13");
        });
        $("#tan2").click(function(){
            alert("开发13");
        });
    });
</script>
</html>