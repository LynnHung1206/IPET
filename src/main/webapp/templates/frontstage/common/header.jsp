<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html class="no-js" lang="zxx">

<head>
</head>
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
<body>
	<header class="header-area">
		<div class="header-top theme-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-4 col-12">
						<div class="welcome-area">
							<p>歡迎蒞臨IPET寵物商城</p>
						</div>
					</div>
					<div class="col-lg-8 col-md-8 col-12">
						<div class="account-curr-lang-wrap f-right"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="header-bottom transparent-bar">
			<div class="container">
				<div class="row">
					<div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-5">
						<div class="logo pt-39">
							<a href="${pageContext.request.contextPath}/ipet-front/home"><img
								alt=""
								src="${pageContext.request.contextPath}/static/frontstage/img/logo/logo.png"></a>
						</div>
					</div>
					<div class="col-xl-7 col-lg-7 d-none d-lg-block">
						<div class="main-menu text-center">
							<nav>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/ipet-front/news/allNews">最新消息</a></li>
									<li class="mega-menu-position"><a href="shop-page.html">商城</a>
										<ul class="mega-menu">
											<li>
												<ul>
													<li class="mega-menu-title">狗日用品</li>
													<li><a href="shop-page.html">狗飼料</a></li>
													<li><a href="shop-page.html">狗玩具</a></li>
													<li><a href="shop-page.html">狗背帶</a></li>
													<li><a href="shop-page.html">狗零食</a></li>
												</ul>
											</li>
											<li>
												<ul>
													<li class="mega-menu-title">貓日用品</li>
													<li><a href="shop-page.html">貓飼料</a></li>
													<li><a href="shop-page.html">貓玩具</a></li>
													<li><a href="shop-page.html">貓砂</a></li>
													<li><a href="shop-page.html">貓零食</a></li>
												</ul>
											</li></li>
								</ul>
								</li>
								<li><a href="#">住宿</a>
									<ul class="submenu">
										<li><a href="">住宿環境</a></li>
										<li><a href="shop-page.html">房型參考</a></li>
										<li><a href="shop-list.html">我要預約</a></li>
									</ul></li>
								<li><a href="<c:url value='/ipet-front/salon/salonCategory' />">美容</a>
									<ul class="submenu">
										<li><a href="<c:url value='/ipet-front/salon/salonCategory' />">美容服務</a></li>
										<li><a href="blog-leftsidebar.html">注意事項</a></li>
										<li><a href="blog-details.html">我要預約</a></li>
									</ul></li>
								<li><a href="${pageContext.request.contextPath}/templates/frontstage/about-us.jsp">關於我們</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-xl-3 col-lg-2 col-md-8 col-sm-8 col-7">
						<div class="search-login-cart-wrapper">
							<div class="header-search same-style">
								<button class="search-toggle">
									<i class="icon-magnifier s-open"></i> <i
										class="ti-close s-close"></i>
								</button>
								<div class="search-content">
									<form action="#">
										<input type="text" placeholder="Search">
										<button>
											<i class="icon-magnifier"></i>
										</button>
									</form>
								</div>
							</div>
							<div class="header-login same-style">
								<button class="icon-cart" data-toggle="tooltip"
									data-placement="bottom" title="會員">
									<i class="icon-user icons">${member.getMemName()}</i>
								</button>
								<!-- 								<a -->
								<%-- 									href="${pageContext.request.contextPath}/ipet-back/member/toLogin"><i --%>
								<!-- 									class="icon-user icons"></i></a> -->
								<div class="shopping-cart-content"
									style="width: 200px; padding-top: 30px;">
									<ul>
										<c:if test="${!empty member}">
											<li><a href="<c:url value='/ipet-back/member/edit' />">會員資料修改</a></li>
											<li><a href="<c:url value='/ipet-back/member/listPet' />">寵物資料管理</a></li>
											<li><a href="<c:url value='#' />">商城訂單查詢</a></li>
											<li><a href="<c:url value='/ipet-front/member/salonAppointment' />">美容預約查詢</a></li>
											<li><a href="<c:url value='#' />">住宿預約查詢</a></li>
											<li><a href="<c:url value='/ipet-front/member/loginOut' />">會員登出</a></li>
										</c:if>
										<c:if test="${empty member}">
											<li><a href="<c:url value='/ipet-back/member/toLogin' />">會員登入</a></li>
											<li><a href="<c:url value='/templates/frontstage/member/register.jsp' />">會員註冊</a></li>
										</c:if>
									</ul>
								</div>
							</div>



							<div class="header-cart same-style">
								<button class="icon-cart">
									<i class="icon-handbag"></i> <span class="count-style">02</span>
								</button>
								<div class="shopping-cart-content">
									<ul>
										<li class="single-shopping-cart">
											<div class="shopping-cart-img">
												<a href="#"><img alt=""
													src="${pageContext.request.contextPath}/static/frontstage/img/cart/cart-1.jpg"></a>
											</div>
											<div class="shopping-cart-title">
												<h4>
													<a href="#">Dog Calcium Food </a>
												</h4>
												<h6>Qty: 02</h6>
												<span>$260.00</span>
											</div>
											<div class="shopping-cart-delete">
												<a href="#"><i class="ti-close"></i></a>
											</div>
										</li>
										<li class="single-shopping-cart">
											<div class="shopping-cart-img">
												<a href="#"><img alt=""
													src="${pageContext.request.contextPath}/static/frontstage/img/cart/cart-2.jpg"></a>
											</div>
											<div class="shopping-cart-title">
												<h4>
													<a href="#">Dog Calcium Food</a>
												</h4>
												<h6>Qty: 02</h6>
												<span>$260.00</span>
											</div>
											<div class="shopping-cart-delete">
												<a href="#"><i class="ti-close"></i></a>
											</div>
										</li>
									</ul>
									<div class="shopping-cart-total">
										<h4>
											Shipping : <span>$20.00</span>
										</h4>
										<h4>
											Total : <span class="shop-total">$260.00</span>
										</h4>
									</div>
									<div class="shopping-cart-btn">
										<a href="cart.html">view cart</a> <a href="checkout.html">checkout</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	 <a id=msg style="z-index:999" href="${pageContext.request.contextPath}/templates/frontstage/customerservice/index.jsp"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/msn-icon.png"></a>
</body>
</html>