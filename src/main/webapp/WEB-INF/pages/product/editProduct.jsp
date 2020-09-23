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
<%@include file="../staff/staffMenu.jsp" %>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">主页</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>

    <div class="pd-20">
        <table class="table">
            <tbody>
            <form action="/updateProduct" enctype="multipart/form-data" method="post">
                <input type="hidden" name="id" value="${p.id}">
                <input type="hidden" name="imgUrl" value="${p.imgUrl}">

                <tr>
                    <th class="text-r" width="53">菜品名称:</th>
                    <td><input type="text" name="name" value="${p.name}"></td>
                </tr>
                <tr>
                    <th>价格:</th>
                    <td><input type="text" name="price" value="${p.price}"></td>
                </tr>
                <tr>
                    <th>详情:</th>
                    <td><input type="text" name="detail" value="${p.detail}"></td>
                </tr>

                <tr>
                    <th>图片:</th>
                    <td>
                        <img src="${pageContext.request.contextPath}/${p.imgUrl} " width="100px" height="100px">

                    </td>
                </tr>
                <tr>
                    <th>重新上传图片:</th>
                    <td><input type="file" name="image" accept="image/*"/></td>
                </tr>
                <tr>
                    <th><input type="submit" value="提交"></th>
                </tr>
            </form>
            </tbody>
        </table>
    </div>


</section>

<%@include file="../admin/publicFooter.jsp" %>
</body>
</html>
