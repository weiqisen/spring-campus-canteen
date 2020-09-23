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
        数据管理
        <span class="c-gray en">&gt;</span>
        已备份数据列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                   href="javascript:location.replace(location.href);" title="刷新"><i
                class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a onclick="backUp()" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 一键备份
                    </a>

                   <a>Tip:数据操作有风险，请谨慎操作！</a>
                </span>

                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">数据库列表</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="">文件</th>
                    <th width="">路径</th>
                    <th width="">备份日期</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${dbs}" var="dbs">
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td><img src="/images/db.jpg" width="50px" height="50px"></td>
                        <td>${dbs.url}</td>
                        <td>${dbs.time}</td>
                        <td><input type="button" value="一键还原" onclick="javascript:resetDb(${dbs.id})"/>
                            <input type="button" value="删除" onclick="javascript:delDb(${dbs.id})"/></td>
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

</body>
</html>
<%@include file="publicFooter.jsp" %>

<script type="text/javascript">

    function backUp() {
        if (confirm("操作数据有风险，是否确认备份？")) {
            $.ajax({
                url: "backUp",
                type: "POST",
                success:
                    function (flag) {
                        if (flag == "success") {
                            alert("备份成功！");
                            window.location.href = "listDb";
                        }
                    }
            });


        }


        else {
            alert("已取消该操作");
        }

    }


    function delDb(id) {
        if (confirm("是否确认删除？")) {
            if (confirm("操作数据有风险，是否确认删除？")) {
                $.ajax({
                    url: "delDb",
                    data: "id=" + id,
                    success(flag) {
                        if (flag = "success") {
                            alert("删除成功!")
                            window.location.href = "listDb";
                        }
                    }
                });

            }
            else {
                alert("已取消该操作");
            }
        } else {
            alert("已取消该操作");
        }

    }


    function resetDb(id) {
        if (confirm("是否确认还原数据库？")) {
            if (confirm("操作数据有风险，是否确认还原？")) {
                $.ajax({
                    data: "id=" + id,
                    url: "resetDb",
                    success(flag) {
                        if (flag = "success") {
                            alert("数据恢复成功!")
                            window.location.href = "listDb";
                        }
                    }
                });
            }
            else {
                alert("已取消该操作");
            }
        } else {
            alert("已取消该操作");
        }

    }
</script>

