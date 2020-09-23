<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../admin/publicMeta.jsp" %>
<%@include file="../admin/publicHeader.jsp" %>
<%@include file="staffMenu.jsp" %>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a href="index">首页</a>
        <span class="c-gray en">&gt;</span>
        订单管理
        <span class="c-gray en">&gt;</span>
        未备餐订单： <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                  href="javascript:location.replace(location.href);" title="刷新"><i
                class="Hui-iconfont">&#xe68f;</i></a>
    </nav>


    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a>Tip：工作人员备餐完成后即可点击右方加号通知取餐！</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>


            <c:forEach items="${orders}" var="os">
            <input type="hidden" name="id" value="${os.id}">
            <div class="panel panel-default mt-20">
                <div class="panel-header">${fn:substring(os.time,0,16)}</div>
                <div class="panel-body">
                    <ul>
                        <li><a>订单编号：${os.number}</a>
                            <tr>订单状态:<a id="status${os.id}"><c:if
                                    test="${os.status==1}">已下单</c:if><c:if
                                    test="${os.status==2}">已备餐</c:if><c:if
                                    test="${os.status==3}">已取餐</c:if><c:if
                                    test="${os.status==4}">已评价</c:if></a></tr>


                        </li>
                        <table border="1" class="tab">

                            <c:forEach items="${os.order_msgs}" var="oms" varStatus="index">
                                <tr>
                                    <input type="hidden" id="${oms.id}">
                                    <td id="">${index.count}</td>
                                    <td width="65px"><img src="${oms.product.imgUrl}"
                                                          width="65px"
                                                          height="65px">
                                    </td>
                                    <td width="60px"> ${oms.product.name}</td>
                                    <td> 数量:${oms.number}</td>
                                    <td>${oms.product.price}</td>
                                    <td>总金额:
                                        <a class="label label-success radius">${os.totalPrice}元</a>
                                    </td>
                                    <td>${oms.product.canteen.name}&${oms.product.window.name}</td>
                                    <td>${os.detail}</td>
                                    <td>
                                        <a class="label label-primary radius"
                                           onclick='javascript:setStatus("${os.id}")'
                                           class="ml-5" style="text-decoration:none">
                                            通知取餐
                                        </a>
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>
                    </ul>
                    <div id="Huitags-demo1"></div>
                </div>
            </div>

            </c:forEach>


    </div>

    <article class="cl pd-20">
        <%@include file="../admin/publicPage.jsp" %>
    </article>
    </article>
    </div>
</section>

<%@include file="../admin/publicFooter.jsp" %>

</body>
</html>


<script>

    function setStatus(id) {
        $.ajax({
            type: "POST",
            url: "setStatus",
            data: "id=" + id,
            success: function (msg) {
                if (msg === "success") {
                    window.location.replace(location.href);
                }
                else {
                    alert("请求失败!")
                }

            }
        });
    }

    //一分钟请求一次url
    setTimeout("location.href='staffOrder'", 100000)


    window.onload = function () {

        var tablist = document.getElementsByClassName("tab");
        for (var index in tablist) {
            var tab = tablist[index];
            var maxCol = 9, val, count, start;

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