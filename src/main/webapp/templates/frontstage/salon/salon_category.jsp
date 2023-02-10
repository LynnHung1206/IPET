<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>瀏覽美容類別 | IPET寵物商城</title>
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
    <!-- sweetalert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
    <style>
    
    li.active {
       	padding-right: 0;
   	}
    /* ============ 我要預約按鈕樣式 =============*/
    	.addtocart-btn {
    	    background-color: #7e4c4f;
		    color: white;
		    font-weight: 700;
		    border: 1px solid #7e4c4f;
		    padding: 14px 33px;
		    border-radius: 26px;
    	}
    	
    	.addtocart-btn:hover{
    		cursor: pointer;
    	    background-color: #8b585b;
    	}
    
    </style>
    
</head>

<body>
    <%@include file="/templates/frontstage/common/header.jsp"%>
    <div class="breadcrumb-area pt-95 pb-95 bg-img" style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>美容服務</h2>
                <ul>
                    <li><a href="index.html">home</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/ipet-front/salon/salonCategory">美容服務</a></li>
                </ul>
                <p></p>
                <button class="addtocart-btn">我要預約</button>
            </div>
        </div>
    </div>
    <div class="shop-area pt-100 pb-100">
        <div class="container">
            <div class="row flex-row-reverse">
                <div class="col-lg-12 col-md-8">
                    <div class="row">
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=1"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-4.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=1">基礎美容</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li><b>價格範圍:</b> <span>NT$750 - $1200 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=2"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-5.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=2">造型美容</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li><b>價格範圍:</b> <span>NT$1500 - $3500 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=3"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-6.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=3">頂級SPA</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li><b>價格範圍:</b> <span>NT$4000 - $5000 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="blog-wrapper mb-30 gray-bg">
                                <div class="blog-img hover-effect">
                                    <a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=4"><img alt="" src="${pageContext.request.contextPath}/static/frontstage/img/blog/blog-7.jpg"></a>
                                </div>
                                <div class="blog-content">
                                    <h4><a href="${pageContext.request.contextPath}/ipet-front/salon/service?catId=4">深層護理</a></h4>
                                    <div class="blog-meta">
                                        <ul>
                                            <li>價格範圍: <span>NT$4500 - $6000 (依體型而定)</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
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
    
    <script>
    $(function () {
    	
    	/*===================== 點擊我要預約，檢查是否有寵物資訊定跳轉頁面 ==========================*/
    	$(document).on("click", ".addtocart-btn", function (e){
    		$.ajax({
      	        url : "${pageContext.request.contextPath}/ipet-front/salon/addAppointment",
      	        type : "POST",
      	        success : function(response) {
      	        	if(response === "noPet"){
      	        		swal({
    		    	    	title: "Welcome！",
    		    	    	text: "還沒有新增毛孩的資訊，將跳轉到新增頁面！",
    		    	    }, function(){
	    		    	    location.replace("${pageContext.request.contextPath}/ipet-front/pet/addNew");	
    		    	    });
      	        	}else{
      	        		let actionForm = $('<form>', {'action': '${pageContext.request.contextPath}/ipet-front/salon/addAppointment', 'method': 'post'}).append($('<input>', {'type': 'hidden'}));
      	        		actionForm.appendTo('body').submit();
      	        	}
      	        },error: function(response) {
      	        	showSwal("something-Wrong");
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