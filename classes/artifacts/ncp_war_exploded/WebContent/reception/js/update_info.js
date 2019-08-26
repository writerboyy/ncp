function serach() {
    var goodsName = $('#serach').val();
    if (goodsName != null && "" != goodsName) {
        $.post("../goods",
            {
                flag: '10',
                goodsName: goodsName
            },
            function (data) {
                window.location.href = "list.jsp";
            }
        );
    }
}

function bianji() {
    $("#user_name1").removeAttr("type");
    $("#user_name1").attr("type", "hidden");
    $("#user_name2").show();
    $("#tell1").removeAttr("type");
    $("#tell1").attr("type", "hidden");
    $("#tell2").show();
    $("#password1").removeAttr("type");
    $("#password1").attr("type", "hidden");
    $("#password2").show();
    $("#bianji2").removeAttr("type");
    $("#bianji2").attr("type", "hidden");
    $("#bianji1").removeAttr("type");
    $("#bianji1").attr("type", "button");
    $("#zhang").hide();
    $("#chong").hide();
    $("#error_t").hide();
    $("#error_p").hide();
}

function bianJi() {
    $("#user_name1").removeAttr("type");
    $("#user_name1").attr("type", "text");
    $("#user_name2").hide();
    $("#tell1").removeAttr("type");
    $("#tell1").attr("type", "text");
    $("#tell2").hide();
    $("#password1").removeAttr("type");
    $("#password1").attr("type", "password");
    $("#password2").hide();
    $("#bianji2").removeAttr("type");
    $("#bianji2").attr("type", "button");
    $("#bianji1").removeAttr("type");
    $("#bianji1").attr("type", "hidden");
}


var temp1;
var temp2;
var temp3;

//验证用户名
function check_u() {
    var user_name1 = $("#user_name1").val();
    var len = user_name1.length;
    var user_id = $("#user_id").val();
    if (len < 3 || len > 12) {
        $("#zhang").show();
        temp1 = false;
    } else {
        $("#zhang").hide();
    }
    $.post("../user",
        {flag: 9, userName: user_name1, userId: user_id},
        function (date) {
            if ("1" == date) {
                $("#chong").show();
                temp1 = false;
            } else {
                $("#chong").hide();
                temp1 = true;
            }
        }, "json");
}

//检验电话
function check_t() {
    var tell = $("#tell1").val();
    var check = /^1[0-9]{10}$/;
    if (check.test(tell)) {
        $("#error_t").hide();
        temp2 = true;
    } else {
        $("#error_t").show();
        temp2 = false;
    }

}

//密码验证
function check_p() {
    var pwd1 = $("#password1").val();
    var len = pwd1.length;
    if (len < 6) {
        $("#error_p").show();
        temp3 = false;
    } else {
        $("#error_p").hide();
        temp3 = true;
    }
}
//确定修改
function queDing() {
    var user_name1 = $("#user_name1").val();
    var user_id = $("#user_id").val();
    var tell = $('#tell1').val();
    var address = $('#address').val();
    var password = $('#password1').val();
    var grade = $('#grade').val();
    if (temp1 && temp2 && temp3) {
        $.post("../user",
            {
                flag: 4,
                userName: user_name1,
                address: address,
                tell: tell,
                userId: user_id,
                password: password,
                grade: grade
            },
            function (date) {
                if ("1" == date) {
                    alert("保存成功！");
                    window.location.href = "user_center_info.jsp";
                }
            }, "json");
    }
}

$(document).ready(function () {
    $("#tan1").click(function () {
        alert("开发13");
    });
    $("#tan2").click(function () {
        alert("开发13");
    });
});