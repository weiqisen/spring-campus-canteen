<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../fore/head.jsp" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>失物招领详情页面</title>
</head>
<body>
<h3>详细失物信息</h3>
<table>

    <form>
        <ul>

            <img class="round" src="${pageContext.request.contextPath}/${lost.user.imgUrl}" width="15px" height="15px">
            <li>姓名:${lost.user.name}</li>
            <br/>
            <li>联系方式:${lost.user.phone}</li>
            <br/>
            <li>标题:${lost.kind}</li>
            <br/>

            <br/>
            <li>内容:<textarea name="" id="" readonly="readonly" cols="30" rows="10">${lost.content}</textarea></li>
            <br/>
            <li><a>失物具体图片:</a>
                <img src="${pageContext.request.contextPath}/${lost.imgUrl}" width="150px" height="150px">
            </li>

        </ul>

    </form>

</table>

</body>
</html>
<%@include file="../fore/footer.jsp" %>