<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.staff.model.service.*"%>
<%@ page import="com.web.staff.model.entity.*"%>
<%@ page import="com.web.admin.model.service.*"%>
<%@ page import="com.web.admin.model.entities.*"%>


<%
StaffService staffSvc = new StaffService();
List<Staff> list = staffSvc.getAll();
pageContext.setAttribute("list", list);
%>
<%
AdminService adminSvc = new AdminService();
List<Admin> adminvo = adminSvc.getAll();
pageContext.setAttribute("adminvo", adminvo);
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
}

th, td {
	background-color: pink;
}

input#addNew {
	background-color: lightgray;
	border: none;
	border-radius: 5px;
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
					<form
						action="${pageContext.request.contextPath}/ipet-back/staff/addNew">
						<input id="addNew" type="submit" value="新增員工">
					</form>
					<div class="row mb-2">
						<table>
							<tr>
								<td>員工編號</td>
								<td>員工姓名</td>
								<td>身份證字號</td>
								<td>生日</td>
								<td>性別</td>
								<td>信箱</td>
								<td>手機</td>
								<td>市內電話</td>
								<td>地址</td>
								<td>職稱</td>
								<td>狀態</td>
								<!-- 									<td>權限</td> -->
								<td></td>
							</tr>

							<%@ include file="page1.file"%>
							<c:forEach var="staffVO" items="${list}" begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">

								<tr>
									<td>${staffVO.id}</td>
									<td>${staffVO.name}</td>
									<td>${staffVO.uid}</td>
									<td>${staffVO.bth}</td>
									<td>${staffVO.sex}</td>
									<td>${staffVO.email}</td>
									<td>${staffVO.phone}</td>
									<td>${staffVO.tel}</td>
									<td>${staffVO.add}</td>
									<td>${staffVO.posi}</td>
									<td>${staffVO.status == 0 ? "在職" : "離職"}</td>
<%-- 									<td><jsp:useBean id="adminFuncSvc" scope="page" --%>
<%-- 											class="com.web.admin.model.service.AdminFuncService" /> <c:forEach --%>
<%-- 											var="adminFunc" items="${admin}"> --%>
<%-- 													${AdminFunc.getName()}			 --%>
<%-- 										</c:forEach> --%>
<!-- 										</td> -->
									<td>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/ipet-back/staff/edit"
											style="margin-bottom: 0px;">
											<input type="submit" value="修改"> <input type="hidden"
												name="staffId" value="${staffVO.getId()}"> <input
												type="hidden" name="action" value="updateTemp">
										</FORM>
									</td>
								</tr>
							</c:forEach>
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
