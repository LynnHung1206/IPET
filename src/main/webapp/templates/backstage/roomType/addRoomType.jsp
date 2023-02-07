<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>





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
				<h3>新增房型</h3>
					<FORM METHOD="POST" ACTION="hotel.do" name="form1">
						<table>
							<tr>
								<td>房型數量:</td>
								<td><input type="TEXT" name="roomAmount" size="45"
									value="<%=(roomType == null) ? 5 : roomType.getRoomAmount()%>" /></td>
							</tr>
							<tr>
								<td>房型名稱:</td>
								<td><input type="TEXT" name="roomTypeName" size="45"
									Value="<%=(roomType == null) ? "大狗房" : roomType.getRoomTypeName()%>" /></td>
							</tr>
							<tr>
								<td>寵物體型:</td>
								<td><select name="roomTypeStatus">
										<option value="小型犬"
											${room.getroomTypeStatus() == 0 ?'selected':''}>小型犬</option>
										<option value="中型犬"
											${room.getroomTypeStatus() == 1 ?'selected':''}>中型犬</option>
										<option value="大型犬"
											${room.getroomTypeStatus() == 1 ?'selected':''}>中型犬</option>
								</select></td>
							</tr>
							<tr>
								<td>房型說明:</td>
								<td><textarea name="roomTypeContent" cols="43"><%=(roomType == null) ? "預設文字展示專用" : roomType.getRoomTypeContent()%></textarea></td>
							</tr>
							<tr>
							</tr>
							<tr>
								<td>房型價格:</td>
								<td><input type="TEXT" name="roomTypePrice" size="45"
									value="<%=(roomType == null) ? 800 : roomType.getRoomTypePrice()%>" /></td>
							</tr>
							<tr>
								<td>上下架狀態:</td>
								<td><select name="roomSaleStatus">
										<option value="0"
											${room.getroomTypeStatus() == 0 ?'selected':''}>上架</option>
										<option value="1"
											${room.getroomTypeStatus() == 1 ?'selected':''}>下架</option>
								</select></td>
							</tr>
						</table>
						<br> <input type="hidden" name="action" value="insert">
						<input type="submit" value="送出新增">
					</FORM>
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
