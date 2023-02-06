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
ServiceService svcsvc = new ServiceService();
List<Service> svclist = svcsvc.selectAll();
pageContext.setAttribute("svclist", svclist);
%>

<%
CategoryService catsvc = new CategoryService();
List<Category> catlist = catsvc.selectAll();
pageContext.setAttribute("catlist", catlist);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物 | 美容專區 | 新增優惠</title>
  	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
	<!-- IonIcons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<!-- daterange picker -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/daterangepicker/daterangepicker.css">

<style>

	.cantSee {
		display: none !important;
	}
	
	.input-shadow {
		box-shadow: inset 0 1px 2px rgb(0 0 0/ 8%);
	}
	
	.c3 {
		margin-top: 1.25rem;
	}
	
	.choice-title {
		font-weight: 700;
	/* 	display: inline-block; */
		margin-bottom: 0.5rem;
		box-sizing: border-box;
	}
	
	#second-card {
		margin-top: 28px;
	}
	
	hr {
		margin-top: 25px;
		margin-bottom: 20px;
		border: 2px solid #6c757d;
	}
	
	.button-style {
		height: 30px;
		width: 120px;
		border: 1px solid #ced4da;
		border-radius: 0.25rem;
		margin-left: 0.25rem;
	}
	
	.button-style:hover {
		border: 1px solid #9b9b9b;
	}
	
	.button-style:active {
		background-color: #cccccc;
		border: 1px solid #bdbdbd;
	}
	
	/* ================== table區 ==================*/
	.view-type-price {
		width: 96%;
		margin: 19px;
	}
	
	.view-type-price td, th {
		border: 1px solid #efefef;
		padding: 12.75px;
	}
	
	.view-type-price thead {
		background-color: #e7e9eb;
	}
	
	.view-type-price thead th {
		border-right: 1px solid rgb(209, 211, 212);
	}
	
	.view-type-price tbody tr:hover {
		background-color: #f3f5f6;
	}
	
	.fa-trash {
		padding: 0 10px;
	}
	
	.fa-trash:hover {
		cursor: pointer;
		color: #ff0000;
	}
	
	.beSentSalePrice {
		text-align: center;
		padding-left: 20px;
	}
	
	#money-icon {
		position: absolute;
		left: 10px;
		top: 1px;
		color: #585858;
	}

		/* ================== summernote區 ==================*/
	.note-codable, .card-block {
		min-height: 170px;
		padding: 20px !important;
	}
	
	.note-editor.note-frame.card {
		box-shadow: none;
	}
	
	.note-toolbar.card-header {
		box-shadow: inset 0 1px 2px rgb(0 0 0/ 8%);
	}
	
	.note-toolbar.card-header, .note-resizebar {
		background-color: #f3f5f6;
		padding: 6px 10px 10px 10px;
	}
	
	.note-btn-group.btn-group.note-insert {
		display: none;
	}
	
	/* ================== 新增服務 按鈕 ==================*/
	#before-submit {
		height: 100px;
	}
	
	.service-submit {
		height: 55px;
		border: 1px solid #ced4da;
		border-radius: 0.25rem;
		margin-top: 10px;
		width: 100%;
		background-color: #007bff;
		color: white;
		font-weight: 700;
	}
	
	.service-submit:active {
		transform: scale(0.995);
	}
	
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
		overflow: auto;
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
	
	/* ======================== 優惠表單 ==========================*/

	.toInline {
		display: inline-block;
		width: 48%;
	}
	
	.toInline.toInline-right {
		margin-left: 25px;
	}
	
	#summernoteFather {
		margin-top: 25px;
	}
	
	/* ================== 日曆樣式 ==================*/
	.daterangepicker {
    	padding: 0 10px 0 0;
	}
	
	.daterangepicker .drp-calendar.right {
	    border-left: 1px solid #dfdfdf;
	}
	
	.daterangepicker .drp-calendar.left {
    	margin-right: 15px !important;
	}
	
	.daterangepicker th.month {
	    padding: 7px;
	}
	
	.next.available, th.prev.available{
		padding: 7px;
	}
	
	.form-control.float-right {
	    text-align: center;
    	letter-spacing: 1px;
	}
	
	/* ============ 彈出視窗-優惠選擇服務 =============*/
	#addSaleBox {
 		display: none; 
		position: fixed;
		z-index: 9998;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0,0,0,0.4);
		box-sizing: border-box;
	}
	
	/* 	 彈出視窗本人 */
	.main-modal-content {
		background-color: #fafafa;
		margin: 3% auto;
		border: 1px solid #888;
		width: 1000px;
		height: 87%;
	}
	
	/* 	叉叉 */
	#modalClose {
		float: right;
	    font-size: 22px;
	    padding: 5px;
	    margin: 15px 25px;
	    color: #939393;
	}
	
	#modalClose:hover {
		cursor: pointer;
	}
</style>
	<!-- summernote -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/summernote/summernote-bs4.min.css">
	</head>
	<body class="hold-transition sidebar-mini">
	<div class="wrapper">
	
	  <!--  Navbar -->
	  <%@ include file="/templates/backstage/common/navbar.jsp" %>
	  <!-- /.navbar -->
	
	  <!-- 左邊選單區 Main Sidebar Container -->
	  <%@ include file="/templates/backstage/common/sidebar.jsp" %>
	  <!-- /.aside -->
	  
	  <!-- ================== 新增時的loading畫面 ==================== -->
		<div id="mainModal">
			<div class="main-modal-content">
				<div class="d-flex align-items-center">
					 <strong id="loading-text">正在新增服務...</strong>
					 <div class="spinner-border ml-auto text-light" role="status" aria-hidden="true"></div>
				</div>
			</div>
		</div>
	  <!-- ====================== 彈出視窗 ========================= -->
	  	<div id="addSaleBox" style="overflow-y: hidden;">
			<div class="main-modal-content" style="overflow-y: scroll;">
				<i class="nav-icon fas fa-sharp fa-solid fa-times" id="modalClose"></i>
				
		<!-- 快速查詢 -->
				<div style="padding: 35px;">
				<div style="border-radius: 0.25rem; margin: 20px 0;">
						<!-- card-body -->
						<div class="card-body" style="display: none;">
						</div>
							<input type="text" id="searchSvc" placeholder="快速查詢..." style="border: 1px solid #d2d2d2; width: 100%; height: 40px; padding-left: 10px;">
				</div>
						<!-- /.card-body -->
				
			<!-- datatable -->	
					<table id="example2" class="table table-bordered table-hover">
						<thead style="background-color: #6c757d; color: white;">
							<tr>
								<th></th>
								<th style="width: 90px;">服務編號</th>
								<th>服務名稱</th>
								<th>服務類別</th>
								<th>寵物種類</th>
								<th>服務單價</th>
								<th>狀態</th>
							</tr>
						</thead>
						<tfoot>
						</tfoot>
					</table>
					<input type="button" class="service-submit" value="新增服務" id="submitAll">
				</div>
			</div>
		</div>
	  <!-- ====================== /彈出視窗 ========================= -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<!-- <h3 style="margin-top: .6rem;">新增美容服務</h3> -->
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/ipet-back/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/ipet-back/salonSale/allSale">優惠管理</a></li>
								<li class="breadcrumb-item active">新增美容優惠</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content1 -->
			<section class="content">
				<form method="post" enctype="multipart/form-data" id="addSvcForm" action="${pageContext.request.contextPath}/ipet-back/salonSale/addSale">
					<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">新增美容優惠</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse" title="Collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- card-body -->
						<div class="card-body">
							<div class="toInline">
								<label for="saleName">優惠名稱</label>
								<input type="text" id="saleName" class="form-control input-shadow"
									placeholder="請輸入優惠名稱" required name="saleName">
							</div>
							<div class="toInline toInline-right">
								<label for="saleTime" style="margin-top: 10px;">優惠時間</label>
								<div class="input-group">
				                    <div class="input-group-prepend">
				                      <span class="input-group-text"><i class="far fa-clock"></i></span>
				                    </div>
				                    <input type="text" class="form-control float-right" 
				                    	id="reservationtime" placeholder="請選擇優惠時間" name="saleTime">
				                </div>
			                </div>
							<div id="summernoteFather">
								<label for="summernote">優惠描述</label>
								<div>
									<textarea id="summernote" name="saleContent"></textarea>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
				</div>
			</form>
			</section>
			<!-- /.content1 -->

			<!-- Main content2 -->
			<section class="content">
				<div class="card card-secondary n2" id="second-card">
					<div class="card-header">
						<h3 class="card-title">優惠服務</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<button id="addSaleBtn" class="button-style" style="color: #4a4747; border-color: #4a4747;"><i class="fas fa-thin fa-plus" style="margin-right: 5px;"></i>
						<span style="font-weight: 700;">新增服務</span></button>
						
						<table class="view-type-price c3">
						<thead>
							<tr>
								<th>服務編號</th>
								<th>服務名稱</th>
								<th>服務類別</th>
								<th>寵物種類</th>
								<th>服務單價</th>
								<th>優惠價</th>
								<th>折扣</th>
								<th>刪除</th>
							</tr>
						</thead>
						<tbody id="showList">
						</tbody>
					</table>
					</div>
			
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
				<div id="before-submit">
					<input type="submit" class="service-submit" value="新增優惠" form="addSvcForm">
				</div>
			</section>
		</div>
		<!-- /.content1 -->
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
	<!-- date-range-picker -->
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/moment/moment.min.js"></script>
  	<script src="${pageContext.request.contextPath}/static/backstage/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Summernote -->
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- Navbar script-->
	<script>
    $(function () {
      $("#Mynavbar").load("../../navbar_pages.html");
    })
  </script>

	<!-- Footer script-->
	<script>
    $(function () {
      $("#Myfooter").load("../../footer.html");
    })
  </script>
	<!-- Page specific script -->
	<script>
	
    $(function () {
    	
    	const datatable = $('#example2').DataTable({
    		"dom": "tp",
            "paging": false,
            "pageLength": 5,
            "lengthChange": false,
            "ordering": true,
            "autoWidth": false,
            "responsive": true,
            "data": ${services},
			"columns" : [
				{ data: "svcId",
					render: function(data, type){
	            		return `<input type="checkbox" id="svcId` + data + `"class="chooseSvcId" style="width: 20px; height: 20px;" value=` + data + `>`;
	            	},
	            },
	            { data: "svcId", responsivePriority: 1 },
	            { data: "svcName", responsivePriority: 2 },
	            { data: "catName", responsivePriority: 6 },
	            { data: "typeName", responsivePriority: 3 },
	            { data: "svcPrice", 
	            	render: DataTable.render.number(',', null, 0, '$ '),
	            	responsivePriority: 4 },
	            { data: "svcStatusName", responsivePriority: 7 },
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
    	
    	/*===================== 查詢 ==========================*/
    	$("#searchSvc").on("keyup click", function(){
    		datatable.search($(this).val()).draw();
    	});
    	
    	//Date range picker with time picker => 使用手冊 https://www.daterangepicker.com/
        $('#reservationtime').daterangepicker({
          timePicker: true,
          timePickerIncrement: 1,
          timePickerSeconds: true,
          timePicker24Hour: true,
          minDate: moment().add(0.5, 'hours'),
          "opens": "left",
          "locale": {
            "format": "YYYY/MM/DD hh:mm:ss",
            "separator": " - ",
            "applyLabel": "選擇",
            "cancelLabel": "取消",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": [
              "日",
              "一",
              "二",
              "三",
              "四",
              "五",
              "六"
            ],
            "monthNames": [
              "一月",
              "二月",
              "三月",
              "四月",
              "五月",
              "六月",
              "七月",
              "八月",
              "九月",
              "十月",
              "十一月",
              "十二月"
            ],
            "firstDay": 1
          }
        });
    	
        /*===================== 清空查詢 ==========================*/
		$(document).on("click", ".clear", function(){
			$("#searchForm").submit();
			$("#mybtnlabel-left").removeClass("labelOn");
			$("#mybtnlabel-right").removeClass("labelOn");
		});
        
    	/*===================== 彈出視窗 ==========================*/

		//點擊按鈕時打開彈出視窗
		$("#addSaleBtn").click(function() {
			addSaleBox.style.display = "block";
			document.body.style.overflow = "hidden";
		});
		
		//點擊叉叉(X) 或 彈出視窗外面 關閉視窗
		$("#modalClose").click(function() {
			addSaleBox.style.display = "none";
			document.body.style.overflow = "auto";
		});

		$(window).click(function() {
			if (event.target == addSaleBox) {
				addSaleBox.style.display = "none";
				document.body.style.overflow = "auto";
			}
		});
    	
      /*===================== 點擊 card-header 開關 ==========================*/

      $(".card-header").click(function () {
        $(this).next().slideToggle();
        const i = $(this).find("i");
        if (i.hasClass("fa-minus")) {
          i.removeClass("fa-minus").addClass("fa-plus");
        } else if (i.hasClass("fa-plus")) {
          i.removeClass("fa-plus").addClass("fa-minus");
        }
      });


      /*============== 點擊 垃圾桶 刪除價格，並回覆對應checkbox的可選狀態 ===================*/
      $(document).on("click", ".fa-trash", function () {
    	const thisId = $(this).next().text();
    	const thisSvcId = $(`#svcId` + thisId);
    	thisSvcId.attr("disabled", false);
        $(this).parentsUntil("tbody").remove();
      });

      /*===================== Summernote ==========================*/
      $("#summernote").summernote();
      
      /*===================== 點擊 大中小標籤 換犬種 ==========================*/
	  $("#pet-size").change(function () {
	        if($("#pet-size :selected").text() === "大型犬"){
	        	$("#showBigDog").removeClass("cantSee");
	        	$("#showMediumDog").addClass("cantSee");
	        	$("#showSmallDog").addClass("cantSee");
	        }else if($("#pet-size :selected").text() === "中型犬"){
	        	$("#showBigDog").addClass("cantSee");
	        	$("#showMediumDog").removeClass("cantSee");
	        	$("#showSmallDog").addClass("cantSee");
	        }else if($("#pet-size :selected").text() === "小型犬"){
	        	$("#showBigDog").addClass("cantSee");
	        	$("#showMediumDog").addClass("cantSee");
	        	$("#showSmallDog").removeClass("cantSee");
	        }
	  });
      
	  /*===================== 計算金額 ==========================*/
	    
	    $(document).on("keyup click", ".saleCount", function (){
	    	const input = $(this).parent().prev().find(".beSentSalePrice");
	    	const svcSrice = $(this).parent().prev().prev().text();
	    	
	    	//轉換成數字
	    	const noDot = svcSrice.replace(",","");
	    	const spaceStr = noDot.indexOf(" ");
	    	const svcPriceNum = noDot.substring(spaceStr + 1);
	    	
	    	const svcSalePrice = $(this).val() * 0.1 * svcPriceNum;
	    	input.val(Math.floor(svcSalePrice));
	    });
	  
	    $(document).on("keyup click", ".beSentSalePrice", function (){
	    	const thisValue = $(this).val();
	    	const svcSrice = $(this).parent().parent().prev().text();
	    	
	    	//轉換成數字
	    	const noDot = svcSrice.replace(",","");
	    	const spaceStr = noDot.indexOf(" ");
	    	const svcPriceNum = noDot.substring(spaceStr + 1);
	    	
	    	const finalPrice = thisValue / svcPriceNum * 10
	    	
	    	const svcSalePrice = finalPrice.toFixed(2);
	    	
	    	$(this).parent().parent().next().children().val(svcSalePrice);
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
		
	  /*===================== 點擊 新增服務按鈕 新增優惠服務 ==========================*/
	  
	  //點擊新增價格按鈕 
	  $("#submitAll").click(function(){
		  addSaleBox.style.display = "none";
		  document.body.style.overflow = "auto";
		  const svcId = $(".chooseSvcId").length;
		  
		  //判斷checkbox是否選取，若是，append into tbody
		  for(let i = 0; i < svcId; i++){
			const svcIdNum = $(".chooseSvcId").eq(i).parent();
		  	if(svcIdNum.children().prop("checked")){
          	$("#showList").append(`
		      <tr class="beSentTr">
		        <td class="beSentSvcId">` + svcIdNum.next().text() + `</td>
		        <td>` + svcIdNum.next().next().text() + `</td>
		        <td>` + svcIdNum.next().next().next().text() + `</td>
		        <td>` + svcIdNum.next().next().next().next().text() + `</td>
		        <td>` + svcIdNum.next().next().next().next().next().text() + `</td>
		        <td>
		        	<div style="position: relative; display: inline-block;">
						<span id="money-icon">$</span>
						<input type="number" class="beSentSalePrice" min="0" max="999999999" required>
					</div>
				</td>
		        <td>
					<input type="number" class="saleCount" min="0" max="10">
				</td>
				<td>
				<i class="nav-icon fas fa-solid fa-trash"></i>
				<div style="display: none;">` + svcIdNum.next().text() + `</div>
				</td>
		      </tr>
	      	`);
          	//關閉選過的checkedbox可選狀態、清空金額輸入框
          	svcIdNum.children().prop("checked", false).attr("disabled", true);
		    }
		  }
	  });
	  
	  /*===================== 點擊 新增服務按鈕 新增單項服務 ==========================*/
//       $("#submitAll").click(function(){
//     	  const addListLength = $(".addList").length;
//     	  let str = "[";
//     	  for(let i = 0; i < addListLength; i++){
//     		  const addList = $(".addList").eq(i).text();
//     		  if(i === (addListLength - 1)){
//     			  str += addList;
//     		  }else{
//     		  str += addList + ",";
//     		  }
//     	  }
//     	  str += "]";
//     	  $("#allTypeAndPrice").val(str);
//       });
	  
      /*===================== 匯入圖片檔案時預覽 ==========================*/
      $(document).on("change", "#add-img", function (){
          $("#showImg").attr("src", URL.createObjectURL(event.target.files[0]));
      });
      
    });
    
    
    /*===================== 送出新增資訊到後台 ==========================*/
    const form = document.querySelector("#addSvcForm");
    
    form.addEventListener("submit", (e) =>{
    	e.preventDefault();
    	
    	//迴圈存入金額和品種物件
	  	 let svcAndSalePrice = [];
	  	 const beSentTrLength = $(".beSentTr").length;
	  	 for(let i = 0; i< beSentTrLength; i++){
	  		svcAndSalePrice.push({
	  			svcId : $(".beSentSvcId").eq(i).text(),
	  			salePrice : $(".beSentSalePrice").eq(i).text()
	  		});
	  	 }
	  	 
	  	 //資料：formData
    	 let formData = new FormData(form);
    	 formData.append("svcAndSalePrice", JSON.stringify(svcAndSalePrice));
    	 
    	 $.ajax({
    	        url : "${pageContext.request.contextPath}/ipet-back/salonSale/addSale",
    	        type : "POST",
    	        data : formData,
    	        cache: false,
    	        processData: false,
    	        contentType: false,
    	        beforeSend: function(){
    	        	$("#mainModal").css("display","block");
    	        },
    	        success : function(data) {
    	        	$("#mainModal").css("display","none");
    	        	showSwal("success-message");
    	        },error: function(data) {
    	        	showSwal("something-Wrong");
    	        }
    	    })
    });
    
    
      /*===================== 新增成功提示 ==========================*/
    (function($) {
    	  showSwal = function(type) {
    	    "use strict";
    	     if (type === "success-message") {
    	    	 swal({
    	    	        title: '新增成功!',
    	    	        type: 'success',
     	    		  	showConfirmButton: false,
     	    		  	timer: 1500
    	    	      }, function(){
//     	    	    	  location.replace("${pageContext.request.contextPath}/ipet-back/salonSale/allSale");
    	    	      })
    	    }else if (type === "something-Wrong"){
    	    	swal({
	    	        title: "OOPS！Something's Wrong:(",
	    	        text: "請再次嘗試或聯繫客服人員協助處理",
	    	        type: 'question',
 	    		  	showConfirmButton: true,
	    	      })
    	    } 
    	  }

    	})(jQuery);
    	    	
    
  </script>
</body>
</html>