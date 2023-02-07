<%@page import="com.web.member.model.entity.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.list.model.services.CartService"%>
<%@ page import="com.web.list.model.entities.CartList"%>
<%@ page import="com.web.list.model.entities.CartList.CartListPK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Member member = (Member) request.getSession().getAttribute("member");

CartListPK cartListPK = new CartListPK(); //預設傳入memID=1
cartListPK.setMemID(member.getMemId());
CartList cartList = new CartList();
cartList.setCartListPK(cartListPK);

CartService cartSvc = new CartService(); //直接列出memId=1的所有收藏 之後再調整
List<CartList> list = cartSvc.getAll(cartList);
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
	<%@include file="/templates/frontstage/common/header.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="
        background-image: url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);
      ">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>Cartlist</h2>
				<ul>
					<li><a href="index.html">home</a></li>
					<li class="active">Cartlist</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- shopping-cart-area start -->
	<div class="cart-main-area pt-95 pb-100">
		<div class="container">
			<h3 class="page-title">購物車清單</h3>
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
										<th>刪除商品</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cartVO" items="${list}">
										<tr id="btn${cartVO.product.prodID}">
											<td class="product-thumbnail"><a href="#"><img
													src="<%=request.getContextPath()%>/ipet-back/prod/DBGifReader?prodID=${cartVO.product.prodID}"
													alt="" /></a></td>
											<td class="product-name"><a href="#">${cartVO.product.prodName}</a></td>
											<td class="product-price-cart"><span class="amount">${cartVO.product.prodPrice}</span>
											</td>
											<td class="product-quantity">
												<div class="cart-plus-minus">
													<input class="cart-plus-minus-box" type="text"
														name="qtybutton" value="${cartVO.count}" />
												</div>
											</td>
											<td class="product-subtotal">${cartVO.total}</td>
											<td class="product-wishlist-cart"><a href="#" onclick="deleteID(${cartVO.product.prodID})" >刪除商品</a>
											
											
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
<script>

function deleteID(id){
	$.post(
            contextPath + "/ipet-front/prod/fromProductDetailCart", {
                action:"remove",
                prodID: id,
                memID:${member.memId},
            },
        );
	document.querySelector("#btn" + id).remove();
	swal({
	    title: "確定要刪除該商品嗎?",
	    icon: "warning",
	    buttons: true,
	    dangerMode: true
	  });
}

</script>

</html>