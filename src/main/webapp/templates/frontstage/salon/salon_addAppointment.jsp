<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.job.model.*"%>
<%@ page import="com.web.job.model.entities.*"%>
<%@ page import="com.web.job.model.services.*"%>
<%@ page import="com.web.job.model.services.imp.*"%>
<%@ page import="com.web.job.model.dao.*"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>美容預約 | IPET寵物商城</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png">

    <!-- all css here -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css">
    <!-- salon add appointment css -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/salonAddAppointment.css"> --%>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
    
    <!-- sweetalert -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
    <style>
    	.cantSee {
			display: none !important;
		}
		
    	.cantSee2 {
			display: none !important;
		}
    
    	.table td {
		    padding: 0.75rem 0;
		    }
    	
    	.col-9.noPadding{
    		padding: 0 5px 0 5px;
    		position: relative;
	        top: 10px;
    	}
    
    	.col-12.middle span.choicePrice{
	        display: inline-block;
	        text-align: center;
	        letter-spacing: 0px;
	        position: relative;
	        bottom: 10px;
	    } 
	    
	    .col-12.middle span.svcBlock-salePrice{
	        display: inline-block;
	        text-align: center;
	        letter-spacing: 0px;
	        position: relative;
	        bottom: 7px;
	        width: auto;
	    } 
	    
	    .choiceContent {
	    	margin-top: 10px;
	    	font-size: 0.75rem;
	    }
	    
	    li.active {
        	padding-right: 0;
    	}

     /* ============ 預約明細 =============*/
	.showAppointDetail {
		padding: 35px 45px 45px;
		background-color: white;
	}
	
	.ApmDetailHeader {
		font-weight: 700;
	}
	
	.ApmDetailHeader div {
		display: inline-block;
	}
	
	.floatR {
		float: right;
		color: #7e4c4f;
		margin-right: 20px;
	}
	
	.myHr {
		margin: 12px 0;
		border: 1px solid #ddd;
	}
	
	.wayL {
		margin-left: 30px;
	}
	
	#Apmtime {
		margin-left: 5px;
		background-color: #7e4c4f;
		color: white;
		padding: 0 6px;
	}
	
	.product-img {
		width: 100px;
		height: 100px;
		background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        display: inline-block;
	}
	
	.svcBlock div{
		display: inline-block;
		vertical-align: top;
	}


	
	.svcBlock-info {
		margin-left: 20px;
		height: 100px;
		width: calc(100% - 240px);
	}
	
	.svcBlock-info h5{
		display: inline-block;
		font-weight: 700;
		margin-top: 25px;
	}
	
	.svcBlock-info span {
		background-color: #fffacf;
		padding: 4px 10px;
		margin-left: 10px;
	}
	
	.svcBlock-info div{
		margin-top: 3px;
	}
	
	.floatRB {
		float:right;
 		margin: 44px 0;
 		margin: 35px 20px 0 0;
	}
	
	.floatRB div{
		text-align: right;
		display: block;
	}
	
	.deleteLine {
		text-decoration:line-through;
	}
	
	.svcBlock-salePrice {
		color: #f51515;
		font-weight: 500;
	}
	
	.svcBlock-noSalePrice {
		margin-top: 7px;
	}
	
	.alignR {
		text-align: right;
	}
	
	.highlight {
		background-color: #fffacf;
		padding: 5px 9px;
		margin-right: 10px;
		font-weight: 500;
	}
	
	.svcBlock-totalPrice {
		margin-left: 50%;
		font-weight: 700;
		display: inline-block;
	}
	
	.alignR.inline {
		display: inline-block;
		float: right;
		margin-right: 13px;
	}
	
	.svcBlock div.toBlock {
		display: block;
	}

    /* ============ 預約資料選擇 =============*/

    .choicesvcName {
        font-size: 1.1rem; 
        font-weight: 700;
    }
    
    .col-12.middle.mt-15.mb-15 {
    	padding: 0;
    }

    .col-12.middle span{
        vertical-align: middle;
        display: inline-block;
    }

    .middle input {
        height: 20px; 
        width: 20px; 
        position: relative; 
        top: -10px;
    }

    .middle label {
        display: inline-block; 
        padding-left: 15px;
    }

    .selectStyle {
        margin: 0 15px 20px; 
        border: 1px solid #bebebe; 
        height: 40px; 
        border-radius: 0.25rem; 
        text-align: center; 
        font-size: 1.01rem;
    }

    .selectStyle.system {
        margin: 0;
    }

    textarea {
        background-color: white;
    }

    input, textarea:focus, textarea{
        border: 1px solid #bebebe !important;
        border-radius: 0.25rem;
    }
    
    .billing-information-wrapper {
        border-radius: 0 0 0.25rem 0.25rem;
        border: 1px solid #dcdcdc !important;
        padding-top: 40px;
        height: 415px;
    }

    .billing-information-wrapper.choiceSvc {
        overflow-y: auto; 
        width: 100vh;
    }

    .block-header {
        background-color: #7e4c4f;
        padding: 20px; border-radius: 0.25rem 0.25rem 0 0;
    }

    .block-header h4 {
        text-align: center; 
        margin-bottom: 0; 
        color: white;
    }
    
    #submitAll:hover{
    	cursor: pointer;
    }
    </style>
    
</head>

<body>
    <%@include file="/templates/frontstage/common/header.jsp"%>
    
    <div class="breadcrumb-area pt-95 pb-95 bg-img" style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>美容預約服務</h2>
                <ul>
                    <li><a href="index.html">home</a></li>
                    <li class="active">預約美容</li>
                </ul>
            </div>
        </div>
    </div>

    

    <div class="pt-100 pb-100">
        <div class="container">
            <div class="row">
            
                <div class="col-lg-6 col-md-6">
                    <div id="my-account-1" class="panel-collapse collapse show">
                        <div class="panel-body">
                            <div class="block-header">
                                <h4>填寫預約資訊</h4>
                            </div>
                            <div class="billing-information-wrapper">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info">
                                            <label>預約時段</label>
                                            <select id="schPeriod" class="selectStyle system">
                                                <option value="" id="morning">上午</option>
                                                <option value="" id="afternoon">下午</option>
                                                <option value="" id="night">晚上</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info">
                                            <label>預約日期</label>
                                            <select id="schDate" class="selectStyle system">
                                            <option style="display: none; color: #7c7c7c;" value="" id="defaultDate">請選擇日期</option>
                                            
                                            <% 
										    	List<JobSchedule> noAppointmentSchs = new JobScheduleServicesImp().findNoAppointmentSch();
										    	for( JobSchedule sch : noAppointmentSchs){
										    		String schPeriod = sch.getSchPeriod();
										    		if ("上午".equals(schPeriod)){
										    %>
										    			<option class="schDateOption schDate-morning" value="<%= sch.getSchID()%>"><%= sch.getSchDate()%></option>
										    <%		
										    		}else if("下午".equals(schPeriod)){
										    %>
														<option class="schDateOption schDate-afternoon cantSee" value="<%= sch.getSchID()%>"><%= sch.getSchDate()%></option>
											<%
												    }else if("晚上".equals(schPeriod)){
											%>
														<option class="schDateOption schDate-night cantSee" value="<%= sch.getSchID()%>"><%= sch.getSchDate()%></option>
											<%
												    }
										    	}
										    %>
                                            
                                            <option class="cantSee2" style="color: #7c7c7c;" value="" id="noDate" disabled>沒有可預約的日期</option>
                                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info">
                                            <label>寵物名稱</label>
                                            <select id="petID" class="selectStyle system">
                                            	<option style="display: none; color: #7c7c7c;" value="">請選擇寵物名稱</option>
	                                            <c:forEach var="pet" items="${pets}">
													<option value="${pet.petId}">${pet.petName}</option>
												</c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info">
                                            <label>備註</label>
                                            <textarea id="customerNote" rows="5" style= "resize:none;"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-lg-6 col-md-6 d-flex align-items-center">
                    <div id="my-account-1" class="panel-collapse collapse show">
                        <div class="panel-body">
                            <div class="block-header">
                                <h4>選擇服務</h4>
                            </div>
                            <div class="billing-information-wrapper choiceSvc">
                                <div class="row">
                                        <select id="" class="selectStyle">
                                            <option value="">服務類別</option>
                                            <option value="">服務類別1</option>
                                            <option value="">服務類別2</option>
                                        </select>
                                        <select id="" class="selectStyle">
                                            <option value="">寵物體型</option>
                                            <option value="">服務類別1</option>
                                            <option value="">服務類別2</option>
                                        </select>
                                        <select id="" class="selectStyle">
                                            <option value="">寵物品種</option>
                                            <option value="">服務類別1</option>
                                            <option value="">服務類別2</option>
                                        </select>
                                        
                                        
                                  <form id="sendApmForm" method="post" action="${pageContext.request.contextPath}/ipet-front/salon/addAppointment">
                                  		<input type="hidden" name="schID" id="unshowSchDate">
                                  		<input type="hidden" name="petID" id="unshowPetID">
                                  		<input type="hidden" name="customerNote" id="unshowNote">
                                  		
                                        <table id="example2" class="table">
                                        
						                    <thead style="display: none;">
						                    </thead>
						                    <tfoot>
						                    </tfoot>
						                
						                </table>
								 </form>
								 
								 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="padding-bottom: 55px; width: 100%; margin: 0 15px 100px;">
                    <h4 style="text-align: center; padding: 10px; font-weight: 700;">預約明細</h4>
                    <hr class="myHr">
                    <div class="showAppointDetail">
		            					
                        <div class="ApmDetailHeader">
                            <div>預約日期：</div><div id="Apmtime">預約時段</div>
                            <div class="floatR">狗狗名字</div>
                        </div>
                        <hr class="myHr">
                        <div class="mt-25 mb-25 svcBlock">
<%--                             <div class="product-img" style="background-image: url(${pageContext.request.contextPath}/ipet-front/service/showSvcImg?svcId=\${detail.svcId});"></div> --%>
                                <div class="svcBlock-info">
                                    <h5>服務名稱</h5><span class="ifSaleName">優惠名稱</span>
                                    <div class="toBlock">服務描述</div>
                                </div>
                                <div class="floatRB">
                                    <div class="svcBlock-noSalePrice">服務價格</div>
                                    <div class="svcBlock-salePrice">優惠價格</div>
                                </div>
                            </div>
                        <hr class="myHr">
		    				<div class="alignR mr-15 mt-15 mb-15">
		    					<span>備註：</span>
		    					sssss
		    				</div>
		    			<hr class="myHr">
                        <div class="mt-25 mb-15">
                            <h5 class="svcBlock-totalPrice">總金額： </h5>
                            <h5 class="alignR inline">$3333</h5>
                        </div>
							<input type="submit" form="sendApmForm" class="apmsubmit mt-45" value="確認結帳" id="submitAll" style="color: white; background-color: #7e4c4f; font-size: 1.4rem;">
		    		</div>
                </div>




            </div>
        </div>
    </div>
    
    
	<%@include file="/templates/frontstage/common/footer.jsp"%>
    
    <!-- all js here -->
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/elevetezoom.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/ajax-mail.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script>
    
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
    
    
    <script>
    $(function () {
    	
    	const datatable = $('#example2').DataTable({
    		"dom": "tp",
            "paging": false,
            "lengthChange": false,
            "ordering": true,
            "autoWidth": false,
            "responsive": true,
            "data": ${allservices},
            "columns" : [
            	{ data: "svcId", "visible": false, className: "svcId" },
            	{ data: "catId", "visible": false, className: "catId" },
            	{ data: "petSize", "visible": false, className: "petSize" },
            	{ data: "typeId", "visible": false, className: "typeId" },
                { data: null,
                	render: function(data, type){
                		const svcPrice = data.svcPrice;
	            		const salePrice = data.salePrice;
	            		
	            		const notOnSale = `
		            			<span class="svcBlock-salePrice"></span>
	                            <span class="svcBlock-noSalePrice choicePrice">$` + svcPrice + `</span>
			                	</div>
	            		`;
	            		const onSale = `
		            			<span class="svcBlock-salePrice">` + salePrice + `</span>
	                            <span class="svcBlock-noSalePrice choicePrice">$` + svcPrice + `</span>
			                	</div>
	            		`;
	            		
	            		const showBeforeSale = `
		            			<div class="col-12 middle mt-15 mb-15">
			                    <span class="col-1">
			                        <input type="checkbox" class="getsvcId" id="svcshow` + data.svcId + `" value="` + data.svcId + `" name="svcId">
			                    </span>
			                    <label class="col-9 noPadding" for="svcshow` + data.svcId + `">
			                        <div class="choicesvcName">` + data.svcName + ` - ` + data.typeName + `</div>
			                        <div class="choiceContent">` + data.svcContent + `</div>
			                    </label>
	            		`;
	            		
	            		if(svcPrice === salePrice){
			            	return showBeforeSale + notOnSale;
			            }else{
			            	return showBeforeSale + onSale;
			            }
                	}
                }
            ],
    		language: {
    	           "sProcessing": "查詢中...",
    	           "sLengthMenu": "顯示 _MENU_ 項服務",
    	           "sZeroRecords": "查無資料",
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
        
        /*===================== 價格刪除線 ==========================*/
    	
    	const salePriceCheck = document.querySelectorAll(".svcBlock-salePrice");
    	
    	for(let i = 0; i < salePriceCheck.length; i++){
    		const sale = salePriceCheck[i];
    		if(sale.textContent !== ""){
    			document.querySelectorAll(".svcBlock-noSalePrice")[i].style.textDecoration = "line-through";
    		}
    	}
    	
    	/*===================== 若無資料，顯示尚無資料 ==========================*/
    	
    	if($(".schDateOption").length === 2){
    		$("#noDate").removeClass("cantSee2");
    	}
    	
    	/*===================== 點擊時段回傳日期 ==========================*/
    	$("#schPeriod").change(function(){
    		$(".schDateOption").addClass("cantSee");
    		$("#noDate").addClass("cantSee2");
    		$("#defaultDate").prop("selected", true);
    		if($("#schPeriod :selected").text() === "下午"){
    			$(".schDate-afternoon").removeClass("cantSee");
    		}else if($("#schPeriod :selected").text() === "上午"){
    			$(".schDate-morning").removeClass("cantSee");
    		}else if($("#schPeriod :selected").text() === "晚上"){
    			$(".schDate-night").removeClass("cantSee");
    		}
    		if($(".cantSee").length === $(".schDateOption").length){
    			$("#noDate").removeClass("cantSee2");
    		}
    	});
    	
    	/*===================== 新增資訊到hidden ==========================*/
    	$(document).on("change", "#schDate", function (e){
    		$("#unshowSchDate").val($(this).val());
    	});
    	
    	$(document).on("change", "#petID", function (e){
    		$("#unshowPetID").val($(this).val());
    	});
    	
    	$(document).on("keyup click", "#customerNote", function (e){
    		$("#unshowNote").val($(this).val());
    	});
    	
    	/*===================== 送出新增資訊到後台 ==========================*/
//     	$(document).on("click", "#submitAll", function (e){
    		
//     		//要送出的資訊
//     		const schID = $("#schDate").val();
//     		const petID = $("#petID").val();
//     		const customerNote = $("#customerNote").val();
    		
//     		//資料：formData
//     		const form = document.getElementById("sendApmForm");
//        	 	let formData = new FormData(form);
//        	 	formData.append("schID", schID);
//        	 	formData.append("petID", petID);
//        	 	formData.append("customerNote", customerNote);
    		
//     		$.ajax({
//     	        url : "${pageContext.request.contextPath}/ipet-front/salon/addAppointment",
//     	        type : "POST",
//     	        data : formData,
//     	        cache: false,
//     	        processData: false,
//     	        contentType: false,
//     	        beforeSend: function(){
//     	        	$("#mainModal").css("display","block");
//     	        },
//     	        success : function(response) {
//     	        	$("#mainModal").css("display","none");
//     	        	if(!response){
// 	    	        	showSwal("success-message");
//     	        	}else {
//     	 				console.log(response);
//     	        	}
//     	        },error: function(response) {
//     	        	showSwal("something-Wrong");
// 					alert("something-Wrong");
//     	        }
// 			});
    		
//     	});
    	
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