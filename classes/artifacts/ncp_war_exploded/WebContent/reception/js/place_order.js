submitOrder = function () {
    var fount = false;
    var userId = $('#userId').val();
    if (userId.length != 0) {
        $.ajax({
            url: "../buy",
            data: {
                flag: 2,
                userId: userId,
                total: $('#total').val()
            },
            cache: false,
            async: false,
            type: "post",
            dataType: 'json',
            success: function (msg) {
                if (msg.order_Id.length != 0) {
                    var val = $('input[name="pay_style"]:checked').val();
                    if (val==1) {
                        $('#orderId').val(msg.order_Id);
                        var w = window.open("alipay.trade.page.pay.jsp?userId=" + userId + "&total=" + $('#total').val() + "&orderId=" + msg.order_Id, "_blank");
                        location.href = "index.jsp";
                    }else {
                        location.href = "../order?flag=5&userId=" + userId;
                    }
                } else {
                    fount = false;
                    alert("生成订单失败！");
                }
            }
        });
    } else {
    }
    return fount;
}
$(document).ready(function () {
    $("#tan1").click(function () {
        alert("开发13");
    });
    $("#tan2").click(function () {
        alert("开发13");
    });
});