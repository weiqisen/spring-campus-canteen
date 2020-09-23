<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 11/2/2020
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../fore/head.jsp" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="containBox">
    <div class="wap-container">
        <div class="container ui-sortable">
            <div class="panel panel-default mt-20">
                <div class="panel-header"><input type="button" value="发布失物信息"
                                                 onclick="javascript:window.location.href='toAddLost'"></div>
                <div class="panel-body">


                    <c:forEach items="${losts}" var="ls">
                        <ul id="Huifold1" class="Huifold">
                            <li class="item">
                                <h4><img class="round"
                                         src="${pageContext.request.contextPath}/${ls.user.imgUrl}" width="30px"
                                         height="30px" alt=""><span class="pipe">|</span>${ls.kind}
                                    <a deleteLink="true" title="删除"
                                       onclick='javascript:deleteLost("${ls.id}")'
                                       class="ml-5" style="text-decoration:none">
                                        <i class="Hui-iconfont">&#xe6e2;</i>
                                    </a></h4>
                                <div class="info"> 联系人：<a class="c-primary">${ls.user.name}</a><br>联系电话：${ls.user.phone}
                                    <br>具体信息：${ls.content}<br>发布时间：${ls.time}<br>图片详情：<br><img
                                            src="${pageContext.request.contextPath}/${ls.imgUrl}" width="100px"
                                            height="100px" alt="">
                                </div>
                            </li>
                        </ul>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<%@include file="../fore/footer.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript">
    $(function () {
        $.Huifold("#Huifold1 .item h4", "#Huifold1 .item .info", "fast", 2, "click");
        /*5个参数顺序不可打乱，分别是：相应区,隐藏显示的内容,速度,类型,事件*/
    });


    function deleteLost(id) {

        if (confirm("是否确认删除？")) {
            window.location.href = "delLost?id=" + id;
        } else {
            alert("已取消该操作");
        }




    }

    !function ($) {
        $.Huifold = function (obj, obj_c, speed, obj_type, Event) {
            if (obj_type == 2) {
                $(obj + ":first").find("b").html("-");
                $(obj_c + ":first").show();
            }
            $('body').on(Event, obj, function () {
                if ($(this).next().is(":visible")) {
                    if (obj_type == 2) {
                        return false;
                    } else {
                        $(this).next().slideUp(speed).end().removeClass("selected");
                        if ($(this).find("b")) {
                            $(this).find("b").html("+");
                        }
                    }
                } else {
                    if (obj_type == 3) {
                        $(this).next().slideDown(speed).end().addClass("selected");
                        if ($(this).find("b")) {
                            $(this).find("b").html("-");
                        }
                    } else {
                        $(obj_c).slideUp(speed);
                        $(obj).removeClass("selected");
                        if ($(this).find("b")) {
                            $(obj).find("b").html("+");
                        }
                        $(this).next().slideDown(speed).end().addClass("selected");
                        if ($(this).find("b")) {
                            $(this).find("b").html("-");
                        }
                    }
                }
            });
        }
    }(window.jQuery);
    $("#menu_4 dt").addClass("selected");
    $("#menu_4 dd").show();
    $(".Hui-aside").scrollTop(566);

</script>