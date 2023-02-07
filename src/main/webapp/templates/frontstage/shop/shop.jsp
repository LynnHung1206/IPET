<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.product.model.entity.Product"%>
<%@ page import="java.util.List"%>
<%@ page import="com.web.product.model.service.imp.ProductServiceFrontImp"%>

<% 
	ProductServiceFrontImp prodSvc = new ProductServiceFrontImp();
	List<Product> list = prodSvc.findAllProduct();
	pageContext.setAttribute("list", list);
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
		.product-wrapper:hover {
			filter: brightness(85%)
		}

		@media ( min-width : 768px) {
			.pagebar {
				padding-left: 15%;
			}
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
				<h2>Shop</h2>
				<ul>
					<li><a href="<%= request.getContextPath() %>/templates/frontstage/shop/shop.jsp">home</a></li>
					<li class="active">Shop</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="shop-area pt-50 pb-50 gray-bg">
		<div class="container">
			
			<!-- search bar -->
			<div class="shop-widget">
				<h4 class="shop-sidebar-title">搜尋商品</h4>
				<div class="shop-search mt-25 mb-50">
					<form class="shop-search-form" method="get" action="search">
						<input type="text" name="keyword" placeholder="Find a product">
						<button type="submit">
							<i class="icon-magnifier"></i>
						</button>
					</form>
				</div>
			</div>

			<!-- category -->
			<div class="row">
				<div class="col-lg-2" style="padding-bottom: 15%;">
					<div class="shop-sidebar">
						<div class="shop-widget">
							<h4 class="shop-sidebar-title">商品種類</h4>
							<div class="shop-list-style mt-20">
								<ul>
									<li><a href="category?typeID=1">食品</a></li>
									<li><a href="category?typeID=2">玩具</a></li>
									<li><a href="category?typeID=3">居家用品</a></li>
									<li><a href="category?typeID=4">外出用品</a></li>
									<li><a href="category?typeID=5">美容用品</a></li>
									<li><a href="category?typeID=6">其他雜貨</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- product item -->
				<div class="col-lg-10">
					<div class="grid-list-product-wrapper">
						<div class="product-view product-grid">
							<div class="row">
								
								<%@ include file ="numberControl.file" %>
								<c:forEach var="product" items="${list}" begin="<%= pageIndex %>" end="<%= pageIndex + rowsPerPage - 1 %>">
									<div class="product-width col-lg-6 col-xl-4 col-md-6 col-sm-6">
										<div class="product-wrapper mb-10">
											<div class="product-img">
												<img src="<%=request.getContextPath()%>/ipet-front/prod/DBGifReaderFront?prodID=${product.prodID}">
											</div>
											<div class="product-content content_cust">
												<h4>
													<a href="detail?prodID=${product.prodID}">${product.prodName}</a>
												</h4>
												<div class="product-price">
													<span class="new">$ ${product.prodPrice}</span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- page bar -->
			<div class="pagination-style text-center mt-10 pagebar">
				<ul>
					<%@ include file="pageControl.file" %>
				</ul>
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