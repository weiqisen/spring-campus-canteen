<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 31/1/2020
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="publicMeta.jsp" %>
<%@include file="publicHeader.jsp" %>
<%@include file="adminMenu.jsp" %>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">后台管理员主页</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
           href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">

        <div class="page-container">
            <div class="Huialert Huialert-info"><i class="Hui-iconfont">&#xe6a6;</i>
                <p class="f-20 text-success">欢迎使用华软食堂后台管理系统！ <span class="f-14">Beta1.0</span></p></div>
            <div class="Huialert Huialert-success"><i class="Hui-iconfont">&#xe6a6;</i>您好! &nbsp;&nbsp;&nbsp;&nbsp;当前登录IP：${myIp}<br>
            </div>
        </div>
        <footer class="footer">
            <p>
                感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br>
                Copyright &copy;2015 H-ui.admin v3.0 All Rights Reserved.<br> 本后台系统由<a href="http://www.h-ui.net/"
                                                                                       target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持
            </p>
        </footer>
    </div>
</section>


<%@include file="publicFooter.jsp" %>
</body>
</html>