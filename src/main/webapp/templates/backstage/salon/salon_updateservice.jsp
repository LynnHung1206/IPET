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
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物 | 美容專區 | 新增服務</title>
  	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
	<!-- IonIcons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
	<!-- summernote -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/summernote/summernote-bs4.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<!-- addsevice and updateservice css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/alt/salon_addservice.css">
<style>
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
	
	/* 彈出視窗本人
	.main-modal-content {
		background-color: #fafafa;
		margin: 15% auto;
		border: 1px solid #888;
		width: 500px;
		border-radius: 0.5rem;
	} */
	
	.d-flex.align-items-center {
		margin: 20% auto;
		width: 180px;
	}
	
	#loading-text {
		color: #f8f9fa;
		font-size: 16px
	}
	
	#showImg {
		position: absolute;
		top: 0;
		width: 100px;
		height: 100px;
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	}
	
</style>
	</head>
	<body class="hold-transition sidebar-mini">
	<div class="wrapper">
	
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
							<!-- <h3 style="margin-top: .6rem;">新增美容服務</h3> -->
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/ipet-back/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/ipet-back/service/allService">美容專區</a></li>
								<li class="breadcrumb-item active">編輯美容服務</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message.value}</li>
		</c:forEach>
	</ul>
</c:if>

			<!-- Main content -->
			<section class="content">
				<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/ipet-back/service/updateService" name="form1">
				<div class="card card-secondary">
					<!-- card-body -->
						<div class="card-body">

							<input type="hidden" value="${param.svcId}" name="svcId">

							<label for="svc_category_id">服務類型</label>
							<select id="svc_category_id" class="form-control custom-select" name="catId">
								<c:forEach var="catVO" items="${catlist}">
									<option value="${param.catId}"
										${(param.catId == catVO.catId) ? 'selected' : ''}>${catVO.catName}</option>
								</c:forEach>
							</select>
								<label for="svc_name" class="c3">服務名稱</label>
								<c:if test="${not empty errorMsgs}">
									<span style="color: red;">${message.value}</span>
								</c:if>
								<input type="text" id="svc_name" class="form-control input-shadow" value="${param.svcName}" name="svcName">
								<div>
									<div class="choice-title c3">服務圖片</div>
									<label class="svc_picture_label input-shadow">
										<input type="file" id="add-img" accept="image/*" style="display: none;" name="svcImg">
										<i class="nav-icon fas fa-regular fa-image" id="aPictureImg"></i>
										<div id="showImg" style="background-image: url(${pageContext.request.contextPath}/ipet-back/service/showOldSvcImg?svcId=${param.svcId}"></div>
									</label>	
								</div>
								<div id="summernoteFather">
									<label for="svc_img">服務描述</label>
										<div>
											<textarea id="summernote" name="svcContent">${param.svcContent}</textarea>
										</div>
								</div>
							<label for="pet_type" class="c3">寵物品種</label>
							<input type="hidden" value="${param.typeId}" name="typeId">
							<input type="text" readonly id="pet_type" class="form-control input-shadow" value="${param.typeNameAndSize}">
							
							<label for="svc_price" class="c3">服務單價</label>
							<input type="text" id="svc_price" class="form-control input-shadow" value="${param.svcPrice}" name="svcPrice">
							
							<input type="radio" id="svc_status1" value="0" ${(param.svcStatus == 0) ? 'checked' : ''} name="svcStatus">
							<label for="svc_status1" class="c3">上架</label>

							<input type="radio" id="svc_status2" value="1" ${(param.svcStatus == 1) ? 'checked' : ''} name="svcStatus">
							<label for="svc_status2" class="c3">未上架</label>
						</div>
						<!-- /.card-body -->
				</div>
				<!-- /.card -->
				<div id="before-submit">
					<input type="submit" class="service-submit" value="確認修改" id="submit">
				</div>
				
				</form>
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
		$(function() {
			$("#Myfooter").load("../../footer.html");
		})
	</script>
	<!-- Page specific script -->
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
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

			/*===================== 點擊 鉛筆 更改價格 ==========================*/
			let priceValue;

			$(document)
					.on(
							"click",
							".fa-pen",
							function() {
								//變換成圖示+輸入框
								const td4 = $(this).parent();
								const ok = $("<button>").text("修改").addClass(
										"button-style short ok")
								const cancel = $("<button>")
										.text("取消")
										.addClass(
												"button-style short red cancel");
								priceValue = td4.prev().text();
								const updatePrice = `<input type="number" value="${priceValue}" min="0" max="999999999" class="updatePrice">`;
								td4.prev().html(updatePrice);
								td4.next().html(cancel);
								td4.html(ok);
							});

			// 確定修改
			$(document)
					.on(
							"click",
							".ok",
							function() {
								const ok = $(this).parent();
								const uppriceNum = ok.prev().children().val();
								if (uppriceNum === "0"
										|| uppriceNum.match(/[-]/)) {
									alert("服務價格不可小於或等於0！");
									return;
								}
								const faPen = `<i class="nav-icon fas fa-solid fa-pen"></i>`;
								const faTrash = `<i class="nav-icon fas fa-solid fa-trash"></i>`;
								ok.prev().html(uppriceNum);
								ok.next().html(faTrash);
								ok.html(faPen);
							});

			//取消修改
			$(document)
					.on(
							"click",
							".cancel",
							function() {
								const cancel = $(this).parent();
								const faPen = `<i class="nav-icon fas fa-solid fa-pen"></i>`;
								const faTrash = `<i class="nav-icon fas fa-solid fa-trash"></i>`;
								const pricesubling = cancel.prev().prev();
								pricesubling.html(priceValue);
								cancel.prev().html(faPen);
								cancel.html(faTrash);
							});

			/*===================== 點擊 垃圾桶 刪除價格 ==========================*/
			$(document).on("click", ".fa-trash", function() {
				$(this).parentsUntil("tbody").remove();
			});

			/*===================== Summernote ==========================*/
			$("#summernote").summernote();

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

			/*===================== 點擊  ==========================*/
			$("#addService").click(function() {
				// 		  alert($("#svc_category_id").val());
				// 		  alert($("#svc_name").val());
				// 		  alert($("#add-img").files[0]);
				// 		  alert($("#summernote").val());
				// 		  alert($("#enterPrice").val());
				// 		  alert($(".aType").val());
				const aTypeLength = $(".aType").length;
				for (let i = 0; i < aTypeLength; i++) {
					const aTypeNum = $(".aType").eq(i);
					if (aTypeNum.prop("checked")) {
						alert(aTypeNum.val());
					}
				}
			});
			
			/*===================== 匯入圖片檔案時預覽 ==========================*/
			$(document).on("change", "#add-img", function (){
				$("#showImg").css("background-image", "url(" + URL.createObjectURL(event.target.files[0]) + ")");
		      });

		});
	</script>
</body>
</html>