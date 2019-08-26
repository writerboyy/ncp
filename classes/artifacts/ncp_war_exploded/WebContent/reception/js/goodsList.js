$(document).ready(function () {
    myPost();
    /**
     * 点击添加到购物车
     * @type {Function}
     */
    addCartGoods = (function (th) {
        var userId = $('#userId').val();
        var goodsId = $(th).prev().val();
        if (userId.length != 0) {
            $.post(
                "../cart",
                {
                    flag: 2,
                    goodsId: goodsId,
                    userId: userId,
                    number: 1
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

    /**
     * 刷新购车显示数量
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
});