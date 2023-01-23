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
  <title>IPET 寵物 | 美容專區 | 新增優惠</title>
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
	<!-- daterange picker -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/daterangepicker/daterangepicker.css">
	<!-- addsevice and updateservice css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/alt/salon_addservice.css">
<style>
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
		border-radius: 0.25rem;
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
	  	<div id="addSaleBox">
			<div class="main-modal-content">
				<i class="nav-icon fas fa-sharp fa-solid fa-times" id="modalClose"></i>
				<p>一個施工中的彈出式視窗...</p>
			</div>
		</div>
	  

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
								<li class="breadcrumb-item active">新增美容優惠</li>
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
								<label for="svc_category_id">優惠名稱</label>
								<input type="text" id="svc_name" class="form-control input-shadow"
									placeholder="請輸入優惠名稱" required name="svcName">
							</div>
							<div class="toInline toInline-right">
								<label for="saleTime" style="margin-top: 10px;">優惠時間</label>
								<div class="input-group">
				                    <div class="input-group-prepend">
				                      <span class="input-group-text"><i class="far fa-clock"></i></span>
				                    </div>
				                    <input type="text" class="form-control float-right" 
				                    	id="reservationtime" placeholder="請選擇優惠時間">
				                </div>
			                </div>
							<div id="summernoteFather">
								<label for="summernote">優惠描述</label>
								<div>
									<textarea id="summernote" name="svcContent" required> </textarea>
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
						
					</div>
					
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
    	
    	/*===================== 彈出視窗 ==========================*/
		const addSaleBox = document.getElementById("addSaleBox");

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
	  	 let priceAndTypeArray = [];
	  	 const beSentTrLength = $(".beSentTr").length;
	  	 for(let i = 0; i< beSentTrLength; i++){
	  		priceAndTypeArray.push({
	  			typeId : $(".beSentTypeId").eq(i).text(),
	  			svcPrice : $(".beSentPrice").eq(i).text()
	  		});
	  	 }
	  	 
	  	 //資料：formData
    	 let formData = new FormData(form);
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
    	    	    	  location.replace("${pageContext.request.contextPath}/ipet-back/service/allService");
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