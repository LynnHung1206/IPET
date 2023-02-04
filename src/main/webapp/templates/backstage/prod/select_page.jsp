<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IPET 商城</title>
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
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
	margin-left: 260px;
}

p {
	margin-left: 260px;
}

form {
	margin-left: 260px;
}

h4 {
	margin-left: 260px;
	color: blue;
	display: inline;
}
</style>
</head>
<body>
	<!--  Navbar -->
	<%@ include file="/templates/backstage/common/navbar.jsp"%>
	<!-- /.navbar -->

	<!-- 左邊選單區 Main Sidebar Container -->
	<%@ include file="/templates/backstage/common/sidebar.jsp"%>
	<!-- /.aside -->

	<!-- 中間頁面 Content Wrapper. Contains page content -->
	<table id="table-1">
		<tr>
			<td>
				<h3>商品資料查詢 - select_page.jsp</h3>
			</td>

		</tr>
	</table>
	<h4>資料查詢:</h4>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<form method="post"
		action="${pageContext.request.contextPath}/ipet-back/prod/listOneProd">
		<b>輸入商品編號 (如1,2,3):</b> <input type="text" name="prodID" /> <input
			type="hidden" name="action" value="getOne_For_Display" /> <input
			type="submit" value="送出" />
	</form>
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