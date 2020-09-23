<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="publicMeta.jsp" %>
<%@include file="publicHeader.jsp" %>
<%@include file="adminMenu.jsp" %>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a onclick="location='index'">首页</a>
        <span class="c-gray en">&gt;</span>
        订单管理
        <span class="c-gray en">&gt;</span>
        订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                href="javascript:location.replace(location.href);" title="刷新"><i
                class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                  <span class="l">
                    <a>&nbsp&nbsp&nbsp Tip:营业总额数据来自所有已完成付款的订单</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span><br>
                <span class="r">营业额统计:<strong><a style="color: #5f41ff">${countPrice}</a></strong> 元</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">订单列表</th>
                </tr>
                <tr class="text-c">
                    <th width="25">排序</th>
                    <th width="">订单编号：</th>
                    <th width="">总金额:</th>
                    <th width="">订单状态:</th>
                    <th width="">下单时间：</th>
                </tr>
                </thead>
                <tbody id="num">
                <c:forEach items="${orders}" var="os">
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td>${os.number}</td>
                        <td><a style="color: #ff1b34">${os.totalPrice}元</a></td>
                        <td id="status${os.id}"><c:if test="${os.status==1}">已下单</c:if><c:if
                                test="${os.status==2}">已备餐</c:if><c:if test="${os.status==3}">已取餐</c:if><c:if
                                test="${os.status==4}">已完成</c:if></td>
                        <td>${os.time}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </article>
        <article class="cl pd-20">
            <%@include file="publicPage.jsp" %>
        </article>
    </div>
</section>


<%@include file="publicFooter.jsp" %>
<%--用ajax修改审核状态后回调函数刷新页面--%>
<script>
    function pass(id) {
        $.ajax({
            type: "POST",
            url: "pass",
            data: "id=" + id,
            success: function (msg) {
                if (msg == "success") {
                    var tag = "#pass" + id;
                    alert("操作成功！");
                    $(tag).text("已通过");
                    //location.reload();

                }
                else {
                    alert("请求失败!")
                }

            }
        });
    }


    //数据排序
    window.onload = function () {
        var oTable = document.getElementById("num");
        for (var i = 0; i < oTable.rows.length; i++) {
            oTable.rows[i].cells[0].innerHTML = (i + 1);
        }
    }
</script>

</body>
</html>
