<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.job.model.*"%>
<%@ page import="com.web.job.model.entities.*"%>
<%@ page import="com.web.job.model.services.*"%>
<%@ page import="com.web.job.model.services.imp.*"%>
<%@ page import="com.web.job.model.dao.*"%>
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

PetTypeService petSvc = new PetTypeService();
List<PetType> petTypes = petSvc.selectAll();
pageContext.setAttribute("petTypes", petTypes);
%>
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
    
    	.panel-body {
    		margin-bottom: 13px;
    	}
    
    	.cantSee {
			display: none !important;
		}
		
    	.cantSee2 {
			display: none !important;
		}
		
    	.cantSee3 {
			display: none !important;
		}
		
		.getsvcId {
			position: relative;
		    top: 40px;
		    width: 20px;
		    height: 20px;
		}
		
    	.table td {
		    padding: 18px 0;
		}
    	
    	.col-9.noPadding{
    		padding: 0 5px 0 5px;
    		position: relative;
	        top: 10px;
    	}
    
    	.row div.choicePrice{
	        display: inline-block;
	        text-align: center;
	        letter-spacing: 0px;
	        position: relative;
	        bottom: 10px;
	    } 
	    
	    .row div.svcBlock-salePrice{
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
		position: relative;
    	top: 25px;
	}
	
	.svcBlock-noSalePrice {
		margin-top: 7px;
		position: relative;
    	top: 25px;
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
	
	.choiceSaleName {
		background-color: #fffacf;
	    padding: 4px 5px;
	    margin-right: 10px;
	    font-weight: 500;
	    font-size: 12px;
	    color: #7e4c4f;
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
	.row.myRow {
		margin-right: 33px;
    	margin-left: 0px;
	}
	
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
        margin-bottom: 20px; 
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
        padding-top: 25px;
        height: 380px;
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
                                            <label>預約時段</label><span class="error periodError">*</span>
                                            <select id="schPeriod" class="selectStyle system">
                                                <option value="上午" id="morning">上午</option>
                                                <option value="下午" id="afternoon">下午</option>
                                                <option value="晚上" id="night">晚上</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <div class="billing-info">
                                            <label>預約日期</label><span class="error schDateError">* ${errorMsgs.schID}</span>
                                            <select id="schDate" class="selectStyle system">
                                            <option style="display: none; color: #7c7c7c;" value="" id="defaultDate">請選擇日期</option>
                                            
                                            <% 
										    	List<JobSchedule> noAppointmentSchs = new JobScheduleServicesImp().findNoAppointmentSch();
                                            	pageContext.setAttribute("noApmSchs", noAppointmentSchs);
                                            	
                                            %>
                                            <c:forEach var="apm" items="${noApmSchs}">
                                            
                                            	<c:if test="${'上午' eq apm.schPeriod}" var="true">
													<option class="schDateOption schDate-morning" value="${apm.schID}" ${(apm.schID == schID) ? 'selected' : ''} >${apm.schDate}</option>
                                        		</c:if>
                                        		
                                        		<c:if test="${'下午' eq apm.schPeriod}" var="true">
													<option class="schDateOption schDate-afternoon cantSee3" value="${apm.schID}" ${(apm.schID == schID) ? 'selected' : ''} >${apm.schDate}</option>
                                        		</c:if>
                                        		
                                        		<c:if test="${'晚上' eq apm.schPeriod}" var="true">
													<option class="schDateOption schDate-night cantSee3" value="${apm.schID}" ${(apm.schID == schID) ? 'selected' : ''} >${apm.schDate}</option>
                                        		</c:if>
											</c:forEach>
                                            
                                            	<option class="cantSee2" style="color: #7c7c7c;" value="" id="noDate" disabled>沒有可預約的日期</option>
                                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info">
                                            <label>寵物名稱</label><span class="error petIDError">* ${errorMsgs.petID}</span>
                                            <select id="petID" class="selectStyle system">
                                            	<option style="display: none; color: #7c7c7c;" value="">請選擇寵物名稱</option>
	                                            <c:forEach var="pet" items="${pets}">
													<option value="${pet.petId}" ${(pet.petId == petID) ? 'selected' : ''}>${pet.petName}</option>
												</c:forEach>
                                            </select>
                                            
                                            <select style="display: none;" id="searchPetType" class="selectStyle system">
                                            	<option style="display: none; color: #7c7c7c;" value=""></option>
	                                            <c:forEach var="pet" items="${pets}">
													<option id="searchOption${pet.petId}" value="${pet.petId}">${pet.petVarId}</option>
												</c:forEach>
                                            </select>
                                            
                                            <select style="display: none;" id="searchPetSize" class="selectStyle system">
                                            	<option style="display: none; color: #7c7c7c;" value=""></option>
	                                            <c:forEach var="pet" items="${pets}">
													<option id="searchOptionSize${pet.petId}" value="${pet.petId}">${pet.petSize}</option>
												</c:forEach>
                                            </select>
                                            
                                            <input type="hidden" value="${svcId}" id="sessionSvcId">
                                            
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="billing-info">
                                            <label>備註</label>
                                            <textarea id="customerNote" rows="3" style= "resize:none;">${customerNote}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-lg-6 col-md-6">
                    <div id="my-account-1" class="panel-collapse collapse show">
                        <div class="panel-body">
                            <div class="block-header">
                                <h4>選擇服務</h4>
                            </div>
                            <div class="billing-information-wrapper choiceSvc col-12">
                                <div class="row">
                                	<div class="col-12">
                                		<span class="error schDateError">${errorMsgs.svcId}</span>
                                        <select id="selectCat" class="selectStyle">
<!--                                         	<option class="defaultSelect" style="display: none; color: #7c7c7c;" value="">其他服務類別</option> -->
                                        	<c:forEach var="cat" items="${catlist}">
												<option value="${cat.catId}" ${(cat.catId == catId) ? 'selected' : ''}>${cat.catName}</option>
											</c:forEach>
                                        </select>
                                    </div>
                                    <div class="mainChoiceBox col-12 cantSee">
                                        <select id="selectSize" class="selectStyle">
                                        	<option class="defaultSelect" style="display: none; color: #7c7c7c;" value="">請選擇寵物體型</option>
                                            <option value="大型犬">大型犬</option>
                                            <option value="中型犬">中型犬</option>
                                            <option value="小型犬">小型犬</option>
                                        </select>
                                        <select id="selectType" class="selectStyle">
                                        	<option class="defaultSelect" style="display: none; color: #7c7c7c;" value="">請選擇寵物品種</option>
                                        	<c:forEach var="petType" items="${petTypes}">
                                        		<c:if test="${'大型犬' eq petType.petSize}" var="true">
													<option class="bigSize allPetType" value="${petType.typeId}">${petType.typeName}</option>
                                        		</c:if>
                                        		<c:if test="${'中型犬' eq petType.petSize}" var="true">
													<option class="middleSize allPetType" value="${petType.typeId}">${petType.typeName}</option>
                                        		</c:if>
                                        		<c:if test="${'小型犬' eq petType.petSize}" var="true">
													<option class="smallSize allPetType" value="${petType.typeId}">${petType.typeName}</option>
                                        		</c:if>
											</c:forEach>
                                        </select>
                                    </div> 
                                        
                                  <form id="sendApmForm" method="post" action="${pageContext.request.contextPath}/ipet-front/salon/enterAppointment" style="width: 100%;">
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
<!-- 				<input type="submit" class="apmsubmit mt-10 col-12" value="確認服務" style="color: white; background-color: #7e4c4f; font-size: 1.4rem; margin: 0 15px;"> -->
                
                <div id="ApmList" style="padding:35px 0 55px; width: 100%; margin: 0 15px 100px;">
                    <h4 style="text-align: center; padding: 10px; font-weight: 700;">預約明細</h4>
                    <hr class="myHr">
                    <div class="showAppointDetail">
		            					
                        <div class="ApmDetailHeader">
                            預約日期：<div id="ApmDate">請選擇日期</div><div id="Apmtime">請選擇預約時段</div>
                            <div class="floatR" id="ApmPetName">請選擇一隻您的毛孩</div>
                        </div>
                        <hr class="myHr">
                        <div id="ApmSvc"></div>
                        <hr class="myHr">
		    				<div class="alignR mr-15 mt-15 mb-15">
		    					<span>備註：<span id="ApmNote"></span></span>
		    				</div>
		    			<hr class="myHr">
                        <div class="mt-25 mb-15">
                            <h5 class="svcBlock-totalPrice">總金額： </h5>
                            <h5 class="alignR inline" id="ApmTotalPrice"></h5>
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
            	{ data: "typeName", "visible": false, className: "typeName" },
            	{ data: "typeId", "visible": false, className: "typeId" },
                { data: null,
                	render: function(data, type){
                		const svcPrice = data.svcPrice;
	            		const salePrice = data.salePrice;
	            		
	            		const notOnSale = `
	            						<div class="col-1">
					            			<span class="svcBlock-salePrice"></span>
				                            <span class="svcBlock-noSalePrice choicePrice">$` + svcPrice + `</span>
			                            </div>
				                	</div>
	            		`;
	            		const onSale = `
	            						<div class="col-1">
					            			<span class="svcBlock-salePrice">` + salePrice + `</span>
				                            <span class="svcBlock-noSalePrice choicePrice">$` + svcPrice + `</span>
			                            </div>
				                	</div>
	            		`;
	            		
	            		const showBeforeSale = `
			            			<div class="row myRow">
					                    <div class="col-1 prices">
					                        <input type="checkbox" class="getsvcId" id="svcshow` + data.svcId + `" value="` + data.svcId + `" name="svcId">
					                    </div>
					                    <label class="col-10 noPadding" for="svcshow` + data.svcId + `">
					                        <span class="choiceSaleName ifSaleName">` + data.saleName + `</span>
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
    	           "sZeroRecords": "沒有可以預約的服務",
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
        
    	
    	/*===================== 若有session svcId 值，載入時勾選 ==========================*/
    	
    	const sessionSvcId = $("#sessionSvcId").val();
    	
    	if(sessionSvcId !== ""){
    		$("#svcshow" + sessionSvcId).prop("checked", true);
    	}
    	
    	/*===================== 查詢 ==========================*/
    	//當載入時搜索
    	datatable.columns(".catId").search($("#selectCat").val()).draw();
    	datatable.columns(".svcId").search(sessionSvcId).draw();
    	
    	$(document).on("change", "#selectType", function (e){
    		datatable.columns(".typeId").search($("#selectType").val()).draw();
    		datatable.columns(".svcId").search("").draw();
    	});
    	
    	$(document).on("change", "#selectSize", function (e){
    		datatable.columns(".petSize").search($("#selectSize").val()).draw();
    		datatable.columns(".svcId").search("").draw();
    	});
    	
    	$(document).on("change", "#selectCat", function (e){
    		datatable.columns(".catId").search($("#selectCat").val()).draw();
    		datatable.columns(".svcId").search("").draw();
    		$(".getsvcId").prop("checked", false);
    		$("#ApmSvc").empty();
    		$("#ApmTotalPrice").empty();
    		
			/*===================== 優惠background-color隱藏 ==========================*/
        	
        	const ifSaleName = document.querySelectorAll(".ifSaleName");
        	
        	for(let i = 0; i < ifSaleName.length; i++){
        		const saleName = ifSaleName[i];
        		if(saleName.innerHTML === "" || saleName.textContent === ""){
        			saleName.style.backgroundColor = "white";
        		}
        	}
        	
			/*===================== 價格刪除線 ==========================*/
        	
        	const salePriceCheck = document.querySelectorAll(".svcBlock-salePrice");
        	
        	for(let i = 0; i < salePriceCheck.length; i++){
        		const sale = salePriceCheck[i];
        		if(sale.textContent !== ""){
        			document.querySelectorAll(".svcBlock-noSalePrice")[i].style.textDecoration = "line-through";
        		}
        	}
    	});
    	
    	$(document).on("change", "#petID", function (e){
    		if($("#petID").val() !== sessionSvcId){
    			datatable.columns(".svcId").search("").draw();
    			$("#ApmSvc").empty();
    		}
    		//將值輸入要送出的hidden表格
    		$("#unshowPetID").val($(this).val());
    		//改變查詢表格值
    		$("#searchPetType").val($(this).val());
    		const searchPetTypeId = $("#searchPetType").val();
    		$("#selectSize").val($("#searchOptionSize" + searchPetTypeId).text());
    		datatable.columns(".petSize").search($("#selectSize").val()).draw();
    		
    		//查詢寵物品種
    		let petVar = $("#searchOption" + searchPetTypeId).text();
    		datatable.columns(".typeName").search(petVar).draw();
    		
    		//select體型回傳顯示品種
    		$("#selectType").children(".defaultSelect").prop("selected", "true");
    		if($("#selectSize").val() === "大型犬"){
    			$(".bigSize").removeClass("cantSee");
    			$(".middleSize").addClass("cantSee");
    			$(".smallSize").addClass("cantSee");
    		}
    		if($("#selectSize").val() === "中型犬"){
    			$(".bigSize").addClass("cantSee");
    			$(".middleSize").removeClass("cantSee");
    			$(".smallSize").addClass("cantSee");
    		}
    		if($("#selectSize").val() === "小型犬"){
    			$(".bigSize").addClass("cantSee");
    			$(".middleSize").addClass("cantSee");
    			$(".smallSize").removeClass("cantSee");
    		}
    	});
    	
    	/*===================== 動態填入下方明細 ==========================*/
    	
    	$("#Apmtime").html($("#schPeriod").val());
    	$("#ApmDate").html($("#schDate option:selected").text());
    	$("#ApmPetName").html($("#petID option:selected").text());
    	$("#ApmNote").html($("#customerNote").val());
    	
    	//選擇時段
    	$(document).on("change", "#schPeriod", function (e){
    		$("#Apmtime").html($("#schPeriod").val());
    		$("#ApmDate").html("請選擇日期");
    	});
    	
    	//選擇日期
    	$(document).on("change", "#schDate", function (e){
    		$("#ApmDate").html($("#schDate option:selected").text());
    	});
    	
    	//選擇寵物
    	$(document).on("change", "#petID", function (e){
    		$("#ApmPetName").html($("#petID option:selected").text());
    	});
    	
    	//輸入備註
    	$(document).on("blur", "#customerNote", function (e){
    		$("#ApmNote").html($("#customerNote").val());
    	});
    	
    	
    	//選擇服務
    	$(document).on("click", ".getsvcId", function (e){
    		const thisId = $(this).val();
    		const svcName = $(this).parent().next().find(".choicesvcName").text();
    		const saleName = $(this).parent().next().find(".choiceSaleName").text();
    		const svcContent = $(this).parent().next().find(".choiceContent").text();
    		const salePrice = $(this).parent().next().next().find(".svcBlock-salePrice").text();
    		const svcPrice = $(this).parent().next().next().find(".svcBlock-noSalePrice").text();
    		const innerText = `
    			<div id="showApmDetail` + thisId + `">
	    			<div class="mt-25 mb-25 svcBlock">
	                <div class="product-img" style="background-image: url(${pageContext.request.contextPath}/ipet-front/service/showSvcImg?svcId=` + thisId + `);"></div>
	                    <div class="svcBlock-info">
	                        <h5>` + svcName + `</h5><span class="ifSaleName">` + saleName + `</span>
	                        <div class="toBlock">` + svcContent + `</div>
	                    </div>
	                    <div class="floatRB">
	                        <div class="svcBlock-salePrice-show" style="color: #f51515;">` + salePrice + `</div>
	                        <div class="svcBlock-noSalePrice-show">` + svcPrice + `</div>
	                    </div>
	            	</div>
	            </div>
    		`;
    		if($("#showApmDetail" + thisId).length > 0){
    			$("#showApmDetail" + thisId).remove();
    		}else {
    			$("#ApmSvc").append(innerText);
    			const salePriceCheck2 = document.querySelectorAll(".svcBlock-salePrice-show");
    	    	
    	    	for(let i = 0; i < salePriceCheck2.length; i++){
    	    		const sale = salePriceCheck2[i];
    	    		if(sale.textContent !== ""){
    	    			document.querySelectorAll(".svcBlock-noSalePrice-show")[i].style.textDecoration = "line-through";
    	    		}
    	    	}
    	    	
    	    	/*===================== 優惠background-color隱藏 ==========================*/
            	
            	const ifSaleName = document.querySelectorAll(".ifSaleName");
            	
            	for(let i = 0; i < ifSaleName.length; i++){
            		const saleName = ifSaleName[i];
            		if(saleName.innerHTML === "" || saleName.textContent === ""){
            			saleName.style.backgroundColor = "white";
            		}
            	}
    		}
    	    	/*===================== totalPrice ==========================*/
    			const getsvcId = document.querySelectorAll(".getsvcId");
    	    	let totalPrice = 0;
    	    	
    			for(let i = 0; i < getsvcId.length; i++){
    				if(getsvcId[i].checked){
    					const tr = $(getsvcId[i]).closest("tr");
    					const allValue = datatable.row(tr).data();
    					console.log(allValue);
    					const salePrice = allValue.salePrice;
    					totalPrice += salePrice;
    				}
            	}
    			
    			$("#ApmTotalPrice").html("$" + totalPrice);
    		
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
    	
    	/*===================== 優惠background-color隱藏 ==========================*/
    	
    	const ifSaleName = document.querySelectorAll(".ifSaleName");
    	
    	for(let i = 0; i < ifSaleName.length; i++){
    		const saleName = ifSaleName[i];
    		if(saleName.innerHTML === "" || saleName.textContent === ""){
    			saleName.style.backgroundColor = "white";
    		}
    	}
    	
    	/*===================== 點擊時段回傳日期 ==========================*/
    	$("#schPeriod").change(function(){
    		$(".schDateOption").addClass("cantSee3");
    		$("#noDate").addClass("cantSee2");
    		$("#defaultDate").prop("selected", true);
    		if($("#schPeriod :selected").text() === "下午"){
    			$(".schDate-afternoon").removeClass("cantSee3");
    		}else if($("#schPeriod :selected").text() === "上午"){
    			$(".schDate-morning").removeClass("cantSee3");
    		}else if($("#schPeriod :selected").text() === "晚上"){
    			$(".schDate-night").removeClass("cantSee3");
    		}
    		if($(".cantSee3").length === $(".schDateOption").length){
    			$("#noDate").removeClass("cantSee2");
    		}
    	});
    	
    	/*===================== select體型回傳顯示品種 ==========================*/
    	$(document).on("change", "#selectSize", function(){
    		$("#selectType").children(".defaultSelect").prop("selected", "true");
    		if($(this).val() === "大型犬"){
    			$(".bigSize").removeClass("cantSee");
    			$(".middleSize").addClass("cantSee");
    			$(".smallSize").addClass("cantSee");
    		}
    		if($(this).val() === "中型犬"){
    			$(".bigSize").addClass("cantSee");
    			$(".middleSize").removeClass("cantSee");
    			$(".smallSize").addClass("cantSee");
    		}
    		if($(this).val() === "小型犬"){
    			$(".bigSize").addClass("cantSee");
    			$(".middleSize").addClass("cantSee");
    			$(".smallSize").removeClass("cantSee");
    		}
    	});
    	
    	/*===================== 新增資訊到hidden ==========================*/
    	$(document).on("change", "#schDate", function (e){
    		$("#unshowSchDate").val($(this).val());
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
//     	        url : "${pageContext.request.contextPath}/ipet-front/salon/ECPay",
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