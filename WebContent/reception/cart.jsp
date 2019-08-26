<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-购物车</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="js/cart.js"></script>
    <script>

    </script>
</head>
<body>
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

<div class="search_bar clearfix">
    <a href="index.jsp" class="logo fl"><img src="images/logo.png" width="163" height="76"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
    <div class="search_con fr">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
</div>

<div class="total_count">全部商品<em id="allGoodsNum">${cartList.size()}</em>件</div>
<ul class="cart_list_th clearfix">
    <li class="col01">商品名称</li>
    <li class="col02">商品单位</li>
    <li class="col03">商品价格</li>
    <li class="col04">数量</li>
    <li class="col05">小计</li>
    <li class="col06">操作</li>
</ul>
<input type="hidden" id="userId" value="${user.userId}"/>
<c:forEach items="${cartList}" var="cart" varStatus="i">
    <ul class="cart_list_td clearfix">
        <li class="col01"><input type="hidden" value="${cart.goodsId}"/>
            <input type="checkbox" name="cb" checked="checked" onclick="selectOne(this);"></li>
        <li class="col02"><img src="images/goods/${goodsList[i.index].pic}"></li>
        <li class="col03">${cart.goodsName}<br><em>${cart.price}元/500g</em></li>
        <li class="col04">500g</li>
        <li class="col05">${cart.price}元</li>
        <li class="col06">
            <div class="num_add">
                <input type="hidden" name="price" value="${cart.price}"/>
                <input type="hidden" name="goodsId" value="${cart.goodsId}"/>
                <a href="javascript:void(0);" class="add fl" onclick="addNum(this)">+</a>
                <input type="text" class="num_show fl" name="number" value="${cart.cartNumber}">
                <a href="javascript:void(0);" class="minus fl" onclick="delNum(this);">-</a>
            </div>
        </li>
        <li class="col07" name="total">
            <fmt:formatNumber type="number" value="${cart.price*cart.cartNumber}" maxFractionDigits="2"/>
            元
        </li>
        <li class="col08"><a href="javascript:void(0);" name="deleteCart" onclick="deleteCart(this);">删除</a></li>
    </ul>
</c:forEach>
<ul class="settlements">
    <li class="col01"><input type="checkbox" onchange="checkboxAll(this);" checked="checked"></li>
    <li class="col02">全选</li>
    <li class="col03">合计(不含运费)：<span>¥</span><em id="totals">0</em><br>共计<b id="goodsNum">0</b>件商品</li>
    <li class="col04"><a href="javascript:void(0);" onclick="settle();">去结算</a></li>
</ul>

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