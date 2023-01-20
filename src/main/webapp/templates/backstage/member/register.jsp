
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.member.model.entity.*"%>

<%
Member memberVO = (Member) request.getAttribute("memberVO");
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
<script>
	function enter() {
		alert("新增成功");
	}	
</script>
<style type="text/css">
input#allMember {
	background-color: lightgray;
	border: none;
	border-radius: 5px;
}

input#allMember, #search:hover {
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
						action="${pageContext.request.contextPath}/ipet-back/member/getAllList">
						<input id="allMember" type="submit" value="會員列表">
					</form>

					<!-- 新增員工資料 -->
					<div id="newMember">
						<form action="${pageContext.request.contextPath}/ipet-back/member/getAllList" method="post">
							<table id="memberdata">
								<tr>
									<td><label>姓名:</label></td>
									<td><input type="text" name="memName"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}" autofocus
										required></td>
								</tr>
								<tr>
									<td></td>
									<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和
												, 且長度必需在2到10之間</i></span></td>
								</tr>
								<tr>
									<td><label>身分證字號:</label></td>
									<td><input type="text" name="memUid" required></td>
								</tr>
								<tr>
									<td><label>生日:</label></td>
									<td><input type="date" name="memBth" required></td>
								</tr>
								<tr>
									<td><label>性別:</label></td>
										<td>
											<select name="memSex">
												<option value="男" ${(memberVO.memSex=="男")? 'selected':'' }>男
												<option value="女" ${(memberVO.memSex=="女")? 'selected':'' }>女
											</select>
										</td>
								</tr>
								<tr>
									<td><label>Email:</label></td>
									<td><input type="email" name="memEmail" required></td>
								</tr>
								<tr>
									<td><label>手機:</label></td>
									<td><input type="tel" name="memPhone" required></td>
								</tr>
								<tr>
									<td><label>市內電話:</label></td>
									<td><input type="tel" name="memTel" required></td>
								</tr>
								<tr>
									<td><label>地址:</label></td>
									<td><input type="text" name="memAdd" required></td>
								</tr>
								<tr>
									<td><label>帳號:</label></td>
									<td><input type="text" name="memAc"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}" required></td>
								</tr>
								<tr>
									<td></td>
									<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和_
												, 且長度必需在2到10之間</i></span></td>
								</tr>

								<tr>
									<td><label>密碼:</label></td>
									<td><input type="password" name="memPw" required></td>
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
