<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>浓郁-商品列表</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="js/goodsList.js"></script>
</head>
<body>
<input type="hidden" id="userId" value="${user.userId}"/>
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
		<div class="search_con fl">
			<form action="../goods" method="post">
				<input type="hidden" name="flag" value="10"/>
			<input type="text" class="input_text fl" name="goodsName" placeholder="搜索商品">
			<input type="submit" class="input_btn fr" name="" value="搜索" >
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
					<li><a href="../goods?flag=10&typeId=${type.typeId}&t=t" class="fruit${status.count}">${type.typeName}</a></li>
					</c:forEach>
				</ul>
			</div>
			<ul class="navlist fl">
				<li><a href="index.jsp">首页</a></li>
<%--				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>--%>
			</ul>
		</div>
	</div>


	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<c:forEach items="${list1}" var="goods" begin="0" end="1" step="1">
						<li>
							<a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}"><img src="images/goods/${goods.pic}"></a>
								<h4><a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}">${goods.goodsName}</a></h4>
							<div class="prize">￥${goods.price}</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<c:forEach items="${list}" var="goods" begin="0" end="0" step="1">
					<a href="../goods?flag=10&typeId=${goods.typeId}" class="active">默认</a>
					<a href="../goods?flag=10&typeId=${goods.typeId}&price=-1">价格升序</a>
					<a href="../goods?flag=10&typeId=${goods.typeId}&price=1">价格降序</a>
					<a href="../goods?flag=10&typeId=${goods.typeId}&salas=-1">人气升序</a>
					<a href="../goods?flag=10&typeId=${goods.typeId}&salas=1">人气降序</a>
				</c:forEach>
			</div>
			<ul class="goods_type_list clearfix">
				<c:forEach items="${list}" var="goods">
				<li>
					<a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}"><img src="images/goods/${goods.pic}"></a>
					<h4><a href="../goods?flag=11&goodsId=${goods.goodsId}&typeId=${goods.typeId}">${goods.goodsName}</a></h4>
					<div class="operate">
						<span class="prize">${goods.price}/500g</span>
						<span class="unit">销量:${goods.salesNumber}</span>
						<input type="hidden" value="${goods.goodsId}"/>
						<a href="javascript:void (0);" onclick="addCartGoods(this)" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
				</c:forEach>
			</ul>

			<div class="pagenation">
				<a href="../goods?flag=10&pagenum=1">第一页</a>
				<a href="../goods?flag=10&pagenum=${page-1}">上一页</a>
				<a>${page}/${pageTotal}</a>
				<a href="../goods?flag=10&pagenum=${page+1}">下一页</a>
				<a href="../goods?flag=10&pagenum=${pageTotal}">最后一页</a>
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