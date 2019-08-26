<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改密码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="js/Verification.js"></script>
    <style type="text/css">
        .myStyle {
            border: red 1px solid;
        }

    </style>
    <script>
        $(document).ready(function () {
            $("#update").click(function () {
                var userName = $("#name").val();
                var password = $("#password1").val();
                var pwd1 = $("#pwd1").val();
                if (isForm()) {
                    $.post(
                        "../user",
                        {
                            flag: '6',
                            userName: userName,
                            password: password,
                            password1: pwd1
                        },
                        function (msg) {
                            if (msg.judge) {
                                parent.location.href = "adminLogin.jsp";
                            } else {
                                alert("修改信息失败！");
                                //location.href = "adminLogin.jsp";
                            }
                        },
                        'json');
                }
            });
        });
    </script>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="user"></i><em>修改密码</em></span>
    </div>
    <input value="6" type="hidden" name="flag"/>
    <table class="noborder">
        <tr>
            <td width="15%" style="text-align:right;">账号：</td>
            <td>
                <input type="text" class="textBox length-middle" id="name" name="userName" onblur="isName()"
                       value="${admin.userName}"/>
                <span id="spanName" style="color: red"></span>
            </td>
        </tr>
        <tr>
            <td style="text-align:right;">旧密码：</td>
            <td><input type="password" id="password1" name="password" class="textBox length-middle"/></td>
            <td><span id="span2" style="color: red"></span></td>
        </tr>
        <tr>
            <td style="text-align:right;">新密码：</td>
            <td><input type="password" class="textBox length-middle" id="pwd1" name="password1" onblur="isPwd1()"/>
                <span id="spanPwd1" style="color: red"></span></td>
        </tr>
        <tr>
            <td style="text-align:right;">再次确认密码：</td>
            <td><input type="password" class="textBox length-middle" id="pwd2" onblur="isPwd2()"/>
                <span id="spanPwd2" style="color: red"></span></td>
        </tr>
        <tr>
            <td style="text-align:right;"></td>
            <td><input type="submit" class="tdBtn" value="保存" id="update"/> <input type="reset" class="tdBtn"
                                                                                   value="重置"/></td>
        </tr>
    </table>
</div>
</body>
</html>