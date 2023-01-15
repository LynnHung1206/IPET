<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物 | 美容專區 | 已完成的預約</title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/datatables-select/css/select.bootstrap4.css">

  <!-- TODO: 目前先使用 完整css-->
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
  <!-- childTable style -->
  <style>
    .childTable th{
      background-color: rgb(238, 182, 149, 0.45);
    }

    .childTable tr:nth-child(even){
      background-color: #fffaf082;
    }

    .childTable tr:nth-child(odd){
      background-color: #fffffc !important;
    }

    td.details-control {
      background: url("${pageContext.request.contextPath}/static/backstage/img/more.png") no-repeat center;
      background-size: 25px;
      cursor: pointer;
    }
    tr.shown td.details-control {
      background: url("${pageContext.request.contextPath}/static/backstage/img/close.png") no-repeat center;
      background-size: 20px;
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/ipet-back/home">Home</a></li>
              <li class="breadcrumb-item">美容預約管理</li>
              <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/ipet-back/appoint/appoints_finished">已完成的預約</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <!-- Filter -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">預約單 Filter</h3>
              </div>
              <div class="card-body">
                <form>
                  <div class="row">
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>預約單編號</label>
                        <input type="text" class="form-control column_filter" id="col0-search"  data-column="0" placeholder="Enter ...">
                      </div>
                      <!-- text input -->
                      <div class="form-group">
                        <label>會員姓名</label>
                        <input type="text" class="form-control column_filter" id="col1-search" data-column="1" placeholder="Enter ...">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>寵物名字</label>
                        <input type="text" class="form-control column_filter" id="col2-search" data-column="2" placeholder="Enter ...">
                      </div>
                      <!-- text input -->
                      <div class="form-group">
                        <label>預約日期</label>
                        <input type="text" class="form-control column_filter" id="col3-search" data-column="3" placeholder="Enter ...">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>預約時段</label>
                        <input type="text" class="form-control column_filter" id="col4-search" data-column="4" placeholder="Enter ...">
                      </div>
                      <!-- text input -->
                      <div class="form-group">
                        <label>實付金額</label>
                        <input type="text" class="form-control column_filter" id="col5-search" data-column="5" placeholder="Enter ...">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <!-- text input -->
                      <div class="form-group">
                        <label>預約單狀態</label>
                        <input type="text" class="form-control column_filter" id="col6-search" data-column="6" placeholder="Enter ...">
                      </div>
                      <!-- text input -->
                      <div class="form-group">
                        <label>班表編號</label>
                        <input type="text" class="form-control column_filter" id="col7-search" data-column="7" placeholder="Enter ...">
                      </div>
                    </div>
                  </div>

                </form>
              </div>
            </div>
            <!-- /.filter -->

            <!-- table -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="reserveTable" class="table table-bordered table-striped  display">
                  <thead>
                  <tr>
                    <th>預約單編號</th>
                    <th>會員姓名</th>
                    <th>寵物名字</th>
                    <th>預約日期</th>
                    <th>預約時段</th>
                    <th>實付金額</th>
                    <th>預約單狀態</th>
                    <th>班表編號</th>
                    <th>服務詳情</th>
                  </tr>
                  </thead>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.table -->
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
<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-select/js/dataTables.select.js" ></script>



<!-- sidebar menu Class -->
<script>
  $("p:contains(美容預約管理)").closest("li").addClass("menu-open");
  $("p:contains(已完成的預約)").closest("a").addClass("active");
</script>

<!-- DataTable show child row -->
<script>
  let table;
  function format (detailService) {
    // `d` is the original data object for the row
    let tbody = `
        <tbody class="childTable">
          <tr>
              <th>服務編號</th>
              <th>服務名稱</th>
              <th>服務價格</th>
              <th>優惠方案編號</th>
              <th>優惠方案名稱</th>
              <th>優惠方案價</th>
          </tr>`;


    for (let detail of detailService.appointmentDetails){
      tbody += `
        <tr>
            <td>\${detail.svcId}</td>
            <td>\${detail.svcName}</td>
            <td>\${detail.svcPrice}</td>
            <td>\${detail.saleId}</td>
            <td>\${detail.saleName}</td>
            <td>\${detail.salePrice}</td>
        </tr>
        `
    }

    tbody += `
                </tbody>
            `;
    return tbody;
  }

  $(document).ready(function() {
   table = $('#reserveTable').DataTable({
      autoWidth: false,
      responsive: true,
      lengthChange: true,
      info: true,
      altEditor: true,     // Enable altEditor
      data: ${appoints},

      //  填寫直接顯示的欄位，需要與thead tfoot 對應
      "columns": [
        {data: "apmID", responsivePriority: 1,  className: "reserveId"},
        {data: "memName", responsivePriority: 2,  className: "memberName"},
        {data: "petName", className: "petName"},
        {data: "schDate", responsivePriority: 3 , className: "reserveDate"},
        {data: "schPeriod", responsivePriority: 4, className: "reservePeriod"},
        {data: "totalPrice", className: "totalPrice" },
        {data: "apmStatusDesc", className: "reserveStatus"},
        {data: "schID", className: "jobId"},
        {
          className:      'details-control',
          orderable:      false,
          data:           null,
          defaultContent: '',
          responsivePriority: 5,
          type: "readonly"
        }
      ],
      select: {
        style: 'single',
        toggleable: false
      },
      order: [[0, 'desc']],
      fnDrawCallback: function (){}
    });

    <!-- Add event listener for opening and closing details -->
    $('#reserveTable tbody').on('click', 'td.details-control', function () {
      let tr = $(this).closest('tr');
      let row = table.row( tr );

      if ( row.child.isShown() ) {
        // This row is already open - close it
        row.child.hide();
        tr.removeClass('shown');
      }
      else {
        // Open this row
        row.child(format(row.data())).show();
        tr.addClass('shown');
      }
    });

    $('input.column_filter').on('keyup click', function () {
      filterColumn($(this).attr('data-column'));
    });


  });

  function filterColumn(i) {
    table.column(i)
            .search($('#col' + i + '-search').val())
            .draw();
  }
</script>
</body>
</html>
