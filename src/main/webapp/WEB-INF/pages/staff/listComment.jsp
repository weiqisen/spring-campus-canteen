<%--<p>欢迎各位师生为消费后的订单留下真情的评价！</p>   <br/><br/>--%>
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
        评论管理
        <span class="c-gray en">&gt;</span>
        所有评价 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                href="javascript:location.replace(location.href);" title="刷新"><i
                class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a>欢迎各位师生为消费后的订单留下真情的评价！</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>

            <tbody>
            <c:forEach items="${comments}" var="cs">
                <ul class="commentList">
                    <li class="item cl"><a href="#"><i class="avatar size-L radius"><img alt=""
                                                                                         src="${pageContext.request.contextPath}/${cs.user.imgUrl} "></i></a>
                        <div class="comment-main">
                            <header class="comment-header">
                                <div class="comment-meta"><a class="comment-author" href="#">${cs.user.nickName}</a> 评价于
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
            </tbody>
            </table>
        </article>
        <article class="cl pd-20">
            <%@include file="../admin/publicPage.jsp" %>
        </article>

    </div>
</section>

<%@include file="../admin/publicFooter.jsp" %>

</body>
</html>
