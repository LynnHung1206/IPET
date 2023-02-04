<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.product.model.entity.Product"%>
<%@ page import="com.web.product.model.service.ProductServiceBack"%>
<%@ page import="com.web.product.model.service.ProductTypeServiceBack"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
Product prodVO = (Product) request.getAttribute("prodVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>商品資料 - listOneProd.jsp</title>
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

table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: 260px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>
	<div class="wrapper">
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
					<h3>商品資料 - ListOneProd.jsp</h3>
					<h4>
						<a
							href="${pageContext.request.contextPath}/templates/backstage/prod/listAllProd.jsp"><img
							src="" width="100" height="32" border="0">查看所有商品</a>
					</h4>
				</td>
			</tr>
		</table>

		<table>
			<tr>
				<th>商品編號</th>
				<th>商品名稱</th>
				<th>價錢</th>
				<th>商品描述</th>
				<th>上架狀態</th>
				<th>商品類別</th>
				<th>圖片</th>
			</tr>
			
			<tr>
				<td><%=prodVO.getProdID()%></td>
				<td><%=prodVO.getProdName()%></td>
				<td><%=prodVO.getProdPrice()%></td>
				<td><%=prodVO.getProdDescription()%></td>
				<td><c:choose>
							<c:when test="${prodVO.prodStatus == 0}">上架中</c:when>
							<c:otherwise>下架中</c:otherwise>
						</c:choose></td>
				<td>${prodVO.typeID}-[${prodVO.productType.typeName}]</td>
				<td><img
					src="<%=request.getContextPath()%>/ipet-back/prod/DBGifReader?prodID=${prodVO.prodID}"
					width="100px"></td>
			</tr>
		</table>
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