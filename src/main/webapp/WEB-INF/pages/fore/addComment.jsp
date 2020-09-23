<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 11/2/2020
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
<%@include file="../fore/head.jsp" %>
<html>
<head>
    <title>我的评论</title>
</head>
<body>
<center>

    <form action="/addComment" method="post"><br/><br/>
        <h3 align="center">请输入您对编号为：${orderNumber}的订单的评价：</h3><br/>
        <input type="hidden" name="oid" value="${id}">
        <textarea cols="30" rows="10" name="content"></textarea><br/>
        <input type="reset" value="重置">
        <input type="submit" value="提交评论">
    </form>
</center>
</body>
</html>
