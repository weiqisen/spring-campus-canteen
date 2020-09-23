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
        评论管理
        <span class="c-gray en">&gt;</span>
        待审核评论列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                   href="javascript:location.replace(location.href);" title="刷新"><i
                class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">

                    <a>Tip:点击最右边 <i class="Hui-iconfont">&#xe6e1;</i>即可快速通过评价哦！</a>
                </span>
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>

            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">评论列表</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="">昵称</th>
                    <th width="">头像</th>
                    <th width="">订单号码</th>
                    <th width="">评价内容</th>
                    <th width="">发布时间</th>
                    <th width="">状态</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${comments}" var="cs">
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td>${cs.user.nickName}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/${cs.user.imgUrl} " width="50px" height="50px">
                        </td>
                        <td>${cs.order.number}</td>
                        <td>${cs.content}</td>
                        <td>${cs.time}</td>
                        <td id="pass${cs.id}"><c:if test="${cs.status==0}"><a
                                style="color: #5f41ff"><strong>未审核</strong></a></c:if>
                            <c:if test="${cs.status==1}"><strong>已通过</strong></c:if></td>
                        <td>
                            <a title="审核" onclick="pass(${cs.id})" class=" ml-5" style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6e1;</i>
                            </a>
                        </td>

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


<%@include file="publicFooter.jsp" %>
<%--用ajax修改审核状态后回调函数刷新页面--%>
<script>
    function pass(id) {
        $.ajax({
            type: "POST",
            url: "pass",
            data: "id=" + id,
            success: function (data) {
                if (data == "success") {
                    var tag = "#pass" + id;
                    alert("操作成功！");
                    $(tag).text("已通过");
                    location.reload();

                }
                else {
                    alert("请求失败!")
                }

            }
        });
    }
</script>

</body>
</html>
