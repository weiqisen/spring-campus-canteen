<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 5/1/2020
  Time: 1:14 PM
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
        菜品管理
        <span class="c-gray en">&gt;</span>
        所有菜品 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                href="javascript:location.replace(location.href);" title="刷新"><i
                class="Hui-iconfont">&#xe68f;</i></a>
    </nav>


    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a href="/addProduct" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加菜品
                    </a>
                </span>
                <span class="l">
                <a>&nbsp&nbsp&nbsp Tip:点击"<i class="Hui-iconfont">&#xe60e;</i>"即可锁定菜品状态为无货哦！</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">您当前管理的窗口菜品有：</th>
                </tr>


                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="">编号</th>
                    <th width="">名称</th>
                    <th width="">价格</th>
                    <th width="">详情</th>
                    <th width="">状态</th>
                    <th width="">所属窗口</th>
                    <th width="">图片</th>
                    <th width="100">操作</th>
                    <th width="100">无货/在售</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${products}" var="product">
                <tr class="text-c">
                    <td><input type="checkbox" value="1" name=""></td>
                    <td>${product.id}</td>
                    <td><strong>${product.name}</strong></td>
                    <td><a style="color: #5f41ff">${product.price}</a></td>
                    <td>${product.detail}</td>
                    <td><c:if test="${product.status==1}">在售</c:if>
                        <c:if test="${product.status==0}"><strong><span class="label radius">无货</span></strong></c:if>
                    </td>
                    <td>${window.name}</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/${product.imgUrl}" width="100px" height="80px">
                    </td>
                    <td>
                        <a title="修改" onclick='javascript:toUpdate("${product.id}")' class=" ml-5"
                           style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6df;</i>
                        </a>
                        <a title="删除" onclick='javascript:delProduct("${product.id}")' class=" ml-5"
                           style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6e2;</i>
                        </a>

                    </td>

                    <td>
                        <a title="无货" onclick='javascript:lockProduct("${product.id}")' class=" ml-5"
                           style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe60e;</i>
                        </a>
                        <a title="在售" onclick='javascript:unlockProduct("${product.id}")' class=" ml-5"
                           style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe676;</i>
                        </a>

                    </td>
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

<script type="text/javascript">
    function delProduct(id) {
        if (confirm("是否确认删除？")) {
            window.location.href = "delProduct?id=" + id;
        }
        else {
            alert("已取消该操作");
        }
    }


    function toUpdate(id) {
        window.location.href = "toUpdate?id=" + id;

    }

    function lockProduct(id) {
        window.location.href = "lockProduct?id=" + id;
    }

    function unlockProduct(id) {
        window.location.href = "unlockProduct?id=" + id;
    }
</script>
</body>
</html>
