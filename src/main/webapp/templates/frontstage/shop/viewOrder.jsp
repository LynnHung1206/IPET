<%@ page import="com.web.member.model.entity.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.web.product.model.entity.Product"%>
<%@ page import="com.web.product.model.service.imp.ProductServiceFrontImp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.web.order.model.entities.OrderMaster"%>
<%@ page import="com.web.order.model.services.imp.OrderServiceImp"%>

<% 
	OrderServiceImp orderServiceImp = new OrderServiceImp();
	Member member = (Member) request.getSession().getAttribute("member");
	List<OrderMaster> OrderMasterList = orderServiceImp.findOrderMasterBymemID(member.getMemId());
	pageContext.setAttribute("OrderMasterList", OrderMasterList);
	
	ProductServiceFrontImp productServiceFrontImp = new ProductServiceFrontImp();
	List<Product> productList = productServiceFrontImp.findAllProduct();
	pageContext.setAttribute("productList", productList);
%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>IPET寵物商城</title>
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
	
	<!-- Font Awesome Icons -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
	
	<!-- DataTables -->
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    
    <!-- test -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">   
    <!-- test -->
  	<style>
  		th,td {
    		text-align: center;
     		vertical-align: middle;
    	}
  	</style>
</head>

<body>
	<!-- header -->
	<%@include file="/templates/frontstage/common/header.jsp"%>

	<!-- breadcrumb -->
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>Order</h2>
				<ul>
					<li><a href="${pageContext.request.contextPath}/ipet-front/shop/home">home</a></li>
					<li class="active">Shop</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="shop-area pt-50 pb-50 gray-bg">
		<div class="container">
			<div>
				<!-- Main content -->
				<section class="content">
      				<div class="container-fluid">
        				<div class="row">
          					<div class="col-12">
            					<div class="card">
              						<div class="card-header">
                						<h4 class="card-title">訂單總覽</h4>
              						</div>
              						
              						<!-- /.card-body -->
              						<div class="card-body">
                						<table id="example2" class="table table-bordered table-hover">
                  							<thead>
                    							<tr>
                      								<td>訂單編號</td>
                      								<td>會員編號</td>
                      								<td>訂單日期</td>
                      								<td>金額</td>
                      								<td hidden>訂單狀態</td>
                      								<td>訂單狀態</td>
                     								<td>收件人姓名</td>
                      								<td>收件人電話</td>
                      								<td>收件人地址</td>
                      								<td>查看明細</td>
                      								<td>取消訂單</td>
                    							</tr>
                  							</thead>
                  								
                  							<tbody>
                  								<c:forEach var="orderMaster" items="${OrderMasterList}">
                  								<tr>
                      								<td>${orderMaster.orderID}</td>
                      								<td>${orderMaster.memID}</td>
                      								<td><fmt:formatDate value="${orderMaster.orderDate}" pattern="yyyy-MM-dd"/></td>
                      								<td>${orderMaster.orderSum}</td>
                      								<td class="orderStatus" hidden>${orderMaster.orderStatus}</td>
                      								<td></td>
                     								<td>${orderMaster.orderRecName}</td>
                      								<td>${orderMaster.orderRecPhone}</td>
                      								<td>${orderMaster.orderRecAddress}</td>
                      								<td><a href="orderDetail?orderID=${orderMaster.orderID}"><i class="fas fa-sharp fa-solid fa-eye"></i></a></td>
                      								<td>
                      									<form action="cancel" method="post" class="formCancel">
                      										<input type="hidden" name="orderID" value="${orderMaster.orderID}">
                      										<button type="submit" class="btn btn-danger">取消</button>
                      									</form>
                      								</td>
                      							</tr>
                    							</c:forEach>
                  							</tbody>
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
		</div>
	</div>
	
	
	
	<!-- footer -->
	<%@include file="/templates/frontstage/common/footer.jsp"%>
	
	<!-- all js here -->
    <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/jquery-1.12.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    	$(document).ready(function () {
      		$('#example2').DataTable({
        		"paging": true,
        		"lengthChange": false,
        		"searching": false,
        		"ordering": true,
        		"info": true,
        		"autoWidth": false,
        		"responsive": true,
      		});
    	});
  	</script>
  	
	<script>
  		$('.orderStatus').each(function(){
	  		if($(this).text() == 0){
		 		$(this).next().append('待出貨');
		 		$(this).next().css({
             		'color': 'white',
             		'background-color': '#E4E88B'
         	});
	  		} else if($(this).text() == 1) {
		  		$(this).next().append('已出貨');
		  		$(this).next().css({
	             	'color': 'white',
	             	'background-color': '#8D97FF'
	      		});
		  		$(this).parent().find('button').attr('disabled', '');
	  		} else if($(this).text() == 2) {
		  		$(this).next().append('訂單結案');
		  		$(this).next().css({
	             	'color': 'white',
	             	'background-color': '#9C9CA0'
	      		});
		  		$(this).parent().find('button').attr('disabled', '');
	  		} else if($(this).text() == 3) {
		  		$(this).next().append('取消訂單');
		  		$(this).next().css({
	             	'color': 'white',
	             	'background-color': '#EF5A5D'
	      		});
		  		$(this).parent().find('button').attr('disabled', '');
	  		}
  		});
	</script>
	
	<script>
		$('.formCancel').on('submit', function (e) {
        	let form = this;
        	let orderID = $(this).parent().parent().children('td:first').text();
        	e.preventDefault();
        	swal({
            	title: '請確認是否取消訂單',
            	text: '你將會取消訂單 no.' + orderID,
            	icon: 'warning',
            	buttons: ['NO', 'YES'],
            	dangerMode: true,
        	}).then(function (isConfirm) {
            if (isConfirm) {
            	swal('取消成功','','success');
            	setTimeout(() => {
            		form.submit();
                }, 1000);
            }
       	 	});
   		});
	</script>

  <!-- order detail modal -->
  <c:if test="${openDetailModal != null}">
    <div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">訂單編號: ${detailList[0].orderID}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          
          <div class="card-body">
            <div class="modal-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <td>產品編號</td>
                    <td>產品名稱</td>
              		<td>數量</td>
              		<td>單價</td>
              		<td>小計</td>
            	  </tr>
          		</thead>
          		
          		<tbody>
          		  <c:forEach var="detail" items="${detailList}">
            	    <tr>
              		  <td>${detail.prodID}</td>
              		  <c:forEach var="product" items="${productList}">
                	    <c:if test="${detail.prodID == product.prodID}">
                  	  	  <td>${product.prodName}</td>
                		</c:if>
              		  </c:forEach>
              		  <td>${detail.detailQuantity}</td>
              		  <td>${detail.detailPrice}</td>            
              		  <td><fmt:formatNumber type="number" value="${detail.detailQuantity*detail.detailPrice}"/></td> 
            		</tr>
          		  </c:forEach> 
          		</tbody>
        	  </table>
      		</div>
      	  </div>
      
      	  <div class="modal-footer">
        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      	  </div>
    	</div>
  	  </div>
  	</div>
  
    <script>
  	  $('#orderDetailModal').modal('show');
    </script>
  </c:if>

</body>

</html>