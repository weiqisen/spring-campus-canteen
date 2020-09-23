<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 8/2/2020
  Time: 11:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../fore/head.jsp" %>
<%--<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>--%>


<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-success mt-20">
                <div class="panel-header">Tip：大数据每分钟实时更新菜品热度，让你发现好吃的餐品！</div>
                <div class="panel-body">

                    <h1>菜品热度榜Top</h1>
                    <table class="table table-border table-bg">

                        <tr>
                            <td width="10px"></td>
                            <td width="100px">图片</td>
                            <td width="40px">名称</td>
                            <td width="50px">实时热度值</td>
                            <td width="30px">状态</td>
                            <td width="50px">所属</td>


                        </tr>

                        <tbody>
                        <c:forEach items="${listHotProduct}" var="product" varStatus="index">
                            <form>

                                <input type="hidden" name="id" value="${product.id}">
                                <tr>
                                    <td>${index.count}</td>
                                    <td>
                                        <img onclick="location='productDetail?id=${product.id}'"
                                             src="${pageContext.request.contextPath}/${product.imgUrl}" width="70px"
                                             height="70px"></td>
                                    <td><strong>${product.name}</strong></td>
                                    <td><a id="hot${product.id}"
                                           class="label label-success radius">${product.hot}°C<a></a></td>
                                    <td><c:if test="${product.status==1}">在售</c:if> <a style="color: #ff2d38"><c:if
                                            test="${product.status==0}">无货</c:if></a</td>
                                    <td>${product.canteen.name}&${product.window.name}</td>

                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="mt-100">
                        <article class="cl pd-20">
                            <%@include file="../admin/publicPage.jsp" %>
                        </article>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>
<%-----------添加购物车------------------%>
<script type="text/javascript">

    //5秒后重复执行ajax请求
    setInterval(refreshHot, 5000);
    //自执行
    window.onload = refreshHot;

    //这里做一个局部更新热度值
    function refreshHot() {
        var id = "";
        $.ajax({
            url: "refreshHot",
            type: "POST",
            dataType: "JSON",
            success(data) {
                $.each(data, function (index, value) {
                    id = value.id;
                    var hot = value.hot + "°C";
                    var p = "#hot" + id;
                    $(p).text(hot);
                })
            }
        });

    }


</script>