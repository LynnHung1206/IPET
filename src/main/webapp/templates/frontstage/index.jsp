<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>IPET - Pet Food eCommerce Bootstrap4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css">
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
<%@include file="/templates/frontstage/common/header.jsp"%>
    <div class="slider-area">
        <div class="slider-active owl-dot-style owl-carousel">
            <div class="single-slider pt-100 pb-100 yellow-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-7 col-12">
                            <div class="slider-content slider-animated-1 pt-114">
                                <h3 class="animated">welcome to IPET</h3>
                                <h1 style="font-family:fantasy">即刻享用服務</h1>
                                <div class="slider-btn">
                                    <a class="animated" href="product-details.html">SHOP NOW</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-5 col-12">
                            <div class="slider-single-img slider-animated-1">
                                <img class="animated" src="${pageContext.request.contextPath}/static/frontstage/img/slider/slider-single-img-2.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="food-category food-category-col pt-100 pb-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="single-food-category cate-padding-1 text-center mb-30">
                        <div class="single-food-hover-2">
                            <img src="${pageContext.request.contextPath}/static/frontstage/img/product/product-1.jpg" alt="">
                        </div>
                        <div class="single-food-content">
                            <h3>寵物商城</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single-food-category cate-padding-2 text-center mb-30">
                    <a href="<c:url value='/ipet-front/salon/salonCategory' />">
                        <div class="single-food-hover-2">
                            <img src="${pageContext.request.contextPath}/static/frontstage/img/product/product-2.jpg" alt="">
                        </div>
                        <div class="single-food-content">
                            <h3>寵物美容</h3>
                        </div>
                    </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single-food-category cate-padding-3 text-center mb-30">
                        <div class="single-food-hover-2">
                            <img src="${pageContext.request.contextPath}/static/frontstage/img/product/product-3.jpg" alt="">
                        </div>
                        <div class="single-food-content">
                            <h3>寵物住宿</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="/templates/frontstage/common/footer.jsp"%>
    
   



    <!-- all js here -->
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/elevetezoom.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/ajax-mail.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script>
</body>

</html>