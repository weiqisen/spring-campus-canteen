<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #menu {
        float: right
    }

    #menu li {
        display: inline;
        width: 50px;
        height: 40px;
        border: 1px solid rgba(28, 9, 9, 0.34);
        margin-left: 8px;
    }
</style>


<div class="hui-list" style="margin-top:22px;">
    <ul id="menu">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a href="?id=${canteens.id}&&start=0">
                <span aria-hidden="true">首页</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                <a href="?id=${canteens.id}&&start=${status.index*page.count}"
                   <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                >${status.count}</a>
            </li>
        </c:forEach>


        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?id=${canteens.id}&&start=${page.last}">
                <span aria-hidden="true">末页</span>
            </a>
        </li>
    </ul>
</div>