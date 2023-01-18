
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.pet.model.entity.*"%>

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

<style>
#petdata {
	margin: auto;
}
</style>

<style type="text/css">
input#allPet {
	background-color: lightgray;
	border: none;
	border-radius: 5px;
}

input#allPet:hover, #search:hover {
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
						action="${pageContext.request.contextPath}/ipet-back/pet/getAllList">
						<input id="allPet" type="submit" value="寵物列表">
					</form>

					<!-- 新增寵物資料 -->
					<div id="newPet">
						<form
							action="${pageContext.request.contextPath}/ipet-back/pet/allPetList"
							method="post">
							<table id="petdata">
								<tr>
									<td><label>會員ID:</label></td>
									<td><input type="text" name="memId" value="${petVO.memId}"></td>
								</tr>
								<tr>
									<td><label>寵物名字:</label></td>
									<td><input type="text" name="petName"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}" autofocus
										required></td>
								</tr>
								<tr>
									<td></td>
									<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和_
												, 且長度必需在2到10之間</i></span></td>
								</tr>
								<tr>
									<td><label>品種:</label></td>
									<td><input type="text" name="petVarId" ></td>
								</tr>
								<tr>
									<td><label>寵物體型:</label></td>
									<td><select name="petSize">
											<option value="" disabled selected>請選擇</option>
											<option value="小型犬">小型犬(體重10公斤以下)</option>
											<option value="中型犬">中型犬(體重11~25公斤)</option>
											<option value="大型犬">大型犬(體重26公斤以上)</option>
									</select></td>
								</tr>
								<tr>
									<td><label>性別:</label></td>
									<td>
									<label for="boy"><input type="radio" name="petGen" id="boy" value="男" checked>男</label> 
									<label for="girl"><input type="radio" name="petGen" id="girl" value="女">女</label></td>
								</tr>
								<tr>
									<td><label>寵物生日:</label></td>
									<td><input type="date" name="petBirth" ></td>
								</tr>
								<tr>
									<td><label>狀態:</label></td>
									<td><input type="text" name="petStatus" value="1" readonly ></td>
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
