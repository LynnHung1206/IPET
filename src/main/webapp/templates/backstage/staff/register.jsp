
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.staff.model.entity.*"%>

<%
Staff staffVO = (Staff) request.getAttribute("staffVO");
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

<style>
#staffdata {
	margin: auto;
}
</style>
<script>
	function enter() {
		alert("新增成功");
	}
</script>
<style type="text/css">
input#allStaff {
	background-color: lightgray;
	border: none;
	border-radius: 5px;
}

input#allStaff:hover, #search:hover {
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
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<form
						action="${pageContext.request.contextPath}/ipet-back/staff/getAllList">
						<input id="allStaff" type="submit" value="員工列表">
					</form>

					<!-- 新增員工資料 -->
					<div id="newStaff">
						<form action="${pageContext.request.contextPath}/ipet-back/staff/getAllList" method="post">
							<table id="staffdata">
								<tr>
									<td><label>姓名:</label></td>
									<td><input type="text" name="sname"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}" autofocus
										required></td>
								</tr>
								<tr>
									<td></td>
									<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和_
												, 且長度必需在2到10之間</i></span></td>
								</tr>
								<tr>
									<td><label>身分證字號:</label></td>
									<td><input type="text" name="uid" required></td>
								</tr>
								<tr>
									<td><label>生日:</label></td>
									<td><input type="date" name="birth" required></td>
								</tr>
								<tr>
									<td><label>性別:</label></td>
									<td><label for="girl"><input type="radio"
											name="sex" id="girl" value="女" checked>女</label> <label
										for="boy"><input type="radio" name="sex" id="boy"
											value="男">男</label></td>
								</tr>
								<tr>
									<td><label>Email:</label></td>
									<td><input type="email" name="email" required></td>
								</tr>
								<tr>
									<td><label>手機:</label></td>
									<td><input type="tel" name="phone" required></td>
								</tr>
								<tr>
									<td><label>市內電話:</label></td>
									<td><input type="tel" name="tel"></td>
								</tr>
								<tr>
									<td><label>地址:</label></td>
									<td><input type="text" name="address" required></td>
								</tr>
								<tr>
									<td><label>帳號:</label></td>
									<td><input type="text" name="acount"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}" required></td>
								</tr>
								<tr>
									<td></td>
									<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和_
												, 且長度必需在2到10之間</i></span></td>
								</tr>

								<tr>
									<td><label>密碼:</label></td>
									<td><input type="password" name="password" required></td>
								</tr>
								<tr>
									<td><label> 職稱: </label></td>
									<td><select name="job">
											<option value="" disabled selected>請選擇</option>
											<option value="經理">經理</option>
											<option value="財務">財務</option>
											<option value="會計">會計</option>
											<option value="人事">人事</option>
											<option value="美容師">美容師</option>
											<option value="美容助理">美容助理</option>
											<option value="一般人員">一般人員</option>

									</select></td>
								</tr>
								<tr>
									<jsp:useBean id="adminFuncSvc" scope="page"
										class="com.web.admin.model.service.AdminFuncService" />
									<td><label>權限:</label></td>
									<td><c:forEach var="adminFunc"
											items="${adminFuncSvc.getAll()}">
											<label for="${adminFunc.getAdminID()}"
												style="font-size: 10px;"><input type="radio"
												name="admin" id="${adminFunc.getAdminID()}"
												value="${adminFunc.getAdminID()} ">
												${adminFunc.getAdminName()}</label>
										</c:forEach></td>
								</tr>
								<tr>
									<td><input type="hidden" name="action" value="insert"></td>
									<td><input type="submit" value="送出" onclick="enter()"></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="row mb-2">
						<script>
							const dateControl = document
									.querySelector('input[type="date"]');
							dateControl.value = '1980-01-01';
						</script>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<%-- /.content-header --%>
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
