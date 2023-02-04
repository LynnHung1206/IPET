<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.product.model.entity.Product"%>

<%
Product prodVO = (Product) request.getAttribute("prodVO"); //ProdServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>商品資料修改 - update_pord_input.jsp</title>
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
h3{
margin-left: 260px;
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
	white-space: nowrap;
}

th, td {
	padding: 1px;
}
[name="form1"]{
   margin-left: 260px;
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
					<h3>商品資料修改 - update_prod_input.jsp</h3>
				</td>
			</tr>
		</table>

		<h3>資料修改:</h3>

		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<FORM METHOD="post"
			ACTION="${pageContext.request.contextPath}/ipet-back/prod/updateProdInput"
			name="form1" enctype="multipart/form-data">
			<table>
				<tr>
					<td>商品編號:<font color=red><b>*</b></font></td>
					<td><%=prodVO.getProdID()%></td>
				</tr>

				<!-- 這裡代表直接取原本的值跟顯示欄位 -->
				<tr>
					<td>商品名稱:</td>
					<td><input type="TEXT" name="prodName" size="45"
						value="<%=prodVO.getProdName()%>" /></td>
				</tr>
				<tr>
					<td>價錢:</td>
					<td><input type="TEXT" name="prodPrice" size="45"
						value="<%=prodVO.getProdPrice()%>" /></td>
				</tr>

				<tr>
					<td>商品描述:</td>
					<td><input type="TEXT" name="prodDescription" size="45"
						value="<%=prodVO.getProdDescription()%>" /></td>
				</tr>
				<tr>
					<td>上架狀態:</td>
					<td><input type="TEXT" name="prodStatus" size="45"
						value="<%=prodVO.getProdStatus()%>" /></td>
				</tr>
			
				<jsp:useBean id="prodTypeSvc" scope="page"
					class="com.web.product.model.service.ProductTypeServiceBack" />

				
				<tr>
					<td>類別:<font color=red><b>*</b></font></td>
					<td><select size="1" name="typeID">
							<c:forEach var="prodTypeVO" items="${prodTypeSvc.all}">
								<option value="${prodTypeVO.typeID}"
									${(prodVO.typeID==prodTypeVO.typeID)? 'selected':'' }>${prodTypeVO.typeName}
							</c:forEach>
					</select></td>
				</tr>

			</table>
			<input type="file" name="imgFile" value="上傳圖片" accept="image/*" /> <input
				type="hidden" name="action" value="update"> <input
				type="hidden" name="prodID" value="<%=prodVO.getProdID()%>">

			<input type="submit" value="送出修改">
		</FORM>

<!-- 			<FORM method="post" action="prod.do" enctype="multipart/form-data"> -->

<%-- 				<input type="hidden" name="prodID" value="<%=prodVO.getProdID()%>"> --%>
				
<!-- 				<input type="hidden" name="action" value="upload_img" /> 	<input -->
<!-- 					type="file" name="imgFile" /> <input type="submit" value="新增圖片"> -->
<!-- 			</FORM> -->
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