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
        <span class="c-666">添加新窗口</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>


    <div class="pd-20">
        <table class="table">
            <tbody>
            <form name="form" action="/addWindow" enctype="multipart/form-data" method="post">
                <input type="hidden" name="tid" value="${canteen.id}">
                <tr>
                    <th class="text-r" width="60">窗口名称：</th>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <th>窗口介绍：</th>
                    <td><textarea name="detail " cols="30" rows="10"></textarea></td>
                </tr>
                <tr>
                    <th>展示图片：</th>
                    <td><input type="file" name="image" accept="image/*"/></td>
                </tr>
                <tr>
                    <th>负责人工号：</th>
                    <td><input type="text" name="number"/></td>
                </tr>
                <tr>
                    <td colspan='2' width='600px'><input type="submit" value="提交"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/>
                    </td>
                </tr>
            </form>
            </tbody>
        </table>
    </div>


</section>

<%@include file="../admin/publicFooter.jsp" %>
</body>
</html>
