<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品评论</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="js/recycle.js"></script>
</head>
<style>
    .nei {
        display: inline-block;
        border: 1px #8ca3c0 solid;
        padding: 5px 10px;
        cursor: pointer;
        background: #96aecd;
        color: #fff;
    }
</style>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i></i><em>商品评论</em></span>
    </div>

    <table class="list-style" id="table">
        <tr>
            <th>ID编号</th>
            <th>用户编号</th>
            <th>产品</th>
            <th>名称</th>
            <th>评论</th>
            <th>好评</th>
            <th>时间</th>
            <th>操作</th>
        </tr>
    </table>
    <!-- BatchOperation -->
    <div style="overflow:hidden;">
        <!-- Operation -->
        <div class="BatchOperation fl">
            <input type="button" value="全选" class="btnStyle" id="checkAll"/>
            <input type="button" value="取消全选" class="btnStyle" id="cancel"/>
            <input type="button" value="删除选定商品" class="btnStyle" id="dele"/>
        </div>
        <!-- turn page -->
        <div class="turnPage center fr">
            <input type="button" id="first" value="第一页" class="nei"/>
            <input type="button" id="before" value="上一页" class="nei"/>
            <a id="pagenation"></a>
            <input type="button" id="after" value="下一页" class="nei"/>
            <input type="button" id="last" value="最后一页" class="nei"/>
        </div>
    </div>
</div>
</body>
</html>