<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.product.model.entity.Product"%>

<%
Product prodVO = (Product) request.getAttribute("prodVO");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IPET 寵物 | 商城專區 | 新增商品</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-select/css/select.bootstrap4.css">

<!-- TODO: 目前先使用 完整css-->
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
<!-- childTable style -->
<style>
.myButton {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color: #ededed;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #777777;
	font-family: Verdana;
	font-size: 15px;
	font-weight: bold;
	padding: 7px 10px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
	margin-left:10px;
}

.myButton:hover {
	background: linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color: #dfdfdf;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>


</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!--  Navbar -->
		<%@ include file="/templates/backstage/common/navbar.jsp"%>
		<!-- /.navbar -->

		<!-- 左邊選單區 Main Sidebar Container -->
		<%@ include file="/templates/backstage/common/sidebar.jsp"%>
		<!-- /.aside -->


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">


			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">

						<div class="col-12">




							<!-- table -->
							<div class="card">
								<div class="card-header">
									<h3 class="card-title"></h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<FORM METHOD="post"
										ACTION="${pageContext.request.contextPath}/ipet-back/prod/addOneProd1"
										name="form1" enctype="multipart/form-data">
										<table id="reserveTable"
											class="table table-bordered table-striped  display">
											<tr>
												<td>商品名稱:</td>
												<td><input type="TEXT" name="prodName" size="45"
													value="<%=(prodVO == null) ? "小狗餅乾" : prodVO.getProdName()%>" /></td>
											</tr>
											<tr>
												<td>價格:</td>
												<td><input type="TEXT" name="prodPrice" size="45"
													value="<%=(prodVO == null) ? "300" : prodVO.getProdPrice()%>" /></td>
											</tr>
											<tr>
												<td>商品描述:</td>
												<td><input type="TEXT" name="prodDescription" size="45"
													value="<%=(prodVO == null) ? "這是一個商品描述" : prodVO.getProdDescription()%>" /></td>
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
										<input type="hidden" name="action" value="insert"> <label
											for="imgFile" class="btn btn-primary"> <i
											class="fas fa-cloud-upload-alt"></i> 上傳圖片
										</label> <input type="file" id="imgFile" name="imgFile" value="上傳圖片"
											accept="image/*" style="display: none;" /><span
											id="fileName"></span> <input type="submit" value="送出新增"
											class="myButton">
									</FORM>


								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.table -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content --


    
			<!-- /. Edit Modal content   -->



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="/templates/backstage/common/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/js/adminlte.js"></script>

	<!-- DataTables  & Plugins -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/jszip/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/pdfmake/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-select/js/dataTables.select.js"></script>

	<!-- sidebar menu Class -->
	<script>
		$("p:contains(商品管理)").closest("li").addClass("menu-open");
		$("p:contains(新增商品)").closest("a").addClass("active");
	</script>
	
	<script>
		var fileInput = document.getElementById("imgFile");
		fileInput.addEventListener("change", function() {
			var fileName = this.value.split("\\").pop();
			document.getElementById("fileName").innerHTML = fileName;
		});
	</script>

</body>
</html>