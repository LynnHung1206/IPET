<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.product.model.entity.Product"%>



<%
Product product = (Product) request.getAttribute("product");
pageContext.setAttribute("product", product);
%>

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
	
	<style>
 		.img-location {
    		display: flex;
    		justify-content: center;
    		align-items: center;
		}
    </style>
</head>

<body>
    <!-- header -->
	<%@include file="/templates/frontstage/common/header.jsp"%>

	<!-- breadcrumb -->
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>Product Detail</h2>
				<ul>
					<li><a href="<%= request.getContextPath() %>/templates/frontstage/shop/shop.jsp">home</a></li>
					<li class="active">Shop</li>
				</ul>
			</div>
		</div>
	</div>
	
    <div class="shop-area pt-70 pb-70">
        <div class="container">
            <div class="row">
                
                <!-- product image -->
                <div class="col-lg-6 col-md-6 img-location">
                    <div class="img-location">
                        <img src="showImg?prodID=${product.prodID}" />
                    </div>
                </div>
                
                <!-- product info -->
                <div class="col-lg-6 col-md-6">
                    <div class="product-details-content">
                        <h2>${product.prodName}</h2>
                        <div class="product-price">
                            <span class="new">$ ${product.prodPrice} </span>
                        </div>
                        <div class="in-stock">
                            <span><i class="ion-android-checkbox-outline"></i> 供應中</span>
                        </div>
                        <div class="sku">
                            <span>PRODUCT#: ${product.prodID}</span>
                        </div>
                        <p>${product.prodDescription}</p>
                        <div class="quality-wrapper mt-30 product-quantity">
                            <label>數量:</label>
                            <div class="cart-plus-minus">
                                <input class="cart-plus-minus-box" type="text" name="qtybutton" value="0">
                            </div>
                        </div>
                        <div class="product-list-action">
                            <div class="product-list-action-left">
                                <a class="addtocart-btn" href="#" title="Add to cart">
                                    <i class="icon-bag"></i>
                                    &nbsp加入購物車
                                </a>
                            </div>
                            <div class="product-list-action-left">
                                <a class="addtocart-btn" href="#" title="Add to Wishlist">
                                    <i class="ti-heart"></i>
                                    &nbsp加入收藏
                                </a>
                            </div>
                            <br>
                            <br>
                        </div>
                        <div class="social-icon mt-30">
                        
                        	<!-- media icon -->
                            <ul>
                                <li><a href="#"><i class="icon-social-twitter"></i></a></li>
                                <li><a href="#"><i class="icon-social-instagram"></i></a></li>
                                <li><a href="#"><i class="icon-social-linkedin"></i></a></li>
                                <li><a href="#"><i class="icon-social-skype"></i></a></li>
                                <li><a href="#"><i class="icon-social-facebook"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<!-- footer -->
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