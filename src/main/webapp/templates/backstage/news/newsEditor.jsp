<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IPET 寵物</title>
<!-- TODO: 目前先使用 完整css，後續再換成 min.css-->
<!-- summernote
 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/summernote/summernote-bs4.min.css">
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
.note-btn-group.btn-group.note-insert {
	display: none;
}
/* #editBlock { */
/* 	margin-left:400px; */
/* } */
textarea {
	width: 200px;
	height: 200px;
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
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">

					<div id="editBlock">
						<form method="post"
							action="${pageContext.request.contextPath}/ipet-back/news/addNewNews">
							<div>
								<label>標題</label>
							</div>
							<div>
								<input type="text" id="title" name="title" required>
							</div>
							<div>
								<label>內容</label>
							</div>
							<div>
								<textarea id="summernote" name="text" required></textarea>
							</div>
							<!-- 						<input type="hidden" name="action" value="insert"> -->
							<input type="submit" value="送出" onclick="ck()">
						</form>
					</div>


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
	<!-- Summernote -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/summernote/summernote-bs4.min.js"></script>

	<script>
		$("#summernote").summernote();

		const textarea = document.getElementById('summernote').innerText;
		const title = document.getElementById('title').innerText;

		// 		const p = document.getElementsByTagName('p');
		// 		p[47].setAttribute('id', 'text');
		// 		const pNew = document.getElementById('text').innerText;

		function ck() {
			if ($("#summernote").val() == '' || $("#summernote").val() == null) {
				alert("請輸入內容");
			} else if (title != null || title != '') {
				alert("新增成功");
			}

		}
	</script>
	<script>
		$("p:contains(消息管理)").closest("li").addClass("menu-open");
		$("p:contains(新增最新消息)").closest("a").addClass("active");
	</script>
</body>
</html>
