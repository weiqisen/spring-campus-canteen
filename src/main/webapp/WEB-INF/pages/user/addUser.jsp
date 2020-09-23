<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../admin/publicMeta.jsp" %>
<%@include file="../admin/publicHeader.jsp" %>
<%@include file="../admin/adminMenu.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <a>Tip:用户头像为默认，登录个人账号后即可进行修改！</a>
                </span>
                <span class="r">Tip:角色分类："1"：普通用户；"2"：窗口工作人员；"3"：管理员；"4"：后勤人员</span>
            </div>

            <div class="pd-20">
                <table class="table">
                    <tbody>
                    <form name="form" action="addUser" method="post">
                        <table align="center">
                            <input type="hidden" name="nickName" value="还没给自己起个昵称哦！">
                            <tr>
                                <th class="text-r" width="40">姓名</th>
                                <td><input type="text" name="name"/></td>
                            </tr>
                            <tr>
                                <th class="text-r">密码</th>
                                <td><input type="text" name="password"/></td>
                            </tr>
                            <tr>
                                <th class="text-r">学号</th>
                                <td><input type="text" name="number"/></td>
                            </tr>

                            <tr>
                                <th class="text-r">角色</th>
                                <td><input type="text" name="role"/></td>
                            </tr>
                            <tr>
                                <th class="text-r">电话</th>
                                <td><input type="text" name="phone"/></td>
                            </tr>
                            <tr>
                                <th class="text-r">性别</th>
                                <td><input name="sex" type="radio" checked="checked" value="男">男<input name="sex"
                                                                                                       type="radio"
                                                                                                       value="女">女
                                </td>
                            </tr>
                            <tr>
                                <td colspan='2' width='600px'>
                                    <input type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" value="重置"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                    </tbody>
                </table>
            </div>
        </article>

    </div>
</section>