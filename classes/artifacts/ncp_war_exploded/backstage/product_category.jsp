<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>产品分类</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
</head>


<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i></i><em>产品分类</em></span>
        <span class="modular fr"><a href="add_category.jsp" class="pt-link-btn">+添加新分类</a></span>
    </div>
    <div class="operate">
        <form action="../type" method="get">
            <input type="hidden" name="flag" value="6" />
            <input type="text" name="typeName" class="textBox length-long" placeholder="输入类别名称.." />
            <input type="submit" value="查询" class="tbBtn"/>
        </form>
    </div>
    <table class="list-style">
        <tr>
            <th>分类编号</th>
            <th>分类名称</th>

            <th>操作</th>
            <th>删除</th>
        </tr>

        <c:forEach items="${list}" var="type">

            <tr>

                <td class="center"><input type="checkbox" name="cb" value="${type.typeId}"/>${type.typeId}</td>
                <td style="text-indent:2em;"> ${type.typeName}</td>
                <td class="center"><a href="../type?flag=2&type_id=${type.typeId}" class="block" title="修改"><img
                        src="images/icon_edit.gif"/></a></td>
                <td class="center"><a href="../type?flag=4&type_id=${type.typeId}" class="block" title="移除"><img
                        src="images/icon_trash.gif"/></a></td>
            </tr>
        </c:forEach>

    </table>

    <!-- BatchOperation -->
    <div style="overflow:hidden;">
        <!-- Operation -->
        <div class="BatchOperation fl">
            <input type="checkbox" id="cheall"/>
            <label for="cheall" class="btnStyle middle" type="button" >全选</label>
            <input type="button" value="删除选中类别" class="btnStyle" style="background: red" onclick="deleteType()" />
        </div>
        <!-- turn page -->
        <div class="turnPage center fr">
            <a>第一页</a>
            <a>1</a>
            <a>最后一页</a>
        </div>
    </div>
</div>
<script>
function deleteType(){
    var checkBox=document.getElementsByName("cb")
    var num=checkBox.length;
    var ids="";
    for (var index=0;index<num;index++){
        if(checkBox[index].checked){
            ids+=checkBox[index].value+",";
        }
    }
    if(ids!=""){
        if(window.confirm("确定删除所选记录？")){
         $.post('../type',{flag: "5",ids:ids},
             function () {
             window.location.href="../type";
             }
             );
        }
    }else{
        alert("请选择要删除的记录");
    }
}
window.onload=function(){
    document.getElementById("cheall").onchange = function(){
        var cbs = document.getElementsByName("cb");
        for (var i = 0; i < cbs.length; i++) {
            cbs[i].checked = !cbs[i].checked;
        }
    }
}
</script>
</body>
</html>