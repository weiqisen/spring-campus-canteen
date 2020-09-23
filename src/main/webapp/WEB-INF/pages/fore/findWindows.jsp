<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 3/1/2020
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <div class="panel-header">请选择您要进行点餐的窗口!</div>
                <div class="panel-body">
                    <table>
                        <c:forEach items="${windows}" var="windows">
                            <form method="post">
                                <tr>
                                    <input type="hidden" name="id" value="${windows.id}">
                                    <td width="50">
                                        <img src="${pageContext.request.contextPath}/${windows.imgUrl}" width="65px"
                                             height="65px"></td>
                                    <td width="50">${windows.name}</td>
                                    <td width="50" id="status${windows.id}"><c:if test="${windows.status==1}">营业中</c:if><c:if
                                            test="${windows.status==0}">已打烊</c:if></td>

                                    <td width="10">
                                        <a class="label label-success radius"
                                           onclick='javascript:foreFindProduct("${windows.id}")'>进入</a>
                                </tr>
                            </form>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%@include file="footer.jsp" %>
<script>

    <%--js验证是否能进入窗口--%>

    function foreFindProduct(id) {
        var id = id;
        var status = "#status" + id;
        var now = $(status).text();
        if (now == "已打烊") {
            alert("窗口已打烊，无法进行点餐！")
        } else {
            window.location.href = "foreFindProduct?id=" + id;
        }

    }
</script>