<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.web.salonService.model.*"%>
<%@ page import="com.web.salonService.model.entities.*"%>
<%@ page import="com.web.salonService.model.services.*"%>
<%@ page import="com.web.salonService.model.dao.*"%>
<%@ page import="com.web.salonService.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

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
	  
	  <!-- ================== 新增時的loading畫面 ==================== -->
		<div id="mainModal">
			<div class="d-flex align-items-center">
				 <strong id="loading-text">正在新增服務...</strong>
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
							<!-- <h3 style="margin-top: .6rem;">新增美容服務</h3> -->
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/ipet-back/home">Home</a></li>
								<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/ipet-back/service/allService">美容專區</a></li>
								<li class="breadcrumb-item active">新增美容服務</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content1 -->
			<section class="content">
				<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/ipet-back/service/addService" id="addSvcForm">
					<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">新增美容服務</h3>
							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse" title="Collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- card-body -->
						<div class="card-body">
							<label for="svc_category_id">服務類型</label> <select
								id="svc_category_id" class="form-control custom-select" required
								name="catId">
								<option selected style="display: none;">請選擇服務類型</option>
								<%
								List<Category> listcaCategoryVOs = new ArrayList<Category>();
														CategoryService categorySvc = new CategoryService();
														listcaCategoryVOs = categorySvc.selectAll();
														int count = 0;
														for (Category category : listcaCategoryVOs) {
															if (category.getCatStatus() == 0) {
																count += 1;
								%>
								<option value="<%=category.getCatId()%>"><%=category.getCatName()%></option>
								<%
								} else if (category.getCatStatus() == 1) {
								count += 1;
								%>
								<option value="<%=category.getCatId()%>"><%=category.getCatName()%>(未上架)
								</option>
								<%
								}
								if (count == 0) {
								%>
								<option disabled>尚無資料</option>
								<%
								}
								}
								%>

							</select> <label for="svc_name" class="c3">服務名稱</label> <input type="text"
								id="svc_name" class="form-control input-shadow"
								placeholder="請輸入服務名稱" required name="svcName">
							<div>
								<div class="choice-title c3">服務圖片</div>
								<label class="svc_picture_label input-shadow">
									<input type="file" id="add-img" accept="image/*" style="display: none;" name="svcImg">
									<i class="nav-icon fas fa-regular fa-image" id="aPictureImg"></i>
									<div id="showImg"></div>
								</label>
							</div>
							<div id="summernoteFather">
								<label for="summernote">服務描述</label>
								<div>
									<textarea id="summernote" name="svcContent"> </textarea>
								</div>
							</div>
							<label>是否立即上架</label><br>
							<input type="radio" id="svc_status1" value="0" name="svcStatus">
							<label for="svc_status1" class="c3" style="margin-top: 8px; margin-right: 20px;">是</label>
							<input type="radio" id="svc_status2" value="1" checked name="svcStatus">
							<label for="svc_status2" class="c3" style="margin-top: 8px;">否</label>
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
						<h3 class="card-title">瀏覽服務單價</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<label for="svc_img" style="margin-top: 8.5px;">寵物品種與價格</label> <select
							id="pet-size" class="form-control custom-select">
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
								<input type="checkbox" id="pet-type<%=typeId%>"
									class="form-control aType" value="<%=typeId%>"> <label
									for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
								<input type="hidden" value="<%=petType.getPetSize()%>">
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
								<input type="checkbox" id="pet-type<%=typeId%>"
									class="form-control aType" value="<%=typeId%>"> <label
									for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
								<input type="hidden" value="<%=petType.getPetSize()%>">
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
								<input type="checkbox" id="pet-type<%=typeId%>"
									class="form-control aType" value="<%=typeId%>"> <label
									for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
								<input type="hidden" value="<%=petType.getPetSize()%>">
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
						<div class="add-service">
							<div id="to-right">
								<span>服務單價：</span>
								<div style="position: relative; display: inline-block;">
									<span id="money-icon">$</span> <input type="number"
										id="enterPrice" class="input-shadow" min="0" max="999999999">
								</div>
								<button class="button-style blue" id="addService">新增價格</button>
							</div>
						</div>
					</div>
					<table class="view-type-price c3">
						<thead>
							<tr>
								<th>寵物體型</th>
								<th>寵物品種</th>
								<th colspan="3">服務單價</th>
							</tr>
						</thead>
						<tbody id="showList">
						</tbody>
					</table>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
				<div id="before-submit">
					<input type="submit" class="service-submit" value="新增服務"
						id="submitAll" form="addSvcForm">
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
    	/*===================== 彈出視窗 ==========================*/
		const mainModal = document.getElementById("mainModal");

		//點擊按鈕時打開彈出視窗
// 		$("#mainBtn").click(function() {
// 			mainModal.style.display = "block";
// 			document.body.style.overflow = "hidden";
// 		});
    	
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

      /*===================== 點擊 鉛筆 更改價格 ==========================*/
      let priceValue;

      $(document).on("click", ".fa-pen", function () {
        //變換成圖示+輸入框
        const td4 = $(this).parent();
        const ok = $("<button>").text("修改").addClass("button-style short ok")
        const cancel = $("<button>").text("取消").addClass("button-style short red cancel");
        priceValue = td4.prev().text();
        const updatePrice = `<input type="number" value="` + priceValue + `" min="0" max="999999999" class="updatePrice">`;
        td4.prev().html(updatePrice);
        td4.next().html(cancel);
        td4.html(ok);
      });

      // 確定修改
      $(document).on("click", ".ok", function () {
        const ok = $(this).parent();
        const uppriceNum = ok.prev().children().val();
        if(uppriceNum === "0" || uppriceNum.match(/[-]/)){
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
      $(document).on("click", ".cancel", function () {
        const cancel = $(this).parent();
        const faPen = `<i class="nav-icon fas fa-solid fa-pen"></i>`;
        const faTrash = `<i class="nav-icon fas fa-solid fa-trash"></i>`;
        const pricesubling = cancel.prev().prev();
        pricesubling.html(priceValue);
        cancel.prev().html(faPen);
        cancel.html(faTrash);
      });

      /*============== 點擊 垃圾桶 刪除價格，並回覆對應checkbox的可選狀態 ===================*/
      $(document).on("click", ".fa-trash", function () {
    	const thisPetId = $(this).parent().next().text();
    	const thisPetTypeId = $(`#pet-type` + thisPetId);
    	thisPetTypeId.attr("disabled", false);
    	thisPetTypeId.next().css("color","#212529");
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
      
	  /*===================== 點擊 新增價格按鈕 新增瀏覽服務單價 ==========================*/
	  
	  //點擊新增價格按鈕 
	  $("#addService").click(function(){
		  
		  //備用
		  // alert($("#svc_category_id").val());
		  // alert($("#svc_name").val());
		  //alert($("#add-img").files[0]);
		  // alert($("#summernote").val());
		  // alert($("#enterPrice").val());
		  
		  const enterPrice = $("#enterPrice").val();
		  const aTypeLength = $(".aType").length;
		  //判斷是否有輸入正確價格
		  if(!enterPrice){
			  alert("請輸入服務單價");
			  return;
		  }
		  if(enterPrice <= 0){
			  alert("金額不可小於等於零！");
			  return;
		  }
		  //判斷checkbox是否選取，若是，append into tbody
		  for(let i = 0; i < aTypeLength; i++){
			const aTypeNum = $(".aType").eq(i);
		  	if(aTypeNum.prop("checked")){
          	$("#showList").append(`
		      <tr class="beSentTr">
		        <td>` + aTypeNum.next().next().val() + `</td>
		        <td>` + aTypeNum.next().text() + `</td>
		        <td class="beSentPrice">` + enterPrice + `</td>
		        <td><i class="nav-icon fas fa-solid fa-pen"></i></td>
		        <td><i class="nav-icon fas fa-solid fa-trash"></i></td>
		        <td style="display: none;" class="beSentTypeId">` + aTypeNum.val() + `</td>
		      </tr>
	      	`);
          	//關閉選過的checkedbox可選狀態、清空金額輸入框
          	aTypeNum.prop("checked", false).attr("disabled", true);
          	aTypeNum.next().css("color","#9da2a6");
          	$("#enterPrice").val("");
		    }
		  }
	  });
	  
      /*===================== 匯入圖片檔案時預覽 ==========================*/
      $(document).on("change", "#add-img", function (){
    	  $("#showImg").css("background-image", "url(" + URL.createObjectURL(event.target.files[0]) + ")");
      });
      
    });
    
    
    /*===================== 送出新增資訊到後台 ==========================*/
      $(document).on("submit", "#addSvcForm", function (e){
      	 e.preventDefault();
    	
    	 //迴圈存入金額和品種物件
	  	 let priceAndTypeArray = [];
	  	 const beSentTrLength = $(".beSentTr").length;
	  	 for(let i = 0; i< beSentTrLength; i++){
	  		priceAndTypeArray.push({
	  			typeId : $(".beSentTypeId").eq(i).text(),
	  			svcPrice : $(".beSentPrice").eq(i).text()
	  		});
	  	 }
	  	 
	  	 //資料：formData
    	 let formData = new FormData(this);
    	 formData.append("typeAndPrice", JSON.stringify(priceAndTypeArray));
    	 
    	 $.ajax({
    	        url : "${pageContext.request.contextPath}/ipet-back/service/addService",
    	        type : "POST",
    	        data : formData,
    	        cache: false,
    	        processData: false,
    	        contentType: false,
    	        beforeSend: function(){
    	        	$("#mainModal").css("display","block");
    	        },
    	        success : function(response) {
    	        	$("#mainModal").css("display","none");
    	        	if(!response){
	    	        	showSwal("success-message");
    	        	}else {
	    	        	const res = JSON.parse(response);
    	 				console.log(res);
    	        	}
// 					console.log(errorMsgs);
    	        },error: function(response) {
    	        	showSwal("something-Wrong");
					alert("something-Wrong");
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