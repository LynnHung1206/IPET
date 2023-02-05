<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Marten - Pet Food eCommerce Bootstrap4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png">

    <!-- all css here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css">
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <%@include file="/templates/frontstage/common/header.jsp"%>
    <div class="breadcrumb-area pt-95 pb-95 bg-img" style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>美容服務</h2>
                <ul>
                    <li><a href="index.html">home</a></li>
                    <li class="active">美容服務</li>
                </ul>
                <p></p>
                <a class="btn-style" href="#">我要預約</a>
            </div>
        </div>
    </div>
    <div class="shop-area pt-100 pb-100">
        <div class="container">
            <div class="row flex-row-reverse">
                <div class="col-lg-12 col-md-8">
                    <div class="row">
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="${pageContext.request.contextPath}/ipet-front/salon/service"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-4.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="${pageContext.request.contextPath}/ipet-front/salon/service">基礎美容</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li><b>價格範圍:</b> <span>NT$750 - $1200 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="blog-details.html"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-5.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="blog-details.html">造型美容</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li><b>價格範圍:</b> <span>NT$1500 - $3500 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="blog-details.html"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-6.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="blog-details.html">頂級SPA</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li><b>價格範圍:</b> <span>NT$4000 - $5000 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="blog-details.html"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-7.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="blog-details.html">深層護理</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li>價格範圍: <span>NT$4500 - $6000 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
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