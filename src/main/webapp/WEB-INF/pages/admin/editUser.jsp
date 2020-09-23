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


    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a>Tip:角色分类："1"：普通用户；"2"：窗口工作人员；"3"：管理员；"4"：后勤人员</a>
                </span>
                <span class="r">共有数据：<strong>1</strong> 条</span>
            </div>


            <div class="cl pd-20" style=" background-color:#5bacb6">
                <img class="avatar size-XL l" src="${user.imgUrl}">
                <dl style="margin-left:80px; color:#fff">
                    <dt>
                        <span class="f-18">${user.name}</span>
                        <span class="pl-10 f-12">昵称:${user.nickName}</span>
                    </dt>
                    <dd class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd>
                </dl>
            </div>
            <div class="pd-20">
                <table class="table">
                    <tbody>
                    <form name='form' action='/updateUserByCondition' method="post">
                        <input type='hidden' name="id" value="${user.id}"/>
                        <input type="hidden" name="nickName" value="${user.nickName}"/>
                        <input type="hidden" name="imgUrl" value="${user.imgUrl}">

                        <tr>
                            <th class="text-r" width="40">姓名：</th>
                            <td><input type='text' name="name" value="${user.name}"/></td>
                        </tr>
                        <tr>
                            <th class="text-r">学号：</th>
                            <td><input type='text' name="number" value="${user.number}"/></td>
                        </tr>
                        <tr>
                            <th class="text-r">密码：</th>
                            <td><input type='text' name="password" placeholder="请输入新密码"/></td>
                        </tr>
                        <tr>
                            <th class="text-r">电话：</th>
                            <td><input type='text' name="phone" value="${user.phone}"/></td>
                        </tr>
                        <tr>
                            <th class="text-r">性别：</th>
                            <td><input type='text' name="sex" value="${user.sex}"/></td>
                        </tr>
                        <tr>
                            <th class="text-r">角色：</th>
                            <td><input type='text' name="role" value="${user.role}"/></td>
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

<%@include file="publicFooter.jsp" %>
</body>
</html>
