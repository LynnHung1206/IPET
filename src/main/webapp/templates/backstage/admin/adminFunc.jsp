<%@page import="com.web.admin.model.service.AdminFuncService"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.web.admin.model.service.*"%>
<%@page import="com.web.admin.model.entities.*"%>
<%@ page import="java.util.*"%>
<%
AdminFuncService adminFuncSvc = new AdminFuncService();
List<AdminFunc> list = adminFuncSvc.getAll();
pageContext.setAttribute("list", list);
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IPET 寵物</title>
<!-- TODO: 目前先使用 完整css，後續再換成 min.css-->

<!-- DataTable -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
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
#new {
	/* 	margin-right: 200px; */
	display: inline-block;
}

#editblock {
	margin-top: 0px;
	display: inline-block;
	margin-bottom: 50px;
	margin-right: 100px;
}

/*  table, th, td {  */
/*  	border: 1px solid white;  */
/*  	border-collapse: collapse;  */
/*  }  */

/*  th, td {  */
/*  	background-color: pink;  */
/* 	margin: 0 auto;  */
/*  }  */
.container-fluid {
	display: flex;
}

example {
	margin-top: 50px;
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
					<div id="editblock">
						<h1>員工權限</h1>
						<table id="example" class="display" cellspacing="0" width="100%">
							<thead>
								<tr>
									<td></td>
									<td>權限編號</td>
									<td>權限名稱</td>
									<td></td>
								</tr>
							</thead>
						</table>
					</div>

					<div class="row mb-2">
						<div id="new">
							<h1>新增員工權限</h1>
							<br>
							<form method="post"
								action="${pageContext.request.contextPath}/ipet-back/admin/addNewAdmin">
								<input type="text" id="admin" name="admin" required> <input
									type="submit" onclick="add()">
							</form>
						</div>
						<div class="col-sm-6"></div>
					</div>
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
	<!-- DataTable -->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
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
	<!-- Summernote -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/summernote/summernote-bs4.min.js"></script>
	<script>
	function format (allAdmin) {
	    return '<form action="${pageContext.request.contextPath}/ipet-back/admin/adminEdit" method="post"><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
	        '<tr>'+
	            '<td>編號:</td>'+
	            '<td>'+allAdmin.id+'</td>'+
	        '</tr>'+
	        '<tr>'+
	            '<td>名稱:</td>'+
	            '<td><textarea id="summernote" style="width:189px;" name="name">'+allAdmin.name+'</textarea></td>'+
	        '</tr>'+
	        '<tr>'+
	        '<input type="hidden" name="id" value="'+allAdmin.id+'">'+
	        '</tr>'+
		    '</table><input type="submit" value="送出修改" style="margin-left:180px; '+
		    'background-color: pink;border: none;border-radius: 5px" onclick="ok()"></form>';
	}


		$(document).ready(function() {
			var table = $('#example').DataTable({
				data:${allAdmin},
				"info": false,
                "searching": false,
                "bLengthChange": false,
                "ordering": true,
				"columns" : [ {
					"className" : 'details-control',
					"orderable" : false,
					"data" : null,
					"defaultContent" : ''
				}, {
					"data" : "id",
						className: 'adminid'
				}, {
					"data" : "name"
				}, {
			          data: null,
			          defaultContent:
			                  '<button type="submit" class="btn btn-light details-control" data-toggle="modal" data-target="#EditModal" data-whatever="@mdo">' +
			                  '<i class="fas fa-solid fa-pen"></i>' +
			                  '</button>',
			          className: 'row-edit dt-center',
			          orderable: false,
			          responsivePriority: 6
			        }
				],
				"order" : [ [ 1, 'asc' ] ]
			});
			

			// Add event listener for opening and closing details
			$('#example tbody').on('click', 'button.btn-light', function() {
				var tr = $(this).closest('tr');
				var row = table.row(tr);

				if (row.child.isShown()) {
					// This row is already open - close it
					row.child.hide();
					tr.removeClass('shown');
				} else {
					// Open this row
					row.child(format(row.data())).show();
					tr.addClass('shown');
				}
			});
		});
		
		function ok(){
			alert("修改成功");
		}
		let admin = document.getElementById('admin').innerText;
		function add(){
		if(admin !=''){
			alert("新增成功,即將跳轉首頁");
		}
		}
		</script>
		<script>
		$("p:contains(權限管理)").closest("li").addClass("menu-open");
		$("p:contains(員工權限與新增權限)").closest("a").addClass("active");
	</script>
</body>
</html>
