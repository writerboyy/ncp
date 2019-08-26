<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-商品详情</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
</head>
<script src="js/detail.js"></script>
<style>
    .div1 {
        position: relative;
        font-family: "微软雅黑";
        font-size: 15px;
        width: 100%;
        height: 60px;
        border-bottom: #dadada 1px solid;
        margin-top: 25px;
    }

    .text {
        text-indent: 20px;
        position: absolute;
        left: 2%;
        width: 82%;
    }

    .date {
        position: absolute;
        height: 30px;
        bottom: 5px;
        width: 18%;
        right: 2%;
    }
</style>
<body>
<input type="hidden" id="userId" value="${user.userId}"/>
<input type="hidden" id="goodsId" value="${goods.goodsId}"/>
<input type="hidden" id="stock" value="${goods.stock}"/>
<input type="hidden" id="page" value="${page}"/>
<input type="hidden" id="pagetotal" value="${pageTotal}"/>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到浓郁!</div>
        <div class="fr">
            <c:choose>
                <c:when test="${user.userName!=null}">
                    <div class="welcome fl">
                        <input type="hidden" id="user" value="${user.userId}"/>
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
    <div class="search_con fl">
        <form action="../goods" method="post">
            <input type="hidden" name="flag" value="10"/>
            <input type="text" class="input_text fl" name="goodsName" placeholder="搜索商品">
            <input type="submit" class="input_btn fr" name="" value="搜索">
        </form>
    </div>
    <div class="guest_cart fr">
        <a href="../cart?flag=0" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="show_count">0</div>
    </div>
</div>

<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>全部商品分类</h1>
            <span></span>
            <ul class="subnav">
                <c:forEach items="${typeList}" var="type" varStatus="status" begin="1" end="6">
                    <li><a href="../goods?flag=10&typeId=${type.typeId}&t=t"
                           class="fruit${status.count}">${type.typeName}</a></li>
                </c:forEach>
            </ul>
        </div>
        <ul class="navlist fl">
            <li><a href="index.jsp">首页</a></li>
            <%--<li class="interval">|</li>--%>
            <%--<li><a href="">手机生鲜</a></li>--%>
            <%--<li class="interval">|</li>--%>
            <%--<li><a href="">抽奖</a></li>--%>
        </ul>
    </div>
</div>

<div class="goods_detail_con clearfix">
    <div class="goods_detail_pic fl"><img src="images/goods/${goods.pic}" style="width: 350px;height: 350px"></div>

    <div class="goods_detail_list fr">
        <input type="hidden" id="goodsname" value="${goods.goodsId}"/>
        <h3>${goods.goodsName}</h3>
        <div class="prize_bar">
            <input type="hidden" id="price" value="${goods.price}"/>
            <span class="show_pirze">¥<em>${goods.price}</em></span>
            <span class="show_unit">单  位：500g</span>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数 量：</div>
            <div class="num_add fl">
                <input type="text" class="num_show fl" value="1" id="number">
                <a href="javascript:void(0);" class="add fr" id="addNum">+</a>
                <a href="javascript:void(0);" class="minus fr" id="delNum">-</a>
            </div>
        </div>
        <div class="total">总价：<em id="total">${goods.price}元</em></div>
        <div class="operate_btn">
            <a href="javascript:void(0);" class="buy_btn" id="buy">立即购买</a>
            <a href="javascript:void(0);" class="add_cart" id="add_cart">加入购物车</a>
        </div>
    </div>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <c:forEach items="${list1}" var="goods" begin="0" end="1" step="1">
                    <li>
                        <a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}"><img
                                src="images/goods/${goods.pic}"></a>
                        <h4>
                            <a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}">${goods.goodsName}</a>
                        </h4>
                        <div class="prize">￥${goods.price}</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li class="active" id="details" style="background-color:#39a93e; color:white">商品介绍</li>
            <li class="active" id="comment">评论</li>
        </ul>

        <div class="tab_content" style="display: block" id="detail_display">
            <dl>
                <dt>商品详情：</dt>
                <dd>${goods.text}</dd>
            </dl>
        </div>

        <div class="tab_content" style="display: none" id="comment_display">
            <dl>
                <ul id="com" class="com">
                    <dt>评论：</dt>
                </ul>
            </dl>

            <div class="pagenation">
                <input type="button" id="first" value="第一页"/>
                <input type="button" id="before" value="上一页"/>
                <a id="pagenation"></a>
                <input type="button" id="after" value="下一页"/>
                <input type="button" id="last" value="最后一页"/>
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
<div class="add_jump"></div>
<%--<script type="text/javascript">--%>
<%--var $add_x = $('#add_cart').offset().top;--%>
<%--var $add_y = $('#add_cart').offset().left;--%>

<%--var $to_x = $('#show_count').offset().top;--%>
<%--var $to_y = $('#show_count').offset().left;--%>

<%--$(".add_jump").css({'left': $add_y + 80, 'top': $add_x + 10, 'display': 'block'})--%>
<%--$('#add_cart').click(function () {--%>
<%--$(".add_jump").stop().animate({--%>
<%--'left': $to_y + 7,--%>
<%--'top': $to_x + 7--%>
<%--},--%>
<%--"fast", function () {--%>
<%--$(".add_jump").fadeOut('fast', function () {--%>
<%--$('#show_count').html(2);--%>
<%--});--%>

<%--});--%>
<%--})--%>
<%--</script>--%>
<script>
    var $list;
    var $page;
    var $pageTotal;

    window.onload = function () {
        var goodsId = $("#goodsId").val();
        $.post("../user",
            {flag: 11, goodsId: goodsId},
            function () {
            });
    }
    $(document).ready(function () {
        $("#tan1").click(function () {
            alert("开发13");
        });
        $("#tan2").click(function () {
            alert("开发13");
        });
    });
        $("#details").click(function () {
            $("#comment").css({"background-color": "white", "color": "black"});
            $("#details").css({"background-color": "#39a93e", "color": "white"});
            $("#detail_display").css("display", "block");
            $("#comment_display").css("display", "none");
        });

        $("#comment").click(function () {
            $("#comment").css({"background-color": "#39a93e", "color": "white"});
            $("#details").css({"background-color": "white", "color": "black"});
            var $goodsId = $("#goodsname").val();
            var $userId = $("#user").val();
            $("#detail_display").css("display", "none");
            $("#comment_display").css("display", "block");
            $.ajax({
                type: "POST",
                url: "../comment",
                xhrFields: {
                    withCredentials: true
                },
                data:
                    {
                        flag: 0,
                        pagenum:1,
                        goodsid: $goodsId
                    },
                dataType: "json",
                success: function (data) {
                    yemian(data);
                }
            });
        });


        $("#first").click(function () {
            $.ajax({
                type: "POST",
                url: "../comment",
                data:
                    {
                        flag: 0,
                        pagenum: 1
                    },
                dataType: "json",
                success: function (data) {
                    yemian(data);
                }
            })
        });


        $("#last").click(function () {
            $.ajax({
                type: "POST",
                url: "../comment",
                data:
                    {
                        flag: 0,
                        pagenum: $pageTotal
                    },
                dataType: "json",
                success: function (data) {
                    yemian(data);

                }
            })
        })
        $("#before").click(function () {
            $.ajax({
                type: "POST",
                url: "../comment",
                data:
                    {
                        flag: 0,
                        pagenum: $page - 1
                    },
                dataType: "json",
                success: function (data) {
                    yemian(data);

                }
            })
        })
        $("#after").click(function () {
            $.ajax({
                type: "POST",
                url: "../comment",
                data:
                    {
                        flag: 0,
                        pagenum: $page + 1
                    },
                dataType: "json",
                success: function (data) {
                    yemian(data);
                }
            })
        })


    function yemian(data) {
        var str = "";
        $("#com").html("");
        $list=data[0];
        $page=parseInt(data[1]);
        $pageTotal=parseInt(data[2]);
        for (var i = 0; i < $list.length; i++) {
            str += "<div class='div1'><div class='text'>" + $list[i].comment + "</div><div class='date'>" + formatDateTime($list[i].date) + "</div></div>";
        }
        $("#com").html(str);
        $("#pagenation").html($page+"/"+$pageTotal);

    }

    function formatDateTime(inputTime) {
        var date = new Date(inputTime);
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        h = h < 10 ? ('0' + h) : h;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        minute = minute < 10 ? ('0' + minute) : minute;
        second = second < 10 ? ('0' + second) : second;
        return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
    };
</script>
</body>
</html>