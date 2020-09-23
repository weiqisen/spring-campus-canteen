<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 7:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../fore/head.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

</head>

<body>

<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">已下单订单</div>
                <div class="panel-body">
                    <c:forEach items="${orders}" var="os">
                        <input type="hidden" name="id" value="${os.id}">
                        <div class="panel panel-default mt-20">
                            <div class="panel-header">${fn:substring(os.time,0,11)}</div>
                            <div class="panel-body">
                                <ul>
                                    <li><a>订单编号：${os.number}</a>
                                        <tr>订单状态:<a id="status${os.id}"><c:if test="${os.status==1}">已下单</c:if><c:if
                                                test="${os.status==2}">已备餐</c:if><c:if test="${os.status==3}">已取餐</c:if><c:if
                                                test="${os.status==4}">已评价</c:if></a></tr>
                                        <td>
                                            <a deleteLink="true" title="删除" onclick='javascript:deleteOm("${os.id}")'
                                               class="ml-5" style="text-decoration:none">
                                                <i class="Hui-iconfont">&#xe6e2;</i>
                                            </a>

                                            <a deleteLink="true" title="评价" onclick="javascript:comment(${os.id})"
                                               class="ml-5" style="text-decoration:none">
                                                <i class="Hui-iconfont">&#xe60c;</i>
                                            </a>

                                        </td>
                                    </li>
                                    <table border="1" class="tab">

                                        <c:forEach items="${os.order_msgs}" var="oms" varStatus="index">
                                            <tr>
                                                <td>${index.count}</td>
                                                <td width="50px"><img src="${oms.product.imgUrl}" width="50px"
                                                                      height="50px">
                                                </td>
                                                <td> ${oms.product.name}</td>
                                                <td> 数量:${oms.number}</td>
                                                <td>${oms.product.price}</td>
                                                <td>总金额:<a style="color: #ff265d">${os.totalPrice}元</a></td>
                                                <td>${oms.product.canteen.name}&${oms.product.window.name}</td>
                                                <td>${os.detail}</td>
                                            </tr>

                                        </c:forEach>
                                    </table>
                                </ul>
                                <div id="Huitags-demo1"></div>
                            </div>
                        </div>

                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>

    //ajax局部刷新订单状态，做判断对比，如果请求回来的状态和jsp当前渲染的数据不一样，则提醒订单状态发生变化且进行数据替换。反之不执行任何操作
    function refreshOnTime() {
        var id = "";
        $.ajax({
            //配置
            url: "jsonOrderA",
            type: "POST",
            dataType: "JSON",
            success:
                function (data) {
                    $.each(data, function (index, value) {
                        id = value.id;
                        status = value.status;
                        var lll = transtext(status);
                        var replace = "#status" + id;
                        var now = $(replace).text();
                        console.log("now=" + now);
                        console.log("lll=" + lll)

                        // 做一个判断,如果ajax拿到的数据不等于页面当前渲染的数据，则播报语音
                        if (now != lll) {
                            if (lll == "已备餐") {
                                var mp3 = "http://localhost:8080/sound/qucanla.mp3";
                                var sound = new Audio(mp3);
                                sound.play();
                                alert("您预定的餐品已备餐！");
                                $(replace).text(lll);
                            }
                            alert("订单状态已变更！");
                            $(replace).text(lll);
                        }
                    });
                },
        });

    }

    //json状态码转换
    function transtext(status) {
        var ll = status * 1;
        if (ll == 1) {
            ll = "已下单";
        }
        if (ll == 2) {
            ll = "已备餐";
        }
        if (ll == 3) {
            ll = "已取餐";
        }
        if (ll == 4) {
            ll = "已评价";
        }
        return ll;

    }


    //三秒后重复执行ajax请求
    setInterval(refreshOnTime, 5000);
    //自执行
    window.onload = refreshOnTime;


    function deleteOm(id) {
        var replace = "#status" + id;
        var now = $(replace).text();

        if (now == "已完成") {

            if (confirm("是否确认删除？")) {

                window.location.href = "deleteOm?id=" + id;
            } else {
                alert("已取消该操作");
            }
        }
        else {
            alert("订单未完成，无法删除！")
        }

    }


    //跳转订单评价页面
    function comment(id) {
        $.ajax({
            url: "comment",
            data: "id=" + id,
            type: "POST",
            success:
                function (flag) {
                    if (flag == "success") {
                        window.location.href = "toComment?id=" + id;
                    }
                    else if (flag == "false") {
                        alert("订单未完成，无法进行评价！")
                    }
                    else if (flag == "done") {
                        alert("您已经评价过该订单了,无法再次评价!")
                    }

                }


        })


    }


    window.onload = function () {

        var tablist = document.getElementsByClassName("tab");
        for (var index in tablist) {
            console.log("www", tablist[tab]);
            var tab = tablist[index];
            var maxCol = 8, val, count, start;

            for (var col = maxCol - 1; col >= 0; col--) {
                count = 1;
                val = "";
                for (var i = 0; i < tab.rows.length; i++) {
                    if (val == tab.rows[i].cells[col].innerHTML) {
                        count++;
                    } else {
                        if (count > 1) { //合并
                            start = i - count;
                            tab.rows[start].cells[col].rowSpan = count;
                            for (var j = start + 1; j < i; j++) {
                                tab.rows[j].cells[col].style.display = "none";
                            }
                            count = 1;
                        }
                        val = tab.rows[i].cells[col].innerHTML;
                    }
                }
                if (count > 1) { //合并，最后几行相同的情况下
                    start = i - count;
                    tab.rows[start].cells[col].rowSpan = count;
                    for (var j = start + 1; j < i; j++) {
                        tab.rows[j].cells[col].style.display = "none";
                    }
                }
            }
        }
    };

</script>