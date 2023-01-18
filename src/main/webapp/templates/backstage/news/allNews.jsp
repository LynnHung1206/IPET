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
<body class="hold-transition sidebar-mini"
	onload="opener.location.reload()">
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

					<table id="example" class="display" cellspacing="0" width="90%">
						<thead>
							<tr>
								<th style="width: 10px;"></th>
								<th>編號</th>
								<th>標題</th>
								<th>時間</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
					</table>

					<div class="col-sm-6"></div>
					<div class="row mb-2"></div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->

			<!-- Remove Modal content   -->
			<div class="modal fade" id="RemoveModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">資料刪除</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							確認要刪除此筆資料?
							<p id="deleteModalMessage"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">離開</button>
							<button type="submit" class="btn btn-danger btn-remove-confirm">確認</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.Remove Modal content   -->

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
	function format (allnews) {
	    return '<form action="${pageContext.request.contextPath}/ipet-back/news/editNews" method="post"><table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
	        '<tr>'+
	            '<td>標題:</td>'+
	            '<td><input type="text" name="title" value="'+allnews.title+'"></td>'+
	        '</tr>'+
	        '<tr>'+
	            '<td>內容:</td>'+
	            '<td><textarea id="summernote" name="text">'+allnews.text+'</textarea></td>'+
	        '</tr>'+
	        '<tr>'+
	        '<input type="hidden" name="id" value="'+allnews.id+'">'+
	        '</tr>'+
		    '</table><input type="submit" value="送出修改" style="margin-left:180px; '+
		    'background-color: pink;border: none;border-radius: 5px" onclick="ok()"></form>';
	}


		$(document).ready(function() {
			var table = $('#example').DataTable({
				data:${allnews},
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
						className: 'newsid'
				}, {
					"data" : "title"
				},  {
					"data" : "time"
				},  {
			          data: null,
			          defaultContent:
			                  '<button type="submit" class="btn btn-lightt details-control" data-toggle="modal" data-target="#EditModal" data-whatever="@mdo">' +
			                  '<i class="fas fa-solid fa-pen"></i>' +
			                  '</button>',
			          className: 'row-edit dt-center',
			          orderable: false,
			          responsivePriority: 6
			        },    {
			            data: null,
			            defaultContent:
			                    '<button type="submit" class="btn btn-light row-remove" data-toggle="modal" data-target="#RemoveModal" >' +
			                    '<i class="fas fa-solid fa-trash"></i>' +
			                    '</button>',
			            className: 'row-remove dt-center',
			            orderable: false,
			            responsivePriority: 6
			          }
				],
				"order" : [ [ 1, 'desc' ] ],
				fnDrawCallback: function(){
					let targetDataDelete;
					let newsId;
					let deleteRefresh;
					 $('td.row-remove').on('click', function (){
					targetDataDelete = $(this).closest("tr")[0];
					newsId =  targetDataDelete.querySelector("td.newsid").innerText.trim();
					   });
					$('.modal-footer').on('click','.btn-remove-confirm', function (){
						 $.ajax({
							 url: "${pageContext.request.contextPath}/ipet-front/news/deleteNews", 
							 method: "POST",
							 data: {"newsId" : newsId},
							 success:function(res){
								 window.location.reload();
					            }
						 })
					});
					   $('#RemoveModal').on('hidden.bs.modal', function (){
					          // clean the value
					          $("#deleteModalMessage").text("");
					          $(".btn-remove-confirm").removeAttr("disabled");
					          $(".btn-remove-confirm").removeClass("disabled");
					          if (deleteRefresh === true) {
					            window.location.reload();
					          }
					        });
				}
			});
			

			// Add event listener for opening and closing details
			$('#example tbody').on('click', 'button.btn-lightt', function() {
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
	</script>
	<script>
		$("p:contains(消息管理)").closest("li").addClass("menu-open");
		$("p:contains(最新消息列表)").closest("a").addClass("active");
	</script>
</body>
</html>
