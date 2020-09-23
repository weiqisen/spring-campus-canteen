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
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">主页</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>


    <title>用户查看</title>

    <div class="cl pd-20" style=" background-color:#5bacb6">
        <img class="avatar size-XL l" src="${user.imgUrl}">
        <dl style="margin-left:80px; color:#fff">
            <dt>
                <span class="f-18">${user.name}</span>
                <span class="pl-10 f-12">昵称:${user.nickName}</span>
            </dt>
            <dd class="pt-10 f-12" style="margin-left:0">我还在想一句能炸裂地表的自我介绍</dd>
        </dl>
    </div>
    <div class="pd-20">
        <table class="table">
            <tbody>
            <form name='form' action='/editUser' method="post">

                <tr>
                    <th class="text-r" width="40">姓名：</th>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <th class="text-r">学号：</th>
                    <td>${user.number}</td>
                </tr>
                <tr>
                    <th class="text-r">密码：</th>
                    <td>${user.password}</td>
                </tr>
                <tr>
                    <th class="text-r">电话：</th>
                    <td>${user.phone}</td>
                </tr>
                <tr>
                    <th class="text-r">性别：</th>
                    <td>${user.sex}</td>
                </tr>
                <tr>
                    <th class="text-r">身份：</th>
                    <td><c:if test="${user.role==1}">学生</c:if><c:if test="${user.role==2}">食堂员工</c:if>
                        <c:if test="${user.role==3}">管理员</c:if></td>
                </tr>

            </form>
            </tbody>
        </table>
    </div>


</section>

<%@include file="publicFooter.jsp" %>
</body>
</html>
