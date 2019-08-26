function isForm() {//表单拦截
    return isName() && isPwd1() && isPwd2();
}

function isName() {
    var th = document.getElementById("name");
    var name = th.value;
    var reg_name = /^\w{2,12}$/;//运用正则表达式校验用户名6到12位数字字母下划线字符
    var temp = reg_name.test(name);
    if (!temp) {
        document.getElementById("spanName").innerHTML = "用户名不合法！";
        th.style.border = "1px solid red";//设置输入框样式
    } else {
        document.getElementById("spanName").innerHTML = "";
        th.style.border = "";
    }
    return temp;
}

function isPwd1() {
    var th = document.getElementById("pwd1");
    var pwd1 = th.value;
    var pwd1 = th.value;
    var temp = false;
    if (pwd1.length == 0) {
        temp = false;
        document.getElementById("spanPwd1").innerHTML = "密码不能为空！";
        th.style.border = "1px solid red";
    } else {
        temp = true;
        document.getElementById("spanPwd1").innerHTML = "";
        th.style.border = "";
    }
    return temp;
}

function isPwd2() {
    var pwd1 = document.getElementById("pwd1").value;
    var th = document.getElementById("pwd2");
    var temp = false;
    var pwd2 = th.value;
    if (pwd1 != pwd2) {
        temp = false;
        document.getElementById("spanPwd2").innerHTML = "两次密码不一致！";
        th.style.border = "1px solid red";
    } else {
        temp = true;
        document.getElementById("spanPwd2").innerHTML = "";
        th.style.border = "";
    }
    return temp;
}
