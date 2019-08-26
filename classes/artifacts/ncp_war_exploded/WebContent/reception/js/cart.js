$(document).ready(function () {
    tongji();
    /**
     * 增加商品数量
     * @param th
     */
    addNum = function (th) {
        var n = parseInt($(th).next().val());//数量
        var m = parseFloat($(th).prev().prev().val());//单价
        var goodsId = parseFloat($(th).prev().val());//商品编号
        if (n < 100) {
            if (update(n + 1, goodsId)) {
                $(th).next().val(n + 1);
                $(th).parent().parent().next().html(((n + 1) * m).toFixed(2) + "元");
                tongji();
            } else {
                alert("操作失败!");
            }
        }
    };
    /**
     * 减少商品数量
     * @param th
     */
    delNum = function (th) {
        var n = parseInt($(th).prev().val());//单价
        var m = parseFloat($(th).parent().children("[name='price']").val());
        var goodsId = parseFloat($(th).parent().children("[name='goodsId']").val());//商品编号
        if (n > 1) {
            if (update(n - 1, goodsId)) {
                $(th).prev().val(n - 1);
                $(th).parent().parent().next().html(((n - 1) * m).toFixed(2) + "元");
                tongji();
            } else {
                alert("操作失败!");
            }
        }
    };

    /**
     * 跟新商品数量和价格
     * @param n
     * @param goodsId
     * @returns {boolean}
     */
    function update(n, goodsId) {
        var fount = false;
        $.ajax({
            url: "../cart",
            data: {
                flag: 5,
                userId: $('#userId').val(),
                goodsId: goodsId,
                number: n
            },
            cache: false,
            async: false,
            type: "POST",
            dataType: 'json',
            success: function (msg) {
                fount = msg.judge;
            }
        });
        return fount;
    };
    /**
     * 从购物车删除
     * @param th
     */

    deleteCart = function (th) {
        $.post(
            "../cart",
            {
                flag: 3,
                userId: $('#userId').val(),
                goodsId: $(th).parent().prev().prev().children().children("[name='goodsId']").val()
            },
            function (msg) {
                if (msg.judge) {
                    $(th).parent().parent().remove();
                    tongji();
                } else {
                    alert("删除商品失败!");
                }
            },
            'json'
        );
    };
    /**
     * 全选按钮
     * @param th
     */
    checkboxAll = function (th) {
        var cbs = document.getElementsByName("cb");
        for (var i = 0; i < cbs.length; i++) {
            if (th.checked) {
                cbs[i].checked = true;
            } else {
                cbs[i].checked = false;
            }
        }
        tongji();
    };
    /**
     * 单选点击
     * @param th
     */
    selectOne = function (th) {//切换checked状态
        $(th).checked = !$(th).checked;
        tongji();
    };

    /**
     * 统计选中的商品总价和数量
     */
    function tongji() {
        var cbs = document.getElementsByName("cb");
        var num = 0;//商品种类数
        var totals = 0;
        for (var i = 0; i < cbs.length; i++) {
            if (cbs[i].checked) {
                num++;
                var total = parseFloat($(cbs[i]).parent().parent().children("li:last-child").prev().html());//总价
                totals += total;
            }
        }
        $('#allGoodsNum').html(num);
        $('#goodsNum').html(num);
        $('#totals').html(totals.toFixed(2));
    }

    /**
     * 结算
     */
    settle = function () {
        var cbs = document.getElementsByName("cb");
        var goodsIds = new Array();
        var numbers = new Array();
        for (var i = 0; i < cbs.length; i++) {
            if (cbs[i].checked) {
                var goodsId = $(cbs[i]).prev().val();
                var number = $(cbs[i]).parent().parent().children('li:eq(5)').children().children("[name='number']").val();
                goodsIds.push(goodsId);
                numbers.push(number);
                var total = parseFloat($(cbs[i]).parent().parent().children("li:last-child").prev().html());//总价
                totals += total;

            }
        }
        if (goodsIds.length != 0) {
            $.post(
                "../cart",
                {
                    flag: 1,
                    userId: $('#userId').val(),
                    goodsIds: JSON.stringify(goodsIds),
                    numbers: JSON.stringify(numbers)
                }, function () {
                    location.href = "place_order.jsp";
                }
            );
        }
    }
});