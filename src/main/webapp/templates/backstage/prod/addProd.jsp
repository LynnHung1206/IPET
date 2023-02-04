<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.product.model.entity.Product"%>

<%
Product prodVO = (Product) request.getAttribute("prodVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�ӫ~��Ʒs�W - addEmp.jsp</title>
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

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

h4 {
	margin-left: 260px;
}

[name="form1"] {
	margin-left: 260px;
}
</style>

</head>
<body bgcolor='white'>
	<div class="wrapper">
		<!--  Navbar -->
		<%@ include file="/templates/backstage/common/navbar.jsp"%>
		<!-- /.navbar -->

		<!-- ������� Main Sidebar Container -->
		<%@ include file="/templates/backstage/common/sidebar.jsp"%>
		<!-- /.aside -->

		<!-- �������� Content Wrapper. Contains page content -->

		<table id="table-1">
			<tr>
				<td>
					<h3>�ӫ~��Ʒs�W - addProd.jsp</h3>
				</td>
				
			</tr>
		</table>

		<h4>��Ʒs�W:</h4>

		<%-- ���~��C --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">�Эץ��H�U���~:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<FORM METHOD="post"
			ACTION="${pageContext.request.contextPath}/ipet-back/prod/addOneProd"
			name="form1" enctype="multipart/form-data">
			<table>
				<tr>
					<td>�ӫ~�W��:</td>
					<td><input type="TEXT" name="prodName" size="45"
						value="<%=(prodVO == null) ? "�p���氮" : prodVO.getProdName()%>" /></td>
				</tr>
				<tr>
					<td>����:</td>
					<td><input type="TEXT" name="prodPrice" size="45"
						value="<%=(prodVO == null) ? "300" : prodVO.getProdPrice()%>" /></td>
				</tr>
				<tr>
					<td>�ӫ~�y�z:</td>
					<td><input type="TEXT" name="prodDescription" size="45"
						value="<%=(prodVO == null) ? "�o�O�@�Ӱӫ~�y�z" : prodVO.getProdDescription()%>" /></td>
				</tr>



				<jsp:useBean id="prodTypeSvc" scope="page"
					class="com.web.product.model.service.ProductTypeServiceBack" />
				<tr>
					<td>���O:<font color=red><b>*</b></font></td>
					<td><select size="1" name="typeID">
							<c:forEach var="prodTypeVO" items="${prodTypeSvc.all}">
								<option value="${prodTypeVO.typeID}"
									${(prodVO.typeID==prodTypeVO.typeID)? 'selected':'' }>${prodTypeVO.typeName}
							</c:forEach>
					</select></td>
				</tr>

			</table>
			<br> <input type="hidden" name="action" value="insert">
			<input type="file" name="imgFile" value="�W�ǹϤ�" accept="image/*" /> <input
				type="submit" value="�e�X�s�W">
		</FORM>
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