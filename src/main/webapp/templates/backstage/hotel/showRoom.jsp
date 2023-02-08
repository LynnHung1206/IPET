<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.room.model.*"%>
<%@ page import="com.web.room.model.entities.*"%>
<%@ page import="com.web.room.model.service.*"%>
<%@ page import="com.web.room.model.dao.*"%>
<%@ page import="com.web.room.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

<%
RoomService roomsvc = new RoomService();
List<Room> list = roomsvc.selectAll();
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


<style type="text/css">
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
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
					<h3>房間列表</h3>
					<form
						action="${pageContext.request.contextPath}/ipet-back/hotel/addRoom">
						<input id="addNew" type="submit" value="新增房間">
					</form>
					<div class="row mb-2">
						<table id="Room" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>房間編號</th>
									<th>房型</th>
									<th>房間狀態</th>
									<th>上下架狀態</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>
								<%@ include file="page1.file"%>
								<c:forEach var="roomVO" items="${list}" begin="<%=pageIndex%>"
									end="<%=pageIndex+rowsPerPage-1%>">

									<tr>
										<td>${roomVO.roomId}</td>
										<td>${roomVO.roomTypeVO.roomTypeName}</td>
										<td>${roomVO.roomCheckStatus}</td>
										<td>${roomVO.roomSaleStatus  == 0 ? "上架" : "下架"}</td>
										<td>
											<form METHOD="post"
												ACTION="${pageContext.request.contextPath}/ipet-back/hotel/editRoom"
												style="margin-bottom: 0px;">
												<input type="submit" value="修改"> <input
													type="hidden" name="roomId" value="${roomVO.roomId}">
											</form>
										</td>
										<td>
											<form METHOD="post"
												ACTION="${pageContext.request.contextPath}/ipet-back/hotel/deleteRoom"
												style="margin-bottom: 0px;">
												<input type="submit" value="刪除"> <input
													type="hidden" name="roomId" value="${roomVO.roomId}">
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
	<!-- sidebar menu Class -->
	<script>
		$("p:contains(房間管理)").closest("li").addClass("menu-open");
		$("p:contains(房間列表)").closest("a").addClass("active");
	</script>
</body>
</html>
