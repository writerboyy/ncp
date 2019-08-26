var error_tell = false;
var tell;
var userName;
var address;
var userId;
var password;

window.onload = function () {//页面加载完成
    var province = document.getElementById("province");
    var city = document.getElementById("city");
    var area = document.getElementById("area");
    for (var i = 0; i < provinces.length; i++) {//向省下拉列表填充数据
        var option = document.createElement("option");//创建一个option对象
        option.setAttribute("id", provinces[i].id);//设置option的id属性的值
        option.setAttribute("value", provinces[i].id);//设置option的value属性的值
        option.innerHTML = provinces[i].name;//向option中填充内容
        province.appendChild(option);//将potion添加到省列表中
    }
    province.onchange = function () {//省下拉列表域改变事件
        city.innerHTML = " <option value=\"0\">---请选择---</option>";
        var array = citys[province.value];//获取省对应的市的数组
        for (var i = 0; i < array.length; i++) {//向市下拉列表填充数据
            var option = document.createElement("option");
            option.setAttribute("value", array[i].id);
            option.setAttribute("id", array[i].id);
            option.innerHTML = array[i].name;
            city.appendChild(option);
        }
    }
    city.onchange = function () {//市下拉列表域改变事件
        area.innerHTML = " <option value=\"0\">---请选择---</option>";
        var array = areas[city.value];//获取市对应的县的数组
        for (var i = 0; i < array.length; i++) {//向县下拉列表填充数据
            var option = document.createElement("option");
            option.setAttribute("value", array[i].id);
            option.setAttribute("id", array[i].id);
            option.innerHTML = array[i].name;
            area.appendChild(option);
        }
    }
    area.onchange = function () {//县下拉列表域改变事件
        var data1 = document.getElementById(province.value).innerHTML;//获取省的值
        var data2 = document.getElementById(city.value).innerHTML;//获取市的值
        var data3 = document.getElementById(area.value).innerHTML;//获取县的值
        var str = data1 + data2 + data3;
        document.getElementById("data").innerHTML = str;
    }
}


//修改电话地址
function qian_check() {
    tell = $('#tell').val();
    userName = $("#userName").val();
    address = $('#data').val();
    if (error_tell) {
        $.post("../user",
            {flag: 10, userName: userName, address: address, tell: tell},
            function (date) {
                if (date == "1") {
                    alert("修改成功！");
                    window.location.href = "user_center_site.jsp";
                } else {
                    alert("输入有误，请重新输入");
                }
            }, "json");
    }else{
        alert("输入有误，请重新输入");
    }
}


//检验电话
function check_tell() {
    var re = /^1[0-9]{10}$/;
    if (re.test($('#tell').val())) {
        $('#tell').next().hide();
        error_tell = true;
    }
    else {
        $('#tell').next().html('你输入的电话格式不正确');
        $('#tell').next().css("color", "red");
        $('#tell').next().show();
        error_tell = false;
    }

}

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
