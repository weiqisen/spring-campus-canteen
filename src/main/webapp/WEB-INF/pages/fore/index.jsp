<%--
  Created by IntelliJ IDEA.
  User: weiqisen
  Date: 18/12/2019
  Time: 1:10 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="head.jsp" %>


<div class="hero-area home-four mb-30">
    <!--=======  slider container  =======-->
    <div class="slider-container">
        <!--=======  hero slider one  =======-->
        <div class="slider-style-2">
            <!--=======  slider item  =======-->
            <div class="hero-slider-item slider-bg-9">
            </div>

            <!--=======  End of slider item  =======-->

            <!--=======  slider item  =======-->

            <div class="hero-slider-item slider-bg-10">
                <!--=======  slider content  =======-->

                <!--=======  End of slider content  =======-->
            </div>

            <!--=======  End of slider item  =======-->

            <!--=======  slider item  =======-->

            <div class="hero-slider-item slider-bg-11">
                <!--=======  slider content  =======-->
                <!--=======  End of slider content  =======-->
            </div>

            <!--=======  End of slider item  =======-->

        </div>

        <!--=======  End of hero slider one  =======-->
    </div>

    <!--=======  End of slider container  =======-->
</div>


<%--<c:forEach items="${windows}" var="window" varStatus="vs">--%>

    <%--<div class="slider-banner-sidebar-three mb-50">--%>
        <%--<div class="container">--%>
            <%--<div class="row">--%>
                <%--<div class="col-lg-12">--%>
                    <%--<!--=======  slider banner sidebar three container  =======-->--%>
                    <%--<div class="slider-banner-sidebar-three-container">--%>
                        <%--<div class="sidebar-container">--%>
                            <%--<!--=======  section title  =======-->--%>
                            <%--<div class="section-title-three">--%>
                                <%--<h3 id="${window.id}">${window.name}</h3>--%>
                            <%--</div>--%>
                            <%--<!--=======  End of section title  =======-->--%>
                            <%--<!--=======  sidebar  =======-->--%>
                            <%--<div class="sidebar">让食堂点餐更为高效简洁</div>--%>
                            <%--<!--=======  End of sidebar  =======-->--%>
                        <%--</div>--%>
                        <%--<!--=======  banner  =======-->--%>
                        <%--<div class="slider-banner home-four-banner slider-border banner-bg banner-bg-4">--%>
                            <%--<div class="banner-text h-100"></div>--%>
                        <%--</div>--%>
                        <%--<!--=======  End of banner  =======-->--%>
                        <%--<div class="fl-slider tab-product-slider">--%>
                            <%--<c:forEach items="${window.products}" var="product">--%>
                                <%--<div class="fl-product">--%>
                                    <%--<div class="image">--%>
                                        <%--<a>--%>
                                            <%--<img src="${pageContext.request.contextPath}/${product.imgUrl}"--%>
                                                 <%--class="img-fluid" alt="">--%>
                                            <%--<img src="${pageContext.request.contextPath}/${product.imgUrl}"--%>
                                                 <%--class="img-fluid" alt="">--%>
                                        <%--</a>--%>
                                        <%--<!-- wishlist icon -->--%>
                                        <%--<span class="wishlist-icon">--%>
                                            <%--<a href="#"><i class="icon ion-md-heart-empty"></i></a>--%>
										 <%--</span>--%>
                                    <%--</div>--%>
                                    <%--<div class="content">--%>
                                        <%--<h2 class="product-title"><a--%>
                                                <%--href="foreDetailUI?id=${product.id}">${product.name}</a></h2>--%>
                                        <%--<div class="rating">--%>
                                            <%--<i class="fa fa-star active"></i>--%>
                                            <%--<i class="fa fa-star active"></i>--%>
                                            <%--<i class="fa fa-star active"></i>--%>
                                            <%--<i class="fa fa-star"></i>--%>
                                            <%--<i class="fa fa-star"></i>--%>
                                        <%--</div>--%>
                                        <%--<p class="product-price">--%>
                                            <%--<span class="main-price discounted">--%>
                                                <%--$<fmt:formatNumber type="number" value="${product.price+15.1}"--%>
                                                                   <%--pattern="0.00" maxFractionDigits="2"/>--%>
                                            <%--</span>--%>
                                            <%--<span class="discounted-price">--%>
                                                <%--$<fmt:formatNumber type="number" value="${product.price}" pattern="0.00"--%>
                                                                   <%--maxFractionDigits="2"/>--%>
                                            <%--</span>--%>
                                        <%--</p>--%>


                                    <%--</div>--%>

                                <%--</div>--%>
                            <%--</c:forEach>--%>
                            <%--<!--=======  End of single product  =======-->--%>
                        <%--</div>--%>

                        <%--<!--=======  End of banner slider  =======-->--%>
                    <%--</div>--%>
                    <%--<!--=======  End of slider banner sidebar three container  =======-->--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</c:forEach>--%>


<%@include file="footer.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.min.js"></script>
