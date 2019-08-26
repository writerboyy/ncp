<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-用户中心</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/update_info.js"></script>
</head>
<body>
<input type="hidden" id="user_id" value="${user.userId}">
<input type="hidden" id="grade" value="${user.grade}">
<input type="hidden" id="tell" value="${user.tell}">
<input type="hidden" id="password" value="${user.password}">
<input type="hidden" id="address" value="${user.address}">
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到浓郁!</div>
        <div class="fr">
            <c:choose>
                <c:when test="${user.userName!=null}">
                    <div class="welcome fl">
                        欢迎您：<em class="emEm">${user.userName}</em>
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
                <a href="user_center_order.jsp">我的订单</a>
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
            <li><a href="user_center_info.jsp" class="active">· 个人信息</a></li>
            <c:if test="${user==null}">
                <li><a href="login.jsp">· 我的订单</a></li>
            </c:if>
            <c:if test="${user!=null}">
                <li><a href="../order?flag=5&userId=${user.userId}">· 我的订单</a></li>
            </c:if>
            <li><a href="user_center_site.jsp">· 收货地址</a></li>
            <li><a href="user_center_critic.jsp">· 我的评论</a></li>
            <%--<li><a href="../comment?flag=5&pagenum=1&userId=${user.userId}">· 我的评论</a></li>--%>
        </ul>
    </div>
    <div class="right_content clearfix">
        <div class="info_con clearfix">
            <h3 class="common_title2">基本信息</h3>
            <ul class="user_info_list">
                <li><span>用户名：</span>
                    <input type="hidden" value="${user.userName}" id="user_name1" onblur="check_u()">
                    <span style="display: none;color:red;height: 0px;" id="chong">重名</span>
                    <span style="display: none;color:red" id="zhang">3-12个字</span>
                    <span id="user_name2" style="width:100px;text-align:left;">${user.userName}</span><br></li>
                <li><span>联系方式：</span>
                    <input type="hidden" value="${user.tell}" id="tell1" onblur="check_t()">
                    <span style="display: none;color:red" id="error_t">电话错误</span>
                    <span id="tell2" style="width:100px;text-align:left;">${user.tell}</span><br></li>
                <li><span>密码：</span>
                    <input type="hidden" id="password1" value="${user.password}" onblur="check_p()">
                    <span style="display: none;color:red" id="error_p">不小于六位</span>
                    <span id="password2" style="width:100px;text-align:left;">******</span><br></li>

                <li><input type="button" value="编辑" onclick="bianJi()"
                           style="border: none;color: #3d3d3d;background: white" id="bianji1">
                    <input type="hidden" value="编辑" onclick="bianji()"
                           style="border: none;color: #3d3d3d;background: white" id="bianji2">&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" value="确定" onclick="queDing()"
                           style="border: none;color: #3d3d3d;background: white"></li>
            </ul>
        </div>
        <br/>
        <br/>
        <br/>
        <h3 class="common_title2">最近浏览</h3>
        <div class="has_view_list">
            <ul class="goods_type_list clearfix">
                <c:forEach items="${user_goods_List}" var="goods">
                    <li>
                        <h4>
                            <a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}">${goods.goodsName}</a>
                        </h4>
                        <a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}"><img
                                src="images/goods/${goods.pic}"></a>
                        <div class="operate">
                            <span class="prize">￥${goods.price}</span>
                            <span class="unit">${goods.price}/500g</span>
                            <a href="#" class="add_goods" title="加入购物车"></a>
                        </div>
                    </li>
                </c:forEach>
            </ul>
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
<script>
    // $(document).ready(function () {
    //     $("#comment").click(function () {
    //         var $userId = $("#user_id").val();
    //         console.log($userId);
    //         $.ajax({
    //             type: "POST",
    //             url: "../comment",
    //             data:
    //                 {
    //                     flag: 1,
    //                     pagenum: 1,
    //                     userId: $userId
    //                 },
    //             dataType: "json",
    //             success: function (data) {
    //                  window.location.href="user_center_critic.jsp?"+"date="+date;
    //             }
    //         })
    //     })
    // })
</script>
</body>
</html>