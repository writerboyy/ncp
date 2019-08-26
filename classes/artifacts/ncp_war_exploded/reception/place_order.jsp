<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-提交订单</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="js/place_order.js"></script>
</head>
<body id="body">
<input id="userId" value="${user.userId}" type="hidden"/>
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
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>
    <div class="search_con fr">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
</div>

<h3 class="common_title">确认收货地址</h3>

<div class="common_list_con clearfix">
    <dl>
        <dt>寄送到：</dt>
        <dd><input type="radio" name="" checked="">${user.address} （${user.userName} 收） ${user.tell}</dd>
    </dl>
    <a href="user_center_site.jsp" class="edit_site">编辑收货地址</a>

</div>

<h3 class="common_title">支付方式</h3>
<div class="common_list_con clearfix">
    <div class="pay_style_con clearfix">
        <input type="radio" name="pay_style" checked value="0">
        <label class="cash">货到付款</label>
        <input type="radio" name="pay_style" value="1">
        <label class="zhifubao"></label>
    </div>
</div>

<h3 class="common_title">商品列表</h3>

<div class="common_list_con clearfix">
    <ul class="goods_list_th clearfix">
        <li class="col01">商品名称</li>
        <li class="col02">商品单位</li>
        <li class="col03">商品价格</li>
        <li class="col04">数量</li>
        <li class="col05">小计</li>
    </ul>
    <c:forEach items="${goodsList}" var="goods" varStatus="i">
        <ul class="goods_list_td clearfix">
            <li class="col01">${i.index+1}</li>
            <li class="col02"><img src="images/goods/${goods.pic}"></li>
            <li class="col03">${goods.goodsName}</li>
            <li class="col04">500g</li>
            <li class="col05">${goods.price}元</li>
            <li class="col06">${goods.stock}</li>
            <li class="col07">
                <fmt:formatNumber type="number" value="${goods.price*goods.stock}" pattern="0.00"
                                  maxFractionDigits="2"/>
                元
            </li>
        </ul>
    </c:forEach>
</div>

<h3 class="common_title">总金额结算</h3>

<div class="common_list_con clearfix">
    <div class="settle_con">
        <div class="total_goods_count">共<em>${goodsList.size()}</em>件商品，总金额<b>
            <fmt:formatNumber type="number" value="${goodsSum}" pattern="0.00" maxFractionDigits="2"/>
            元</b></div>
        <div class="transit">运费：<b>10元</b></div>
        <div class="total_pay">实付款：<b>
            <input type="hidden" id="total" value="${goodsSum+10}"/>
            <fmt:formatNumber type="number" value="${goodsSum+10}" pattern="0.00" maxFractionDigits="2"/>
            元</b></div>
    </div>
</div>
<%--<form action=alipay.trade.page.pay.jsp id="form" method="post"onsubmit="return submitOrder()" target="_blank">--%>
<input type="hidden" name="userId" value="${user.userId}"/>
<%--    <input type="hidden" name="total" value="${goodsSum+10}"/>--%>
<input type="hidden" name="total" value="0.01"/>
<input type="hidden" id="orderId" name="orderId"/>
<div class="order_submit clearfix">
    <input type="submit" onclick="submitOrder()">提交订单</input>
</div>
<%--</form>--%>

<div class="footer">
    <div class="foot_link">
        <a id="tan1">关于我们</a>
        <span>|</span>
        <a id="tan2">联系我们</a>
    </div>
    <p>CopyRight © 2019 厦门浓郁技术有限公司 All Rights Reserved</p>
    <p>电话：010-8888888 厦kf13 1238888号</p>
</div>

<div class="popup_con">
    <div class="popup">
        <p>订单提交成功！</p>
    </div>

    <div class="mask"></div>
</div>
<script type="text/javascript">

</script>
</body>
</html>