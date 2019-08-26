<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台管理中心起始页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <style>html, body {
        width: 100%;
        height: 100%;
    }</style>
    <!--<script src="js/eject.js"></script>-->
    <script src="js/public.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
<div class="wrap start-page">
    <h1><i class="home-icon"></i>欢迎回到${user.userName}站点管理中心</h1>
    <dl>
        <dt>订单统计信息</dt>
        <dd>
            <ul>
                <li>
                    <span>未付款订单：</span>
                    <span id="orderNum3">0</span>
                </li>
                <li>
                    <span>已付款订单：</span>
                    <span id="orderNum2">0</span>
                </li>
                <li>
                    <span>全部订单：</span>
                    <span id="orderNum1">0</span>
                </li>
            </ul>
        </dd>
    </dl>

    <dl>
        <dt>商品统计信息</dt>
        <dd>
            <ul>
                <li>
                    <span>商品总数：</span>
                    <span id="goodsNum1">0</span>
                </li>
                <li>
                    <span>商品总数量：</span>
                    <span id="goodsNum2">0</span>
                </li>
                <li>
                    <span>总销量：</span>
                    <span id="goodsNum3">0</span>
                </li>
            </ul>
        </dd>
    </dl>

    <dl>
        <dt>会员统计信息</dt>
        <dd>
            <ul>
                <li>
                    <span>白金会员：</span>
                    <span id="userNum1">0</span>
                </li>
                <li>
                    <span>黄金会员：</span>
                    <span id="userNum2">0</span>
                </li>
                <li>
                    <span>普通会员：</span>
                    <span id="userNum3">0</span>
                </li>
            </ul>
        </dd>
    </dl>
</div>
</body>
</html>