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
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

    <!-- all css here -->
    <style type="text/css" media="screen">
        #msg {
            width: 50px;
            height: 50px;
            position: fixed;
            right: 50px;
            bottom: 50px;
            opacity: 0.5;

            /* 整個標籤透明度0-1 */
        }

        #msg:hover {
            opacity: 1;
        }
    </style>
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
    <div class="breadcrumb-area pt-95 pb-95 bg-img" style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>關於我們</h2>
                <ul>
                    <li class="active">about us</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="about-us-area pt-100 pb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="about-us-img pr-30 wow fadeInLeft">
                        <img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/banner/banner-3.png">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 d-flex align-items-center">
                    <div class="about-us-content">
                        <h2>關於 IPET</h2>
                        <p>我們是由一群準軟體工程師共同經營的複合式寵物商城 由於網路世界開始崛起 我們也將傳統的寵物商城跨及到網路平台來提供飼主與毛小孩
                            各式各樣的服務 包括美容商城與住宿 我們對於服務品質的堅持也源自我們對於code的品質的要求<br>

                        </p>
                        <div class="about-us-list">
                            <h4>我們的三大堅持:</h4>
                            <ul>
                                <li>堅持商品品質的把關-杜絕來路不明的商品</li>
                                <li>堅持美容的服務品質-毛孩交給我們請放心</li>
                                <li>堅持住宿環境的品質-把毛孩當作自己家人</li>
                            </ul>
                        </div>
                        <div class="about-us-btn">
                            <a class="btn-style" href="#">聯絡我們</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="team-ara pt-95 pb-70">
        <div class="container">
            <div class="section-title text-center mb-55">
                <h2>我們的團隊</h2>
                <p>Tibame CGA105 第一組</p>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-1.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>佳豪</h4>
                            <span>掃地阿伯</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-2.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>育伶</h4>
                            <span>董事長</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-3.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>文豪</h4>
                            <span>總經理</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-4.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>關婷</h4>
                            <span>美容經理</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="team-ara pt-95 pb-70">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-1.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>育菁</h4>
                            <span>美容經理</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-2.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>振豪</h4>
                            <span>住宿經理</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-3.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>承憲</h4>
                            <span>商城經理</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/static/frontstage/img/team/team-4.jpg" alt="">
                            </a>
                            <div class="team-social">
                                <a href="#">
                                    <i class="ti-facebook"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-pinterest"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-twitter-alt"></i>
                                </a>
                                <a href="#">
                                    <i class="ti-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>宏熹</h4>
                            <span>商城經理</span>
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