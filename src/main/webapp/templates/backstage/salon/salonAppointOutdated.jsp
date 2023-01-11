<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物 | 美容專區 | 逾時未到的預約</title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="/static/backstage/plugins/fontawesome-free/css/all.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/static/backstage/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="/static/backstage/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="/static/backstage/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="/static/backstage/plugins/datatables-select/css/select.bootstrap4.css">

  <!-- TODO: 目前先使用 完整css-->
  <!-- Theme style -->
  <link rel="stylesheet" href="/static/backstage/css/adminlte.css">
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
      background: url("../../../static/backstage/img/more.png") no-repeat center;
      background-size: 25px;
      cursor: pointer;
    }
    tr.shown td.details-control {
      background: url("../../../static/backstage/img/close.png") no-repeat center;
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
              <li class="breadcrumb-item"><a href="/templates/backstage/index.htmljsp">Home</a></li>
              <li class="breadcrumb-item">美容預約管理</li>
              <li class="breadcrumb-item active"><a href="/templates/backstage/salon/salonAppointCancelled.jsp">已取消的預約</a></li>
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
                    <th></th>
                    <th></th>
                  </tr>
                  </thead>
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

    <!-- Remove Modal content   -->
    <div class="modal fade" id="RemoveModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">資料刪除</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            確認要刪除此筆資料?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            <button type="submit" class="btn btn-danger btn-remove-confirm">確認</button>
          </div>
        </div>
      </div>
    </div>
    <!-- /.Remove Modal content   -->

    <!-- Edit Modal content   -->
    <div class="modal fade" id="EditModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">資料編輯</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="reserveDate-modal" class="col-form-label">預約日期</label>
                <input type="date" class="form-control" id="reserveDate-modal" readonly>
              </div>
              <div class="form-group">
                <label for="reservePeriod-modal" class="col-form-label">預約時段</label>
                <input type="text" id="reservePeriod-modal"  class="form-control"  readonly>
              </div>
              <div class="form-group">
                <label for="reserveStatus-modal" class="col-form-label">預約單狀態</label>
                <select id="reserveStatus-modal" class="form-control">
                  <option value="1">已支付訂金</option>
                  <option value="2">已完成預約</option>
                  <option value="3">已取消</option>
                  <option value="4">逾時未到</option>
                </select>
              </div>
              <div class="form-group">
                <label for="jobId-modal" class="col-form-label">班表編號</label>
                <select id="jobId-modal" class="form-control">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            <button type="submit" class="btn btn-primary btn-edit-confirm">確認修改</button>
          </div>
        </div>
      </div>
    </div>
    <!-- /. Edit Modal content   -->

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
<script src="/static/backstage/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/static/backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="/static/backstage/js/adminlte.js"></script>

<!-- DataTables  & Plugins -->
<script src="/static/backstage/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/static/backstage/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/static/backstage/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/static/backstage/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/static/backstage/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/static/backstage/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/static/backstage/plugins/jszip/jszip.min.js"></script>
<script src="/static/backstage/plugins/pdfmake/pdfmake.min.js"></script>
<script src="/static/backstage/plugins/pdfmake/vfs_fonts.js"></script>
<script src="/static/backstage/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/static/backstage/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/static/backstage/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="/static/backstage/plugins/datatables-select/js/dataTables.select.js" ></script>


<!-- sidebar menu Class -->
<script>
  $("p:contains(美容預約管理)").closest("li").addClass("menu-open");
  $("p:contains(已取消的預約)").closest("a").addClass("active");
</script>

<!-- DataTable show child row -->
<script>
  /* Formatting function for row details - modify as you need */
  function format ( d ) {
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


    for (let i = 0; i < d.serviceId.length; i ++){
      tbody += `
        <tr>
            <td>${d.serviceId[i]}</td>
            <td>${d.serviceName[i]}</td>
            <td>${d.servicePrice[i]}</td>
            <td>${d.saleId[i]}</td>
            <td>${d.saleName[i]}</td>
            <td>${d.salePrice[i]}</td>
        </tr>
        `
    }

    tbody += `
                <tr>
                  <td colspan="6" style="border-top: 1px solid #dee2e6;
                  border-right: 1px solid #dee2e6;
                  border-bottom: 1px solid #dee2e6"><b>顧客備註</b>: ${d.clientNote}</td>
                </tr>
                </tbody>
            `;
    return tbody;
  }

  $(document).ready(function() {
    let table = $('#reserveTable').DataTable({
      autoWidth: false,
      responsive: true,
      lengthChange: true,
      info: true,
      altEditor: true,     // Enable altEditor
      ajax: "/templates/backstage/salon/objects.txt",

      //  填寫直接顯示的欄位，需要與thead tfoot 對應
      "columns": [
        { data: "reserveId",  responsivePriority: 1,  className: "reserveId"},
        { data: "memberName",  responsivePriority: 2,  className: "memberName"},
        { data: "petName",  className: "petName"},
        { data: "reserveDate",  responsivePriority: 3 , className: "reserveDate"},
        { data: "reservePeriod",  responsivePriority: 4, className: "reservePeriod"},
        { data: "totalPrice", className: "totalPrice" },
        { data: "reserveStatus", className: "reserveStatus"},
        { data: "jobId", className: "jobId"},
        {
          className:      'details-control',
          orderable:      false,
          data:           null,
          defaultContent: '',
          responsivePriority: 5,
          type: "readonly"
        },
        {
          data: null,
          defaultContent:
                  '<button type="submit" class="btn btn-light" data-toggle="modal" data-target="#EditModal" data-whatever="@mdo">' +
                  '<i class="fas fa-solid fa-pen"></i>' +
                  '</button>',
          className: 'row-edit dt-center',
          orderable: false,
          responsivePriority: 6
        },
        {
          data: null,
          defaultContent:
                  '<button type="submit" class="btn btn-danger" data-toggle="modal" data-target="#RemoveModal">\n' +
                  ' <i class="fas fa-solid fa-trash"></i>' +
                  '</button>',
          className: 'row-remove dt-center',
          orderable: false,
          responsivePriority: 7
        }
      ],
      select: {
        style: 'single',
        toggleable: false
      },
      order: [[1, 'asc']]
    });




    // Add event listener for opening and closing details
    $('#reserveTable tbody').on('click', 'td.details-control', function () {
      let tr = $(this).closest('tr');
      let row = table.row( tr );
      console.log(row.data());

      if ( row.child.isShown() ) {
        // This row is already open - close it
        row.child.hide();
        tr.removeClass('shown');
      }
      else {
        // Open this row
        row.child( format(row.data()) ).show();
        tr.addClass('shown');
      }
    });


    // TODO: (需要重寫) Delete data from modal
    $('#reserveTable tbody').on('click', 'td.row-remove', function (){
      // TODO: 從資料庫移除資料
      let targetData = $(event.target).closest("tr");
      $('.modal-footer').on('click', '.btn-remove-confirm', function (){
        targetData.remove();
        // table.ajax().reload();
        $('#RemoveModal').modal('hide');
      })
    });


    // TODO: (需要重寫)  Edit data from modal
    $('#reserveTable tbody').on('click', 'td.row-edit', function (){
      // TODO: 將資料庫的資料顯示在 Modal 上
      let targetData = $(event.target).closest("tr")[0]; // get tr data

      //  1. edit the reserveDate
      $('#reserveDate-modal').val(targetData.querySelector("td.reserveDate").innerText);

      //  2. edit the reserveStatus
      switch (targetData.querySelector("td.reservePeriod").innerText) {
        case "已支付訂金":
          $('#reserveStatus-modal').val(1);
          return;
        case "已完成預約":
          $('#reserveStatus-modal').val(2);
          return;
        case "已取消":
          $('#reserveStatus-modal').val(3);
          return;
        case "逾時未到":
          $('#reserveStatus-modal').val(4);
          return;
      }

      //  3. edit the reservePeriod
      $('#reservePeriod-modal').val(targetData.querySelector("td.reservePeriod").innerText);

      // 4. edit the jobId
      $('#jobId-modal').val(targetData.querySelector("td.jobId").innerText);

      // TODO: 從資料庫修改資料，並重新顯現在 table 上 (以下方法由於目前是使用靜態資料，故是失效的)
      $('.modal-footer').on('click', '.btn-edit-confirm', function (){
        // 1. update the reserveDate
        targetData.querySelector("td.reserveDate").innerText = $('#reserveDate-modal').val();

        // 2. update the reserveStatus
        switch ($('#reserveStatus-modal').val()) {
          case 1:
            targetData.querySelector("td.reserveStatus").innerText = "已支付訂金";
            table.ajax().reload();
            return;
          case 2:
            targetData.querySelector("td.reserveStatus").innerText = "已完成預約";
            table.ajax().reload();
            return;
          case 3:
            targetData.querySelector("td.reserveStatus").innerText = "已取消";
            table.ajax().reload();
            return;
          case 4:
            targetData.querySelector("td.reserveStatus").innerText = "逾時未到";
            table.ajax().reload();
            return;
        }
        console.log(targetData.querySelector("td.reserveStatus").innerText);

        // 3. update the reservePeriod
        targetData.querySelector("td.reservePeriod").innerText = $('#reservePeriod-modal').val();

        // 4. update the jobId
        targetData.querySelector("td.jobId").innerText = $('#jobId-modal').val();

        $("#EditModal").modal("hide");
      })
    })
  });
</script>
</body>
</html>
