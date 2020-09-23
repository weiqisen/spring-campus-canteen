<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 17/12/2019
  Time: 12:02 PM
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
            <form name="form" action="add" enctype="multipart/form-data" method="post">
                <table align="center" width=400px cellspacing=0 cellpadding=3 border=1 height=180px>
                    <tr>
                        <td>名称</td>
                        <td><input type="text" name="name"/></td>
                    </tr>
                    <tr>
                        <td>价格</td>
                        <td><input type="text" name="price"/></td>
                    </tr>
                    <tr>
                        <td>描述</td>
                        <td><input type="text" name="detail"/></td>
                    </tr>
                    <tr>
                        <td>图片</td>
                        <td><input type="file" name="image" accept="image/*"/></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center"><input type="submit" value="添加"/>
                            <input type="button" value="清空"/></td>
                    </tr>
                </table>
            </form>
            </tbody>
        </table>
    </div>


</section>

<%@include file="../admin/publicFooter.jsp" %>
</body>
</html>
