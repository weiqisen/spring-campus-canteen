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
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>


<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">搜索结果</div>
                <div class="panel-body">

                    <h1>搜索结果</h1>
                    <table>

                        <tr>
                            <td width="10px"></td>
                            <td width="40px">名称</td>
                            <td width="50px">实时热度值</td>
                            <td width="30px">状态</td>
                            <td width="50px">所属</td>
                            <td width="100px">图片</td>

                        </tr>

                        <tbody id="num">
                        <c:forEach items="${products}" var="product">
                            <form>

                                <input type="hidden" name="id" value="${product.id}">
                                <tr>
                                    <td></td>
                                    <td><strong>${product.name}</strong></td>
                                    <td><a id="hot${product.id}"
                                           class="label label-success radius">${product.hot}°C<a></a></td>
                                    <td><c:if test="${product.status==1}">在售</c:if> <a style="color: #ff2d38"><c:if
                                            test="${product.status==0}">无货</c:if></a</td>
                                    <td>${product.canteen.name}&${product.window.name}</td>
                                    <td>
                                        <img onclick="location='productDetail?id=${product.id}'"
                                             src="${pageContext.request.contextPath}/${product.imgUrl}" width="100px"
                                             height="50px"></td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                    <article class="cl pd-20">
                        <%@include file="../admin/publicPage.jsp" %>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
<%@include file="footer.jsp" %>