<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.salonService.model.*"%>
<%@ page import="com.web.salonService.model.entities.*"%>
<%@ page import="com.web.salonService.model.services.*"%>
<%@ page import="com.web.salonService.model.dao.*"%>
<%@ page import="com.web.salonService.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

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
    
    	/* ============ 變更datatable樣式 =============*/
	    .page-item.active .page-link {
		    background-color: #7e4c4f;
		    border-color: #7e4c4f;
		}
		
		.page-link {
			color: #7e4c4f;
		}
		
		#example2_wrapper {
			width: 100%;
		}
		
		#example2_paginate {
			display: flex;
		    justify-content: center; 
		    align-items: center;
		}
		
		/* ============ /變更datatable樣式 =============*/
    	
    	.old {
    		margin-right: 7px;
    		font-size: 22px !important;
    	}
    	
    	.new {
            font-size: 22px !important;
            color: #e41313 !important;
        }
        
        .product-price span.old {
		    text-decoration: none;
		}
    
    	.product-price span::before {
    		background-color: #f6f6f6;
    	}
    
        li.active {
            padding-right: 0;
        }

        .pet-style-label {
		    float: right;
		    display: inline-block;
		    background-color: #7e4c4f;
		    box-sizing: border-box;
		    padding: 6px 10px;
		    position: relative;
		    top: 3px;
		    text-align: center;
		    color: white !important;
		    font-weight: 600;
		}

        .inline-block-h4 {
            display: inline-block;
            margin-top: 20px;
            position: relative;
            top: 5px;
        }

        .inline-block-h4 a {
            font-size: 22px;
        }

        .product-list-content>p {
            padding-top: 15px;
        }


        .product-img {
            width: 270px;
            height: 270px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }

        ul.view-mode {
            margin-bottom: 20px;
        }

        /* ============ 查詢區 =============*/
        .aType {
        	height: 27px;
     		display: contents;
        }
        
        .pet-type {
		    background-color: white;
		}
		
		.pet-type label {
			padding: 14px 0 0 25%;
			width: 100%;
		}
		
		.pet-type label:hover, #pet-size:hover {
			cursor: pointer;
		}
		
		.pet-type:hover {
			background-color: #efefef;
			cursor: pointer;
		}
		
		.pet-type.on {
	      background-color: #fffacf;
    	}
    	
    	.cantSee {
			display: none !important;
		}
		
		#choose-pet-father {
			margin-bottom: 30px;
			margin-top: 15px;
		}
		
    </style>
</head>

<body>
    <%@include file="/templates/frontstage/common/header.jsp"%>
    
    
    <div class="breadcrumb-area pt-55 pb-40 bg-img" style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2 id="titleCatName"></h2>
                <ul>
                    <li><a href="index.html">home</a></li>
                    <li class="active">美容服務</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="shop-area pt-100 pb-100 gray-bg">
        <div class="container">
            <div class="row flex-row-reverse">
                <div class="col-lg-9">
                    <div class="grid-list-product-wrapper">
                        <div class="product-view product-list">
                            <div class="row">
                            
                            <table id="example2" class="table">
			                    <thead style="display: none;">
			                    </thead>
			                    <tfoot>
			                    </tfoot>
			                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="shop-sidebar">
                    
                    	<div class="shop-widget">
                            <div class="shop-search mt-15 mb-30">
                                <form class="shop-search-form">
                                    <input type="text" id="searchSvcName">
                                    <button type="submit">
                                        <i class="icon-magnifier"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        
                        <div class="shop-widget">
                            <h4 class="shop-sidebar-title">寵物品種</h4>
	                        <div id="choose-pet-father">
									<select id="pet-size" class="form-control custom-select">
										<option selected style="display: none;">請選擇寵物體型</option>
										<option>大型犬</option>
										<option>中型犬</option>
										<option>小型犬</option>
									</select>
									<div class="choose-type-price" id="showBigDog">
										<div class="pet-type on">
											<input type="radio" class="aType" value="" id="allType">
											<label for="allType" class="pet-label">所有犬種</label>
										</div>
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
											<input type="radio" id="pet-type<%=typeId%>" class="aType" value="<%=petType.getTypeName()%>" name="typeId">
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
											<input type="radio" id="pet-type<%=typeId%>" class="aType" value="<%=petType.getTypeName()%>" name="typeId">
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
											<input type="radio" id="pet-type<%=typeId%>" class="aType" value="<%=petType.getTypeName()%>" name="typeId">
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
							</div>
                        
                        <div class="shop-widget">
                            <h4 class="shop-sidebar-title">價格區間</h4>
                            <p></p>
                            <input type="text" class="form-control" placeholder="$ 最低價" id="lowerPrice">
								<p></p>
							<input type="text" class="form-control" placeholder="$ 最高價" id="highestPrice">
                        </div>

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
        	$("#titleCatName").text(${services}[0].catName);
        	
        	const datatable = $('#example2').DataTable({
        		"dom": "tp",
                "paging": true,
                "pageLength": 5,
                "lengthChange": false,
                "ordering": true,
                "autoWidth": false,
                "responsive": true,
                "data": ${services},
                "columns" : [
                	{ data: "svcId", "visible": false, className: "svcId" },
                	{ data: "svcName", "visible": false, className: "svcName" },
                	{ data: "typeName", "visible": false, className: "typeName" },
                	{ data: "svcPrice", "visible": false, className: "svcPrice" },
		            { data: null,
		            	render: function(data, type){
		            		const svcPrice = data.svcPrice;
		            		const salePrice = data.salePrice;
		            		
		            		const notOnSale = `<span class="old">$ ` + svcPrice + `</span>`;
		            		const onSale = `
						            		<span class="old" style="text-decoration:line-through;">$ ` + svcPrice + `</span>
				                            <span class="new"> ` + salePrice + `</span>`;
				            
				            const showHtml1 = `
				            	<div class="product-width col-lg-6 col-xl-4 col-md-6 col-sm-6">
	                            <div class="product-wrapper mb-10">
	                                <div class="product-img" style="background-image: url(${pageContext.request.contextPath}/ipet-front/service/showSvcImg?svcId=` + data.svcId + `);"></div>
	                                <div class="product-list-content">
	                                    <h4 class="inline-block-h4"><a title="Quick View" data-toggle="modal"
	                                            data-target="#exampleModal" href="#">` + data.svcName + `</a></h4>
	                                    <span class="pet-style-label">` + data.typeName + `</span>
	                                    <p>` + data.svcContent + `</p>
	                                    <div class="product-price">
				            `;
				            
				            const showHtml2 = `
						            	</div>
		                                <div class="product-list-action">
		                                    <div class="product-list-action-left">
		                                        <a class="addtocart-btn" title="Add to cart" href="#"><i
		                                                class="ion-bag"></i> 我要預約</a>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>		
				            `;
				                            
				            if(svcPrice === salePrice){
				            	return showHtml1 + notOnSale + showHtml2;
				            }else{
				            	return showHtml1 + onSale + showHtml2;
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
        	
            /*===================== 搜索 ==========================*/
        	$("#searchSvcName").on('keyup click', function () {
        		datatable.search($(this).val()).draw();
        	});
            
        	$(".aType").on("click", function () {
                datatable.columns(".typeName").search($(this).val()).draw();
            });
            
//         	let min = $('#lowerPrice');
//             let max = $('#highestPrice');
         
//             // Custom range filtering function
//             $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
//                 const min = parseInt(min.val(), 10);
//                 const max = parseInt(max.val(), 10);
//                 const price = parseFloat(data[2]) || 0; // use data for the age column
         
//                 if (
//                     (isNaN(min) && isNaN(max)) ||
//                     (isNaN(min) && price <= max) ||
//                     (min <= price && isNaN(max)) ||
//                     (min <= price && price <= max)
//                 ) {
//                     return true;
//                 }
         
//                 return false;
//             });
         
//             // Changes to the inputs will trigger a redraw to update the table
//             min.on('input', function () {
//             	datatable.draw();
//             });
//             max.on('input', function () {
//             	datatable.draw();
//             });

        	/*===================== 寵物品種查詢變色 ==========================*/
        	$(".pet-type").on("click", function () {
                $(".pet-type").removeClass("on");
                $(this).addClass("on");
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
        	
        	
        })
    </script>
</body>

</html>