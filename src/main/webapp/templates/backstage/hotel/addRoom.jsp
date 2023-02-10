<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.room.model.*"%>
<%@ page import="com.web.room.model.entities.*"%>
<%@ page import="com.web.room.model.service.*"%>
<%@ page import="com.web.room.model.dao.*"%>
<%@ page import="com.web.room.model.dao.impl.*"%>
<%@ page import="com.web.roomType.model.entities.*"%>
<%@ page import="com.web.roomType.model.service.*"%>
<%@ page import="com.web.roomType.model.dao.*"%>
<%@ page import="com.web.roomType.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

<%
Room room = (Room) request.getAttribute("room");

RoomTypeService roomSvc = new RoomTypeService();
List<RoomType> list = roomSvc.selectAll();
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
					<h4>新增房間</h4>
					<div class="d-flex justify-content-center">
					<form
						action="${pageContext.request.contextPath}/ipet-back/hotel/addRoom"
						method="post">
						<table id="roomdata">
							<tr>
								<td>房型</td>
								<td><select id="room_Type_id" size="1" name="roomTypeId">
										<c:forEach var="roomTypeVO" items="${list}">
											<option value="${roomTypeVO.roomTypeId}"
												${(param.roomTypeId == roomTypeVO.roomTypeId) ? 'selected' : ''}>${roomTypeVO.roomTypeName}</option>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>房間狀態</td>
								<td><select name="roomCheckStatus">
										<option value="0"
											${room.getroomCheckStatus() == 0 ?'selected':''}>空房</option>
										<option value="1"
											${room.getroomCheckStatus() == 1 ?'selected':''}>已預約</option>
										<option value="2"
											${room.getroomCheckStatus() == 2 ?'selected':''}>已入住</option>
								</select></td>
							</tr>
							<tr>
								<td>上下架狀態</td>
								<td><select name="roomSaleStatus">
										<option value="0"
											${room.getroomCheckStatus() == 0 ?'selected':''}>上架</option>
										<option value="1"
											${room.getroomCheckStatus() == 1 ?'selected':''}>下架</option>
								</select></td>
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
	<script>
		$("p:contains(房間管理)").closest("li").addClass("menu-open");
		$("p:contains(房間列表)").closest("a").addClass("active");
	</script>
</body>
</html>
