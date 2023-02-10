<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
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

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IPET 寵物 | 商城專區 | 所有商品</title>
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
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color:#ededed;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Verdana;
	font-size:15px;
	font-weight:bold;
	padding:6px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color:#dfdfdf;
}
.myButton:active {
	position:relative;
	top:1px;
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
									<table id="tablexx"
										class="table table-bordered table-striped  display">
										<thead>
											<tr>
												<th>商品編號</th>
												<th>商品名稱</th>
												<th>價格</th>
												<th>商品描述</th>
												<th>上架時間</th>
												<th>狀態</th>
												<th>類別</th>
												<th>圖片</th>
												<th>修改</th>
												<th>刪除</th>
											</tr>
										</thead>
										<%-- 										<%@ include file="page1.file"%> --%>
										

											<%-- 											<%@ include file="page1.file"%> --%>
											<%-- 										<c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>" --%>
											<%-- 											end="<%=pageIndex+rowsPerPage-1%>"> --%>

											<tbody>
											<c:forEach var="prodVO" items="${list}">
												<tr>
													<td>${prodVO.prodID}</td>
													<td>${prodVO.prodName}</td>
													<td>${prodVO.prodPrice}</td>
													<td>${prodVO.prodDescription}</td>
													<td class="no-wrap">${prodVO.addedTime}</td>
													<td><c:choose>
															<c:when test="${prodVO.prodStatus == 0}">上架中</c:when>
															<c:otherwise>下架中</c:otherwise>
														</c:choose></td>
													<td class="no-wrap">${prodVO.productType.typeName}</td>
													<td><img
														src="<%=request.getContextPath()%>/ipet-back/prod/DBGifReader?prodID=${prodVO.prodID}"
														width="100px"></td>

													<td>
														<FORM METHOD="post"
															ACTION="<%=request.getContextPath()%>/ipet-back/prod/getOneForUpdate"
															style="margin-bottom: 0px;">
															<input type="submit" value="修改" class="myButton"> <input
																type="hidden" name="prodID" value="${prodVO.prodID}">
															<input type="hidden" name="action"
																value="getOne_For_Update">
														</FORM>
													</td>
													<td>
														<FORM METHOD="post"
															ACTION="<%=request.getContextPath()%>/ipet-back/prod/delete"
															style="margin-bottom: 0px;">
															<input type="submit" value="刪除" class="myButton"> <input
																type="hidden" name="prodID" value="${prodVO.prodID}">
															<input type="hidden" name="action" value="delete">
														</FORM>
													</td>


												</tr>
										</c:forEach>
										</tbody>
									</table>
									<%-- 									<%@ include file="page2.file"%> --%>
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


    

		
		<!-- /.content-wrapper -->
		</div>
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

	<!-- sidebar menu Class -->
	<script>
		$("p:contains(商品管理)").closest("li").addClass("menu-open");
		$("p:contains(商品列表)").closest("a").addClass("active");
	</script>
	<script>
		$(document).ready(function() {
			$('#tablexx').DataTable({
				language: {
				      search: '搜尋：',
				      lengthMenu: '顯示 _MENU_ 筆資料',
				      zeroRecords: '沒有符合的結果',
				      info: '顯示第 _START_ 至 _END_ 筆資料，共 _TOTAL_ 筆',
				      infoEmpty: '顯示 0 至 0 筆資料，共 0 筆',
				      infoFiltered: '(從 _MAX_ 筆資料中篩選)',
				      paginate: {
				        first: '第一頁',
				        last: '最後一頁',
				        next: '下一頁',
				        previous: '上一頁'
				      }
				    }
			});
		});
	</script>

</body>
</html>