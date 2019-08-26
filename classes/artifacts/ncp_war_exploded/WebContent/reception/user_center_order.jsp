<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-用户中心</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
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
                <a href="user_center_order.jsp">我的订单</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="index.jsp" class="logo fl"><img src="images/logo.png" width="163" height="76"></a>
    <div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
<%--    <div class="search_con fr">--%>
<%--        <input type="text" class="input_text fl" name="" placeholder="搜索订单">--%>
<%--        <input type="button" class="input_btn fr" name="" value="搜索">--%>
<%--    </div>--%>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="user_center_info.jsp">· 个人信息</a></li>
            <c:if test="${user==null}">
                <li><a href="login.jsp" class="active">· 我的订单</a></li>
            </c:if>
            <c:if test="${user!=null}">
                <li><a href="../order?flag=5&userId=${user.userId}" class="active">· 我的订单</a></li>
            </c:if>
            <li><a href="user_center_site.jsp">· 收货地址</a></li>
            <li><a href="user_center_critic.jsp">· 我的评论</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <h3 class="common_title2">&nbsp;查询到${barstotal}条订单信息</h3>
        <c:forEach items="${listfen}" var="order">
            <ul class="order_list_th w978 clearfix">
                <li class="col01">${order.orderDate}&nbsp;${fn:substring(order.orderId, 8, 10)}时${fn:substring(order.orderId, 10, 12)}分${fn:substring(order.orderId, 12, 14)}秒</li>
                <li class="col02">订单号：${order.orderId}</li>
                <c:if test="${order.status=='0'}">
                    <li class="col02 stress">未支付</li>
                </c:if>
                <c:if test="${order.status=='1'}">
                    <li class="col02 stress">已支付</li>
                </c:if>

            </ul>
            <table class="order_list_table w980">
                <tbody>
                <tr>
                    <td width="55%">
                        <c:forEach items="${listDetail}" var="orderDe">
                            <c:if test="${order.orderId==orderDe.orderId}">
                                <ul class="order_goods_list clearfix">
                                    <li class="col01"><a
                                            href="../goods?flag=11&goodsId=${orderDe.goodsId}&typeId=2"><img
                                            src="images/goods/${orderDe.pic}"></a></li>
                                    <li class="col02">${orderDe.goodsName}<em>${orderDe.price}元/500g</em></li>
                                    <li class="col03">${orderDe.orderNumber}份</li>
                                    <li class="col04">
                                        <fmt:formatNumber type="number" value="${orderDe.price*orderDe.orderNumber}"
                                                          maxFractionDigits="2"/>
                                    </li>
                                </ul>
                                <ul id="appraise${order.orderId}${orderDe.goodsId}" class="appraise${order.orderId}"
                                    style="display: none">

                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $(".oper_btn${order.orderId}").click(function () {
                                                $(".appraise${order.orderId}").show();
                                            });
                                            $("#assess${order.orderId}${orderDe.goodsId}").click(function () {
                                                $("#appraise${order.orderId}${orderDe.goodsId}").hide();
                                                var com_text = $("#assessText${order.orderId}${orderDe.goodsId}").val();
                                                var praise = $("#assessLevel${order.orderId}${orderDe.goodsId}").val();
                                                var userId =${order.userId};
                                                var goodsId=${orderDe.goodsId};
                                                $.ajax({
                                                    type: "POST",
                                                    url: "../comment",
                                                    data:
                                                        {
                                                            flag:"4",
                                                            com_text: com_text,
                                                            praise: praise,
                                                            userId: userId,
                                                            goodsId: goodsId
                                                        },
                                                    dataType: "json",
                                            });
                                                $.ajax({
                                                    type: "POST",
                                                    url: "../order",
                                                    data:
                                                        {
                                                            flag:"7",
                                                            orderId:$("#assess${order.orderId}${orderDe.goodsId}").val()
                                                        },
                                                    dataType: "json",
                                                    success:function (msg) {
                                                        if (msg.judge){
                                                            //alert("评价成功，谢谢支持");
                                                            $('.oper_btn${order.orderId}').parent().html("已评价");
                                                        } else {
                                                            alert("评价失败!");
                                                        }
                                                    }
                                                });
                                            });
                                        });
                                        function del(th) {
                                            var value=$(th).prev().val();
                                            $.ajax({
                                                type: "POST",
                                                url: "../order",
                                                data:
                                                    {
                                                        flag:"8",
                                                        orderId:value
                                                    },
                                                dataType: "json",
                                                success:function () {
                                                }
                                            });


                                        }
                                    </script>

                                    <li>
                                        <div style="padding: 5px">
                                            <select style="margin: 5px"
                                                    id="assessLevel${order.orderId}${orderDe.goodsId}">
                                                <option value="1">非常满意</option>
                                                <option value="2">满意</option>
                                                <option value="3">一般</option>
                                                <option value="4">不满意</option>
                                                <option value="5">很不满意</option>
                                            </select>
                                            <input style="width: 350px" type="text"
                                                   id="assessText${order.orderId}${orderDe.goodsId}">
                                            <button id="assess${order.orderId}${orderDe.goodsId}" value="${order.orderId}">提交</button>
                                        </div>
                                    </li>
                                </ul>
                            </c:if>
                        </c:forEach>
                    </td>
                    <c:if test="${order.status=='0'}">
                        <input type="hidden" value="${order.orderId}">
                        <input type="hidden" value="${order.orderTotal}">
                        <td width="15%"><a href="alipay.trade.page.pay.jsp?userId=${user.userId}&total=${order.orderTotal}&orderId=${order.orderId}" target="_blank" class="oper_btn">去付款</a></td>
                        <td width="15%">￥${order.orderTotal}</td>
                        <td width="15%"> <input type="hidden" value="${order.orderId}"><a href="../order?flag=5&userId=${user.userId}" class="oper_btn" onclick="del(this)">取消订单</a></td>
                    </c:if>
                    <c:if test="${order.status=='1'}">
                        <td width="15%">已付款</td>
                        <td width="15%">￥${order.orderTotal}</td>
                        <td width="15%"><a href="#" class="oper_btn${order.orderId}">评价</a></td>
                    </c:if>
                    <c:if test="${order.status=='2'}">
                        <td width="15%">已付款</td>
                        <td width="15%">￥${order.orderTotal}</td>
                        <td width="15%">已评价</td>
                    </c:if>

                </tr>
                </tbody>
            </table>
        </c:forEach>
        <div class="pagenation">
            <a href="../order?flag=5&userId=${userId}&pagenum=1">首页</a>
            <a href="../order?flag=5&userId=${userId}&pagenum=${pagen-1}">上一页</a>
            <a href="#" class="active">${pagen}/${pagetatol}</a>
            <a href="../order?flag=5&userId=${userId}&pagenum=${pagen+1}">下一页></a>
            <a href="../order?flag=5&userId=${userId}&pagenum=${pagetatol}">末页</a>
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
<script type="text/javascript">

    function serach() {
        var goodsName = $('#serach').val();
        if (goodsName != null && "" != goodsName) {
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
    }


    $(document).ready(function () {
        $("#tan1").click(function () {
            alert("开发13");
        });
        $("#tan2").click(function () {
            alert("开发13");
        });

        $(".oper_btn${order.orderId}").click(function () {
            $(".appraise${order.orderId}").show();
        });
        $(".assess${order.orderId}").click(function () {
            $(".appraise${order.orderId}").hide();
        });
    });

</script>

</body>
</html>