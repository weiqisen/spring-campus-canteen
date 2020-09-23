<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 4/2/2020
  Time: 2:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../fore/head.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">订单详情</div>
                <div class="panel-body">
                    <table border="1">

                        <tr>
                            <td width="200px">菜品</td>
                            <td width="200px">图片</td>
                            <td width="200px">数量</td>
                            <td width="200px">价格</td>
                            <td width="200px">所属窗口</td>
                            <td width="200px">小计</td>

                        </tr>
                        <c:forEach items="${order_msgs}" var="oms">
                            <form>
                                <tr>
                                    <td>${oms.product.name}</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/${oms.product.imgUrl}"
                                             width="100px" height="100px">
                                    </td>
                                    <td>${oms.number}</td>
                                    <td>${oms.product.price}元</td>
                                    <td>${oms.product.uid}号饭堂${oms.product.wid}号窗口</td>
                                    <td>${oms.product.price*oms.number}</td>
                                </tr>
                            </form>
                        </c:forEach>
                    </table>

                    <br/><br/>

                    <form action="">
                        <td>预计取餐时间:<br/><span id="booktime"></span>
                            <br/><br/>
                        <td>备注：<br/><input type="text" id="remark"></td>
                        <br/><br/>
                        <td>用餐方式：</td>
                        <br>
                        <td><input name="method" type="radio" checked="checked" value="堂食">堂食<input name="method"
                                                                                                    type="radio"
                                                                                                    value="打包">打包
                        </td>

                    </form>
                    <p>当前订单总价格：<span id="totalPrice">${totalPrice}</span></p><br/>
                    <p>当前选中总份数：<span id="count">${count}</span></p>
                    <button onclick="placeOrder();">结算</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
<%@include file="footer.jsp" %>

<script>

    function placeOrder() {


        // var time = $("#booktime").val();
        var remark = $("#remark").val();
        var method = $('input:radio:checked').val();
        var detail = method + remark;
        if (booktime == "") {
            alert("预计取餐时间不能为空！")
        }
        // uri转码
        window.location.href = "order?detail=" + encodeURI(encodeURI(detail));

    }


    //js监听浏览器后退事件
    $(document).ready(function (e) {
        var counter = 0;
        if (window.history && window.history.pushState) {
            window.onpopstate = function () {
                window.history.pushState('forward', null, '#');
                window.history.forward(1);
                window.location.href = "/myCart";
            };
        }
        window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
        window.history.forward(1);

    });


    //这里做一个计算取餐时间，比当前时间延后十分钟
    var bk = new Date().getTime();
    bk = bk + 600000;
    var bkTime = new Date(bk);


    var booktime = bkTime.getHours() + '时:' + bkTime.getMinutes() + '分';
    $("#booktime").text(booktime);
    console.log(booktime);



</script>