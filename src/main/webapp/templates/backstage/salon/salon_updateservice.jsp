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

	.content-header {
	    padding: 15px 23px;
	}

	.content-wrapper > .content {
	    padding: 0 29px;
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
	
	.error {
		color: red;
		padding-left: 5px;
		font-size: 12px;
		font-weight: 700;
 		font-style: italic;
	}
	
	.errorRed {
		border: 1px solid red;
		box-shadow: 0 0 2px 1px #ffb9b9;
	}
	
	/* ======== 上下架按鈕 =========*/
	.mybtn {
  	 	display: none;
	}
	
	.mybtngroup {
		display: inline-block;
		font-size: 0px;
	}
	
	#mybtnlabel-left {
		font-size: 1rem;
		width: 150px;
	    height: 32px;
	    border-radius: 0.25rem 0 0 0.25rem;
	    border-left: 1px solid #7c7c7c;
	    border-top: 1px solid #7c7c7c;
	    border-bottom: 1px solid #7c7c7c;
	    padding: 3px;
	    text-align: center;
	}
	
	#mybtnlabel-right {
		font-size: 1rem;
		width: 150px;
	    height: 32px;
	    border-radius: 0 0.25rem 0.25rem 0;
	    border-right: 1px solid #7c7c7c;
	    border-top: 1px solid #7c7c7c;
	    border-bottom: 1px solid #7c7c7c;
	    padding: 3px;
	    text-align: center;
	}
	
	#mybtnlabel-right:hover, #mybtnlabel-left:hover, select:hover{
		cursor: pointer;
	}
	
	.labelOn {
		background-color: #dae0e5;
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
	  
	  <!-- ================== 新增時的loading畫面 ==================== -->
		<div id="mainModal">
			<div class="d-flex align-items-center">
				 <strong id="loading-text">服務修改中...</strong>
				 <div class="spinner-border ml-auto text-light" role="status" aria-hidden="true"></div>
			</div>
		</div>
	  <!-- ================== 新增時的loading畫面 end ==================== -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/ipet-back/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/ipet-back/service/allService">美容服務總覽</a></li>
								<li class="breadcrumb-item active">編輯美容服務</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			
			<!-- Main content -->
			<section class="content">
				<form method="post" id="sendUpdateForm">
				<div class="card card-secondary">
					<!-- card-body -->
						<div class="card-body">

							<input type="hidden" value="${param.svcId}" name="svcId">

							<label for="svc_category_id">服務類型</label><span class="error catError">*</span>
							<select id="svc_category_id" class="form-control custom-select" name="catId">
								<c:forEach var="catVO" items="${catlist}">
									<option value="${param.catId}"
										${(param.catId == catVO.catId) ? 'selected' : ''}>${catVO.catName} ${(catVO.catStatus == 1) ? '(未上架)' : ''}</option>
								</c:forEach>
							</select>
								<label for="svc_name" class="c3">服務名稱</label><span class="error nameError">*</span>
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
							<label for="pet_type" class="c3">寵物品種</label><span class="error typeError">*</span>
							<input type="hidden" value="${param.typeId}" name="typeId">
							<input type="text" readonly id="pet_type" class="form-control input-shadow" value="${param.typeNameAndSize}">
							
							<label for="svc_price" class="c3">服務單價</label><span class="error priceError">*</span>
							<input type="text" id="svc_price" class="form-control input-shadow" value="${param.svcPrice}" name="svcPrice">
							
							<label class="c3">服務狀態</label><span class="error statusError">*</span><br>
							<div class="mybtngroup">
					           <label id="mybtnlabel-left" for="svc-Status1" class="${(param.svcStatus == 0) ? 'labelOn' : ''}">上架</label>
					           <input type="radio" id="svc-Status1" class="mybtn" value="0" name="svcStatus" ${(param.svcStatus == 0) ? 'checked' : ''}>
					                  
					           <label id="mybtnlabel-right" for="svc-Status2" class="${(param.svcStatus == 1) ? 'labelOn' : ''}">下架</label>
					           <input type="radio" id="svc-Status2" class="mybtn" value="1" name="svcStatus" ${(param.svcStatus == 1) ? 'checked' : ''}>
							</div>
						</div>
						<!-- /.card-body -->
				</div>
				<!-- /.card -->
				<div id="before-submit">
					<input type="submit" class="service-submit" value="確認修改" id="submitUpdate" form="sendUpdateForm">
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
	
	<!-- sidebar menu Class -->
	<script>
	  $("p:contains(服務項目管理)").closest("li").addClass("menu-open");
	  $("p:contains(服務總覽)").closest("a").addClass("active");
	</script>
	
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

			/*===================== Summernote ==========================*/
			$("#summernote").summernote();

			/*===================== 上下架顏色 ==========================*/
		      
		    $(document).on("click", "#svc-Status1", function(){
		  		if($(this).prop("checked")){
		  			$("#mybtnlabel-left").addClass("labelOn");
		  			$("#mybtnlabel-right").removeClass("labelOn");
		  		}else{
		  			$("#mybtnlabel-left").removeClass("labelOn");
		  		}
		  	});
		      
		    $(document).on("click", "#svc-Status2", function(){
		  		if($(this).prop("checked")){
		  			$("#mybtnlabel-right").addClass("labelOn");
		  			$("#mybtnlabel-left").removeClass("labelOn");
		  		}else{
		  			$("#mybtnlabel-right").removeClass("labelOn");
		  		}
		  	});

			/*===================== 匯入圖片檔案時預覽 ==========================*/
			$(document).on("change", "#add-img", function (){
				$("#showImg").css("background-image", "url(" + URL.createObjectURL(event.target.files[0]) + ")");
		      });
			
			/*===================== 若警告訊息輸入紅框消失 ==========================*/
		      
		      $(document).on("change", "#svc_category_id", function (){
		      	$(this).removeClass("errorRed");
		      });
		        
		      $(document).on("change", "#svc_name", function (){
		      	$(this).removeClass("errorRed");
		      });
		      
		      $(document).on("change", "#pet_type", function (){
		      	$(this).removeClass("errorRed");
		      });
		      
		      $(document).on("change", "#svc_price", function (){
		      	$(this).removeClass("errorRed");
		      });
			
			/*===================== 送出新增資訊到後台 ==========================*/
	        $(document).on("submit", "#sendUpdateForm", function (e){
	        	 e.preventDefault();
	        	 
	        	 //清空警告訊息
	        	 $(".catError").text("*");
	        	 $(".nameError").text("*");
	        	 $(".typeError").text("*");
	        	 $(".priceError").text("*");
	        	 $(".statusError").text("*");
	        	 
	  	  	 //資料：formData
	      	 let formData = new FormData(this);
	      	 
	      	 $.ajax({
	      	        url : "${pageContext.request.contextPath}/ipet-back/service/updateService",
	      	        type : "POST",
	      	        data : formData,
	      	        cache: false,
	      	        processData: false,
	      	        contentType: false,
// 	      	        beforeSend: function(){
// 	      	        	$("#mainModal").css("display","block");
// 	      	        },
	      	        success : function(response) {
	      	        	$("#mainModal").css("display","none");
	      	        	if(!response){
	  	    	        	showSwal("success-message");
	      	        	}else {
	      	        		//顯示錯誤訊息
	  	    	        	const res = JSON.parse(response);
	  	    	        	if(res.svcStatus){
	  	    	        		$(".statusError").text("*" + res.svcStatus);
	  	    	        		window.scrollTo( 0, 800 );
	  	    	        	}
	  	    	        	if(res.svcPrice){
	  	    	        		$(".priceError").text("*" + res.svcPrice);
	  	    	        		$("#svc_price").addClass("errorRed");
	  	    	        		window.scrollTo( 0, 800 );
	  	    	        	}
	  	    	        	if(res.typeError){
	  	    	        		$(".typeError").text("*" + res.typeError);
	  	    	        		$("#pet_type").addClass("errorRed");
	  	    	        		window.scrollTo( 0, 800 );
	  	    	        	}
	  	    	        	if(res.svcName){
	  	    	        		$(".nameError").text("*" + res.svcName);
	  	    	        		$("#svc_name").addClass("errorRed");
	  	    	        		window.scrollTo( 0, 150 );
	  	    	        	}
	  	    	        	if(res.catId){
	  	    	        		$(".catError").text("*" + res.catId);
	  	    	        		$("#svc_category_id").addClass("errorRed");
	  	    	        		window.scrollTo( 0, 100 );
	  	    	        	}
	      	 				console.log(res);
	      	        	}
	      	        },error: function(response) {
	      	        	showSwal("something-Wrong");
	  					alert("something-Wrong");
	      	        }
	      	 	});
	      	});
			
			

		});
		
		
		
		
		 /*===================== 新增成功提示 ==========================*/
	    (function($) {
	    	  showSwal = function(type) {
	    	    "use strict";
	    	     if (type === "success-message") {
	    	    	 swal({
	    	    	        title: '修改成功!',
	    	    	        type: 'success',
	     	    		  	showConfirmButton: false,
	     	    		  	timer: 1500
	    	    	      }, function(){
	    	    	    	  location.replace("${pageContext.request.contextPath}/ipet-back/service/allService");
	    	    	      })
	    	    }else if (type === "something-Wrong"){
	    	    	swal({
		    	        title: "OOPS！Something's Wrong:(",
		    	        text: "請再次嘗試或聯繫客服人員協助處理",
		    	        type: 'info',
	 	    		  	showConfirmButton: true,
		    	      })
	    	    } 
	    	  }

	    	})(jQuery);
	    	    	
	</script>
</body>
</html>