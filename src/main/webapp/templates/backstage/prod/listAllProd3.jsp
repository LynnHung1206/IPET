<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.product.model.service.ProductServiceBack"%>
<%@ page import="com.web.product.model.service.ProductTypeServiceBack"%>
<%@ page import="com.web.product.model.entity.Product"%>


<%
ProductServiceBack prodSvc = new ProductServiceBack();
List<Product> list = prodSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>

<head>
<title>嚙課佗蕭嚙諉品嚙踝蕭嚙� - listAllProd.jsp</title>
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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 2px solid;
	margin-left: 260px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 8px;
	text-align: center;
}

.no-wrap {
	white-space: nowrap;
}

.page1 {
	margin-left: 260px;
}

.page1-1 {
	margin-left: 260px;
}

.page2 {
	margin-left: 260px;
}

.page2-2 {
	position: relative;
	left: 265px;
}
</style>

</head>

<body bgcolor='white'>
	<div class="wrapper">
		<!--  Navbar -->
		<%@ include file="/templates/backstage/common/navbar.jsp"%>
		<!-- /.navbar -->

		<!-- 嚙踝蕭嚙踝蕭嚙踝蕭嚙� Main Sidebar Container -->
		<%@ include file="/templates/backstage/common/sidebar.jsp"%>
		<!-- /.aside -->

		<!-- 嚙踝蕭嚙踝蕭嚙踝蕭嚙踝蕭 Content Wrapper. Contains page content -->

		<table id="table-1">
			<tr>
				<td>
					<h3>嚙課佗蕭嚙諉品嚙踝蕭嚙� - listAllProd.jsp</h3>

				</td>
			</tr>

		</table>
		<jsp:useBean id="prodTypeSvc" scope="page"
			class="com.web.product.model.service.ProductTypeServiceBack" />



		<table>
			<tr>
				<th class="no-wrap">嚙諉品嚙編嚙踝蕭</th>
				<th class="no-wrap">嚙諉品嚙磕嚙踝蕭</th>
				<th class="no-wrap">嚙踝蕭嚙踝蕭</th>
				<th>嚙諉品嚙緙嚙緲</th>
				<th class="no-wrap">嚙編嚙磕嚙褕塚蕭</th>
				<th class="no-wrap">嚙磕嚙稼嚙踝蕭嚙璀</th>
				<th class="no-wrap">嚙踝蕭嚙瞌</th>
				<th>嚙誕歹蕭</th>
				<th>嚙論改蕭</th>
				<th>嚙磋嚙踝蕭</th>
			</tr>


			<%-- 		<jsp:useBean id="prod_IMGSvc" scope="page" --%>
			<%--  			class="com.web.product.model.service.ProductImgServiceBack" />  --%>
			<%@ include file="page1.file"%>
			<c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">


				<tr>
					<td>${prodVO.prodID}</td>
					<td>${prodVO.prodName}</td>
					<td>${prodVO.prodPrice}</td>
					<td>${prodVO.prodDescription}</td>
					<td class="no-wrap">${prodVO.addedTime}</td>
					<td><c:choose>
							<c:when test="${prodVO.prodStatus == 0}">嚙磕嚙稼嚙踝蕭</c:when>
							<c:otherwise>嚙磊嚙稼嚙踝蕭</c:otherwise>
						</c:choose></td>
					<td class="no-wrap">${prodVO.productType.typeName}</td>
					<td><img
						src="<%=request.getContextPath()%>/ipet-back/prod/DBGifReader?prodID=${prodVO.prodID}"
						width="100px"></td>

					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ipet-back/prod/getOneForUpdate"
							style="margin-bottom: 0px;">
							<input type="submit" value="嚙論改蕭"> <input type="hidden"
								name="prodID" value="${prodVO.prodID}"> <input
								type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/ipet-back/prod/delete"
							style="margin-bottom: 0px;">
							<input type="submit" value="嚙磋嚙踝蕭"> <input type="hidden"
								name="prodID" value="${prodVO.prodID}"> <input
								type="hidden" name="action" value="delete">
						</FORM>
					</td>


				</tr>
			</c:forEach>


		</table>
		<%@ include file="page2.file"%>
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

	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script>

	<script>
		function updateTotalPrice() {
			var qty = document.querySelector(".cart-plus-minus-box").value;
			console.log("123");
		}
	</script>

</body>

</html>