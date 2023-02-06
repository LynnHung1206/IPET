<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.list.model.services.CartService"%>
<%@ page import="com.web.list.model.entities.CartList"%>
<%@ page import="com.web.list.model.entities.CartList.CartListPK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
CartListPK cartListPK = new CartListPK(); //預設傳入memID=1
cartListPK.setMemID(1);
CartList cartList = new CartList();
cartList.setCartListPK(cartListPK);

CartService cartSvc = new CartService(); //直接列出memId=1的所有收藏 之後再調整
List<CartList> list = cartSvc.getAll(cartList);
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
            <h3 class="page-title">checkout</h3>
            <div class="row">
                <div class="col-lg-12">
                    <div class="checkout-wrapper">
                        <div id="faq" class="panel-group">
                        		<div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title"><span>1</span> <a data-toggle="collapse" data-parent="#faq"
                                            href="#payment-6">訂單詳情</a></h5>
                                </div>
                                <div id="payment-6" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="order-review-wrapper">
                                            <div class="order-review">
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th class="width-1">商品名稱</th>
                                                                <th class="width-2">價錢</th>
                                                                <th class="width-3">數量</th>
                                                                <th class="width-4">總價</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach var="cartVO" items="${list}">
                                                            <tr>
                                                                <td>
                                                                    <div class="o-pro-dec">
                                                                        <p>${cartVO.product.prodName}</p>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="o-pro-price">
                                                                        <p>${cartVO.product.prodPrice}</p>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="o-pro-qty">
                                                                        <p>${cartVO.count}</p>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="o-pro-subtotal">
                                                                        <p class="subTotal">${cartVO.total}</p>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td>累計金額</td>
                                                                <td id="grandTotal"></td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                        <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title"><span>2</span> <a data-toggle="collapse" data-parent="#faq"
                                            href="#payment-5">付款資訊</a></h5>
                                </div>
                                <div id="payment-5" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="payment-info-wrapper">
                                            <div class="ship-wrapper">
                                                <div class="single-ship">
                                                    <input type="radio" checked="" value="dadress" name="address">
                                                    <label>信用卡</label>
                                                </div>
                                            </div>
                                            <div class="payment-info">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="billing-info">
                                                            <label>持卡人姓名</label>
                                                            <input type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="billing-select card-mrg">
                                                            <label>信用卡種類</label>
                                                            <select>
                                                                <option>American Express</option>
                                                                <option>Visa</option>
                                                                <option>MasterCard</option>
                                                                <option>Discover</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>信用卡號</label>
                                                            <input type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="expiration-date">
                                                    <label>有效月年</label>
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6">
                                                            <div class="billing-select month-mrg">
                                                                <select>
                                                                    <option>Month</option>
                                                                    <option>January</option>
                                                                    <option>February</option>
                                                                    <option> March</option>
                                                                    <option>April</option>
                                                                    <option> May</option>
                                                                    <option>June</option>
                                                                    <option>July</option>
                                                                    <option>August</option>
                                                                    <option>September</option>
                                                                    <option> October</option>
                                                                    <option> November</option>
                                                                    <option> December</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6">
                                                            <div class="billing-select">
                                                                <select>
                                                                    <option>Year</option>
                                                                    <option>2023</option>
                                                                    <option>2024</option>
                                                                    <option>2025</option>
                                                                    <option>2026</option>
                                                                    <option>2027</option>
                                                                    <option>2028</option>
                                                                    <option>2029</option>
                                                                    <option>2030</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>驗證碼</label>
                                                            <input type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <form action="addOrder" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title"><span>3</span> <a data-toggle="collapse" data-parent="#faq"
                                            href="#payment-3">收件資訊</a></h5>
                                </div>
                                <div id="payment-3" class="panel-collapse collapse ">
                                    <div class="panel-body">
                                    	<div class="shipping-information-wrapper">
                                            <div class="col-lg-6 col-md-6">
                                                 <div class="billing-info">
                                                      <label>收件人姓名</label>
                                                      <input type="text" name="orderRecName">
                                                 </div>
                                                 <div class="billing-info">
                                                      <label>收件人電話</label>
                                                      <input type="text" name="orderRecPhone">
                                                 </div>
                                                 <div class="billing-info">
                                                      <label>收件人地址</label>
                                                      <input type="text" name="orderRecAddress">
                                                 </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        	<div class="billing-btn">
                                 <button type="submit">確認訂單</button>
                            </div>
                        	</form>
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

	<script>
		let grandTotal = parseInt(0);
		$('.subTotal').each(function () {
			grandTotal += parseInt($(this).text());
        });
		$('#grandTotal').append(grandTotal);
	</script>
</body>

</html>