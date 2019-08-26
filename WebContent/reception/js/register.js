$(function () {

    var error_name = false;
    var error_password = false;
    var error_check_password = false;
    var error_tell = false;
    var error_check = false;


    $('#user_name').blur(function () {
        check_user_name();
    });

    $('#pwd').blur(function () {
        check_pwd();
    });

    $('#cpwd').blur(function () {
        check_cpwd();
    });

    $('#tell').blur(function () {
        check_email();
    });

    $('#allow').click(function () {
        if ($(this).is(':checked')) {
            error_check = false;
            $(this).siblings('span').hide();
        }
        else {
            error_check = true;
            $(this).siblings('span').html('请勾选同意');
            $(this).siblings('span').show();
        }
    });


    function check_user_name() {
        var len = $('#user_name').val().length;
        if (len < 5 || len > 20) {
            $('#user_name').next().html("<font color='red'>输入5-20位的用户名</font>")
            $('#user_name').next().show();
            error_name = true;
        }
        else {
            // $('#user_name').next().hide();
            regName();
        }
    }

    regName = function () {
        var name = $('#user_name').val();
        $.post(
            '../user',
            {
                flag: "9",
                regName: name
            },
            function (msg) {
                if (msg.judge) {
                    $('#user_name').next().html("<font color='green'>用户名可用</font>");
                    error_name = false;
                } else {
                    $('#user_name').next().html("<font color='red'>该用户名已被注册</font>");
                    error_name = true;
                }
            },
            'json')
    }

    function check_pwd() {
        var len = $('#pwd').val().length;
        if (len < 8 || len > 20) {
            $('#pwd').next().html("<font color='red'>密码最少8位，最长20位</font>")
            $('#pwd').next().show();
            error_password = true;
        }
        else {
            $('#pwd').next().hide();
            error_password = false;
        }
    }


    function check_cpwd() {
        var pass = $('#pwd').val();
        var cpass = $('#cpwd').val();

        if (pass != cpass) {
            $('#cpwd').next().html("<font color='red'>两次输入密码不一致</font>")
            $('#cpwd').next().show();
            error_check_password = true;
        }
        else {
            $('#cpwd').next().hide();
            error_check_password = false;
        }

    }

    function check_email() {
        var re = /^1[0-9]{10}$/;
        //var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

        if (re.test($('#tell').val())) {
            $('#tell').next().hide();
            error_tell = false;
        }
        else {
            $('#tell').next().html(("<font color='red'>电话格式不正确</font>"))
            $('#tell').next().show();
            error_check_password = true;
        }

    }


    $('#reg_form').submit(function () {
        check_user_name();
        check_pwd();
        check_cpwd();
        check_email();

        if (error_name == false && error_password == false && error_check_password == false && error_tell == false && error_check == false) {
            return true;
        }
        else {
            return false;
        }

    });


})