<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.member.model.service.*"%>
<%@ page import="com.web.member.model.entity.*"%>
<%@ page import="com.web.pet.model.service.*"%>
<%@ page import="com.web.pet.model.entity.*"%>

<%
MemberService memberSvc = new MemberService();
List<Member> list = memberSvc.getAll();
pageContext.setAttribute("list", list);
%>
<%
Pet petVO = (Pet) request.getAttribute("petVO");
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
	width: max;
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
<!-- 					<form -->
<%-- 						action="${pageContext.request.contextPath}/ipet-back/member/addNew"> --%>
<!-- 						<input id="addNew" type="submit" value="新增會員"> -->
<!-- 					</form> -->
					<div class="row mb-2">
						<table align="center" style="width: 100%;">
							<tr>
								<th>會員編號</th>
								<th>會員姓名</th>
								<th>身份證字號</th>
								<th>生日</th>
								<th>性別</th>
								<th>信箱</th>
								<th>手機</th>
								<th>市內電話</th>
								<th>地址</th>
								<th>狀態</th>
								<th></th>
<!-- 								<th></th> -->
							</tr>

							<%@ include file="page1.file"%>
							<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>"
								end="<%=pageIndex+rowsPerPage-1%>">

								<tr>
									<td>${memberVO.memId}</td>
									<td>${memberVO.memName}</td>
									<td>${memberVO.memUid}</td>
									<td>${memberVO.memBth}</td>
									<td>${memberVO.memSex}</td>
									<td>${memberVO.memEmail}</td>
									<td>${memberVO.memPhone}</td>
									<td>${memberVO.memTel}</td>
									<td>${memberVO.memAdd}</td>
									<td>${memberVO.memStatus != 1 ? "正常" : "停權"}</td>
									<td>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/ipet-back/member/edit"
											style="margin-bottom: 0px;">
											<input type="submit" value="修改"> <input type="hidden"
												name="memId" value="${memberVO.getMemId()}"> <input
												type="hidden" name="action" value="updateTemp">
										</FORM>
									</td>
<!-- 									<td> -->
<!-- 										<FORM METHOD="post" -->
<%-- 											ACTION="<%=request.getContextPath()%>/ipet-back/pet/addNew" --%>
<!-- 											style="margin-bottom: 0px;"> -->
<!-- 											<input type="submit" value="新增寵物"> <input type="hidden" -->
<%-- 												name="memId" value="${memberVO.getMemId()}"> <input --%>
<!-- 												type="hidden" name="action" value="insert"> -->
<!-- 										</FORM> -->
<!-- 									</td> -->
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
