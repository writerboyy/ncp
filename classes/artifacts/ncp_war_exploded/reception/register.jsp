<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-注册</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/register.js"></script>
</head>
<body>
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="images/logo02.png" width="163" height="96"></a>
        <div class="reg_slogan">足不出户 · 新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
            <a href="login.jsp">登录</a>
        </div>
        <div class="reg_form clearfix">
            <form action="../user" method="post">
                <input type="hidden" name="flag" value="2"/>
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="userName" id="user_name" placeholder="请输入要注册的用户名">
                        <span class="error_tip1"></span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="password" id="pwd" placeholder="请输入密码">
                        <span class="error_tip2"></span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" name="cpwd" id="cpwd" placeholder="重新输入密码">
                        <span class="error_tip3"></span>
                    </li>
                    <li>
                        <label>电话:</label>
                        <input type="text" name="tell" id="tell" placeholder="输入您的手机号">
                        <span class="error_tip4"></span>
                    </li>
<%--                    <li>--%>
<%--                        <label>验证码:</label>--%>
<%--                        <input type="text" name="tell" id="yzm" placeholder="输入">--%>
<%--                        <span class="error_tip4"></span>--%>
<%--                    </li>--%>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意”浓郁用户使用协议“</label>
                        <span class="error_tip5"></span>
                    </li>
                    <li class="reg_sub">
                        <input type="submit" value="注 册" name="">
                    </li>
                </ul>
            </form>
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
