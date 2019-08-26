<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>浓郁-用户中心</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <script>
        $.ajax({
            type: "POST",
            url: "../comment",
            xhrFields: {
                withCredentials: true
            },
            data:
                {
                    flag: 6,
                    pagenum: 1,
                },
            dataType: "json",
            success: function (data) {
                yemian(data);
            }
        });
    </script>
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
</head>
<body>
<input type="hidden" id="userId" value="${user.userId}">
<input type="hidden" id="grade" value="${user.grade}">
<input type="hidden" id="tell" value="${user.tell}">
<input type="hidden" id="password" value="${user.password}">
<input type="hidden" id="address" value="${user.address}">
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
<%--        <input type="text" class="input_text fl" name="" placeholder="搜索评论" id="serach">--%>
<%--        <input type="button" class="input_btn fr" name="" value="搜索" onclick="serach()">--%>
<%--    </div>--%>
</div>

<div class="main_con clearfix">
    <div class="left_menu_con clearfix">
        <h3>用户中心</h3>
        <ul>
            <li><a href="user_center_info.jsp">· 个人信息</a></li>
            <c:if test="${user==null}">
                <li><a href="login.jsp">· 我的订单</a></li>
            </c:if>
            <c:if test="${user!=null}">
                <li><a href="../order?flag=5&userId=${user.userId}">· 我的订单</a></li>
            </c:if>
            <li><a href="user_center_site.jsp">· 收货地址</a></li>
            <li><a href="user_center_critic.jsp" class="active">· 我的评论</a></li>
        </ul>
    </div>
    <div class="right_content clearfix">
        <table class="order_list_table w980" id="yiPing">
        </table>
        <div class="turnPage center fr">
            <input type="button" id="first" value="第一页" class="nei"/>
            <input type="button" id="before" value="上一页" class="nei"/>
            <a id="pagenation"></a>
            <input type="button" id="after" value="下一页" class="nei"/>
            <input type="button" id="last" value="最后一页" class="nei"/>
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

    //未评论
    function weiping() {
        $("#weiPing").show();
        $("#yiPing").hide();
    }

    $("#bianji1").click(function () {
        $("#pingLun3").hide();
        $("#pingLun4").show();
    })

    $("#tijiao1").click(function () {
        $("#pingLun4").hide();
        $("#pingLun3").show();
    })

    //已评论
    $("#yiping").click(function () {
        $("#yiPing").show();
        $("#weiPing").hide();
        $.ajax({
            type: "POST",
            url: "../comment",
            xhrFields: {
                withCredentials: true
            },
            data:
                {
                    flag: 6,
                    pagenum: 1,
                },
            dataType: "json",
            success: function (data) {
                yemian(data);
            }
        });
    });

    deleteCom = function (th) {
        var id = $(th).prev().val();
        console.log(id);
        window.confirm("确定要删除吗？");
        $.post("../comment",
            {flag: "5", comId: id},
            function () {
                window.location.href = "user_center_critic.jsp";
            }
        )
    }

    var $list;
    var $page;
    var $pageTotal;

    $("#first").click(function () {
        $.ajax({
            type: "POST",
            url: "../comment",
            data:
                {
                    flag:6,
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
                    flag: 6,
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
                    flag: 6,
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
                    flag: 6,
                    pagenum: $page + 1
                },
            dataType: "json",
            success: function (data) {
                yemian(data);
            }
        })
    })


    function yemian(data) {
        //var str = "";
        $("#yiPing").html("");
        $list = data[0];
        $page = parseInt(data[1]);
        $pageTotal = parseInt(data[2]);
        for (var i = 0; i < $list.length; i++) {
            var tr = "<tr>\n" +
                "                <td width=\"30%\">\n" +
                "                    <ul class=\"order_goods_list clearfix\">\n" +
                "                        <li class=\"col01\"><a href=\"../goods?flag=11&goodsId=" + $list[i].goodsId + "&typeId=2\"><img\n" +
                "                                src=\"images/goods/" + $list[i].pic + "\"></a></li>\n" +
                "                        <li class=\"col02\"><em>" + $list[i].goodsName + "</em></li>\n" +
                "                    </ul>\n" +
                "                </td>\n" +
                "                <td width=\"35%\">\n" +
                "                <div style=\"width: 100%\" id=\"pingLun1\">\n" +
                "                    <span>" + $list[i].comment + "</span>\n" +
                "                </div>\n" +
                "                </td>\n" +
                "                <td width=\"25%\">\n" +
                "                <div style=\"width: 100%\" id=\"pingLun1\">\n" +
                "                    <span style=\"left: 10px\">" + formatDateTime($list[i].date) + "</span>\n" +
                "                </div>\n" +
                "                </td>\n" +
                "            <td width=\"10%\">" +
                "<input type=\"hidden\" value=\"" + $list[i].comId + "\" />" +
                "<a href=\"#\" class=\"oper_btn\" onclick='deleteCom(this);'>删除</a></td>\n" +
                "            </tr>";
            //str += "<div class='div1'><div class='text'>" + $list[i].comment + "</div><div class='date'>" + formatDateTime($list[i].date) + "</div></div>";
            $('#yiPing').append(tr);
        }
        $("#pagenation").html($page + "/" + $pageTotal);

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


    $(document).ready(function () {
        $("#tan1").click(function () {
            alert("开发13");
        });
        $("#tan2").click(function () {
            alert("开发13");
        });
    });

    //搜索
    function serach() {
        var goodName = $('#serach').val();
        if (goodName != null && "" != goodName) {
            $.post("../goods",
                {
                    flag: '10',
                    goodsName: goodName
                },
                function (data) {
                    window.location.href = "list.jsp";
                }
            );
        }
    }
</script>
</body>
</html>