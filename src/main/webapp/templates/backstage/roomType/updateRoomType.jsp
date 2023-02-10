<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.roomType.model.*"%>
<%@ page import="com.web.roomType.model.entities.*"%>
<%@ page import="com.web.roomType.model.service.*"%>
<%@ page import="com.web.roomType.model.dao.*"%>
<%@ page import="com.web.roomType.model.dao.impl.*"%>


<%
RoomType roomType = (RoomType) request.getAttribute("roomType");
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

.error {
	color: #ff0000;
	font-style: italic;
	font-weight: lighter;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 5px;
	margin: 5px;
	width: 500px;
	font-weight: normal;
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
				<h4>房型修改</h4>
					<form
						action="${pageContext.request.contextPath}/ipet-back/roomType/updateRoomType"
						method="post" enctype="multipart/form-data">
						<table id="roomTypedata">
							<tr>
								<td>房型編號:</td>
								<td>${roomTypeVO.roomTypeId}</td>
							</tr>
							<tr>
								<td>房間數量:</td>
								<td><input type="TEXT" name="roomAmount" size="45"
									value="${roomTypeVO.roomAmount}" onclick="hideContent('roomAmount.errors');"/></td>
								<td><span  id ="roomAmount.errors" class="error">${errorMsgs.roomAmount}</span></td>
							</tr>
							<tr>
								<td>房間名稱:</td>
								<td><input type="TEXT" name="roomTypeName" size="45"
									value="${roomTypeVO.roomTypeName}" onclick="hideContent('roomTypeName.errors');"/></td>
								<td><span  id ="roomTypeName.errors" class="error">${errorMsgs.roomTypeName}</span></td>
							</tr>
							<tr>
								<td>寵物體型:</td>
								<td><select name="dogSize">
										<option value="小型犬"
											${roomTypeVO.dogSize.equals("小型犬") ?'selected':''}>小型犬</option>
										<option value="中型犬"
											${roomTypeVO.dogSize.equals("中型犬") ?'selected':''}>中型犬</option>
										<option value="大型犬"
											${roomTypeVO.dogSize.equals("大型犬") ?'selected':''}>大型犬</option>
								</select></td>
							</tr>
							<tr>
								<td>房型內容:</td>
								<td><textarea name="roomTypeContent" cols="43">${roomTypeVO.roomTypeContent}</textarea></td>
							</tr>
							<tr>
								<td>寵物圖片</td>
								<td><div class="input-group mb-3">
										<input type="file" class="form-control" id="inputGroupFile02"
											name="roomTypePhoto"> <label class="input-group-text"
											for="inputGroupFile02">Upload</label>
									</div></td>
							</tr>
							<tr>
								<td>房型價格:</td>
								<td><input type="TEXT" name="roomTypePrice" size="45"
									value="${roomTypeVO.roomTypePrice}" /></td>
							</tr>
							<tr>
								<td>上下架狀態:</td>
								<td><select name="roomTypeStatus">
										<option value="0"
											${roomTypeVO.roomTypeStatus == 0 ?'selected':''}>上架</option>
										<option value="1"
											${roomTypeVO.roomTypeStatus == 1 ?'selected':''}>下架</option>
								</select></td>
							</tr>
							<tr>
								<td><input type="hidden" name="action" value="update">
									<input type="hidden" name="roomTypeId"
									value="${roomTypeVO.roomTypeId}"></td>
								<td><input type="submit" value="送出修改"></td>
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
		$("p:contains(房型管理)").closest("li").addClass("menu-open");
		$("p:contains(房型列表)").closest("a").addClass("active");
	</script>
	<script>
	//清除提示信息
	function hideContent(d) {
	     document.getElementById(d).style.display = "none";
	}
	</script>
</body>
</html>
