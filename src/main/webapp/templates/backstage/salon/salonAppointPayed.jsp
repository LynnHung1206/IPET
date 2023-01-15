<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物 | 美容專區 | 已付訂金的預約</title>
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
              <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/ipet-back/appoint/appoints_payed">已付訂金的預約</a></li>
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
                    <th></th>
                    <th></th>
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
              <%-- 預約日期 --%>
              <div class="form-group">
                <label for="reserveDate-modal-edit" class="col-form-label">預約日期</label>
                <input type="date" class="form-control" id="reserveDate-modal-edit" readonly>
              </div>
              <%-- 預約時段 --%>
              <div class="form-group">
                <label for="reservePeriod-modal-edit" class="col-form-label">預約時段</label>
                <input type="text" id="reservePeriod-modal-edit"  class="form-control"  readonly>
              </div>
              <%-- 預約單狀態 --%>
              <div class="form-group">
                <label for="reserveStatus-modal-edit" class="col-form-label">預約單狀態</label>
                <select id="reserveStatus-modal-edit" class="form-control">
                  <option value="0">已支付訂金</option>
                  <option value="1">已完成預約</option>
                  <option value="2">已取消</option>
                  <option value="3">逾時未到</option>
                </select>
              </div>

              <div>
                <button type="button" class="btn btn-outline-dark" id="searchAvailableJob">查詢可用班表</button>
              </div>
              <%-- 班表編號 --%>
              <div class="form-group">
                <label for="jobId-modal-edit" class="col-form-label">班表編號</label>
                <select id="jobId-modal-edit" class="form-control">
                </select>
              </div>
              <%-- 備註 --%>
              <div>
                <label for="jobId-modal-edit" class="col-form-label">顧客備註</label>
                <textarea id="clientNote-modal-edit" class="form-control"></textarea>
              </div>
              <div>
                <p id="editModalMessage"></p>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">離開</button>
            <button data-toggle="modal" class="btn btn-primary btn-edit-confirm">確認修改</button>
          </div>
        </div>
      </div>
    </div>
    <!-- /. Edit Modal content   -->

    <!-- Edit Confirm Modal content   -->
    <div class="modal fade" id="EditConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">確認修改</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            確認要修改此筆資料? <br>
            <p style="color: red">注意! 若更改狀態為 "已取消"、"已完成預約" 或 "逾時未到"，該筆資料後續將無法再被更改。</p>
            <br>
            <p id="editConfirmModalMessage"></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">離開</button>
            <button type="submit" class="btn btn-danger btn-edit-confirm-confirm" >確認修改</button>
          </div>
        </div>
      </div>
    </div>
    <!-- /.Edit Confirm Modal content   -->

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
  $("p:contains(已付訂金的預約)").closest("a").addClass("active");
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
      altEditor: false,     // Enable altEditor
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
        {data: null,
          className:      'details-control',
          orderable:      false,
          defaultContent: '',
          responsivePriority: 5
        },
        {data: "customerNote", className: "customerNote", orderable: false},
        {
          data: null,
          defaultContent:
                  '<button type="submit" class="btn btn-light" data-toggle="modal" data-target="#EditModal" data-whatever="@mdo">' +
                  '<i class="fas fa-solid fa-pen"></i>' +
                  '</button>',
          className: 'row-edit dt-center',
          orderable: false,
          responsivePriority: 6
        }
      ],
      select: {
        style: 'single',
        toggleable: false
      },
      order: [[0, 'desc']],
      fnDrawCallback : function (){
        <!-- 當預約狀態不是 "已支付訂金時", 直接移除 可編輯按鈕 -->
        $("#reserveTable tr").each(function (){
          if (this.querySelector(".reserveStatus").innerText !== "已支付訂金"){
            this.querySelector(".row-edit").innerHTML = "";
          }
        });

        <!--  Edit data from modal -->
        let apmIDEdit;
        let targetDataEdit;
        let apmObjectEdit;
        let editRefresh;
        $('td.row-edit').on('click',  function (){
          // get the selected tr
          targetDataEdit = $(event.target).closest("tr")[0];
          apmIDEdit = targetDataEdit.querySelector("td.reserveId").innerText.trim();


          // send the request to server, and response the data on the modal
          $.ajax({
            url: "${pageContext.request.contextPath}/ipet-back/appoint/editModalInput",
            method: "POST",
            data:{"apmID": apmIDEdit},
            success : function (resp){
              if (resp !== ""){
                apmObjectEdit = JSON.parse(resp);
                // 載入預約狀態 並選擇起來
                $('#reserveStatus-modal-edit  option[value="' + apmObjectEdit.appoint.apmStatus + '"]').attr("selected");
                console.log(apmObjectEdit.appoint.apmStatus);

                // 載入note
                $("#clientNote-modal-edit").val(apmObjectEdit.appoint.customerNote);

                // 載入原始班表並鎖定
                $("#jobId-modal-edit").html(`<option value="\${apmObjectEdit.appoint.schID}" selected>(\${apmObjectEdit.appoint.schID}) \${apmObjectEdit.appoint.schDate} \${apmObjectEdit.appoint.schPeriod} </option>`);
                $("#jobId-modal-edit").prop("disabled", true);

                // 載入原始日期
                $("#reserveDate-modal-edit").val(apmObjectEdit.appoint.schDate);

                // 載入原始時段
                $("#reservePeriod-modal-edit").val(apmObjectEdit.appoint.schPeriod);

              }else{
                $("#editModalMessage").html("錯誤: 預約單載入失敗。")
                        .css("color","red");
              }
            }
          });
        })

        // 當你更新了狀態....
        $("#reserveStatus-modal-edit").on("change", function (){
          // 班表會被回復到原始數值並鎖起來
          $("#jobId-modal-edit").val(apmObjectEdit.appoint.schID)
                  .prop("disabled", true);
        });

        // 當狀態為 "已支付訂金" 才可點選查詢班表，進而顯示可選擇班表
        $("#searchAvailableJob").on("click", function(){
          if ($("#reserveStatus-modal-edit").val() === "0"){
            // 解除班表鎖定
            $("#jobId-modal-edit").removeAttr("disabled");
            // 將可選擇的班表顯示於下拉選單中
            let jobHTMLEdit = $("#jobId-modal-edit").html();
            for (let job of apmObjectEdit.availableJob) {
              if (job.schID === apmObjectEdit.schID) {
                jobHTMLEdit += `<option value="\${job.schID}">(\${job.schID}) \${job.schDate} \${job.schPeriod}</option>`
              }else{
                jobHTMLEdit += `<option value="\${job.schID}" selected>(\${job.schID}) \${job.schDate} \${job.schPeriod}</option>`
              }
              $('#jobId-modal-edit').html(jobHTMLEdit);
            }
          }else{
            $("#editModalMessage").html("預約單狀態為已支付訂金，才可以查詢班表並更改。")
                    .css("color","red");
          }
        })

        // 當班表被更新，更動日期 時段，且狀態鎖起來
        let selectNewJobID;
        $("#jobId-modal-edit").on("change", function (){
          let selectJobDatePeriod = $("#jobId-modal-edit").find(":selected").text();
          selectNewJobID = $("#jobId-modal-edit").val()[0];
          let selectNewJobDate = selectJobDatePeriod.split(" ")[1].trim();
          let selectNewJobPeriod = selectJobDatePeriod.split(" ")[2].trim();
          $("#reserveDate-modal-edit").val(selectNewJobDate);
          $("#reservePeriod-modal-edit").val(selectNewJobPeriod);
          $("#reserveStatus-modal-edit").prop("disabled", true);
        })

        // 當資料確定很完整後，送出後才能跳出下一個視窗
        $(".btn-edit-confirm").on("click", function(){
          //data-target="#EditConfirmModal"
          if (apmObjectEdit.appoint.apmID !== "" &&
                  apmObjectEdit.appoint.memID !== "" &&
                  apmObjectEdit.appoint.petID != "" &&
                  $("#jobId-modal-edit").val().trim() !== "" &&
                  $("#reserveStatus-modal-edit").val().trim() !== "")
          {
            $(".btn-edit-confirm").attr("data-target","#EditConfirmModal");
          }else{
            $("#editModalMessage").html("錯誤: 資料不完整，請重新填寫。")
                    .css("color","red");
          }

        })


        $('.modal-footer').on('click', '.btn-edit-confirm-confirm', function (){
          $.ajax({
            url:"${pageContext.request.contextPath}/ipet-back/appoint/appoint_edit",
            method:"POST",
            data:{
              apmID: apmObjectEdit.appoint.apmID,
              memID: apmObjectEdit.appoint.memID,
              petID: apmObjectEdit.appoint.petID,
              totalPrice: apmObjectEdit.appoint.totalPrice,
              schID: $("#jobId-modal-edit").val(),
              apmStatus: $("#reserveStatus-modal-edit").val(),
              customerNote: $("#clientNote-modal-edit").val()
            },
            success: function (resp){
              if (resp === "修改成功"){
                $("#editConfirmModalMessage").html("修改成功")
                        .css("color","green");
                $(".btn-edit-confirm-confirm").addClass("disabled")
                        .attr("disabled");
                editRefresh = true;
              }else{
                $("#editConfirmModalMessage").html("錯誤: 無法修改!")
                        .css("color","red");
              }
            }
          })
        })

        $('#EditConfirmModal').on("hidden.bs.modal", function (){
          $("#EditModal").modal("hide");
        });

        $("#EditModal").on("hidden.bs.modal", function (){
          // clean the previous data and class
          $(".btn-edit-confirm").removeAttr("data-target", "disabled")
                  .removeClass("disabled");
          $(".btn-edit-confirm-confirm").removeClass("disabled")
                  .removeAttr("disabled");

          if (editRefresh) {
            window.location.reload();
          }
        });
        <!--  /.Edit data from modal -->
      }
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
