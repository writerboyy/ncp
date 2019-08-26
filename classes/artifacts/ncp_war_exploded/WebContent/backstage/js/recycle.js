$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "../comment",
        xhrFields: {
            withCredentials: true
        },
        data:
            {
                flag: 2,
                pagenum: 1,
            },
        dataType: "json",
        success: function (data) {
            yemi(data);
        }
    });

    $("#checkAll").click(function () {
        var arr = document.getElementsByName("choose");
        for (var i = 0; i < arr.length; i++) {
            arr[i].checked = true;
        }
    })

    $("#cancel").click(function () {
        var arr = document.getElementsByName("choose");
        for (var i = 0; i < arr.length; i++) {
            arr[i].checked = false;
        }
    })

    $("#dele").click(function () {
        var arr = document.getElementsByName("choose");
        var str = "";
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].checked == true) {
                str += arr[i].value + ",";
            }
        }
        if (str != "") {
            window.confirm("确定要删除选择的评论吗？");
            $.post("../comment",
                {flag: "3", str: str},
                function () {
                    window.location.href = "recycle_bin.jsp";
                }
            )
        } else {
            alert("请选择评论");
        }
    });

    deleteCom = function (th) {
        var id = $(th).prev().val();
        window.confirm("确定要删除选择的评论吗？");
        $.post("../comment",
            {flag: "5", comId: id},
            function () {
                window.location.href = "recycle_bin.jsp";
            }
        )
    }


    var $list;
    var $page;
    var $pageTotal;

    $("#first").click(function () {
        $.ajax({
            type: "POST",
            url: "../comment",
            data:
                {
                    flag: 2,
                    pagenum: 1
                },
            dataType: "json",
            success: function (data) {
                yemi(data);
            }
        })
    });


    $("#last").click(function () {
        $.ajax({
            type: "POST",
            url: "../comment",
            data:
                {
                    flag: 2,
                    pagenum: $pageTotal
                },
            dataType: "json",
            success: function (data) {
                yemi(data);

            }
        })
    })
    $("#before").click(function () {
        $.ajax({
            type: "POST",
            url: "../comment",
            data:
                {
                    flag: 2,
                    pagenum: $page - 1
                },
            dataType: "json",
            success: function (data) {
                yemi(data);

            }
        })
    })
    $("#after").click(function () {
        $.ajax({
            type: "POST",
            url: "../comment",
            data:
                {
                    flag: 2,
                    pagenum: $page + 1
                },
            dataType: "json",
            success: function (data) {
                yemi(data);
            }
        })
    })


    function yemi(data) {
        $list = data[0];
        $page = parseInt(data[1]);
        $pageTotal = parseInt(data[2]);
        var th = "  <tr>\n" +
            "            <th>ID编号</th>\n" +
            "            <th>用户编号</th>\n" +
            "            <th>产品</th>\n" +
            "            <th>名称</th>\n" +
            "            <th>评论</th>\n" +
            "            <th>好评</th>\n" +
            "            <th>时间</th>\n" +
            "            <th>操作</th>\n" +
            "        </tr>";
        $('#table').html(th);
        for (var i = 0; i < $list.length; i++) {
            var tr = " <tr>\n" +
                "                <td>\n" +
                "     <span>\n" +
                "     <input type=\"checkbox\" name=\"choose\" id=\"choose\" value=\"" + $list[i].comId + "\" class=\"middle children-checkbox\"/>\n" +
                "     <i>" + $list[i].comId + "</i>\n" +
                "     </span>\n" +
                "                </td>\n" +
                "                <td class=\"center\">\n" +
                "                    <span>" + $list[i].userName + "</span>\n" +
                "                </td>\n" +
                "                <td class=\"center pic-area\"><img src=\"../reception/images/goods/" + $list[i].pic + "\" class=\"thumbnail\"/></td>\n" +
                "                <td class=\"center\">\n" +
                "                    <span>" + $list[i].goodsName + "</span>\n" +
                "                </td>\n" +
                "\n" +
                "                <td class=\"td-name\">\n" +
                "                    <span class=\"ellipsis td-name block\">" + $list[i].comment + "</span>\n" +
                "                </td>\n" +
                "                <td class=\"center\">\n" +
                "                    <span>" + $list[i].praise + "</span>\n" +
                "                </td>\n" +
                "                <td class=\"center\">\n" +
                "                    <span>" + formatDateTime($list[i].date) + "</span>\n" +
                "                </td>\n" +
                "                <td class=\"center\">\n" +
                "<input type=\"hidden\" value=\"" + $list[i].comId + "\" />" +
                "                    <input type=\"button\" value=\"删除选定评论\" onclick='deleteCom(this);'>\n" +
                "                </td>\n" +
                "            </tr>";
            $('#table').append(tr);
        }

        $("#pagenation").html($page + "/" + $pageTotal);

    }

    function formatDateTime(inputTime) {
        var date = new Date(inputTime);
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        h = h < 10 ? ('0' + h) : h;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        minute = minute < 10 ? ('0' + minute) : minute;
        second = second < 10 ? ('0' + second) : second;
        return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
    };
});
