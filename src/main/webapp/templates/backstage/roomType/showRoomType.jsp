<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.web.roomType.model.*" %>
<%@ page import="com.web.roomType.model.entities.*" %>
<%@ page import="com.web.roomType.model.service.*" %>
<%@ page import="com.web.roomType.model.dao.*" %>
<%@ page import="com.web.roomType.model.dao.impl.*" %>

<%
RoomTypeService roomTypesvc = new RoomTypeService();
List<RoomType> list = roomTypesvc.selectAll();
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
					<h4>房型列表</h4>
					
					<a	href="${pageContext.request.contextPath}/templates/backstage/roomType/addRoomType.jsp"><button>新增房型</button></a>
						
		
					<div class="row mb-2">
						<table id="Room" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>房型編號</th>
									<th>房型數量</th>
									<th>房型名稱</th>
									<th>房型說明</th>
									<th>寵物體型</th>
									<th>房型價格</th>
									<th>上下架狀態</th>
									<th>圖片</th>
									<th>修改</th>
								</tr>


								<%@ include file="page1.file"%>
								<c:forEach var="roomTypeVO" items="${list}"
									begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

									<tr>
										<td>${roomTypeVO.roomTypeId}</td>
										<td>${roomTypeVO.roomAmount}</td>
										<td>${roomTypeVO.roomTypeName}</td>
										<td>${roomTypeVO.roomTypeContent}</td>
										<td>${roomTypeVO.dogSize}</td>
										<td>${roomTypeVO.roomTypePrice}</td>
										<td>${roomTypeVO.roomTypeStatus != 1 ? "上架" : "下架"}</td>
										<td><img src="<%=request.getContextPath()%>/roomType/DBGifReader?roomTypeId=${roomTypeVO.roomTypeId}" width="100px"></td>

										<td>
											<form METHOD="post"
												ACTION="${pageContext.request.contextPath}/ipet-back/roomType/editRoomType"
												style="margin-bottom: 0px;">
												<input type="submit" value="修改"> <input
													type="hidden" name="roomTypeId"
													value="${roomTypeVO.roomTypeId}">
											</form>
										</td>
									</tr>
								</c:forEach>
							</thead>
						</table>
						<div class="col-sm-6">
							<%@ include file="page2.file"%>
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
</body>
</html>
