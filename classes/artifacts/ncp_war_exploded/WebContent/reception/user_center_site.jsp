<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-用户中心</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="js/province.js" type="text/javascript"></script>
    <script src="js/city.js" type="text/javascript"></script>
    <script src="js/area.js" type="text/javascript"></script>
    <script src="js/update_site.js" type="text/javascript"></script>
</head>
<body>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到浓郁!</div>
        <div class="fr">
            <c:choose>
                <c:when test="${user.userName!=null}">
                    <div class="welcome fl">
                        欢迎您：<em class="emEm" id="userName">${user.userName}</em>
                        <span>|</span>
                        <a href="../user?flag=12">退出</a>
                    </div>
                </c:when>
                <c:when test="${user.userName==null}">
                    <div class="login_btn fl">
                        <a href="login.jsp">登录</a>
                        <span>|</span>
                        <a href="register.jsp">注册</a>
                    </div>
                </c:when>
            </c:choose>
            <div class="user_link fl">
                <span>|</span>
                <a href="user_center_info.jsp">用户中心</a>
                <span>|</span>
                <a href="../cart?flag=0">我的购物车</a>
                <span>|</span>
                <c:if test="${user==null}">
                    <a href="login.jsp">我的订单</a>
                </c:if>
                <c:if test="${user!=null}">
                    <a href="../order?flag=5&userId=${user.userId}">我的订单</a>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="index.jsp" class="logo fl"><img src="images/logo.png" width="163" height="76"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
<%--    <div class="search_con fr">--%>
<%--        <input type="text" class="input_text fl" name="" placeholder="搜索商品" id="serach">--%>
<%--        <input type="button" class="input_btn fr" name="" value="搜索" onclick="serach()">--%>
<%--    </div>--%>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="user_center_info.jsp">· 个人信息</a></li>
            <li><a href="user_center_order.jsp">· 我的订单</a></li>
            <li><a href="user_center_site.jsp" class="active">· 收货地址</a></li>
            <li><a href="user_center_critic.jsp">· 我的评论</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <h3 class="common_title2">收货地址</h3>
        <div class="site_con">
            <dl>
                <dt>当前地址：</dt>
                <dd>${user.address}</dd>
            </dl>
        </div>
        <h3 class="common_title2">编辑地址</h3>
        <div class="site_con">
            <div class="form_group form_group2">
                <label>选择地址：</label>
                <select id="province">
                    <option value="0">请选择</option>
                </select>
                <select id="city">
                    <option value="0">请选择</option>
                </select>
                <select id="area">
                    <option value="0">请选择</option>
                </select>
            </div>
            <div class="form_group form_group2">
                <label>详细地址：</label>
                <textarea class="site_area" id="data"></textarea>
            </div>
            <div class="form_group">
                <label>手机：</label>
                <input type="text" name="tell" id="tell" onblur="check_tell()" value="${user.tell}">
                <span style="display: none" type="hidden">提示信息</span>
            </div>

            <input type="button" value="提交" class="info_submit" id="siteTi" onclick="qian_check()">
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