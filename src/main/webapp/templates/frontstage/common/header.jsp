<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<!-- sweetalert -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
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
        
        #headerApm {
        	background-color: white;
		    border: none;
		    position: relative;
		    right: 6px;
		    color: #555;
        }
        
        #headerApm:hover {
        	cursor: pointer;
         	color: #7e4c4f;
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
									<li><a href="${pageContext.request.contextPath}/ipet-front/shop/home">商城</a>
                                        <ul class="submenu">
                                            <li>
                                                <ul>
                                                    <li><a href="${pageContext.request.contextPath}/ipet-front/shop/category?typeID=1">食品</a></li>
													<li><a href="${pageContext.request.contextPath}/ipet-front/shop/category?typeID=2">玩具</a></li>
													<li><a href="${pageContext.request.contextPath}/ipet-front/shop/category?typeID=3">居家用品</a></li>
													<li><a href="${pageContext.request.contextPath}/ipet-front/shop/category?typeID=4">外出用品</a></li>
													<li><a href="${pageContext.request.contextPath}/ipet-front/shop/category?typeID=5">美容用品</a></li>
													<li><a href="${pageContext.request.contextPath}/ipet-front/shop/category?typeID=6">其他雜貨</a></li>
                                                </ul>
                                            </li>
                                		</ul>
                                    </li>
								</li>
								<li><a href="#">住宿</a>
									<ul class="submenu">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ipet-front/hotel/roomIndex">房型瀏覽</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/templates/frontstage/hotel/comingSoon.jsp">我要預約</a>
                                        </li>
                                    </ul></li>
								<li><a href="<c:url value='/ipet-front/salon/salonCategory' />">美容</a>
									<ul class="submenu">
										<li><a href="<c:url value='/ipet-front/salon/salonCategory' />">美容服務</a></li>
<!-- 										<li><a href="blog-leftsidebar.html">注意事項</a></li> -->
<%-- 										<li><a href="<c:url value='/ipet-front/salon/addAppointment' />">我要預約</a></li> --%>
										<li><button id="headerApm">我要預約</button></li>
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
											<li><a href="<c:url value='/ipet-front/member/edit' />">會員資料修改</a></li>
											<li><a href="<c:url value='/ipet-front/member/listPet' />">寵物資料管理</a></li>
											<li><a href="<c:url value='/ipet-front/shop/myOrder' />">商城訂單查詢</a></li>
											<li><a href="<c:url value='/ipet-front/member/salonAppointment' />">美容預約查詢</a></li>
											<li><a href="<c:url value='#' />">住宿預約查詢</a></li>
											<li><a href="<c:url value='/ipet-front/member/loginOut' />">會員登出</a></li>
										</c:if>
										<c:if test="${empty member}">
											<li><a href="<c:url value='/ipet-front/member/toLogin' />">會員登入</a></li>
											<li><a href="<c:url value='/templates/frontstage/member/register.jsp' />">會員註冊</a></li>
										</c:if>
									</ul>
								</div>
							</div>



							<div class="header-cart same-style">
								<button class="icon-cart">
									<i class="icon-handbag"></i> <span class="count-style">0</span>
								</button>
								<div class="shopping-cart-content">
<!-- 									<ul> -->
<!-- 										<li class="single-shopping-cart"> -->
<!-- 											<div class="shopping-cart-img"> -->
<!-- 												<a href="#"><img alt="" -->
<%-- 													src="${pageContext.request.contextPath}/static/frontstage/img/cart/cart-1.jpg"></a> --%>
<!-- 											</div> -->
<!-- 											<div class="shopping-cart-title"> -->
<!-- 												<h4> -->
<!-- 													<a href="#">Dog Calcium Food </a> -->
<!-- 												</h4> -->
<!-- 												<h6>Qty: 02</h6> -->
<!-- 												<span>$260.00</span> -->
<!-- 											</div> -->
<!-- 											<div class="shopping-cart-delete"> -->
<!-- 												<a href="#"><i class="ti-close"></i></a> -->
<!-- 											</div> -->
<!-- 										</li> -->
<!-- 										<li class="single-shopping-cart"> -->
<!-- 											<div class="shopping-cart-img"> -->
<!-- 												<a href="#"><img alt="" -->
<%-- 													src="${pageContext.request.contextPath}/static/frontstage/img/cart/cart-2.jpg"></a> --%>
<!-- 											</div> -->
<!-- 											<div class="shopping-cart-title"> -->
<!-- 												<h4> -->
<!-- 													<a href="#">Dog Calcium Food</a> -->
<!-- 												</h4> -->
<!-- 												<h6>Qty: 02</h6> -->
<!-- 												<span>$260.00</span> -->
<!-- 											</div> -->
<!-- 											<div class="shopping-cart-delete"> -->
<!-- 												<a href="#"><i class="ti-close"></i></a> -->
<!-- 											</div> -->
<!-- 										</li> -->
<!-- 									</ul> -->
<!-- 									<div class="shopping-cart-total"> -->
<!-- 										<h4> -->
<!-- 											Shipping : <span>$20.00</span> -->
<!-- 										</h4> -->
<!-- 										<h4> -->
<!-- 											Total : <span class="shop-total">$260.00</span> -->
<!-- 										</h4> -->
<!-- 									</div> -->
									<div class="shopping-cart-btn">
										<a href="${pageContext.request.contextPath}/ipet-front/shop/cart">查看購物車</a>
										<a href="${pageContext.request.contextPath}/ipet-front/shop/wishList">查看我的最愛</a>
										<a href="${pageContext.request.contextPath}/ipet-front/shop/checkout">結帳去</a>
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
<script
	src="${pageContext.request.contextPath}/static/frontstage/js/vendor/jquery-1.12.0.min.js"></script>
<script>
const contextPath = "<%=request.getContextPath()%>";
$(document).ready(function() {
	  setInterval(function() {
	    $.post(contextPath + "/ipet-front/prod/header", {
	      action: "head"
	    }, function(data) {
	      $(".count-style").text(data);
	    });
	  }, 800);
	});
</script>


<script>
    $(function () {
    	
    	/*===================== 點擊我要預約，檢查是否有寵物資訊定跳轉頁面 ==========================*/
    	$(document).on("click", "#headerApm", function (e){
    		const url = "${pageContext.request.contextPath}/ipet-front/salon/addAppointment";
    		$.ajax({
      	        url : url,
      	        type : "POST",
      	        success : function(response) {
      	        	if(response === "noPet"){
      	        		swal({
    		    	    	title: "Welcome！",
    		    	    	text: "還沒有新增毛孩的資訊，將跳轉到新增頁面！",
    		    	    }, function(){
	    		    	    location.replace("${pageContext.request.contextPath}/ipet-front/pet/addNew");	
    		    	    });
      	        	}else{
      	        		let actionForm = $('<form>', {'action': '${pageContext.request.contextPath}/ipet-front/salon/addAppointment', 'method': 'post'}).append($('<input>', {'type': 'hidden'}));
      	        		actionForm.appendTo('body').submit();
      	        	}
      	        },error: function(response) {
      	        	showSwal("something-Wrong");
      	        }
      	 	});
    		
    	});
    	
    	
    	
    	
    	
    	
    });
    
    
    /*===================== 新增成功提示 ==========================*/
    (function($) {
    	  showSwal = function(type) {
    	    "use strict";
    	     if (type === "success-message") {
    	    	 swal({
    	    	        title: '新增成功!',
    	    	        type: 'success',
     	    		  	showConfirmButton: false,
     	    		  	timer: 1500
    	    	      })
    	    }else if (type === "something-Wrong"){
    	    	swal({
	    	        title: "OOPS！Something's Wrong:(",
	    	        text: "請再次嘗試或聯繫客服人員協助處理",
	    	        type: 'info',
 	    		  	showConfirmButton: true,
	    	      })
    	    } 
    	  }

    	})(jQuery);
    
    </script>

</html>

