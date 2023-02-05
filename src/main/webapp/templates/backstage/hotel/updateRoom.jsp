<%@page import="com.web.roomType.model.service.RoomTypeService"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.room.model.*"%>
<%@ page import="com.web.room.model.entities.*"%>
<%@ page import="com.web.room.model.service.*"%>
<%@ page import="com.web.room.model.dao.*"%>
<%@ page import="com.web.room.model.dao.impl.*"%>
<%@ page import="com.web.roomType.model.*"%>
<%@ page import="com.web.roomType.model.entities.*"%>
<%@ page import="com.web.roomType.model.service.*"%>
<%@ page import="com.web.roomType.model.dao.*"%>
<%@ page import="com.web.roomType.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

<%
Room room = (Room) request.getAttribute("room");
%>

<%
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
					<h3>資料修改:</h3>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message.value}</li>
							</c:forEach>
						</ul>
					</c:if>
					<form
						action="${pageContext.request.contextPath}/ipet-back/hotel/updateRoom"
						method="post">
						<table id="discountdata">
							<tr>
								<td>房間編號:</td>
								<td>${roomVO.roomId}</td>
							</tr>
							<tr>
								<td><label for="room_Type_Id">房型:</label></td>
								<td><select id="room_Type_id" size="1" name="roomTypeId">
										<c:forEach var="roomTypeVO" items="${list}">
									<option value="${roomTypeVO.roomTypeId}"
										${(param.roomTypeId == roomTypeVO.roomTypeId) ? 'selected' : ''}>${roomTypeVO.roomTypeName}</option>
								</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td><label>房間狀態:</label></td>
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
								<td>上下架狀態:</td>
								<td><select name="roomSaleStatus" >
										<option value="0"
											${room.getroomSaleStatus() == 0 ?'selected':''}>上架</option>
										<option value="1"
											${room.getroomSaleStatus() == 1 ?'selected':''}>下架</option>
								</select></td>
							</tr>
							<tr>
								<td><input type="hidden" name="action" value="update">
									<input type="hidden" name="roomId" value="${roomVO.roomId}"></td>
								<td><input type="submit" value="送出修改"></td>
							</tr>
						</table>
					</form>
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
