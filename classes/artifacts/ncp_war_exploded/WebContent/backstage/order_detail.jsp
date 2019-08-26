<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>订单详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="order"></i><em>订单编号：${odList[0].orderId}</em></span>
    </div>
    <dl class="orderDetail">
        <dt class="order-h">订单详情</dt>
        <dd>
            <ul>
                <li>
                    <span class="h-cont h-right">收件人姓名：</span>
                    <span class="h-cont h-left">${odUser.userName}</span>
                </li>
                <li>
                    <span class="h-cont h-right">联系电话：</span>
                    <span class="h-cont h-left">${odUser.tell}</span>
                </li>
                <li>
                    <span class="h-cont h-right">联系地址：</span>
                    <span class="h-cont h-left">${odUser.address}</span>
                </li>
                <li>
                    <span class="h-cont h-right">付款状态：</span>
                    <c:if test="${order.status eq '0'}">
                        <span class="h-cont h-left">未付款</span>
                    </c:if>
                    <c:if test="${order.status>'0'}">
                        <span class="h-cont h-left">已付款</span>
                    </c:if>
                </li>
                <li>
                    <span class="h-cont h-right">下单时间：</span>
                    <span class="h-cont h-left">${order.orderDate}</span>
                </li>
                <li>
                    <span class="h-cont h-right">付款时间：</span>
                    <span class="h-cont h-left">${order.payDate}</span>
                </li>
            </ul>
        </dd>
        <dd style="padding:1em 0;">
            <span><b>订单留言：</b></span>
            <span>${odUser.address}</span>
        </dd>
        <dd>
            <table class="list-style">
                <tr>
                    <th>缩略图</th>
                    <th>产品</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <c:forEach items="${odList}" var="od">

                    <tr>
                        <td><img src="../reception/images/goods/${od.pic}" class="thumbnail"/></td>
                        <td>${od.goodsName}</td>
                        <td>
       <span>
        <i>￥</i>
        <em>${od.price}</em>
       </span>
                        </td>
                        <td>${od.orderNumber}</td>
                        <td>
       <span>
        <i>￥</i>
        <em>
            <fmt:formatNumber type="number" value="${od.price * od.orderNumber}" pattern="0.00" maxFractionDigits="2"/>
        </em>
       </span>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5">
                        <div class="fr">
        <span style="font-size:15px;font-weight:bold;">
         <i>订单共计金额：￥</i>
         <b>${order.orderTotal}</b>
        </span>
                        </div>
                    </td>
                </tr>
            </table>
        </dd>
        <dd>
            <!-- Operation -->
            <div class="BatchOperation">
                <input type="button" value="打印订单" class="btnStyle"/>
                <input type="button" value="配送" class="btnStyle"/>
                <input type="button" value="发货" class="btnStyle"/>
                <input type="button" value="取消订单" class="btnStyle"/>
            </div>
        </dd>
    </dl>
</div>
</body>
</html>