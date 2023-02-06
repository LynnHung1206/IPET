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
.childTable th {
	background-color: rgb(238, 182, 149, 0.45);
}

.childTable tr:nth-child(even) {
	background-color: #fffaf082;
}

.childTable tr:nth-child(odd) {
	background-color: #fffffc !important;
}

td.details-control {
	background:
		url("${pageContext.request.contextPath}/static/backstage/img/more.png")
		no-repeat center;
	background-size: 25px;
	cursor: pointer;
}

tr.shown td.details-control {
	background:
		url("${pageContext.request.contextPath}/static/backstage/img/close.png")
		no-repeat center;
	background-size: 20px;
	cursor: pointer;
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
										ACTION="${pageContext.request.contextPath}/ipet-back/prod/addOneProd"
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
										<br> <input type="hidden" name="action" value="insert">
										<input type="file" name="imgFile" value="上傳圖片"
											accept="image/*" /> <input type="submit" value="送出新增">
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


    <!-- Edit Modal content   -->
			<div class="modal fade" id="EditModal" data-backdrop="static"
				data-keyboard="false" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">資料編輯</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form>
								<%-- 預約日期 --%>
								<div class="form-group">
									<label for="reserveDate-modal-edit" class="col-form-label">預約日期</label>
									<input type="date" class="form-control"
										id="reserveDate-modal-edit" readonly>
								</div>
								<%-- 預約時段 --%>
								<div class="form-group">
									<label for="reservePeriod-modal-edit" class="col-form-label">預約時段</label>
									<input type="text" id="reservePeriod-modal-edit"
										class="form-control" readonly>
								</div>
								<%-- 預約單狀態 --%>
								<div class="form-group">
									<label for="reserveStatus-modal-edit" class="col-form-label">預約單狀態</label>
									<select id="reserveStatus-modal-edit" class="form-control">
										<option value="0">已支付訂金</option>
										<option value="1">已完成預約</option>
										<option value="2">已取消</option>
										<option value="3">逾時未到</option>
									</select>
								</div>

								<div>
									<button type="button" class="btn btn-outline-dark"
										id="searchAvailableJob">查詢可用班表</button>
								</div>
								<%-- 班表編號 --%>
								<div class="form-group">
									<label for="jobId-modal-edit" class="col-form-label">班表編號</label>
									<select id="jobId-modal-edit" class="form-control">
									</select>
								</div>
								<%-- 備註 --%>
								<div>
									<label for="jobId-modal-edit" class="col-form-label">顧客備註</label>
									<textarea id="clientNote-modal-edit" class="form-control"></textarea>
								</div>
								<div>
									<p id="editModalMessage"></p>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">離開</button>
							<button data-toggle="modal"
								class="btn btn-primary btn-edit-confirm">確認修改</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /. Edit Modal content   -->

			<!-- Edit Confirm Modal content   -->
			<div class="modal fade" id="EditConfirmModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">確認修改</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							確認要修改此筆資料? <br>
							<p style="color: red">注意! 若更改狀態為 "已取消"、"已完成預約" 或
								"逾時未到"，該筆資料後續將無法再被更改。</p>
							<br>
							<p id="editConfirmModalMessage"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">離開</button>
							<button type="submit"
								class="btn btn-danger btn-edit-confirm-confirm">確認修改</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.Edit Confirm Modal content   -->

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

</body>
</html>