<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.roomDiscount.model.*"%>
<%@ page import="com.web.roomDiscount.model.entity.*"%>
<%@ page import="com.web.roomDiscount.model.service.*"%>
<%@ page import="com.web.roomDiscount.model.dao.*"%>
<%@ page import="com.web.roomDiscount.model.dao.impl.*"%>
<%@ page import="java.util.*"%>


<%
DiscountService roomDiscountSvc = new DiscountService();
List<Discount> list = roomDiscountSvc.selectAll();
pageContext.setAttribute("list", list);
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
					<form
						action="${pageContext.request.contextPath}/ipet-back/hotel/addRoomDiscount">
						<input id="addNew" type="submit" value="新增優惠">
					</form>
					<div class="row mb-2">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>優惠方案編號</th>
									<th>優惠名稱</th>
									<th>優惠內容</th>
									<th>優惠折扣</th>
									<th>優惠開始時間</th>
									<th>優惠結束時間</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>

								<%@ include file="page1.file"%>
								<c:forEach var="discountVO" items="${list}"
									begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

									<tr>
										<td>${discountVO.discountId}</td>
										<td>${discountVO.discountName}</td>
										<td>${discountVO.discountContent}</td>
										<td>${discountVO.roomDis}</td>
										<td>${discountVO.startTime}</td>
										<td>${discountVO.endTime}</td>
										<td>
											<form METHOD="post"
												ACTION="${pageContext.request.contextPath}/ipet-back/hotel/editRoomDiscount"
												style="margin-bottom: 0px;">
												<input type="submit" value="修改"> <input
													type="hidden" name="discountId"
													value="${discountVO.discountId}">
											</form>
										</td>
										<td>
											<form METHOD="post"
												ACTION="${pageContext.request.contextPath}/ipet-back/hotel/deleteRoomDiscount"
												style="margin-bottom: 0px;">
												<input type="submit" value="刪除">
												<input type="hidden" name="discountId" value="${discountVO.discountId}">
											</form>
										</td>
								</c:forEach>
							</thead>
						</table>
						<div class="col-sm-6">
							<%@ include file="page2.file"%>
						</div>
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
</body>
</html>
