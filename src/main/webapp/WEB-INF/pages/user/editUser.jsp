<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../fore/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改个人资料</title>
</head>
<body>

<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">Tip：个人资料修改</div>
                <div class="panel-body">
                    <table class="table">
                        <tr>
                            <th colspan='2'>个人资料</th>
                        </tr>
                        <form name='form' action='/updateUser' method="post" enctype="multipart/form-data">

                            <input type='hidden' name="id" value="${user.id}"/>
                            <input type="hidden" name="name" value="${user.name}"/>
                            <input type="hidden" name="sex" value="${user.sex}"/>
                            <input type="hidden" name="role" value="${user.role}">
                            <input type="hidden" name="number" value="${user.number}">

                            <tr>
                                <td width="100">昵称</td>
                                <td><input type='text' name="nickName" value="${user.nickName}"/></td>
                            </tr>
                            <tr>
                                <td>密码</td>
                                <td><input type='text' name="password" value="${user.password}"/></td>
                            </tr>
                            <tr>
                                <td>电话</td>
                                <td><input type='text' name="phone" value="${user.phone}"/></td>
                            </tr>
                            <tr>
                                <td>头像</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/${user.imgUrl} " width="50px"
                                         height="50px">

                                </td>
                            </tr>
                            <tr>
                                <td>重新上传图片</td>
                                <td><input type="file" name="image" accept="image/*"/></td>
                            </tr>
                            <tr>
                                <td colspan='2' width='600px'><input type="submit"
                                                                     value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input
                                        type="reset"
                                        value="重置"/>
                                </td>
                            </tr>
                        </form>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
