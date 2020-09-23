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
        用户管理
        <span class="c-gray en">&gt;</span>
        员工用户 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                href="javascript:location.replace(location.href);" title="刷新"><i
                class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a href="/toAdd" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加用户
                    </a>
                    <a>管理员只有修改用户无法修改的信息的权利：如姓名，学号,性别</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">用户列表</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="">编号</th>
                    <th width="">头像</th>
                    <th width="">姓名</th>
                    <th width="">昵称</th>
                    <th width="">工号</th>
                    <th width="">电话</th>
                    <th width="">性别</th>
                    <th width="">角色</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${users}" var="users" varStatus="index">
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td>${index.count}</td>
                        <td><img src="${pageContext.request.contextPath}/${users.imgUrl}" width="50px" height="50px">
                        </td>
                        <td>${users.name}</td>
                        <td>${users.nickName}</td>
                        <td>${users.number}</td>
                        <td>${users.phone}</td>
                        <td>${users.sex}</td>
                        <td><c:if test="${users.role==1}"><strong>学生</strong></c:if><c:if test="${users.role==2}"><a
                                style="color: #5f41ff"><strong>食堂员工</strong></a></c:if>
                            <c:if test="${users.role==3}"><a style="color: #ff7319"><strong>管理员</strong></a></c:if><c:if
                                    test="${users.role==4}"><a style="color: #134eff"><strong>后勤员工</strong></a></c:if>
                        </td>

                        <td>
                            <a title="修改" onclick='javascript:editUser("${users.id}")' class=" ml-5"
                               style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>
                            <a title="删除" onclick='javascript:delUser("${users.id}")' class=" ml-5"
                               style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </article>
        <article class="cl pd-20">
        <%@include file="../admin/publicPage.jsp" %>
        </article>
    </div>
</section>


<%@include file="publicFooter.jsp" %>
<%--用ajax修改审核状态后回调函数刷新页面--%>
<script>
    function delUser(id) {
        if (confirm("是否确认删除？")) {
            window.location.href = "delete?id=" + id;
        } else {
            alert("已取消该操作");
        }
    }

    function editUser(id) {
        window.location.href = "editUser?id=" + id;
    }


</script>

</body>
</html>
