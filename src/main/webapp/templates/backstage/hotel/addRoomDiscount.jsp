<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.roomDiscount.model.*"%>
<%@ page import="com.web.roomDiscount.model.entity.*"%>
<%@ page import="com.web.roomDiscount.model.service.*"%>
<%@ page import="com.web.roomDiscount.model.dao.*"%>
<%@ page import="com.web.roomDiscount.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

<%
Discount discount = (Discount) request.getAttribute("discount");
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IPET 寵物</title>
<!-- TODO: 目前先使用 完整css，後續再換成 min.css-->
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
<!-- boostrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">


<style type="text/css">
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	text-align: center;
}

th {
	text-align: center;
}

input#addNew {
	background-color: lightgray;
	border: none;
	border-radius: 5px;
	margin-bottom: 20px;
}

input#addNew:hover, #search:hover {
	cursor: pointer;
}

h4 {
	text-shadow: 1px 1px 0px gray, -1px -1px 0px gray, 1px -1px 0px gray,
		-1px 1px 0px gray;
	color: rgb(208, 208, 208) !important;
	opacity: 0.8 !important;
	font-weight: bold !important;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif !important;
	line-height: 120px !important;
	font-size: 3em !important;
	filter: drop-shadow(0 0 2px #000) !important;
	background: linear-gradient(to bottom, rgba(140, 0, 0, 0.15) 0%,
		rgba(0, 0, 0, 0.15) 100%),
		radial-gradient(at top center, rgba(200, 100, 100, 0.40) 0%,
		rgba(0, 0, 0, 0.40) 120%) #989898;
	background-blend-mode: multiply, multiply;
	text-align: center;
}
</style>



</head>
<!--
`body` tag options:

  Apply one or more of the following classes  to the body tag
  to get the desired effect

  * sidebar-collapse
  * sidebar-mini
-->
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!--  Navbar -->
		<%@ include file="/templates/backstage/common/navbar.jsp"%>
		<!-- /.navbar -->

		<!-- 左邊選單區 Main Sidebar Container -->
		<%@ include file="/templates/backstage/common/sidebar.jsp"%>
		<!-- /.aside -->

		<!-- 中間頁面 Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
				<h4>新增優惠</h4>
					<div id="newDiscount">
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
						<form
							action="${pageContext.request.contextPath}/ipet-back/hotel/addRoomDiscount"
							method="post">
							<table id="discountdata">
								<tr>
									<td>優惠名稱:</td>
									<td><input type="TEXT" name="discountName" size="45"
										value="<%=(discount == null) ? "測試用" : discount.getDiscountName()%>" /></td>
								</tr>
								<tr>
									<td>優惠內容:</td>
									<td><textarea name="discountContent" cols="43"><%=(discount == null) ? "預設文字展示專用" : discount.getDiscountContent()%></textarea></td>
								</tr>
								<tr>
									<td>優惠折扣:</td>
									<td><input type="TEXT" name="roomDis" size="45"
										value="<%=(discount == null) ? 50 : discount.getRoomDis()%>" /></td>
								</tr>
								<tr>
									<td>優惠開始時間:</td>
									<td><input type="DATE" name="startTime" size="45"
										value="<%=(discount == null) ? "" : discount.getStartTime()%>" /></td>
								</tr>
								<tr>
									<td>優惠結束時間:</td>
									<td><input type="DATE" name="endTime" size="45"
										value="<%=(discount == null) ? "" : discount.getEndTime()%>" /></td>
								</tr>
								<tr>
									<td><input type="hidden" name="action" value="insert"></td>
									<td><input type="submit" value="送出新增"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->

			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Main Footer -->
		<%@ include file="/templates/backstage/common/footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/js/adminlte.js"></script>
	<!-- sidebar menu Class -->
	<script>
		$("p:contains(住宿優惠管理)").closest("li").addClass("menu-open");
		$("p:contains(優惠列表)").closest("a").addClass("active");
	</script>
</body>
</html>
