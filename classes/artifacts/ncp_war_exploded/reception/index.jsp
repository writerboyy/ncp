<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-首页</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/slide.js"></script>
    <script>
        $(document).ready(function () {
            $.post(
                "../cart",
                {
                    flag: 4,
                    userId: $('#userId').val(),
                },
                function (msg) {
                    $('#show_count').html(msg.num);
                },
                'json'
            );
            $.post(
                "../goods",
                {
                    flag: '9'
                },
                function () {
                    if (location.href.indexOf("#reloaded") == -1) {
                        location.href = location.href + "#reloaded";
                        location.reload();
                    }
                }
            );
        })
    </script>
</head>
<body>
<input type="hidden" value="${user.userId}" id="userId"/>
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
                <c:if test="${user==null}">
                    <a href="login.jsp">用户中心</a>
                </c:if>
                <c:if test="${user!=null}">
                    <a href="user_center_info.jsp">用户中心</a>
                </c:if>
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
    <div class="navbar">
        <h1 class="fl">全部商品分类</h1>
        <ul class="navlist fl">
            <li><a href="index.jsp">首页</a></li>
            <%--            <li class="interval">|</li>
                        <li><a href="">手机生鲜</a></li>
                        <li class="interval">|</li>
                        <li><a href="">抽奖</a></li>--%>
        </ul>
    </div>
</div>

<div class="center_con clearfix">
    <ul class="subnav fl">
        <c:forEach items="${typeList}" var="type" varStatus="status" begin="1" end="6">
            <li><a href="#model0${status.count-1}" name="typeName" class="fruit${status.count}">${type.typeName}</a>
            </li>
        </c:forEach>
    </ul>
    <div class="slide fl">
        <ul class="slide_pics">
            <li><a href="../goods?flag=10&typeId=2&t=t"><img src="images/slide.jpg" alt="幻灯片"></a></li>
            <li><a href="../goods?flag=10&typeId=2&t=t"><img src="images/slide02.jpg" alt="幻灯片"></a></li>
            <li><a href="../goods?flag=10&typeId=4&t=t"><img src="images/slide03.jpg" alt="幻灯片"></a></li>
            <li><a href="../goods?flag=10&typeId=3&t=t"><img src="images/slide04.jpg" alt="幻灯片"></a></li>
        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>
    <div class="adv fl">
        <a href="../goods?flag=10&typeId=2&t=t"><img src="images/adv01.jpg"></a>
        <a href="../goods?flag=10&typeId=7&t=t"><img src="images/adv02.jpg"></a>
    </div>
</div>


<c:forEach items="${arrlist}" var="list" begin="1" end="8" varStatus="status">
    <div class="list_model">

        <div class="list_title clearfix">
            <c:forEach items="${list}" var="goods" begin="0" end="0" step="1">
                <c:forEach items="${typeList}" var="type" begin="${status.count}" end="${status.count}" step="1">
                    <h3 class="fl" id="model0${status.count-1}">${type.typeName}</h3>
                </c:forEach>
                <div class="subtitle fl">
                    <span>|</span>
                    <c:forEach items="${daolist}" var="daolist" begin="${status.count}" end="${status.count}" step="1">
                        <c:forEach items="${daolist}" var="daogoods" begin="0" end="2" step="1">
                            <a href="../goods?flag=11&goodsId=${daogoods.goodsId}&typeId=${goods.typeId}">${daogoods.goodsName}</a>
                        </c:forEach>
                    </c:forEach>
                </div>
                <a href="../goods?flag=10&typeId=${goods.typeId}&t=t" class="goods_more fr" id="fruit_more">查看更多 ></a>
            </c:forEach>

        </div>
        <div class="goods_con clearfix">

            <div class="goods_banner fl"><img src="images/banner0${status.count}.jpg"></div>

            <ul class="goods_list fl">
                <c:forEach items="${list}" var="goods" begin="0" end="3" step="1">
                    <li>
                        <h4>
                            <a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}">${goods.goodsName}</a>
                        </h4>
                        <a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}"><img
                                src="images/goods/${goods.pic}"></a>
                        <div class="prize">${goods.price}</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

</c:forEach>

<div class="footer">
    <div class="foot_link">
        <a id="tan1">关于我们</a>
        <span>|</span>
        <a id="tan2">联系我们</a>
    </div>
    <p>CopyRight © 2019 厦门浓郁技术有限公司 All Rights Reserved</p>
    <p>电话：010-8888888 厦kf13 1238888号</p>
</div>

<script type="text/javascript">

    function serach() {
        var goodsName = $('#serach').val();
        $.post("../goods",
            {
                flag: '10',
                goodsName: goodsName
            },
            function (data) {
                window.location.href = "list.jsp";
            }
        );
    }

    $(document).ready(function () {
        $("#tan1").click(function () {
            alert("开发13");
        });
        $("#tan2").click(function () {
            alert("开发13");
        });
    });
</script>
</body>
</html>