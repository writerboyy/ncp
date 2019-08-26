$(document).ready(function () {
    var username = $('#userName');
    var password = $('#pwd');
    $('#login').click(function () {
        if (isName() && isPwd()) {
            $.post(
                "../user",
                {
                    flag: 5,
                    ck: $("#jizhu").is(":checked"),
                    userName: username.val(),
                    password: password.val()
                },
                function (msg) {
                    if (msg.judge) {
                        alert("-----");
                        location.href = "../goods?flag=9";
                    } else {
                        alert("用户名或密码错误!");
                    }
                },
                'json'
            );
        }
    });

    /**
     * 校验用户名
     * @returns {boolean}
     */
    function isName() {
        var name = username.val();
        var reg_name = /^\w{2,12}$/;//运用正则表达式校验用户名2到12位数字字母下划线字符
        var temp = reg_name.test(name);
        if (!temp) {
            $('.user_error').toggle();//切换元素状态
        }
        return temp;
    }

    /**
     * 校验密码
     * @returns {boolean}
     */
    function isPwd() {
        var pwd1 = password.val();
        var temp = false;
        if (pwd1.length == 0) {
            temp = false;
            $('.pwd_error').toggle();//切换元素状态
        } else {
            temp = true;
        }
        return temp;
    }

});
