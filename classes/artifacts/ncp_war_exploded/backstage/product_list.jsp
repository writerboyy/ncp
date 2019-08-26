﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>产品列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="js/public.js"></script>
</head>


<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i></i><em>产品列表</em></span>
        <span class="modular fr"><a href="edit_product.jsp" class="pt-link-btn">+添加商品</a></span>
    </div>
    <div class="operate">
        <form action="../goods" method="get">
            <input type="hidden" name="flag" value="5"/>

            <select name="select" class="inline-select">
                <option value="0">请选择</option>
                <c:forEach items="${typeList}" var="type">
                    <option value="${type.typeId}">${type.typeName}</option>
                </c:forEach>
            </select>

            <input type="text" name="goodsName" class="textBox length-long" placeholder="输入产品名称..."/>
            <input type="submit" value="查询" class="tdBtn"/>
        </form>
    </div>
    <table class="list-style Interlaced">
        <tr>
            <th>ID编号</th>
            <th>产品</th>
            <th>名称</th>
            <th>市场价</th>
            <%--<th>会员价</th>--%>
            <th>库存</th>
            <th><a href="../goods?flag=6">销量</a></th>
            <th>操作</th>
        </tr>

        <c:forEach items="${list}" var="goods">
            <tr>
                <td>
     <span>
     <input type="checkbox" name="choose" id="choose" value="${goods.goodsId}" class="middle children-checkbox"/>
     <i>${goods.goodsId}</i>
     </span>
                </td>

                <td class="center pic-area"><img src="../reception/images/goods/${goods.pic}" class="thumbnail"/></td>

                <td class="td-name">
                    <span class="ellipsis td-name block">${goods.goodsName}</span>
                </td>


                <td class="center">
     <span>
      <i>￥</i>
      <em>${goods.price}</em>
     </span>
                </td>

               <%-- <td class="center">
     <span>
      <i>￥</i>
      <em>0.00</em>
     </span>
                </td>--%>

                <td class="center">
     <span>
      <em>${goods.stock}</em>
      <i>件</i>
     </span>
                </td>

                <td class="center"><em>${goods.salesNumber}</em>
                </td>

                <td class="center">
                    <a href="../goods?flag=2&goodsId=${goods.goodsId}" title="编辑"><img src="images/icon_edit.gif"/></a>
                    <a href="../goods?flag=4&goodsId=${goods.goodsId}" title="删除"><img src="images/icon_drop.gif"/></a>
                </td>

            </tr>
        </c:forEach>
    </table>
    <!-- BatchOperation -->
    <div style="overflow:hidden;">
        <!-- Operation -->
        <div class="BatchOperation fl">
            <input type="button" value="全选" class="btnStyle" id="checkAll"/>
            <input type="button" value="取消全选" class="btnStyle" id="cancel"/>
            <input type="button" value="删除选定商品" class="btnStyle" id="dele" />
        </div>
        <!-- turn page -->
        <div class="turnPage center fr">
            <a href="../goods?flag=0&pagenum=1">第一页</a>
            <a href="../goods?flag=0&pagenum=${page-1}">上一页</a>
            <a>${page}/${pageTotal}</a>
            <a href="../goods?flag=0&pagenum=${page+1}">下一页</a>
            <a href="../goods?flag=0&pagenum=${pageTotal}">最后一页</a>
        </div>
    </div>
</div>
<script type="application/javascript">
    $(function () {
        $("#checkAll").click(function () {
            var arr = document.getElementsByName("choose");
            for (var i = 0; i < arr.length; i++) {
                arr[i].checked = true;
            }
        })

        $("#cancel").click(function () {
            var arr = document.getElementsByName("choose");
            for (var i = 0; i < arr.length; i++) {
                arr[i].checked = false;
            }
        })

        $("#dele").click(function () {
            var arr = document.getElementsByName("choose");
            var str = "";
            for (var i = 0; i < arr.length; i++) {
                if (arr[i].checked == true) {
                    str += arr[i].value + ",";
                }
            }
            if (str!="") {
                window.confirm("确定要删除选择商品吗？");
                $.post("../goods",
                    {flag: "8", str: str},
                    function () {
                        window.location.href="../goods";
                    }
                )
            }else{
                alert("请选择商品");
            }
        })

    })

</script>
</body>
</html>