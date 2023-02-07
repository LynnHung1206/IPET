<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.list.model.services.CartService"%>
<%@ page import="com.web.list.model.entities.CartList"%>
<%@ page import="com.web.list.model.entities.CartList.CartListPK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css">
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
	
	<style>
		.billing-btn, td{
			text-align: center !important;
		}
	</style>
</head>

<body>
<%@include file="/templates/frontstage/common/header.jsp"%>
    <div class="breadcrumb-area pt-95 pb-95 bg-img" style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>Checkout</h2>
                <ul>
                    <li><a href="index.html">home</a></li>
                    <li class="active">Checkout</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- shopping-cart-area start -->
    <div class="checkout-area pt-95 pb-70">
        <div class="container">
            <h3 class="page-title"></h3>
            <div class="row">
                <div class="col-lg-12">
                    <div class="billing-btn">
                         <button id="returnToShop" type="button"><a href="${pageContext.request.contextPath}/ipet-front/shop/home">返回首頁</a></button>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(window).on('load', function(){
			swal("訂單新增成功", "", "success");
		});
	</script>
</body>

</html>