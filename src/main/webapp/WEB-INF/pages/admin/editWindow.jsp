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
<%@include file="adminMenu.jsp" %>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">主页</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>

    <div class="pd-20">
        <table class="table">
            <tbody>
            <form action="updateWindow" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${window.id}">
                <input type="hidden" name="imgUrl" value="${window.imgUrl}">
                <input type="hidden" name="oldNumber" value="${window.user.number}">
                <tr>
                    <th class="text-r" width="53">窗口名称:</th>
                    <td><input type="text" name="name" value="${window.name}"></td>
                </tr>

                <tr>
                    <th>介绍:</th>
                    <td><input type="text" name="detail" value="${window.detail}"></td>
                <tr/>
                <tr>
                    <th>负责人工号：</th>
                    <td><input type="text" name="number" value="${window.user.number}"/></td>

                </tr>
                <tr>
                    <th>窗口头像</th>
                    <td>
                        <img src="${pageContext.request.contextPath}/${window.imgUrl} " width="50px" height="50px">
                    </td>
                </tr>
                <tr>

                    <th>重新上传图片</th>
                    <td><input type="file" name="image" accept="image/*"/></td>
                </tr>

                <tr>
                    <td><input type="submit" value="提交"></td>
                <tr/>
            </form>
            </tbody>
        </table>
    </div>


</section>

<%@include file="../admin/publicFooter.jsp" %>
</body>
</html>
