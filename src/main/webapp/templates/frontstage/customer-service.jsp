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

    <!-- all css here -->

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
                <h2>線上客服</h2>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Customer Service</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="contact-area pt-100 pb-100">
        <div class="container">
            <h4 class="contact-title" style="text-align:center;">常見Q&A整理</h4>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="contact-info-wrapper text-center mb-30">
                        <!-- <div class="contact-info-icon">
                            <i class="ti-location-pin"></i>
                        </div> -->
                        <div class="contact-info-content">
                            <h4>商城常見問題Q&A</h4>
                            <p>退換貨規則</p>
                            <p>商品有問題</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="contact-info-wrapper text-center mb-30">
                        <!-- <div class="contact-info-icon">
                            <i class="ti-mobile"></i>
                        </div> -->
                        <div class="contact-info-content">
                            <h4>美容常見問題Q&A</h4>
                            <p>如何預約預約</p>
                            <p>如何取消預約</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="contact-info-wrapper text-center mb-30">
                        <!-- <div class="contact-info-icon">
                            <i class="ti-email"></i>
                        </div> -->
                        <div class="contact-info-content">
                            <h4>住宿常見問題Q&A</h4>
                            <p>如何預定住宿</a></p>
                            <p>如何取消住宿</p>
                        </div>
                    </div>
                </div>
            </div>
                <div class="row">
                    <div class="col-12">
                        <div class="contact-message-wrapper">
                            <h4 class="contact-title" style="text-align:center;">即時線上客服</h4>
                            <div class="contact-message">
                                <form id="contact-form" action="${pageContext.request.contextPath}/static/frontstage/mail.php" method="post">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="contact-form-style">
                                                <div style="width: 100%;height: 250px;border: 1px solid darkgray; overflow:auto;margin: 10px auto;">
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                    這是聊天室窗<br>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="contact-form-style mb-20">
                                                <input name="subject" placeholder="請輸入內容" type="text">
                                                <button class="submit btn-style" type="submit" style="float:right">發送訊息</button>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </form>
                                <p class="form-messege"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact-map">
                    <div id="map"></div>
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
    <script src="http://ditu.google.cn/maps/api/js?key=AIzaSyBmGmeot5jcjdaJTvfCmQPfzeoG_pABeWo"></script>
    <script>
        function init() {
            var mapOptions = {
                zoom: 11,
                scrollwheel: false,
                center: new google.maps.LatLng(40.709896, -73.995481),
                styles: [{
                        "featureType": "administrative",
                        "elementType": "labels.text.fill",
                        "stylers": [{
                            "color": "#444444"
                        }]
                    },
                    {
                        "featureType": "landscape",
                        "elementType": "all",
                        "stylers": [{
                            "color": "#f2f2f2"
                        }]
                    },
                    {
                        "featureType": "poi",
                        "elementType": "all",
                        "stylers": [{
                            "visibility": "off"
                        }]
                    },
                    {
                        "featureType": "road",
                        "elementType": "all",
                        "stylers": [{
                                "saturation": -100
                            },
                            {
                                "lightness": 45
                            }
                        ]
                    },
                    {
                        "featureType": "road.highway",
                        "elementType": "all",
                        "stylers": [{
                            "visibility": "simplified"
                        }]
                    },
                    {
                        "featureType": "road.arterial",
                        "elementType": "labels.icon",
                        "stylers": [{
                            "visibility": "off"
                        }]
                    },
                    {
                        "featureType": "transit",
                        "elementType": "all",
                        "stylers": [{
                            "visibility": "off"
                        }]
                    },
                    {
                        "featureType": "water",
                        "elementType": "all",
                        "stylers": [{
                                "color": "#F6AB44"
                            },
                            {
                                "visibility": "on"
                            }
                        ]
                    }
                ]
            };
            var mapElement = document.getElementById('map');
            var map = new google.maps.Map(mapElement, mapOptions);
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(40.709896, -73.995481),
                map: map,
                icon: '${pageContext.request.contextPath}/static/frontstage/img/icon-img/map.png',
                animation: google.maps.Animation.BOUNCE,
                title: 'Snazzy!'
            });
        }
        google.maps.event.addDomListener(window, 'load', init);
    </script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script>
</body>

</html>