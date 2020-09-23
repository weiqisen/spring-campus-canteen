<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 3/1/2020
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1">
    <tr>菜品类别</tr>
    <tr>
        <td width="100px">编号</td>
        <td width="200px">名称</td>
    </tr>
    <c:forEach items="${list}" var="window">
        <form action="editWindow">
            <tr>
                <input type="hidden" name="id" value="${window.id}">
                <td><a href="/findProductByCid?id=${window.id}">${window.id}</a></td>
                <td>${window.name}</td>

            </tr>
        </form>
    </c:forEach>
</table>
</body>
</html>
