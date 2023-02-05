<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.question.model.service.*"%>
<%@ page import="com.web.question.model.entity.*"%>

<%
QuestionService questionSvc = new QuestionService();
List<Question> list = questionSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>IPET - Pet Food eCommerce Bootstrap4 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png">

<!-- all css here -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css">
<style type="text/css">
table, th, td {
	border: 1px solid lightgray;
	border-collapse: collapse;
	text-align: center;
}

th {
	background-color: lightgray;
	text-align: center;
	border: 1px solid white;
}

td {
	background-color: white;
}

details span {
	color: green;
	font-size: 20px;
}

details summary {
	color: darkgreen;
	font-weight: bold;
	font-size: 20px;
}
</style>
<script
	src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<%@include file="/templates/frontstage/common/header.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>常見問題</h2>
				<ul>
					<li><a href="index.html">Home</a></li>
					<li class="active">Q&A</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="contact-area pt-100 pb-30">
		<div class="container">
			<h4 class="contact-title" style="text-align: center;">常見Q&A整理</h4>
			<div class="col-12" style="margin: 0 auto;">
				<table style="margin: 0 auto; width: 75%;">
					<tr>
						<!-- 						<th>常見問題編號</th> -->
						<th>Title</th>
						<!-- 						<th>常見問題內容</th> -->
						<!-- 						<th>新增時間</th> -->
					</tr>

					<%@ include file="page1.file"%>
					<c:forEach var="questionVO" items="${list}" begin="<%=pageIndex%>"
						end="<%=pageIndex+rowsPerPage-1%>">

						<tr>
							<%-- 							<td>${questionVO.quesId}</td> --%>
							<%-- 							<td>${questionVO.quesTitle}</td> --%>
							<%-- 							<td>${questionVO.quesText}</td> --%>
							<td><details>
									<summary>${questionVO.quesTitle}</summary>
									<br>
									<span>${questionVO.quesText}</span>
								</details></td>
							<%-- 							<td>${questionVO.quesTime}</td> --%>

						</tr>
					</c:forEach>
				</table>

				<div style="margin:0 auto;justify-content: center; display: flex;margin-top: 20px;">
					<%@ include file="page2.file"%>

				</div>
			</div>
			<!-- 			<div class="row"> -->
			<!-- 				<div class="col-12"> -->
			<!-- 					<div class="contact-message-wrapper"> -->
			<!-- 						<h4 class="contact-title" style="text-align: center;">即時線上客服</h4> -->
			<!-- 						<div class="contact-message"> -->
			<!-- 							<form id="contact-form" -->
			<%-- 								action="${pageContext.request.contextPath}/static/frontstage/mail.php" --%>
			<!-- 								method="post"> -->
			<!-- 								<div class="row"> -->
			<!-- 									<div class="col-lg-12"> -->
			<!-- 										<div class="contact-form-style"> -->
			<!-- 											<div -->
			<!-- 												style="width: 100%; height: 250px; border: 1px solid darkgray; overflow: auto; margin: 10px auto;"> -->
			<!-- 												這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> -->
			<!-- 												這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> -->
			<!-- 												這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> -->
			<!-- 												這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> -->
			<!-- 												這是聊天室窗<br> 這是聊天室窗<br> 這是聊天室窗<br> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<!-- 									</div> -->
			<!-- 									<div class="col-lg-12"> -->
			<!-- 										<div class="contact-form-style mb-20"> -->
			<!-- 											<input name="subject" placeholder="請輸入內容" type="text"> -->
			<!-- 											<button class="submit btn-style" type="submit" -->
			<!-- 												style="float: right">發送訊息</button> -->
			<!-- 										</div> -->
			<!-- 									</div> -->

			<!-- 								</div> -->
			<!-- 							</form> -->
			<!-- 							<p class="form-messege"></p> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
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
		src="http://ditu.google.cn/maps/api/js?key=AIzaSyBmGmeot5jcjdaJTvfCmQPfzeoG_pABeWo"></script>
	<script>
		function init() {
			var mapOptions = {
				zoom : 11,
				scrollwheel : false,
				center : new google.maps.LatLng(40.709896, -73.995481),
				styles : [ {
					"featureType" : "administrative",
					"elementType" : "labels.text.fill",
					"stylers" : [ {
						"color" : "#444444"
					} ]
				}, {
					"featureType" : "landscape",
					"elementType" : "all",
					"stylers" : [ {
						"color" : "#f2f2f2"
					} ]
				}, {
					"featureType" : "poi",
					"elementType" : "all",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "road",
					"elementType" : "all",
					"stylers" : [ {
						"saturation" : -100
					}, {
						"lightness" : 45
					} ]
				}, {
					"featureType" : "road.highway",
					"elementType" : "all",
					"stylers" : [ {
						"visibility" : "simplified"
					} ]
				}, {
					"featureType" : "road.arterial",
					"elementType" : "labels.icon",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "transit",
					"elementType" : "all",
					"stylers" : [ {
						"visibility" : "off"
					} ]
				}, {
					"featureType" : "water",
					"elementType" : "all",
					"stylers" : [ {
						"color" : "#F6AB44"
					}, {
						"visibility" : "on"
					} ]
				} ]
			};
			var mapElement = document.getElementById('map');
			var map = new google.maps.Map(mapElement, mapOptions);
			var marker = new google.maps.Marker(
					{
						position : new google.maps.LatLng(40.709896, -73.995481),
						map : map,
						icon : '${pageContext.request.contextPath}/static/frontstage/img/icon-img/map.png',
						animation : google.maps.Animation.BOUNCE,
						title : 'Snazzy!'
					});
		}
		google.maps.event.addDomListener(window, 'load', init);
	</script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script>
</body>

</html>
</html>