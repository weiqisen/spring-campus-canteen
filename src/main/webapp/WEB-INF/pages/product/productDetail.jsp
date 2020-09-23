<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../fore/head.jsp" %>

<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>菜品详情</title>
</head>
<body>

<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">菜品详情</div>
                <div class="panel-body">

                    <table>
                        <tr>
                            <td width="100px">名称</td>
                            <td width="100px">价格</td>
                            <td width="200px">详情</td>
                            <td width="100px">状态</td>
                            <td width="200px">图片</td>
                            <td width="100px">热度</td>
                            <td width="100px">操作</td>
                            <td></td>
                        </tr>
                        <tr>
                            <input type="hidden" id="id" value="${product.id}">
                            <td>${product.name}</td>
                            <td>${product.price}</td>
                            <td width="80">${product.detail}</td>
                            <td><c:if test="${product.status==1}">在售</c:if> <a style="color: #ff2d38"><c:if
                                    test="${product.status==0}">无货</c:if></a</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/${product.imgUrl}" width="100px"
                                     height="100px">
                            </td>
                            <td id="hot">${product.hot}°C</td>
                            <td>
                                <button class="btn btn-success radius" onclick='like(${product.id})'><i class="Hui-iconfont">&#xe648;</i>喜欢</button>
                            </td>
                            <td><input class="btn btn-primary radius" type="button" value="添加购物车" onclick="javascript:addCart(${product.id})">
                            </td>

                        </tr>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<%--如果进来了这个页面浏览3秒后，ajax异步更新菜品热度值加2,点击一次like热度值加10--%>
<script>

    function addCart(id) {
        $.ajax({
            url: "addCart",
            data: "id=" + id,
            type: "POST",
            success:
                function (flag) {
                    if (flag == "success") {
                        alert("已加入购物车！");
                    }

                    else if (flag == "false") {
                        alert("当前菜品无货");

                    }

                    else if (flag == "close") {
                        alert("当前菜品所在窗口未营业");

                    }
                    else if (flag == "false_Login") {
                        alert("您还未登录账号！");
                    }
                }
        });
    }

    window.onload = function () {
        setTimeout('viewProduct()', 3000);
    }

    function viewProduct() {
        var id = document.getElementById("id").value;
        //var id = $("#id").text();

        $.ajax({
                url: "addView",
                data: "id=" + id,
                success:
                    function (data) {
                        //alert(data);
                        if (data != "nothingview") {
                            $("#hot").text(data + "°C");
                        }
                    }


            }
        )
        ;


    }

    function like(id) {
        // var id = id * 1;
        $.ajax({
                url: "addLike",
                data: "id=" + id,
                type: "POST",
                success:
                    function (data) {
                        //alert(data);
                        if (data != "nothinglike") {
                            $("#hot").text(data + "°C");
                        }


                    },


            }
        )
        ;


    }

</script>