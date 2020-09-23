<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../admin/publicMeta.jsp" %>
<%@include file="../admin/publicHeader.jsp" %>
<%@include file="staffMenu.jsp" %>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">主页</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <p class="f-20 text-success">窗口工作人员主页:</p>
        </article>

        <div class="page-container">
            <div class="Huialert Huialert-danger">
                <a>当前窗口为：${window.name}&nbsp;&nbsp;&nbsp;&nbsp;窗口当前状态：<a id="status"><strong><c:if
                        test="${window.status==1}">营业中</c:if><c:if
                        test="${window.status==0}">已打烊</c:if></strong><a/></a>
                    <span class="r">
                <input class="btn btn-success radius" onclick='javascript:setOpen()' type="button" value="一键营业">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input class="btn btn-default radius" onclick='javascript:setClose()' type="button" value="一键打烊">
                </span>
            </div>
            <div class="Huialert Huialert-info"><i class="Hui-iconfont">&#xe6a6;</i>
                <p class="f-20 text-success">您好!&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用华软食堂后台管理系统！ <span
                        class="f-14">Beta1.0</span></p></div>
            <div class="Huialert Huialert-success"><i class="Hui-iconfont">&#xe6a6;</i>
                当前登录IP：${myIp}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            </div>

        </div>


        <footer class="footer">
            <p>
                感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br>
                Copyright &copy;2015 H-ui.admin v3.0 All Rights Reserved.
                <br> 本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持
            </p>
        </footer>
    </div>
</section>


<%@include file="../admin/publicFooter.jsp" %>

</body>
</html>
<script>
    function setOpen() {
        $.ajax({
            url: "setOpen",
            success:
                function (flag) {
                    if (flag == "success") {
                        alert("窗口已设置为开放营业！")
                        window.location.href = "index";
                    }

                }

        });
    }

    function setClose() {
        $.ajax({
            url: "setClose",
            success:
                function (flag) {
                    if (flag == "success") {
                        alert("窗口状态已设置打烊！")
                        window.location.href = "index";
                    }

                }

        });


    }
</script>