<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="robots" content="nofollow"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <style>
        body {
            width: 100%;
            height: 100%;
            overflow: hidden;
            background: url(images/pc_loginBg.jpg) no-repeat;
            background-size: cover;
            position: absolute;
        }
    </style>
    <!--<script src="js/jquery.js"></script>-->

    <script src="js/Particleground.js"></script>
    <script>
        $(document).ready(function () {
            $('body').particleground({
                dotColor: 'green',
                lineColor: '#c9ec6e'
            });
            $('.intro').css({
                'margin-top': -($('.intro').height() / 2)
            });
            $("#login").click(function () {
                var userName = $("#userName").val().trim();
                var password = $("#password").val().trim();
                if (userName.length != 0) {
                    if (password.length != 0) {
                        $.post(
                            "../user",
                            {
                                flag: '5',
                                k:1,
                                userName: userName,
                                password: password
                            },
                            function (msg) {
                                if (msg.judge==1) {
                                    location.href = "index.jsp";
                                } else if(msg.judge==3){
                                    alert("用户名或密码错误！");
                                    //location.href = "adminLogin.jsp";
                                }else {
                                    alert("你不是管理员你的权限不够！");
                                    //location.href="../reception/index.jsp";
                                }
                            },
                            'json');
                    }
                }
            });

        });
    </script>

</head>
<body>
<section class="loginform">
    <h1>后台管理系统</h1>
        <input name="flag" value="5" type="hidden"/>
        <ul>
            <li>
                <label>账号：</label>
                <input type="text" class="textBox" placeholder="管理员账号" name="userName" id="userName"/>
            </li>
            <li>
                <label>密码：</label>
                <input type="password" class="textBox" placeholder="登陆密码" name="password" id="password"/>
            </li>
            <li>
                <input type="button" value="立即登陆" id="login"/>
            </li>
        </ul>
</section>
</body>
</html>