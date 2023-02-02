
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.question.model.entity.*"%>

<%
Question questionVO = (Question) request.getAttribute("questionVO");
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
#questiondata {
	margin: auto;
}
</style>

<style type="text/css">
input#allQuestion {
	background-color: lightgray;
	border: none;
	border-radius: 5px;
}

input#allQuestion:hover, #search:hover {
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
						action="${pageContext.request.contextPath}/ipet-back/question/getAllList">
						<input id="allPet" type="submit" value="常見問題列表">
					</form>

					<!-- 新增常見問題 -->
					<div id="newQuestion">
						<form
							action="${pageContext.request.contextPath}/ipet-back/question/allQuestionList"
							method="post">
							<table id="questiondata">
								
								<tr>
									<td><label>常見問題標題:</label></td>
									<td><input type="text" name="quesTitle" autofocus required></td>
								</tr>
								
								<tr>
									<td><label>常見問題內容:</label></td>
									<td><input type="text" name="quesText" required></td>
								</tr>
<!-- 								<tr> -->
<!-- 									<td><label></label></td> -->
<!-- 									<td><input type="time" name="quesTime" ></td> -->
<!-- 								</tr> -->
								
								
								<tr>
									<td><input type="hidden" name="action" value="insert"></td>
									<td><input type="submit" value="送出" onclick="enter()"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<%-- /.content-header --%>
		</div>
		<!-- /.content-wrapper -->



<!-- 		<script> -->
// 			function enter() {
// 				alert("新增成功");
// 			}
<!-- 		</script> -->
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
