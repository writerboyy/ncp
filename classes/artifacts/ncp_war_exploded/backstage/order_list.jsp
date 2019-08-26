<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="js/public.js"></script>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="order"></i><em>订单列表</em></span>
    </div>
    <div class="operate">
        <form action="../order?flag=3" method="post">
            <img src="images/icon_search.gif"/>
            <input type="text" id="userName" name="userName" class="textBox length-long" placeholder="输入用户名..." value="${userNameOld}"/>
            <select class="inline-select" name="status" id="status" >
                <c:if test="${empty statusTxt} "><option value="">选择订单状态</option></c:if>
                <c:if test="${not empty statusTxt}"> <option value=${statusOld} selected="selected">${statusTxt}</option></c:if>
                <option value="">全部订单</option>
                <option value="0">未付款</option>
                <option value="1">已付款</option>
                <option value="2">已评价</option>
            </select>
            <input type="submit" value="查询" class="tdBtn"/>
            <span>查询到${barstotal}条订单信息</span>
        </form>
    </div>
    <table class="list-style Interlaced">
        <tr>
            <th>订单编号</th>
            <th>下单时间</th>
            <th>收件人</th>
            <th>订单金额</th>
            <th>订单状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${OrderList}" var="order">
            <tr>

                <td>
                    <input type="checkbox" name="dd" value="${order.orderId}"/>
                    <a href="../orderDetail?flag=1&orderId=${order.orderId}">
                                ${order.orderId}
                    </a>
                </td>
                <td class="center">
                    <span class="block">${order.userName}</span>
                    <span class="block">${order.orderDate}</span>
                </td>
                <td width="450">
                    <span class="block">${order.userName}[${order.tell}]</span>
                    <address>${order.address}</address>
                </td>
                <td class="center">
                    <span><i>￥</i><b>${order.orderTotal}</b></span>
                </td>
                <td class="center">
                    <c:if test="${order.status=='0'}"><span>未付款</span></c:if>
                    <c:if test="${order.status=='1'}"><span>已付款</span></c:if>
                    <c:if test="${order.status=='2'}"><span>已评价</span></c:if>
                </td>
                <td class="center">
                    <a href="../orderDetail?flag=1&orderId=${order.orderId}" class="inline-block" title="查看订单"><img
                            src="images/icon_view.gif"/></a>
                    <a href="../order?flag=2&orderId=${order.orderId}" class="inline-block" title="删除订单"><img
                            src="images/icon_trash.gif"/></a>
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
            <input type="button" value="打印订单" class="btnStyle"/>
            <input type="button" value="配货" class="btnStyle"/>
            <input type="button" value="删除选定订单" class="btnStyle" onclick="deleSeltedRecords()" />
        </div>
        <!-- turn page -->
        <div class="turnPage center fr">
            <a href="../order?flag=${flagOld}&pagenum=1&status=${statusOld}&userName=${userNameOld}">第一页</a>
            <a href="../order?flag=${flagOld}&pagenum=${pagen-1}&status=${statusOld}&userName=${userNameOld}">上一页</a>
            <a>${pagen}/${pagetatol}</a>
            <a href="../order?flag=${flagOld}&pagenum=${pagen+1}&status=${statusOld}&userName=${userNameOld}">下一页</a>
            <a href="../order?flag=${flagOld}&pagenum=${pagetatol}&status=${statusOld}&userName=${userNameOld}">最后一页</a>
        </div>
    </div>
</div>
</body>
<script>
    function deleSeltedRecords(){
        var chckBox = document.getElementsByName("dd");
        var num = chckBox.length;
        var ids = "";
        for(var index =0 ; index<num ; index++){
            if(chckBox[index].checked){
                ids += chckBox[index].value + ",";
            }
        }
        if(ids!=""){
            if(window.confirm("确定删除所选记录？")){
                $.post(
                    '../order',
                    { flag: "4",ids:ids},
                    function (){
                        window.location.href="../order";
                    }
                );
            }
        }else{
            alert("请选择要删除的记录");
        }
    }
    window.onload = function () {
        //全选
        document.getElementById("checkAll").onclick = function () {
            var cbs = document.getElementsByName("dd");
            for (var i = 0; i < cbs.length; i++) {
                cbs[i].checked = true;
            }
        }
        //取消全选
        document.getElementById("cancel").onclick = function () {
            var cbs = document.getElementsByName("dd");
            for (var i = 0; i < cbs.length; i++) {
                cbs[i].checked = false;
            }
        }
    }
</script>
</html>
