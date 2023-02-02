<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.member.model.entity.*"%>

<%
Member member = (Member) request.getAttribute("updateMember");
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
#memberdata {
	margin: auto;
}
</style>
<script type="text/javascript">
	function enter() {
		alert("修改成功");
	}
</script>
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

					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					
						<form action="${pageContext.request.contextPath}/ipet-back/member/edit" method="post">
						
							<table id="memberdata">
								<tr>
									<td><label>姓名:</label></td>
									<td><input type="text" name="memName"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}"
										value="<%=member.getMemName()%>" readonly required></td>
								</tr>

								<tr>
									<td><label>身分證字號:</label></td>
									<td><input type="text" name="memUid"
										value="<%=member.getMemUid()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>生日:</label></td>
									<td><input type="date" name="memBth"
										value="<%=member.getMemBth()%>" readonly required></td>
								</tr>
								<tr>
									<td>性別:</td>
									<td><label for="girl"><input type="radio"
											name="memSex" value="<%=member.getMemSex()%>" checked><%=member.getMemSex()%></label></td>
								</tr>
								<tr>
									<td><label>Email:</label></td>
									<td><input type="email" name="memEmail"
										value="<%=member.getMemEmail()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>手機:</label></td>
									<td><input type="tel" name="memPhone"
										value="<%=member.getMemPhone()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>市內電話:</label></td>
									<td><input type="tel" name="memTel"
										value="${member.getMemTel() == null?'':member.getMemTel()}" readonly></td>
								</tr>
								<tr>
									<td><label>地址:</label></td>
									<td><input type="text" name="memAdd"
										value="<%=member.getMemAdd()%>" readonly></td>
								</tr>
								<tr>
									<td><label>帳號:</label></td>
									<td><input type="text" name="memAc"
										value="<%=member.getMemAc()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>密碼:</label></td>
									<td><input type="password" name="memPw"
										value="<%=member.getMemPw()%>" required readonly></td>
								</tr>
								<tr>
									<jsp:useBean id="memberSvc" scope="page"
										class="com.web.member.model.service.MemberService" />
									<td><label>狀態:</label></td>
									<td><select name="memStatus">
											<option value="0" ${member.getMemStatus() == 0 ?'selected':''}>正常</option>
											<option value="1" ${member.getMemStatus() == 1 ?'selected':''}>停權</option>
									</select></td>
								</tr>
								<tr>
									<td><input type="hidden" name="action" value="update">
										<input type="hidden" name="memId"
										value="<%=member.getMemId()%> "></td>
									<td><input type="submit" value="送出修改" onclick="enter()"></td>
								</tr>


							</table>

			
						</form>

					<div class="col-sm-6"></div>



					<div class="row mb-2"></div>
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
