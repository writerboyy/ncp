<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会员列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="js/public.js"></script>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="user"></i><em>会员列表</em></span>
        <span class="modular fr"><a href="add_user.jsp" class="pt-link-btn">+添加新会员</a></span>
    </div>
    <div class="operate">
        <form action="../user?flag=7" method="post">
            <select class="inline-select" name="grade">
                <option>选择会员等级</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
            </select>
            <input type="text" class="textBox length-long" placeholder="输入会员昵称、手机号码..." name="nameOrTell"/>
            <input type="submit" value="查询" class="tdBtn"/>
        </form>
    </div>
    <table class="list-style Interlaced">
        <tr>
            <th>编号</th>
            <th>会员昵称</th>
            <th>会员地址</th>
            <th>手机号码</th>
            <th>是否验证</th>
            <th>会员等级</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${userList}" var="user">

                <tr>
                    <td>
                        <input type="checkbox" name="choose" id="allDel" value="${user.userId}"/>
                        <span class="middle">${user.userId}</span>
                    </td>
                    <td class="center">${user.userName}</td>
                    <td class="center">${user.address}</td>
                    <td class="center">${user.tell}</td>
                    <c:choose>
                        <c:when test="${user.grade<2}">
                        <td class="center"><img src="images/no.gif"/></td>
                        </c:when>
                        <c:when test="${user.grade>1}">
                            <td class="center"><img src="images/yes.gif"/></td>
                        </c:when>
                    </c:choose>
                    <td class="center">
     <span>
             ${user.grade}
     </span>
                    </td>
                    <td class="center">
                        <a href="../user?flag=1&uid=${user.userId}" class="inline-block" title="编辑"><img
                                src="images/icon_edit.gif"/></a>
                        <a class="inline-block" title="删除" href="javascript:void (0)"
                           onclick="oneDelete(${user.userId});"><img src="images/icon_drop.gif"/></a>
                    </td>
                </tr>
        </c:forEach>

    </table>
    <!-- BatchOperation -->
    <div style="overflow:hidden;">
        <!-- Operation -->
        <div class="BatchOperation fl">
            <input type="checkbox" id="del"/>
            <label for="del" class="btnStyle middle">全选</label>
            <input type="button" value="批量删除" class="btnStyle" id="dele"/>
        </div>
        <!-- turn page -->
        <div class="turnPage center fr">
            <a href="../user?flag=${flag}&iPageNo=1&nameOrTell=${nameOrTell}&grade=${grade}">首页</a>
            <a href="../user?flag=${flag}&iPageNo=${iPageNo-1}&nameOrTell=${nameOrTell}&grade=${grade}">上一页</a><a>第${iPageNo}页 </a><a
                href="../user?flag=${flag}&iPageNo=${iPageNo+1}&nameOrTell=${nameOrTell}&grade=${grade}">下一页</a> <a
                href="../user?flag=${flag}&iPageNo=${totalPage}&nameOrTell=${nameOrTell}&grade=${grade}">末页</a>
        </div>
    </div>
</div>
<script>
    //删除一条
    function oneDelete(id) {
        if (window.confirm("确定删除？")) {
            var userId = id;
            $.post("../user", {flag: "3", userId: userId}, function () {
                window.location.href = "../user";
            })
        }
    }

    $(function () {
        //全选
        $("#del").change(function () {
            var arr = document.getElementsByName("choose");
            for (var i in arr) {
                arr[i].checked = this.checked;
            }
        })
        $("#dele").click(function () {
            var arr = document.getElementsByName("choose");
            var delArr = "";
            for (var i = 0; i < arr.length; i++) {
                if (arr[i].checked == true) {
                    delArr += arr[i].value + ",";
                }
            }
            if (delArr!="") {
                if(window.confirm("确定要删除选择的用户吗？")) {
                    $.post("../user",
                        {flag: "8", delArr: delArr},
                        function () {
                            window.location.href = "../user";
                        }
                    )
                }
            }else{
                alert("请选择用户！");
            }
        })
    })
</script>
</body>
</html>