$.post(
    "../order",
    {
        flag: 6
    },
    function (msg) {
        $('#orderNum1').html(msg.num1);
        $('#orderNum2').html(msg.num2);
        $('#orderNum3').html(msg.num3);
    },
    'json'
);
$.post(
    "../goods",
    {
        flag: 12
    },
    function (msg) {
        $('#goodsNum1').html(msg.num1);
        $('#goodsNum2').html(msg.num2);
        $('#goodsNum3').html(msg.num3);
    },
    'json'
);
$.post(
    "../user",
    {
        flag: 13
    },
    function (msg) {
        $('#userNum1').html(msg.num1);
        $('#userNum2').html(msg.num2);
        $('#userNum3').html(msg.num3);
    },
    'json'
);