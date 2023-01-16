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
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png">

<!-- all css here -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/simple-line-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css">

<script
	src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<!-- //加的 -->

<link rel="stylesheet"
	href="http://kp.bkd.sidoarjokab.go.id/website/lib/DataTables-1.10.7/media/css/jquery.dataTables.css">

<style>
td.details-control {
	background:
		url('${pageContext.request.contextPath}/static/frontstage/img/icon-img/plus3.png')
		no-repeat center center;
	cursor: pointer;
}

/* tr.shown td.details-control {
            background: url('../resources/details_close.png') no-repeat center center; */
/* } */
.addSth {
	transform: translateX(50%);
}
</style>
</head>

<body>
	<%@include file="/templates/frontstage/common/header.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>最新消息</h2>
			</div>
		</div>
	</div>
	<div class="block">

		<table id="example" class="display" cellspacing="0" width="70%">
			<thead>
				<tr>
					<th></th>
					<th width="800px">Title</th>
					<th style="margin-right:50px;">date</th>
                </tr>
			</thead>


		</table>

	</div>
	<%@include file="/templates/frontstage/common/footer.jsp"%>


	<!-- all js here -->
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/vendor/jquery-1.12.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/jquery.counterup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/elevetezoom.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/ajax-mail.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script>
	<!-- 加的 -->
	<script
		src="http://kp.bkd.sidoarjokab.go.id/website/lib/DataTables-1.10.7/media/js/jquery.js"></script>
	<script
		src="http://kp.bkd.sidoarjokab.go.id/website/lib/DataTables-1.10.7/media/js/jquery.dataTables.js"></script>
	<script>
//     裡面的東西
        function format(newsDetail) {
            return '<table class="addSth" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px ;">' +
                '<tr>' +
                '<td>Title:</td>' +
                '<td>' + newsDetail.title + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>Date:</td>' +
                '<td>' + newsDetail.time + '</td>' +
                '</tr>' +
                '<tr>' +
                '<td>content:</td>' +
                '<td>' + newsDetail.text + '</td>' +
                '</tr>' +
                '</table>';
        }


        $(document).ready(function () {
            var table = $('#example').DataTable({
//                 "ajax": "object.txt",
                data:${allnews},
                "info": false,
                "searching": false,
                "bLengthChange": false,
                "ordering": true,
                "columns": [{
                        "className": 'details-control',
                        "orderable": false,
                        "data": null,
                        "defaultContent": '',
                    },
                    {
                        "data": "title"
                    },
                    {
                        "data":"time"
                    }
                ],
                "order": [
                    [2, 'desc']
                ]
            });
            

            $('#example tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);

                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                } else {
                    // Open this row
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                }
            });
            // document.getElementsByClassName('details-control').item(0).innerHTML =
            //     `<img src="plus.jpg" width="25px" >`;
        });
    </script>
</body>

</html>