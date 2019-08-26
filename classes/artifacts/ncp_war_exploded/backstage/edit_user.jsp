<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>编辑会员资料</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="edit_user"></i><em>编辑会员资料</em></span>
    </div>
    <table class="list-style">
        <tr>
            <td style="width:15%;text-align:right;">会员昵称：</td>
            <td><input type="text" class="textBox length-middle" value="${user.userName}" id="user_name"
                       onblur="check_name()"/><span style="display: none" type="hidden">提示信息</span></td>
        </tr>
        <tr>
            <td style="text-align:right;">会员地址：</td>
            <td><input type="text" class="textBox length-middle" value="${user.address}" id="hou_address"/></td>
            <td><input type="hidden" value="${user.password}" id="hou_password"/></td>
            <td><input type="hidden" value="${user.userId}" id="hou_userId"/></td>
        </tr>
        <tr>
            <td style="text-align:right;">手机号码：</td>
            <td><input type="text" class="textBox length-middle" value="${user.tell}" onblur="check_tell()"
                       id="hou_tell"/><span style="display: none" type="hidden">提示信息</span></td>
        </tr>
        <tr>
            <td style="text-align:right;">会员等级：</td>
            <td>
                <select class="textBox" id="hou_grade">
                    <option>请选择会员等级</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="text-align:right;"></td>
            <td><input type="button" class="tdBtn" value="更新保存" onclick="houUpdate()"/></td>
        </tr>
    </table>
</div>
<script>
    var error_tell = true;
    var tell;
    var userName;
    var address;
    var error_name = true;
    var userId;
    var password;
    var grade;

    function houUpdate() {
        tell = $('#hou_tell').val();
        userName = $("#user_name").val();
        address = $('#hou_address').val();
        userId = $('#hou_userId').val();
        password = $('#hou_password').val();
        grade = $('#hou_grade').val();
        if (error_tell && error_name) {
            if (grade == "请选择会员等级") {
                alert("请选择等级");
            } else {
                $.post("../user",
                    {
                        flag: 4,
                        userName: userName,
                        address: address,
                        tell: tell,
                        userId: userId,
                        password: password,
                        grade: grade
                    },
                    function (date) {
                        if (date == "1") {
                            alert("修改成功！");
                            window.location.href = "../user";
                        } else {
                            alert("输入有误，请重新输入");
                        }
                    }, "json");
            }
        }
    }


    //校验用户名
    function check_name() {
        userName = $("#user_name").val();
        userId = $("#hou_userId").val();
        var len = $("#user_name").val().length;
        if (len < 3 || len > 12) {
            $('#user_name').next().html('请输入3-12个字符的用户名')
            $('#user_name').next().css("color", "red");
            $('#user_name').next().show();
            error_name = false;
        } else {
            $('#user_name').next().hide();
            error_name = true;
            $.post("../user",
                {flag: 9, userName: userName, userId: userId},
                function (date) {
                    if ("1" == date) {
                        $('#user_name').next().show();
                        $('#user_name').next().html('用户名已存在');
                        $('#user_name').next().css("color", "red");
                        error_name = false;
                    }
                }, "json")
        }
    }

    //检验电话
    function check_tell() {
        var re = /^1[0-9]{10}$/;
        var check = $('#hou_tell').val();
        if (re.test(check)) {
            $('#hou_tell').next().hide();
            error_tell = true;
        } else {
            $('#hou_tell').next().html('电话号码有误！');
            $('#hou_tell').next().css("color", "red");
            $('#hou_tell').next().show();
            error_tell = false;
        }

    }
</script>
</body>
</html>