<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 8/2/2020
  Time: 11:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../fore/head.jsp" %>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>



<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header">点击菜品图片即可查看菜品更多详情</div>
                <div class="panel-body">
                    <table border=1>
                        <br/><br/>
                        <tr>
                            <td width="200px">图片</td>
                            <td width="100px">名称</td>
                            <td width="100px">价格</td>
                            <td width="100px">状态</td>
                            <td width="100px">操作</td>
                        </tr>


                        <c:forEach items="${products}" var="product">
                            <form>
                                <input type="hidden" name="id" value="${product.id}">
                                <tr>
                                    <td>
                                        <img onclick="location='productDetail?id=${product.id}'"
                                             src="${pageContext.request.contextPath}/${product.imgUrl}" width="100px"
                                             height="100px"></td>
                                    <td>${product.name}</td>
                                    <td>${product.price}</td>
                                    <td><c:if test="${product.status==1}">在售</c:if> <a style="color: #ff2d38"><c:if
                                            test="${product.status==0}">无货</c:if></a</td>
                                    <td><input type="button" value="添加购物车" onclick="javascript:addCart(${product.id})">
                                    </td>

                                </tr>
                            </form>
                        </c:forEach>
                    </table>


                </div>
            </div>
        </div>
    </div>
</div>


<%-----------添加购物车------------------%>
<script type="text/javascript">
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
</script>