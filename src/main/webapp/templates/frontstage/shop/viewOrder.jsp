<%@page import="com.web.order.model.entities.OrderMaster"%>
<%@page import="com.web.order.model.services.imp.OrderServiceImp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
	OrderServiceImp orderServiceImp = new OrderServiceImp();

	
	
%>
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
	
	<!-- Font Awesome Icons -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
	
	<!-- DataTables -->
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  	
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
					<li><a href="<%= request.getContextPath() %>/templates/frontstage/shop/shop.jsp">home</a></li>
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
                      								<td><i class="fas fa-sharp fa-solid fa-eye"></i></td>
                      								<td>cancel</td>
                    							</tr>
                  							<tbody>
                  							
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

</body>

</html>