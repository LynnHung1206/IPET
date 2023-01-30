<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.list.model.services.WishService"%>
<%@ page import="com.web.list.model.entities.WishList"%>
<%@ page import="com.web.list.model.entities.WishList.WishListPK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
WishListPK wishListPK = new WishListPK(); //預設傳入memID=1
wishListPK.setMemID(1);
WishList wishList = new WishList();
wishList.setWishListPK(wishListPK);

WishService wishSvc = new WishService(); //直接列出memId=1的所有收藏 之後再調整
List<WishList> list = wishSvc.getAll(wishList);
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Marten - Pet Food eCommerce Bootstrap4 Template</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png" />

<!-- all css here -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/animate.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/simple-line-icons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/themify-icons.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css" />
<script
	src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<%@include file="/templates/frontstage/common/header.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="
        background-image: url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);
      ">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>Wishlist</h2>
				<ul>
					<li><a href="index.html">home</a></li>
					<li class="active">Wishlist</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- shopping-cart-area start -->
	<div class="cart-main-area pt-95 pb-100">
		<div class="container">
			<h3 class="page-title">收藏清單</h3>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<form action="#">
						<div class="table-content table-responsive">
							<table>
								<thead>
									<tr>
										<th>圖片</th>
										<th>商品名稱</th>
										<th>價錢</th>
										<th>數量</th>
										<th>小記</th>
										<th>新增至購物車</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="wishVO" items="${list}">
										<tr>
											<td class="product-thumbnail"><a href="#"><img
													src="<%=request.getContextPath()%>/ipet-back/prod/DBGifReader?prodID=${wishVO.product.prodID}"
													alt="" /></a></td>
											<td class="product-name"><a href="#">${wishVO.product.prodName}</a></td>
											<td class="product-price-cart"><span class="amount">z${wishVO.product.prodPrice}</span>
											</td>
											<td class="product-quantity">
												<div class="cart-plus-minus">
													<input class="cart-plus-minus-box" type="text"
														name="qtybutton" value="02" />
												</div>
											</td>
											<td class="product-subtotal">$110.00</td>
											<td class="product-wishlist-cart"><a href="#">新增至購物車</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/templates/frontstage/common/footer.jsp"%>

	<!-- all js here -->
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/vendor/jquery-1.12.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/jquery.counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/elevetezoom.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/ajax-mail.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script>
</body>

</html>