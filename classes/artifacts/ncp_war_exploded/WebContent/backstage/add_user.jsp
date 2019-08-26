<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>添加新会员</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="add_user"></i><em>添加新会员</em></span>
    </div>
    <table class="list-style">
        <tr>
            <td style="width:15%;text-align:right;">会员昵称：</td>
            <td><input type="text" class="textBox length-middle" id="user_name"
                       onblur="check_name()"/><span style="display: none" type="hidden">提示信息</span></td>
        </tr>
        <tr>
            <td style="text-align:right;">设置密码：</td>
            <td><input type="password" class="textBox length-middle" name="password" id="password" onblur="isPwd()"/>
                <span id="spanPwd" style="color: red"></span></td>
        </tr>
        <tr>
            <td style="text-align:right;">手机号码：</td>
            <td><input type="text" class="textBox length-middle" name="tell" id="tell" onblur="isTell()"/>
                <span type="hidden" style="color: red"></span></td>
        </tr>
        <tr>
            <td style="text-align:right;">会员地址：</td>
            <td><input type="text" class="textBox length-middle" name="address" id="address"/></td>
        </tr>
        <tr>
            <td style="text-align:right;"></td>
            <td><input type="button" class="tdBtn" value="添加新用户" id="add"/></td>
        </tr>
    </table>
</div>
<script>

    var temp1;
    var temp2;
    var temp3;

    //用户名验证
    function check_name() {
        var uName = $("#user_name").val();
        var len = $("#user_name").val().length;
        if (len < 3 || len > 12) {
            $('#user_name').next().html('请输入3-12个字符的用户名')
            $('#user_name').next().css("color", "red");
            $('#user_name').next().show();
            temp1 = false;
        } else {
            $.post('../user',
                {flag: 9, userName: uName},
                function (date) {
                    if ("1" == date) {
                        $('#user_name').next().show();
                        $('#user_name').next().html('用户名已存在');
                        $('#user_name').next().css("color", "red");
                        temp1 = false;
                    }
                }, "json");
            $('#user_name').next().hide();
            temp1 = true;
        }
    }

    //密码验证
    function isPwd() {
        var th = document.getElementById("password");
        var pwd1 = th.value;
        if (pwd1.length < 6) {
            temp2 = false;
            document.getElementById("spanPwd").innerHTML = "密码不能小于六位！";
            th.style.border = "1px solid red";
        } else {
            temp2 = true;
            document.getElementById("spanPwd").innerHTML = "";
            th.style.border = "";
        }
    }

    //手机号验证
    function isTell() {
        var tell = $("#tell").val();
        var check = /^1[0-9]{10}$/;
        if (check.test(tell)) {
            $("#tell").next().hide();
            temp3 = true;
        } else {
            $("#tell").next().html("手机号有误！");
            $("#tell").next().css("color", "red");
            $("#tell").next().show();
            temp3 = false;
        }
    }

    $(function () {
        $("#add").click(function () {
            var userName = $("#user_name").val();
            var password = $("#password").val();
            var tell = $("#tell").val();
            var address = $("#address").val();
            if (temp1 && temp2 && temp3) {
                $.post("../user",
                    {flag: 2, userName: userName, password: password, tell: tell, address: address},
                    function () {
                        window.location.href = "../user";
                    });
            } else {
                alert("添加失败！");
            }
        });
    });
</script>
</body>
</html>