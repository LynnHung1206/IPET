<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.question.model.service.*"%>
<%@ page import="com.web.question.model.entity.*"%>

<%
QuestionService questionSvc = new QuestionService();
List<Question> list = questionSvc.getAll();
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
	height: 50px;
}

th{
	background-color: lightgray;
	text-align: center;
}

td{
	background-color: white;
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
					<form
						action="${pageContext.request.contextPath}/ipet-back/question/addNew">
						<input id="addNew" type="submit" value="新增常見問題">
					</form>
					<div class="row mb-2">
						<table style="width: 100%;height: 50px;">
							<tr>
								<th>常見問題編號</th>
								<th>常見問題標題</th>
								<th>常見問題內容</th>
<!-- 								<th>新增時間</th> -->
								<!-- 									<td>權限</td> -->
								<th></th>
							</tr>

							<%@ include file="page1.file"%>
							<c:forEach var="questionVO" items="${list}" begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">

								<tr>
									<td>${questionVO.quesId}</td>
									<td>${questionVO.quesTitle}</td>
									<td>${questionVO.quesText}</td>
<%-- 									<td>${questionVO.quesTime}</td> --%>

<%-- 									<td><jsp:useBean id="adminFuncSvc" scope="page" --%>
<%-- 											class="com.web.admin.model.service.AdminFuncService" /> <c:forEach --%>
<%-- 											var="adminFunc" items="${admin}"> --%>
<%-- 													${AdminFunc.getName()}			 --%>
<%-- 										</c:forEach> --%>
<!-- 										</td> -->
									<td>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/ipet-back/question/edit"
											style="margin-bottom: 0px;">
											<input type="submit" value="修改"> <input type="hidden"
												name="quesId" value="${questionVO.getQuesId()}"> <input
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
