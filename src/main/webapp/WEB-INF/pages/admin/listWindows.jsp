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
        <a style="color: #134eff">${canteen.name}</a>窗口列表 <a class="btn btn-success radius r"
                                                             style="line-height:1.6em;margin-top:3px"
                                                             href="javascript:location.replace(location.href);"
                                                             title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a onclick="javascript:toAddWindow(${canteen.id})" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加窗口
                    </a>
                </span>
                <span class="l">
                    <a>&nbsp&nbsp&nbsp Tip:可通过编辑按钮为窗口重新分配管理负责人</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">窗口列表</th>
                </tr>
                <tr class="text-c">

                    <th>窗口名称</th>
                    <th>介绍：</th>
                    <th>对外展示图片</th>
                    <th>负责人</th>
                    <th width="100">编辑</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${windows}" var="windows">
                    <tr class="text-c">
                        <td><strong>${windows.name}</strong></td>
                        <td>${windows.detail}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/${windows.imgUrl}" width="65px" height="65px">
                        </td>
                        <td>
                            工号:<strong>${windows.user.number}_${windows.user.name}</strong>
                        </td>
                        <td>

                            <a title="编辑" onclick="javascript:editWindow(${windows.id})" class="ml-5"
                               style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>

                            <a deleteLink="true" title="删除" onclick="javascript:delWindow(${windows.id})"
                               class="ml-5" style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </article>


        <%--此处的翻页部分不引入公用页码，因为还要加上id参数识别是哪个饭堂下的窗口--%>
        <article class="cl pd-20">
            <%@include file="windowsPage.jsp" %>
        </article>
        <%--此处的翻页部分不引入公用页码，因为还要加上id参数识别是哪个饭堂下的窗口--%>
    </div>


</section>
<%@include file="publicFooter.jsp" %>

<script type="text/javascript">
    function delWindow(id) {
        if (confirm("是否确认删除？")) {
            window.location.href = "delWindow?id=" + id;
        }

    }

    function editWindow(id) {
        window.location.href = "editWindow?id=" + id;

    }

    //跳转窗口添加页面的时候要带上一个上级饭堂的id参数
    function toAddWindow(tid) {

        window.location.href = "toAddWindow?tid=" + tid;


    }
</script>

</body>
</html>
