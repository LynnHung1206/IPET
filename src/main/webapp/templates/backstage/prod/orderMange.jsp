<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List"%>
<%@ page import="com.web.order.model.entities.OrderDetail"%> 
<%@ page import="com.web.order.model.services.imp.OrderServiceImp"%>
<%@ page import="com.web.order.model.entities.OrderMaster" %>
<%@ page import="com.web.product.model.entity.Product"%>
<%@ page import="com.web.product.model.service.imp.ProductServiceFrontImp"%>

<%
	OrderServiceImp orderServiceImp = new OrderServiceImp();
	List<OrderMaster> list = orderServiceImp.findAllOrderMaster();
	pageContext.setAttribute("list", list);
	
	List<OrderDetail> detailList = (List<OrderDetail>) request.getAttribute("detailList");
	OrderMaster orderMaster = (OrderMaster) request.getAttribute("orderMaster");
	
	ProductServiceFrontImp productServiceFrontImp = new ProductServiceFrontImp();
	List<Product> productList = productServiceFrontImp.findAllProduct();
	pageContext.setAttribute("productList", productList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物</title>
  <!-- TODO: 目前先使用 完整css，後續再換成 min.css-->
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/static/backstage/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="${pageContext.request.contextPath}/static/backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE -->
  <script src="${pageContext.request.contextPath}/static/backstage/js/adminlte.js"></script>
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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
  	
  	th,
    td {
    	text-align: center;
     	vertical-align: middle;
    }
    
    a{
    	text-decoration: none;
    	color: inherit;
    }
    
    a.disabled{
    	pointer-events: none;
        cursor: default;
        text-decoration: none;
        color: black;
        opacity: 0.4;
    }
    
    label{
    	margin-bottom: 0;
    }
    
    input, select{
    	margin-left: 3%;
    	width: 94%
    }
    
  </style>
</head>
<!--
`body` tag options:

  Apply one or more of the following classes  to the body tag
  to get the desired effect

  * sidebar-collapse
  * sidebar-mini
-->
<body class="hold-transition sidebar-mini">
  <div class="wrapper">
  <!--  Navbar -->
  <%@ include file="/templates/backstage/common/navbar.jsp" %>
  <!-- /.navbar -->

  <!-- 左邊選單區 Main Sidebar Container -->
  <%@ include file="/templates/backstage/common/sidebar.jsp" %>
  <!-- /.aside -->

  <!-- 中間頁面 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
	<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">商城訂單總覽</h3>
              </div>
              <!-- /.card-header -->
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
                      <td>編輯</td>
                    </tr>
                  </thead>
                    
                  <tbody>
                    <c:forEach var="orderMaster" items="${list}">
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
                        <td><a href="detail?orderID=${orderMaster.orderID}"><i class="fas fa-sharp fa-solid fa-eye"></i></a></td>
                        <td id="edit"><a href="edit?orderID=${orderMaster.orderID}"><i class="fas fa-sharp fa-solid fa-pen"></i></a></td>
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
  <!-- /.content-wrapper -->
  	
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
  
  <!-- edit modal -->
  <c:if test="${openEditModal != null}">
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">編輯訂單</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
        
          <form action="edit" method="post" class="formEdit">
          <div class="card-body">
      	    <div class="modal-body">
          	  <p>
          	    <label for="">訂單編號:</label><br>
          	    <input type="text" name="orderID" value="${orderMaster.orderID}" disabled>
          	    <input type="text" name="orderID" value="${orderMaster.orderID}" hidden>
          	  </p>
          	  <p>
          	    <label for="">會員編號:</label><br>
          	    <input type="text" name="memID" value="${orderMaster.memID}" disabled>
          	    <input type="text" name="memID" value="${orderMaster.memID}" hidden>
          	  </p>
          	  <p>
          	    <label for="">訂單日期:</label><br>
          	    <input type="text" name="orderDate" value="<fmt:formatDate value="${orderMaster.orderDate}" pattern="yyyy-MM-dd"/>" disabled>
          	  </p>
          	  <p>
                <label for="">金額:</label><br>
          	    <input type="text" name="orderSum" value="${orderMaster.orderSum}">
          	  </p>
          	  <p>
          	    <label for="">訂單狀態:</label><br>
         	    <select name="orderStatus" id="">
        		  <option value="0">待出貨</option>
        		  <option value="1">已出貨</option>
        		  <option value="2">訂單結案</option>
        		  <option value="3">取消訂單</option>
    	  	    </select>
          	  </p>
          	  <p>
          	    <label for="">收件人姓名:</label><br>
          	    <input type="text" name="orderRecName" value="${orderMaster.orderRecName}">
          	  </p>
          	  <p>
          	    <label for="">收件人電話:</label><br>
          	    <input type="text" name="orderRecPhone" value="${orderMaster.orderRecPhone}">
          	  </p>
          	  <p>
          	    <label for="">收件人地址:</label><br>
          	    <input type="text" name="orderRecAddress" value="${orderMaster.orderRecAddress}">
          	  </p>
      	    </div>
          </div>
      	
      	  <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save</button>
      	  </div>
          </form>
        </div>
  	  </div>
    </div>
    <script>
  	  $('#editModal').modal('show');
    </script>
  </c:if>
  
</div>
<!-- ./wrapper -->

<!-- Main Footer -->
<%@ include file="/templates/backstage/common/footer.jsp" %>

<!-- Side Bar -->
<script>
	$("p:contains(訂單管理)").closest("li").addClass("menu-open");
	$("p:contains(訂單總覽)").closest("a").addClass("active");
</script>

<!-- REQUIRED SCRIPTS -->
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
	  } else if($(this).text() == 2) {
		  $(this).next().append('訂單結案');
		  $(this).next().css({
	             'color': 'white',
	             'background-color': '#9C9CA0'
	      });
		  $(this).parent().find('a:last').addClass('disabled');
	  } else if($(this).text() == 3) {
		  $(this).next().append('取消訂單');
		  $(this).next().css({
	             'color': 'white',
	             'background-color': '#EF5A5D'
	      });
	  }
  });
</script>

<script>
		$('.formEdit').on('submit', function (e) {
        	let form = this;
        	let orderID = $('input:first').val();
        	e.preventDefault();
        	swal({
            	title: '請確認是否修改訂單',
            	text: '你將會修改訂單 no.' + orderID,
            	icon: 'warning',
            	buttons: ['NO', 'YES'],
            	dangerMode: true,
        	}).then(function (isConfirm) {
            if (isConfirm) {
            	swal('修改成功','','success');
            	setTimeout(() => {
            		form.submit();
                }, 1000);
            }
       	 	});
   		});
	</script>

</body>
</html>
