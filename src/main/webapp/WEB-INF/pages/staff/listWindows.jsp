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
        窗口管理管理
        <span class="c-gray en">&gt;</span>
        自家窗口<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
               href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a>&nbsp&nbsp&nbsp Tip:点击"<i class="Hui-iconfont">&#xe6df;</i>"即可编辑窗口信息哦！</a>
                </span>
                <span class="r">直接点击窗口名称也可查看菜品列表</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">您当前所属窗口为：</th>
                </tr>


                <tr class="text-c">
                    <th width="">展示图片</th>
                    <th width="">窗口名称</th>
                    <th>介绍：</th>
                    <th width="">操作</th>

                </tr>
                </thead>
                <tbody>

                <tr class="text-c">
                    <input type="hidden" name="id" value="${window.id}">
                    <td><img src="${pageContext.request.contextPath}/${window.imgUrl}" width="65px" height="65px"></td>
                    <td><a href="/findProductByWid">${window.name}</a></td>
                    <td>${window.detail}</td>
                    <td>
                        <a title="编辑" onclick="javascript:editWindow(${window.id})" class="ml-5"
                           style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>

                        <a deleteLink="true" title="删除" onclick="javascript:delWindow(${window.id})"
                           class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>
                    </td>

                </tr>

                </tbody>
            </table>
        </article>

    </div>
</section>


<%@include file="../admin/publicFooter.jsp" %>

<script type="text/javascript">
    function delWindow(id) {
        if (confirm("是否确认删除？")) {
            window.location.href = "delWindow?id=" + id;
        }

    }

    function editWindow(id) {
        window.location.href = "editWindow?id=" + id;

    }
</script>


</body>
</html>
