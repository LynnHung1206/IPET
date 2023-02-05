<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.salonService.model.*"%>
<%@ page import="com.web.salonService.model.entities.*"%>
<%@ page import="com.web.salonService.model.services.*"%>
<%@ page import="com.web.salonService.model.dao.*"%>
<%@ page import="com.web.salonService.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

<%
CategoryService catsvc = new CategoryService();
List<Category> catlist = catsvc.selectAll();
pageContext.setAttribute("catlist", catlist);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IPET 寵物 | 美容專區 | 美容服務總覽</title>
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
	<!-- IonIcons -->
	<link rel="stylesheet"
		href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
	<!-- showsevice css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/alt/salon_showservice.css">
<style>
	/* ============ 彈出視窗-Loading =============*/
	/* 彈出視窗出現時的暗色背景 */
	#mainModal {
 		display: none; 
		position: fixed;
		z-index: 9999;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0,0,0,0.4);
		box-sizing: border-box;
	}
	
	.d-flex.align-items-center {
		margin: 20% auto;
		width: 180px;
	}
	
	#loading-text {
		color: #f8f9fa;
		font-size: 16px
	}
	
	/* ============ 修改&刪除圖示 =============*/
	.fa-pen {
		padding: 0 10px;
	}
	
	.fa-pen:hover {
		cursor: pointer;
		color: #007bff;
	}

	.fa-trash {
		padding: 0 10px;
	}
	
	.fa-trash:hover {
		cursor: pointer;
		color: #ff0000;
	}
	
</style>
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!--  Navbar -->
		<div id="Mynavbar"></div>
		<!-- /.navbar -->

		<!--  Navbar -->
	  <%@ include file="/templates/backstage/common/navbar.jsp" %>
	  <!-- /.navbar -->
	
	  <!-- 左邊選單區 Main Sidebar Container -->
	  <%@ include file="/templates/backstage/common/sidebar.jsp" %>
	  <!-- /.aside -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h3 style="margin-top: .6rem;">美容服務總覽</h3>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/ipet-back/home">Home</a></li>
								<li class="breadcrumb-item active">美容服務總覽</li>
							</ol>
						</div>
					</div>

					<!-- ================== loading畫面 ==================== -->
					<div id="mainModal">
						<div class="main-modal-content">
							<div class="d-flex align-items-center">
								 <strong id="loading-text">loading...</strong>
								 <div class="spinner-border ml-auto text-light" role="status" aria-hidden="true"></div>
							</div>
						</div>
					</div>

					<!-- ================== 彈出視窗 ==================== -->
					<!-- Trigger/Open The Modal -->
					<!-- <button id="mainBtn">修改預約</button> -->

					<!-- The Modal -->
<!-- 					<div id="mainModal"> -->
<!-- 						Modal content -->
<!-- 						<div class="main-modal-content"> -->
<!-- 							<span id="modalClose">&times;</span> -->
<!-- 							<p>一個施工中的彈出式視窗...</p> -->
<!-- 						</div> -->
<!-- 					</div> -->


				</div>
				<!-- /.container-fluid -->
			</section>
			<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">快速查詢</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse" title="Collapse">
									<i class="fas fa-plus"></i>
								</button>
							</div>
						</div>
						<!-- card-body -->
						<div class="card-body" style="display: none;">
							<form method="post" id="searchForm">
						<div class="AGrid">
							<div class="AGrid-inside">
								<div class="search-svc">
									<label for="svc-Id">服務編號：</label>
									<input type="text" placeholder="請輸入服務編號" id="svc-Id" class="form-control inline-style" name="svcId">
								</div>
								<div class="search-svc">
									<label for="svc-Name">服務名稱：</label>
									<input type="text" placeholder="請輸入服務名稱" id="svc-Name" class="form-control inline-style" name="svcName">
								</div>
								<div class="search-svc">
									<label for="cat-Id">服務類別：</label>
									<select id="cat-Id" class="form-control inline-style my-select-style" name="catId">
										<option style="display: none; color: #7c7c7c;" value="">請選擇服務類別</option>
										<c:forEach var="catVO" items="${catlist}">
											<option value="${catVO.catId}">${catVO.catName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="search-svc" style="position: relative; bottom: 8px; margin-bottom: 1px;">
									<label>價格範圍：</label>
									<input type="text" class="form-control inline-style priceBeShort" placeholder="$ 最低價" name="lowerPrice">
										<span class="drawALine">
											<p class="drawDownLine"></p>
											<p></p>
										</span>
									<input type="text" class="form-control inline-style priceBeShort" placeholder="$ 最高價" name="highestPrice">
								</div>
								<div class="search-svc">
									<label>服務狀態：</label>
									<div class="mybtngroup">
					                  <label id="mybtnlabel-left" for="svc-Status1" >上架中</label>
					                  <input type="radio" id="svc-Status1" class="mybtn" value="0" name="svcStatus">
					                  
					                  <label id="mybtnlabel-right" for="svc-Status2">未上架</label>
					                  <input type="radio" id="svc-Status2" class="mybtn" value="1" name="svcStatus">
									</div>
								</div>
							</div>
						<div class="AGrid-inside">
							<div id="choose-pet-father">
								<select id="pet-size" class="form-control custom-select">
									<option selected style="display: none;">請選擇寵物體型</option>
									<option>大型犬</option>
									<option>中型犬</option>
									<option>小型犬</option>
								</select>
								<div class="choose-type-price" id="showBigDog">
									<%
									List<PetType> listPetTypeVOs = new ArrayList<PetType>();
																			PetTypeDAOImpl petTypeDAO = new PetTypeDAOImpl();
																			listPetTypeVOs = petTypeDAO.findByPetSize("大型犬");
																			int count2 = 0;
																			for (PetType petType : listPetTypeVOs) {
																				int typeId = petType.getTypeId();
																				count2 += 1;
									%>
									<div class="pet-type">
										<input type="radio" id="pet-type<%=typeId%>" class="form-control aType" value="<%=typeId%>" name="typeId">
										<label for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
									</div>
									<%
									}
																			if (count2 == 0) {
									%>
									尚無資料
									<%
									}
									%>
								</div>
								<div class="choose-type-price cantSee" id="showMediumDog">
									<%
									List<PetType> list2 = new ArrayList<PetType>();
																			PetTypeDAOImpl petTypeDAO2 = new PetTypeDAOImpl();
																			list2 = petTypeDAO2.findByPetSize("中型犬");
																			int count3 = 0;
																			for (PetType petType : list2) {
																				int typeId = petType.getTypeId();
																				count3 += 1;
									%>
									<div class="pet-type">
										<input type="radio" id="pet-type<%=typeId%>" class="form-control aType" value="<%=typeId%>" name="typeId">
										<input type="hidden" value="<%=typeId%>"> <label
											for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
									</div>
									<%
									}
																			if (count3 == 0) {
									%>
									尚無資料
									<%
									}
									%>
								</div>
		
								<div class="choose-type-price cantSee" id="showSmallDog">
									<%
									List<PetType> list3 = new ArrayList<PetType>();
																			PetTypeDAOImpl petTypeDAO3 = new PetTypeDAOImpl();
																			list3 = petTypeDAO3.findByPetSize("小型犬");
																			int count4 = 0;
																			for (PetType petType : list3) {
																				int typeId = petType.getTypeId();
																				count4 += 1;
									%>
									<div class="pet-type">
										<input type="radio" id="pet-type<%=typeId%>" class="form-control aType" value="<%=typeId%>" name="typeId">
										<input type="hidden" value="<%=typeId%>">
										<label for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
									</div>
									<%
									}
									if (count4 == 0) {
									%>
									尚無資料
									<%
									}
									%>
								</div>
							</div>
<!-- 							<input type="submit" class="search-submit" value="查詢"> -->
							
							
						</div>
					</div>
							<div class="AGrid2">
								<input type="reset" class="search-submit clear" value="清空">
								<span></span>
								<input type="submit" class="search-submit" value="查詢">
							</div>
				</form>
					<a href="${pageContext.request.contextPath}/ipet-back/service/addService">新增資料</a>
						</div>
						<!-- /.card-body -->
			</div>
			<!-- Main content -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th style="width: 90px;">服務編號</th>
											<th>服務名稱</th>
											<th>服務類別</th>
											<th>寵物種類</th>
											<th>服務單價</th>
											<th>狀態</th>
											<th>修改</th>
											<th>刪除</th>
										</tr>
									</thead>
									<tfoot>
									</tfoot>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="/templates/backstage/common/footer.jsp" %>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE -->
	<script src="${pageContext.request.contextPath}/static/backstage/js/adminlte.js"></script>

	<!-- DataTables  & Plugins -->
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/jszip/jszip.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/pdfmake/vfs_fonts.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- Navbar script-->
	<script>
		$(function() {
			$("#Mynavbar").load("../../navbar_pages.html");
		})
	</script>

	<!-- Footer script-->
	<script>
		$(function() {
			$("#Myfooter").load("../../footer.html");
		})
	</script>
	<!-- Page specific script -->
	<script>
		$(function() {
			
			let myTable = $('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
				"ajax" : {
					"url" : "${pageContext.request.contextPath}/ipet-back/service/allService",
					"type" : "POST",
	    	        "data" : function(){
	    	        	const formData = new FormData(document.getElementById("searchForm"));
	    	        	return formData;
	    	        },
	    	        "dataSrc": "",
	    	        "cache": false,
	    	        "processData": false,
	    	        "contentType": false,
				},
				"columns" : [
		            { data: "svcId", responsivePriority: 1 },
		            { data: "svcName", responsivePriority: 2 },
		            { data: "catName", responsivePriority: 6 },
		            { data: "typeName", responsivePriority: 3 },
		            { data: "svcPrice", 
		            	render: DataTable.render.number(',', null, 0, '$ '),
		            	responsivePriority: 4 },
		            { data: "svcStatusName", responsivePriority: 7 },
		            { data: "svcId",
		            	render: function(data, type){
		            		return `
			            		<form METHOD="post" ACTION="${pageContext.request.contextPath}/ipet-back/service/editService">
									<input type="hidden" name="svcId" value=` + data + `>
									<label><i class="nav-icon fas fa-solid fa-pen"></i>
										<input type="submit" style="display: none;">
									</label>
								</form>
		            		`;
		            	},
		            	responsivePriority: 5,
		            },
		            { data: "svcId",
		            	render: function(data, type){
		            		return `
			            		<form METHOD="post" ACTION="${pageContext.request.contextPath}/ipet-back/service/editService">
									<input type="hidden" name="svcId" value=` + data + `>
									<label><i class="nav-icon fas fa-solid fa-trash"></i>
										<input type="submit" style="display: none;">
									</label>
								</form>
		            		`;
		            	},
		            	responsivePriority: 5,
		            }
		        ],
				language: {
			           "sProcessing": "查詢中...",
			           "sLengthMenu": "顯示 _MENU_ 項服務",
			           "sZeroRecords": "查無資料",
			           "sInfo": "顯示第 _START_ 到 _END_ 項服務，共 _TOTAL_ 項",
			           "sInfoEmpty": "顯示 0 到 0 項服務，共 0 項",
			           "sInfoPostFix": "",
			           "sUrl": "",
			           "sEmptyTable": "尚未新增服務",
			           "sLoadingRecords": "載入中...",
			           "sInfoThousands": ",",
			           "oPaginate": {
			               "sFirst": "第一頁",
			               "sPrevious": "上一頁",
			               "sNext": "下一頁",
			               "sLast": "最後一頁"
			           },
			     }
			});
			
			$(document).on("submit", "#searchForm", function (e){
		      	 e.preventDefault();
		    	 myTable.ajax.reload();
		    });
			
			/*===================== 彈出視窗 ==========================*/
			const mainModal = document.getElementById("mainModal");

			//點擊按鈕時打開彈出視窗
			$("#mainBtn").click(function() {
				mainModal.style.display = "block";
				document.body.style.overflow = "hidden";
			});

			//點擊叉叉(X) 或 彈出視窗外面 關閉視窗
			$("#modalClose").click(function() {
				mainModal.style.display = "none";
				document.body.style.overflow = "auto";
			});

			$(window).click(function() {
				if (event.target == mainModal) {
					mainModal.style.display = "none";
					document.body.style.overflow = "auto";
				}
			});

			/*===================== 點擊 card-header 開關 ==========================*/

			$(".card-header").click(function() {
				$(this).next().slideToggle();
				const i = $(this).find("i");
				if (i.hasClass("fa-minus")) {
					i.removeClass("fa-minus").addClass("fa-plus");
				} else if (i.hasClass("fa-plus")) {
					i.removeClass("fa-plus").addClass("fa-minus");
				}
			});

			/*===================== 點擊 大中小標籤 換犬種 ==========================*/
			$("#pet-size").change(function() {
				if ($("#pet-size :selected").text() === "大型犬") {
					$("#showBigDog").removeClass("cantSee");
					$("#showMediumDog").addClass("cantSee");
					$("#showSmallDog").addClass("cantSee");
				} else if ($("#pet-size :selected").text() === "中型犬") {
					$("#showBigDog").addClass("cantSee");
					$("#showMediumDog").removeClass("cantSee");
					$("#showSmallDog").addClass("cantSee");
				} else if ($("#pet-size :selected").text() === "小型犬") {
					$("#showBigDog").addClass("cantSee");
					$("#showMediumDog").addClass("cantSee");
					$("#showSmallDog").removeClass("cantSee");
				}
			});

			/*===================== 再次點選 radio 取消選取 ==========================*/
			const $radios = $('input[type="radio"]');

			$('input[type="radio"]').click(function(){
			    const $this = $(this);
			
			    if ($this.data('checked')) {
			        this.checked = false;
			    }
			    const $otherRadios = $radios.not($this).filter('[name="' + $this.attr('name') + '"]');
			    $otherRadios.prop('checked', false).data('checked', false);
			    $this.data('checked', this.checked);
			})
			
			$("#svc-Status1").click(function(){
				if($(this).data("checked")){
					$("#mybtnlabel-left").addClass("labelOn");
					$("#mybtnlabel-right").removeClass("labelOn");
				}else{
					$("#mybtnlabel-left").removeClass("labelOn");
				}
			});
			
			$("#svc-Status2").click(function(){
				if($(this).data("checked")){
					$("#mybtnlabel-right").addClass("labelOn");
					$("#mybtnlabel-left").removeClass("labelOn");
				}else{
					$("#mybtnlabel-right").removeClass("labelOn");
				}
			});
			
			/*===================== 清空查詢 ==========================*/
			$(".clear").click(function(){
				$("#mybtnlabel-left").removeClass("labelOn");
				$("#mybtnlabel-right").removeClass("labelOn");
			});
			
		});
	</script>
</body>

</html>