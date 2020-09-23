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


<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-primary mt-20">
                <div class="panel-header">我的小小购物车！</div>
                <div class="panel-body">
                    <table>
                        <tr>
                            <td><input type="checkbox" id="allAndNotAll" width="50px"></td>
                            <td width="200px">菜品</td>
                            <td width="200px">图片</td>
                            <td width="200px">数量</td>
                            <td width="200px">价格</td>
                            <td width="200px">所属窗口</td>
                            <td width="200px">小计</td>
                            <td width="100px">删除</td>
                        </tr>
                        <c:forEach items="${oms}" var="oms">
                            <form>
                                <tr>
                                    <td><input type="checkbox" name="checkitem" width="50px"
                                               onclick="like(this,${oms.id},${oms.product.price});">
                                    </td>
                                    <td>${oms.product.name}</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/${oms.product.imgUrl}"
                                             width="100px" height="100px">
                                    </td>
                                    <td><input type="hidden" id="number${oms.id}" value="${oms.number}">${oms.number}
                                    </td>
                                    <td>${oms.product.price}元</td>
                                    <td>${oms.product.canteen.name}&${oms.product.window.name}</td>
                                    <td>${oms.product.price*oms.number}元</td>
                                    <td><input type="button" onclick="del(${oms.id})" ; value="删除"></td>
                                </tr>
                            </form>
                        </c:forEach>
                    </table>
                    <div class="panel panel-success mt-180">
                        <div class="panel-body">
                            <p>当前选中总价格：<strong><span id="totalPrice"></span></strong></p><br/>
                            <p>当前选中总份数：<span id="count"></span></p>
                            <button onclick="sureOrder();">结算</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>

<script type="text/javascript">
    var count = 0;
    var singleTotalPrice = 0;
    var totalPrice = 0;
    var omids = [];
    //this拿到整个input对象，判断属性checked
    //singleTotalPrice：小计；totalPrice：勾选菜品总价；count：勾选总件数
    //拿到number/price做一次类型转换

    window.onload = function () {
        like();
    }

    function like(obj, id, price) {
        var p = price * 1;
        if (obj.checked) {
            var number = $("#number" + id).val() * 1;
            count += number;
            singleTotalPrice = number * p;
            totalPrice += singleTotalPrice;
            $("#totalPrice").text(totalPrice);
            $("#count").text(count);
            omids.push(id);
        }
        //如果取消勾选购物车里的菜品
        else {
            number = $("#number" + id).val() * 1;
            count -= number;
            singleTotalPrice = number * p;
            totalPrice -= singleTotalPrice;
            $("#totalPrice").text(totalPrice);
            $("#count").text(count);
            removeId(omids, id);
        }
    }

    //移除购物车内的菜品,del(id)后再次刷新页面
    function del(id) {
        $.get(
            "delOrder_Msg",
            {"id": id},
            function (flag) {
                alert("移除成功！");
                window.location.href = "/myCart";
            }
        )
    }


    //添加或者移除勾选菜品数组里的菜品id；
    function removeId(omids, id) {
        for (var i = 0; i < omids.length; i++) {
            if (omids[i] == id) {
                omids.splice(i, 1);
                break;
            }
        }

    }

    //下单验证跳转,这里要做一个验证，如果勾选的菜品里面有打烊了或者无货的属性，就不能进行下单
    function sureOrder() {
        if (omids.length == 0) {
            alert("您仍未勾选您想要的菜品!");
        }
        $.ajax({
            url: "placeOrderVerity",
            type: "POST",
            data: "omids=" + omids,
            success:
                function (flag) {
                    if (flag == "close") {
                        alert("下单失败！您的订单里面有已打烊窗口的菜品")
                    }
                    if (flag == "empty") {
                        alert("下单失败！您的订单里面有状态为无货的菜品")
                    }
                    if (flag == "success") {
                        window.location.href = "/placeOrder?omids=" + omids;
                    }

                }


        });

    }


    //实现全选与反选
    $("#allAndNotAll").click(function () {
        if ($(this).prop("checked")) {
            $("input[name=checkitem]:checkbox").each(function () {
                $(this).prop("checked", true);

                function like() {

                }
            });
        } else {
            $("input[name=checkitem]:checkbox").each(function () {
                $(this).prop("checked", false);
            });
        }
    });


</script>
