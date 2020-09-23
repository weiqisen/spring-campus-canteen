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
<%@include file="../admin/adminMenu.jsp" %>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">主页</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <title>用户查看</title>


    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a>Tip:首页可以查看登录所在地ip哦！</a>
                </span>
                <span class="r">共有数据：<strong>1</strong> 条</span>
            </div>

            <div class="pd-20">
                <table class="table">
                    <tbody>
                    <form name='form' action='updateCanteen' method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${canteen.id}">
                        <input type="hidden" name="imgUrl" value="${canteen.imgUrl}">
                        <tr>
                            <th class="text-r" width="53">饭堂名称:</th>
                            <td><input type='text' name="name" value="${canteen.name}"/></td>
                        </tr>
                        <tr>
                            <th>饭堂介绍:</th>
                            <td><input type='text' name="detail" value="${canteen.detail}"/></td>
                        </tr>
                        <tr>
                            <th>图片:</th>
                            <td>
                                <img src="${pageContext.request.contextPath}/${canteen.imgUrl} " width="100px"
                                     height="100px">

                            </td>
                        </tr>
                        <tr>
                            <th>重新上传:</th>
                            <td><input type="file" name="image" accept="image/*"/></td>
                        </tr>
                        <tr>
                            <td colspan='2' width='600px'>
                                <input type="submit" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="reset" value="重置"/>
                            </td>
                        </tr>
                    </form>
                    </tbody>
                </table>
            </div>
        </article>

    </div>
</section>

<%@include file="../admin/publicFooter.jsp" %>
</body>
</html>
