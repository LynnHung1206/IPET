<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.salonSale.model.*"%>
<%@ page import="com.web.salonSale.model.entities.*"%>
<%@ page import="com.web.salonSale.model.services.*"%>
<%@ page import="com.web.salonSale.model.dao.*"%>
<%@ page import="com.web.salonSale.model.dao.impl.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物 | 美容專區 | 優惠總覽</title>
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
/* ================== 預約導覽列 ====================*/
    .card-header {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      padding: 0;

    }

    .card-change {
      text-align: center;
      padding-top: 12px;
      padding-bottom: 12px;
      border: 0;
      background-color: rgb(230, 230, 230, 0);
    }

    .card-change:first-child {
      border-radius: 0.25rem 0 0 0;
    }

    .card-change:last-child {
      border-radius: 0 0.25rem 0 0;
    }

    .card-change:hover {
      cursor: pointer;
      background-color: rgb(230, 230, 230);
    }

    .card-change.on {
      background-color: #007bff;
      color: aliceblue;
      /* border-bottom: 3px solid #007bff; */
    }

    /* ================== 彈出視窗 ====================*/
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
      background-color: rgb(0, 0, 0);
      background-color: rgba(0, 0, 0, 0.4);
    }

    /* 彈出視窗本人 */
    .main-modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
    }

    /* 叉叉(X) */
    #modalClose {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      text-align: right;
    }

    #modalClose:hover,
    #modalClose:focus {
      color: black;
      text-decoration: none;
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
	  
	  <!-- ================== 彈出視窗 ==================== -->
		<div id="mainModal">
			<div class="main-modal-content">
				<div class="d-flex align-items-center">
					 <strong id="loading-text">正在新增服務...</strong>
					 <div class="spinner-border ml-auto text-light" role="status" aria-hidden="true"></div>
				</div>
			</div>
		</div>
	  <!-- ================== 彈出視窗 end ==================== -->
	  
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

<c:if test="${not empty errorMsgs}">
	<!-- 	<font style="color:red">請修正以下錯誤:</font> -->
	<c:forEach var="message" items="${errorMsgs}">
		<div style="color: red">${message.value}</div>
	</c:forEach>
</c:if>

	<a href="${pageContext.request.contextPath}/ipet-back/service/addService">新增資料</a>
	  <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <form class="card-header">
                  <input type="submit" class="card-change on" value="優惠總覽" id="apm">
                  <input type="submit" class="card-change" value="優惠中" id="apm0">
                  <input type="submit" class="card-change" value="未開始" id="apm1">
                  <input type="submit" class="card-change" value="已完成" id="apm2">
                </form>
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>編號</th>
                        <th>優惠名稱</th>
                        <th>優惠開始時間</th>
                        <th>優惠結束時間</th>
                        <th>狀態</th>
                        <th>修改</th>
                        <th>刪除</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    <%
					SaleService saleSvc = new SaleService();
					List<Sale> saleList = saleSvc.selectAll();
					pageContext.setAttribute("saleList", saleList);
					
					long now = System.currentTimeMillis();
					
					for(Sale sale : saleList){
							String endTimeStr = sale.getEndTime().toString();
							int endSpaceStr = endTimeStr.indexOf(" ") + 1;
							String endDate = endTimeStr.substring(0, endSpaceStr);
							String endTime = endTimeStr.substring(endSpaceStr, endTimeStr.indexOf("."));
							
							String startTimeStr = sale.getStartTime().toString();
							int startSpaceStr = startTimeStr.indexOf(" ") + 1;
							String startDate = startTimeStr.substring(0, startSpaceStr);
							String startTime = startTimeStr.substring(startSpaceStr, startTimeStr.indexOf("."));
					%>
					</tr>
					  <td><%=sale.getSaleId() %></td>
					  <td><%=sale.getSaleName() %><div style="font-size: 10px; margin-top: 10px;"><%=sale.getSalContent() %></div></td>
					  <td><div><%=startDate %></div><div><%=startTime %></div></td>
					  <td><div><%=endDate %></div><div><%=endTime %></div></td>
					<%
						if(sale.getEndTime().getTime() < now){
					%><td>已結束</td><%
						}else if(sale.getStartTime().getTime() < now && sale.getEndTime().getTime() > now){
					%><td>優惠中</td><%
						}else if(sale.getStartTime().getTime() > now){
					%><td>未開始</td><%
						}%>
					  <td>
						<!--	<i class="nav-icon fas fa-solid fa-pen"></i> -->
								<form METHOD="post" ACTION="${pageContext.request.contextPath}/ipet-back/service/editService" style="margin-bottom: 0px;">
									<input type="submit" value="修改">
									<input type="hidden" name="saleId" value="${saleVO.saleId}">				
								</form>
							</td>
							<td>
								<form METHOD="post" ACTION="${pageContext.request.contextPath}/ipet-back/service/deleteService" style="margin-bottom: 0px;">
									<input type="submit" value="刪除">
									<input type="hidden" name="saleId" value="${saleVO.saleId}">				
								</form>
							</td>
						</tr>
					<%
					}%>
                    </tbody>
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
    	
    	$('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
          });
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
	  	 
    	 let formData = new FormData(form);
    	 formData.append("typeAndPrice", JSON.stringify(priceAndTypeArray));
    	 
    	 $.ajax({
    	        url:"${pageContext.request.contextPath}/ipet-back/service/addService",
    	        type : "POST",
    	        data : formData,
    	        cache: false,
    	        processData: false,
    	        contentType: false,
    	        success : function(data) {
    	        	showSwal("success-message");
    	        },error: function(data) {
    	        	showSwal("something-Wrong");
    	        }
    	    })
    });
    
//    	 for(item of formData){
//    		 console.log(item[0], item[1], item[3], item[4]);
//    	 }
    
      /*===================== 新增成功提示 ==========================*/
    (function($) {
    	  showSwal = function(type) {
    	    "use strict";
    	     if (type === "success-message") {
    	    	 swal({
    	    	        title: '新增成功!',
    	    	        type: 'success',
     	    		  	showConfirmButton: false,
     	    		  	timer: 2000
    	    	      }, function(){
    	    	    	  location.replace("${pageContext.request.contextPath}/ipet-back/service/allService");
    	    	      })
    	    }else if (type === "something-Wrong"){
    	    	swal({
	    	        title: "OOPS！送出失敗:(",
	    	        text: "請重新嘗試或聯繫客服人員協助處理",
	    	        type: 'question',
 	    		  	showConfirmButton: true,
	    	      })
    	    } 
    	  }

    	})(jQuery);
    	    	
  </script>
</body>
</html>