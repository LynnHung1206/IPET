<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Marten - Pet Food eCommerce Bootstrap4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
	<!-- IonIcons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	
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
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
    
    <style>
    
    	.card-body {
    		background-color: #f4f4f4;
    	}
    	
    	tbody {
    		border: 1px solid #f4f4f4;
    	}
    	
    	li.active {
    		padding: 0;
    	}
    	
	    .page-item.active .page-link {
		    background-color: #7e4c4f;
		    border-color: #7e4c4f;
		}
		
		.page-link {
			color: #7e4c4f;
		}
		
		#example2_paginate {
			display: flex;
		    justify-content: center; 
		    align-items: center;
		}
		
		/* ================== table ====================*/
		.card {
		    margin: 45px;
	    }
	    
	    table {
	    	border: 1px solid #000;
	    }
	    
    	/* ======= table - 預約導覽列 ============*/
    .card-header {
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      padding: 0;
	  
    }
    
    .card-change {
      text-align: center;
      padding-top: 12px;
      padding-bottom: 12px;
      border: 0;
      background-color: #dadada;
      font-weight: 700;
      font-size: 1.01rem;
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
      background-color: #7e4c4f;
      color: aliceblue;
      /* border-bottom: 3px solid #007bff; */
    }
    
	
	/* ============ datatable - 自訂樣式 =============*/
	.showAppointDetail {
		padding: 45px;
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
		margin-right: 16px;
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
	
    </style>
</head>

<body>
    <%@include file="/templates/frontstage/common/header.jsp"%>
    
    <div class="breadcrumb-area pt-95 pb-95 bg-img" style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>美容預約查詢</h2>
                <ul>
                    <li><a href="index.html">home</a></li>
                    <li class="active">我的美容預約</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <div class="card">
              	<div class="card-header">
                  <button class="card-change on" value="all" id="apm">所有預約</button>
                  <button class="card-change" value="0" id="apm0">待完成預約</button>
                  <button class="card-change" value="1" id="apm1">已完成預約</button>
                  <button class="card-change" value="2" id="apm2">已取消預約</button>
                  <button class="card-change" value="3" id="apm3">未完成預約</button>
                </div>
                <input type="text" style="display: none;" value="已完成預約" id="a1">
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="example2" class="table">
					<thead style="display: none;">
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
    
	    function format (data){
			let showApmSvc = "";
			for(let detail of data.appointmentDetails){
				
				showApmSvc += `
					<div class="mt-25 svcBlock">
					<div class="product-img" style="background-image: url(${pageContext.request.contextPath}/ipet-front/service/showSvcImg?svcId=\${detail.svcId});"></div>
						<div class="svcBlock-info">
							<h5>\${detail.svcName}</h5><span class="ifSaleName">\${detail.saleName}</span>
							<div class="toBlock">\${detail.svcContent}</div>
						</div>
						<div class="floatRB">
							<div class="svcBlock-noSalePrice">$ \${detail.svcPrice}</div>
							<div class="svcBlock-salePrice">\${detail.salePrice}</div>
						</div>
					</div>
				`;
			}
			return showApmSvc;
		}
    
        $(function () {
        	
        	const datatable = $('#example2').DataTable({
        		"dom": "tp",
                "paging": true,
                "pageLength": 5,
                "lengthChange": false,
                "ordering": true,
                "autoWidth": false,
                "responsive": true,
                "data": ${appoints},
                "order": [[0, 'desc']],
                "columns" : [
                	{ data: "schDate", 
		            	className: "schDate",	
		            	"visible": false
		            },
		            { data: "apmStatusDesc", 
		            	className: "apmStatusDesc",	
		            	"visible": false
		            },
		            { data: null,
		            	render: function(data, type){
		            		const allSvc = format(data);
		            		
		            		const showBeforeSvc = `
		            				<div class="showAppointDetail">
		            					
		            					<div class="ApmDetailHeader">
		            						<div>預約日期：` + data.schDate + `</div><div id="Apmtime">` + data.schPeriod + `</div>
		            						<div class="wayL">` + data.petName + `</div>
		            						<div class="floatR">` + data.apmStatusDesc + `</div>
		            					</div>
		            					<hr class="myHr">
		            		`;
		            		
		            		const showAfterSvc = `
		            			<hr class="myHr">
		    					<div class="alignR mr-15 mt-10">
		    						<span>備註：</span>
		    						` + data.customerNote + `
		    					</div>
		    					<hr class="myHr">
		    					<h5 class="svcBlock-totalPrice">總金額： </h5>
		    					<h5 class="alignR inline">$ ` + data.totalPrice + `</h5>
		    					</div>
		            		`;
		            		
		            		return showBeforeSvc + allSvc + showAfterSvc;
		            	}
		            }
		        ],
				language: {
			           "sProcessing": "查詢中...",
			           "sLengthMenu": "顯示 _MENU_ 項預約",
			           "sZeroRecords": "尚無資料",
			           "sInfoPostFix": "",
			           "sUrl": "",
			           "sEmptyTable": "尚未新增預約",
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
        	
        	/*===================== 切換狀態 ==========================*/
        	
        	$(document).on("click", "#apm", function(){
        		datatable.columns(".apmStatusDesc").search("").draw();
        	});
        	
        	$(document).on("click", "#apm0", function(){
        		datatable.columns(".apmStatusDesc").search("已支付訂金").draw();
        	});
        	
        	$(document).on("click", "#apm1", function(){
        		datatable.columns(".apmStatusDesc").search("已完成預約").draw();
        	});
        	
        	$(document).on("click", "#apm2", function(){
        		datatable.columns(".apmStatusDesc").search("預約取消").draw();
        	});
        	
        	$(document).on("click", "#apm3", function(){
        		datatable.columns(".apmStatusDesc").search("逾時未到").draw();
        	});
        	
        	
        	/*===================== 預約導覽列變色 ==========================*/
        	$(".card-change").on("click", function () {
                $(".card-header").children("*").removeClass("on");
                $(this).addClass("on");
            });

        	/*===================== 價格刪除線 ==========================*/
        	
        	const salePriceCheck = document.querySelectorAll(".svcBlock-salePrice");
        	
        	for(let i = 0; i < salePriceCheck.length; i++){
        		const sale = salePriceCheck[i];
        		if(sale.textContent !== ""){
        			sale.previousElementSibling.style.textDecoration = "line-through";
        		}
        	}
        	
        	/*===================== 優惠background-color隱藏 ==========================*/
        	
        	const ifSaleName = document.querySelectorAll(".ifSaleName");
        	
        	for(let i = 0; i < ifSaleName.length; i++){
        		const saleName = ifSaleName[i];
        		if(saleName.textContent === ""){
        			console.log(saleName);
        			saleName.style.backgroundColor = "white";
        		}
        	}
        	
        	
        })
    </script>
</body>

</html>