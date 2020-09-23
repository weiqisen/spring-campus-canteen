<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>华软食堂点餐系统</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/lib/Hui-iconfont/1.0.8/iconfont.min.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/jquery-ui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/jquery.validation/1.14.0/messages_zh.js"></script>

    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">

    <!-- Ionicons CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/ionicons.min.css" rel="stylesheet">

    <!-- Plugins CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet">

    <!-- Helper CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/helper.css" rel="stylesheet">

    <!-- Main CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">

    <!-- Modernizer JS -->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-2.8.3.min.js"></script>

</head>

<body class="grey-bg">

<!--=============================================
=            header container         =
=============================================-->

<div class="header-container header-container-home-4 header-sticky white-bg">

    <!--=============================================
    =            header top         =
    =============================================-->

    <div class="container ">
        <div class="row">
            <div class="col-12 col-lg-6">
                <div class="header-top-text">


                    <div id="marquee" class="marquee">
                        <div id="holder">
                            <ul>
                                <li>学号:${user.number}:${user.name}，欢迎登陆！</li>
                                <li><i class="icon ion-md-alarm"></i> 下单后，约10分钟即可收到取餐通知推送哦！</li>
                                <li>欢迎大家点餐！</li>
                            </ul>
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-12 col-lg-6">
                <!--=======  header top dropdowns  =======-->

                <div class="header-top-dropdown d-flex justify-content-lg-end cl">

                    <ul class="cl">

                        <img onclick="location='showUser'" class="round"
                             src="${pageContext.request.contextPath}/${user.imgUrl}"
                             width="25px" height="25px">
                        <span class="pipe">|</span>
                        <a class="dropDown_A">${user.name}</a>
                        <span class="pipe">|</span>
                        <a href="${pageContext.request.contextPath}/showUser">个人资料</a>
                        <span class="pipe">|</span>
                        <a href="${pageContext.request.contextPath}/logout">注销</a>


                    </ul>

                </div>

            </div>
        </div>
    </div>


    <div class="navigation-menu-top navigation-menu-top-home-4 pt-35 pb-35 pt-md-15 pb-md-15 pt-sm-15 pb-sm-15 mb-md-55 mb-sm-55">

        <div class="navigation-menu navigation-menu-home-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12 col-lg-7">

                        <!-- navigation section -->
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li><a href="/index">主页</a></li>

                                    <li><a href="/listProductFore">菜品热搜榜</a></li>
                                    <li><a href="/myCart"><i class="icon ion-md-cart"></i>购物车</a></li>
                                    <li class=" menu-item-has-children"><a href="/myOrder">所有订单</a>
                                        <ul class="sub-menu">

                                            <li><a href="/myOrderA"
                                                   class="fruit">已下单${a}</a>
                                            </li>
                                            <li><a href="/myOrderB"
                                                   class="fruit">待评价${b}</a>
                                            </li>
                                            <li><a href="/myOrderC" class="fruit">已完成${c}</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="success menu-item-has-children"><a href="/lost">失物发布</a>
                                        <ul class="sub-menu">

                                            <li><a href="/lost"
                                                   class="fruit">失物发布</a>
                                            </li>
                                            <li><a href="/myLost"
                                                   class="fruit">我的发布</a>
                                            </li>

                                        </ul>
                                    </li>
                                    <li><a href="/listCanteen">饭堂</a></li>
                                    <li><a href="/foreComment">评价黑板报</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!-- end of navigation section -->
                    </div>
                    <div class="col-12 col-lg-3">
                        <!--=======  navigation search bar  =======-->

                        <div class="navigation-search d-none d-lg-block">
                            <form method="post" action="/findProductByName">
                                <input type="search" placeholder="云吞面" name="pName">
                                <button type="submit"><i class="icon ion-md-search"></i></button>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
   </div>
</div>
