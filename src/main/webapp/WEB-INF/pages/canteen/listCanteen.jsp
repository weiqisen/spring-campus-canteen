<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 5/1/2020
  Time: 4:52 PM
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
            <div class="panel panel-primary mt-20">
                <div class="panel-header">所有饭堂</div>
                <div class="panel-body">
                    <table class="table table-border table-bg">
                        <p>选择您即将用餐的饭堂</p>
                        <c:forEach items="${canteens}" var="canteens">
                            <form method="post" action="/editCanteen">
                                <tr>
                                    <input type="hidden" name="id" value="${canteens.id}">

                                    <td><strong>${canteens.name}</strong></td>
                                    <td>${canteens.detail}</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/${canteens.imgUrl}" width="100px"
                                             height="100px"></td>
                                    <td>
                                        <a class="label label-success radius"
                                           onclick='javascript:buy("${canteens.id}")'>进入</a>
                                    </td>
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
<%@include file="../fore/footer.jsp" %>
<script>
    function buy(id) {
        window.location.href = "findWindowByTid?id=" + id;

    }
</script>