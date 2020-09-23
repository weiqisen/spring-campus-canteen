<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 11/2/2020
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../fore/head.jsp" %>

<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-primary mt-20">
                <div class="panel-header">欢迎广大师生用餐后留下真挚的评价！</div>
                <div class="panel-body">
                    <c:forEach items="${comments}" var="cs">
                        <ul class="commentList">
                            <li class="item cl">
                                <img class="avatar size-L radius"
                                     src="${pageContext.request.contextPath}/${cs.user.imgUrl} ">
                                <div class="comment-main">
                                    <header class="comment-header">
                                        <div class="comment-meta"><a class="comment-author"
                                                                     href="#">${cs.user.nickName}</a> 评价于
                                            <time title="" datetime="">${cs.time}</time>
                                        </div>
                                    </header>
                                    <div class="comment-body">
                                        <p><a href="#">@</a> <strong>${cs.content}</strong></p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </c:forEach>

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
