<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.pet.model.entity.*"%>

<%
Pet pet = (Pet) request.getAttribute("updatePet");
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
					
						<form action="${pageContext.request.contextPath}/ipet-back/pet/editPetFinal" method="post">
						
							<table id="petdata">
								<tr>
									<td><label>會員ID:</label></td>
									<td><input type="text" name="memId"
										value="<%=pet.getMemId()%>" readonly required></td>
								</tr>
								
								<tr>
									<td><label>寵物姓名:</label></td>
									<td><input type="text" name="petName"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}"
										value="<%=pet.getPetName()%>" readonly required></td>
								</tr>
								
								<tr>
									<td></td>
									<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和_
												, 且長度必需在2到10之間</i></span></td>
								</tr>
			
								<tr>
									<td><label>品種:</label></td>
									<td><input type="text" name="petVarId" readonly
										value="<%=pet.getPetVarId()%>"></td>
								</tr>
								
								<tr>
									<td><label>寵物體型:</label></td>
									<td><input type="text" name="petSize" readonly
										value="<%=pet.getPetSize()%>"></td>
<!-- 									<td><select name="petSize"> -->
<%-- 											<option value="小型犬" ${pet.getPetSize() == "小型犬" ?'selected':''}>小型犬(體重10公斤以下)</option> --%>
<%-- 											<option value="中型犬" ${pet.getPetSize() == "中型犬" ?'selected':''}>中型犬(體重11~25公斤)</option> --%>
<%-- 											<option value="大型犬" ${pet.getPetSize() == "大型犬" ?'selected':''}>大型犬(體重26公斤以上)</option> --%>
<!-- 									</select></td> -->
								</tr>
								
								<tr>
									<td>性別:</td>
									<td><label for="girl"><input type="radio"
											name="petGen" value="<%=pet.getPetGen()%>" checked><%=pet.getPetGen()%></label></td>
								</tr>
								<tr>
									<td><label>寵物生日:</label></td>
									<td><input type="date" name="petBirth"
										value="<%=pet.getPetBirth()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>狀態:</label></td>
									<td><select name="petStatus">
											<option value="0" ${pet.getPetStatus() == 0 ?'selected':''}>過世</option>
											<option value="1" ${pet.getPetStatus() == 1 ?'selected':''}>正常</option>
									</select></td>
								</tr>
								
								<tr>
									<td><input type="hidden" name="action" value="updateFinal">
										<input type="hidden" name="petId"
										value="<%=pet.getPetId()%> "></td>
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
