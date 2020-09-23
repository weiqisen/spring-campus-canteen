<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="publicMeta.jsp" %>
<%@include file="publicHeader.jsp" %>
<%@include file="adminMenu.jsp" %>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> <a onclick="location='index'">首页</a>
        <span class="c-gray en">&gt;</span>
        饭堂管理
        <span class="c-gray en">&gt;</span>
        饭堂列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a href="/toAddCanteen" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加饭堂
                    </a>
                </span>
                <span class="l">
                    <a>&nbsp&nbsp&nbsp Tip:点击<a style="color: #134eff">"进入饭堂"</a>即可进入窗口管理页面哦！</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">商品列表</th>
                </tr>
                <tr class="text-c">

                    <th width="">饭堂名称</th>
                    <th width="">介绍：</th>
                    <th width="">图片</th>
                    <th width="">进入饭堂</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${canteens}" var="canteens">
                    <tr class="text-c">
                        <td><strong>${canteens.name}</strong></td>
                        <td>${canteens.detail}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/${canteens.imgUrl}" width="65px" height="65px">
                        </td>
                        <td>
                            <a type="text" style="color: #134eff"
                               onclick='javascript:buy(${canteens.id})'><strong>进入饭堂</strong></a>

                        </td>
                        <td>

                            <a title="编辑" onclick="javascript:editCanteen(${canteens.id})" class="ml-5"
                               style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>

                            <a deleteLink="true" title="删除" onclick='javascript:delCanteen("${canteens.id}")'
                               class="ml-5" style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </article>


        <article class="cl pd-20">
            <%@include file="publicPage.jsp" %>
        </article>


    </div>
</section>
<%@include file="publicFooter.jsp" %>
<script type="text/javascript">
    function delCanteen(id) {
        if (confirm("是否确认删除？")) {
            window.location.href = "delCanteen?id=" + id;
        } else {
            alert("已取消该操作");
        }

    }

    function editCanteen(id) {
        window.location.href = "editCanteen?id=" + id;

    }


    function buy(id) {
        window.location.href = "findWindowByTid?id=" + id;

    }

</script>


</body>
</html>
