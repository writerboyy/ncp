$(document).ready(function () {
    myPost();

    /**
     * 更细购物车的数量状态
     */
    function myPost() {
        $.post(
            "../cart",
            {
                flag: 4,
                userId: $('#userId').val(),
            },
            function (msg) {
                $('#show_count').html(msg.num);
            },
            'json'
        );
    }

    /**
     * 增加商品数量
     */
    $('#addNum').click(function () {
        var n = parseInt($('#number').val());
        var m = parseFloat($('#price').val());
        if (n < $('#stock').val()) {
            $('#number').val(n + 1);
            $('#total').html(((n + 1) * m).toFixed(2) + "元");
        }
    });
    /**
     * 减少商品数量
     */
    $('#delNum').click(function () {
        var n = parseInt($('#number').val());
        var m = parseFloat($('#price').val());
        if (n > 1) {
            $('#number').val(n - 1);
            $('#total').html(((n - 1) * m).toFixed(2) + "元");
        }
    });

    /**
     * 点击购买
     */
    $("#buy").click(function () {
        var userId = $('#userId').val();
        var goodsId = $('#goodsId').val();
        if (userId.length != 0) {
                $.post(
                    "../cart",
                    {
                        flag: 1,
                        userId: userId,
                        goodsIds:JSON.stringify([goodsId]),
                        numbers: JSON.stringify([$('#number').val()])
                    },function () {
                        location.href="place_order.jsp";
                    }
                );
        } else {
            location.href = "login.jsp";
        }
    });
    /**
     * 添加该商品到购物车
     */
    $("#add_cart").click(function () {
        var userId = $('#userId').val();
        var goodsId = $('#goodsId').val();
        if (userId.length != 0) {
            $.post()
            $.post(
                "../cart",
                {
                    flag: 2,
                    goodsId: goodsId,
                    userId: userId,
                    number: $('#number').val()
                },
                function (msg) {
                    if (msg.judge) {//添加成功
                        myPost();
                    } else {//添加失败
                        alter("添加失败!");
                    }
                },
                "json"
            );
        } else {
            location.href = "login.jsp";
        }
    });
});