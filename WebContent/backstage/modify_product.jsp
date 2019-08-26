<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>产品列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style/adminStyle.css" rel="stylesheet" type="text/css"/>
    <link href="style/upLoad.css" rel="stylesheet" type="text/css"/>
    <script src="js/upLoad.js"></script>
</head>
<body>
<div class="wrap">
    <div class="page-title">
        <span class="modular fl"><i class="add"></i><em>编辑产品</em></span>
        <span class="modular fr"><a href="../goods" class="pt-link-btn">产品列表</a></span>
    </div>
    <form onsubmit="return validate()" action="../goods" method="post" enctype="multipart/form-data">
        <input type="hidden" name="goodsId" value="${goods.goodsId}"/>
        <table class="list-style">
            <tr>
                <td style="text-align:right;width:15%;">产品名称：</td>
                <td><input name="goodsName" type="text" id="goodsName" class="textBox length-long"
                           value="${goods.goodsName}"/><span name="test" style="display: none"></span></td>
            </tr>
            <tr>
                <td style="text-align:right;">产品分类：</td>
                <td>
                    <select NAME="select" id="select" class="inline-select">
                        <option VALUE="0">请选择</option>
                        <c:forEach items="${typeList}" var="type">
                            <option VALUE="${type.typeId}">${type.typeName}</option>
                        </c:forEach>
                    </select>
                    <span name="test" style="display: none"></span>
                </td>
            </tr>

            <tr>
                <td style="text-align:right;">市场价：</td>
                <td>
                    <input name="price" id="price" type="text" value="${goods.price}" class="textBox length-short"/>
                    <span>元</span>
                </td>
            </tr>
            <%-- <tr>
              <td style="text-align:right;">会员价：</td>
              <td>
               <input type="text" class="textBox length-short"/>
               <span>元</span>
              </td>
             </tr>--%>
            <tr>
                <td style="text-align:right;">库存：</td>
                <td>
                    <input name="stock" id="stock" type="text" value="${goods.stock}" class="textBox length-short"/>
                    <span>个</span>
                </td>
            </tr>
            <!-- <tr>
              <td style="text-align:right;">推荐至：</td>
              <td>
               <input type="checkbox" name="tuijian" id="jingpin"/>
               <label for="jingpin">精品</label>
               <input type="checkbox" name="tuijian" id="xinpin"/>
               <label for="xinpin">新品</label>
               <input type="checkbox" name="tuijian" id="rexiao"/>
               <label for="rexiao">热销</label>
              </td>
             </tr>-->

            <tr>
                <td style="text-align:right;">商品图片：</td>
                <td>
                    <div id="div_pic" style="height: 100px;width: 100%">
                        <div class="uploadImgBtn" id="uploadImgBtn">
                            <input class="uploadImg" type="file" name="file" multiple id="file">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;">产品详情：</td>
                <td><textarea name="text" class="textarea">${goods.text}</textarea></td>
            </tr>
            <tr>
                <td style="text-align:right;"></td>
                <td><input type="submit" value="发布新商品" class="tdBtn"/></td>
            </tr>
        </table>
    </form>
</div>
<script>
    var $goodName = $("#goodsName").val();

    goodsname = function (data) {
        var fount = false;
        var $goodsName = $("#goodsName").val();
        var len = $goodsName.length;
        if (len < 1) {
            $("#goodsName").next().show();
            $("#goodsName").next().css("color", "red");
            $("#goodsName").next().html("商品名不可用");
            fount = false;
        } else {
            $("#select").next().hide();
            if (data == $goodsName) {
                $("#goodsName").next().show();
                $("#goodsName").next().css("color", "red");
                $("#goodsName").next().html("商品名可用");
                fount = true;
            } else {
                $.ajax({
                    type: "POST",
                    url: "../goods",
                    data: {
                        "flag": 20,
                        "goodsName": $goodsName
                    },
                    async: false,
                    success: function (msg) {
                        if (msg == 0) {
                            $("#goodsName").next().show();
                            $("#goodsName").next().css("color", "red");
                            $("#goodsName").next().html("商品名可用");
                            fount = true;
                        } else {
                            $("#goodsName").next().show();
                            $("#goodsName").next().css("color", "red");
                            $("#goodsName").next().html("商品名不可用");
                            fount = false;
                        }
                    }
                });
            }
        }
        return fount;
    }

    sele = function () {
        var fount = false;
        if ($("#select").val() == 0) {
            $("#select").next().show();
            $("#select").next().css("color", "red");
            $("#select").next().html("请选择类型");
            fount = false;
        } else {
            $("#select").next().hide();
            fount = true;
        }
        return fount;
    }

    price = function () {
        var fount = false;
        var $price = $("#price").val();
        var yan = /(^[+]?(\d{1,5}(\.\d{1,2})?$))|(^[+]?[0]{1}(\.\d{1,2})?$)/;
        if (!yan.test($price)) {
            $("#price").next().show();
            $("#price").next().css("color", "red");
            $("#price").next().html("输入错误");
            fount = false;
        } else {
            $("#price").next().hide();
            fount = true;
        }
        return fount;
    }
    stock = function () {
        var fount = false;
        var $stock = $("#stock").val();
        var yan = /^([1-9]\d{0,4}|100000)$/;
        if (!yan.test($stock)) {
            $("#stock").next().show();
            $("#stock").next().css("color", "red");
            $("#stock").next().html("输入错误");
            fount = false;
        } else {
            $("#stock").next().hide();
            fount = true;
        }
        return fount;
    }

    validate = function () {
        return goodsname($goodName) && sele() && price() && stock();
    }


    $("#goodsName").blur(function () {
        goodsname($goodName);
    });


    $("#select").blur(function () {
        sele();
    });

    $("#price").blur(function () {
        price();
    });
    $("#stock").blur(function () {
        stock();
    });


</script>
</body>
</html>