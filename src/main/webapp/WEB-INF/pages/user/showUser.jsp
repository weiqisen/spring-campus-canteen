<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../fore/head.jsp" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户详情页面</title>
</head>
<body>
<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">我的资料</div>
                <div class="panel-body">
                    <table>

                        <form action="/editUser">
                            <input type="hidden" name="id" value="${user.id}">
                            <ul>
                                <li>头像</li>
                                <br/>
                                <img src="${pageContext.request.contextPath}/${user.imgUrl}" width="50px" height="50px">
                                <li>姓名:${user.name}</li>
                                <br/>
                                <li>昵称:${user.nickName}</li>
                                <br/>
                                <br/>
                                <li>密码:${user.password}</li>
                                <br/>
                                <li>电话:${user.phone}</li>
                                <br/>
                                <li><c:if test="${user.role==1}">学号</c:if><c:if test="${user.role==2}">工号</c:if><c:if
                                        test="${user.role==3}">工号</c:if>:${user.number}</li>
                                <br/>
                                <li>性别:${user.sex}</li>
                                <br/>
                                <li>身份:<c:if test="${user.role==1}">学生</c:if><c:if test="${user.role==2}">食堂员工</c:if>
                                    <c:if test="${user.role==3}">管理员</c:if></li>
                            </ul>
                            <input type="submit" name="" id="" value="编辑">
                        </form>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>