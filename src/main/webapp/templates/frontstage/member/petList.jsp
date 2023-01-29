<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>IPET - Pet Food eCommerce Bootstrap4 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/frontstage/img/favicon.png">

<!-- all css here -->
<style type="text/css" media="screen">
table {
	width: 500px;
	height: 200px;
	margin: auto;
}

</style>
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
	href="${pageContext.request.contextPath}/static/frontstage/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css">
<script
	src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<%@include file="/templates/frontstage/common/header.jsp"%>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>寵物資料管理</h2>
				<ul>
					<li><a href="index.html">home</a></li>
					<li class="active">Pet Profile</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login-register-area pt-95 pb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-12 ml-auto mr-auto">
					<div class="login-register-wrapper"
						style="margin: 0 auto; text-align: center;">
						<form
							action="${pageContext.request.contextPath}/ipet-back/pet/addNew">
							<input id="addNew" type="submit" value="新增寵物" style="width: 300px;">
						</form>
						<table>
							<tr>
								<!-- 								<th>寵物編號</th> -->
								<!-- 								<th>會員編號</th> -->
								<th>寵物名字</th>
								<th>品種</th>
								<th>寵物體型</th>
								<th>性別</th>
								<th>寵物生日</th>
								<th>寵物狀態</th>
								<!-- 									<td>權限</td> -->
								<th></th>
							</tr>

							<c:forEach var="petVO" items="${petList}">

								<tr>
									<%-- 									<td>${petVO.petId}</td> --%>
									<%-- 									<td>${petVO.memId}</td> --%>
									<td>${petVO.petName}</td>
									<td>${petVO.petVarId}</td>
									<td>${petVO.petSize}</td>
									<td>${petVO.petGen}</td>
									<td>${petVO.petBirth}</td>
									<td>${petVO.petStatus != 0 ? "正常" : "過世"}</td>
									<%-- 									<td><jsp:useBean id="adminFuncSvc" scope="page" --%>
									<%-- 											class="com.web.admin.model.service.AdminFuncService" /> <c:forEach --%>
									<%-- 											var="adminFunc" items="${admin}"> --%>
									<%-- 													${AdminFunc.getName()}			 --%>
									<%-- 										</c:forEach> --%>
									<!-- 										</td> -->
									<td>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/ipet-back/pet/edit"
											style="margin-bottom: 0px;">
											<input type="submit" value="修改"> <input type="hidden"
												name="petId" value="${petVO.getPetId()}"> <input
												type="hidden" name="action" value="updateTemp">
										</FORM>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
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
	<script>
		// 	const account = document.querySelector('#memAc');
		// 	const password = document.querySelector('#memPw');
		// 	const btnLogin = document.querySelector('#btnLogin');

		// 	btnLogin.addEventListener('click',function(){
		// 		fetch('${pageContext.request.contextPath}/ipet-back/member/login', {
		// 			method: 'POST',
		// 			header: {
		// 				'Content-Type': 'application/json' //當作是瀏覽器上的副檔名
		// 			},
		// 			body: JSON.stringify({ 
		// 				memAc: account.value,
		// 				memPw: password.value
		// 			})
		// 		})
		// 		.then(resp => resp.json())
		// 		.then(body => {
		// // 			alert(body.result);
		// 			if(body.result){
		// 				location = '${pageContext.request.contextPath}/templates/frontstage/index.jsp';
		// 			}
		// 		});
		// 	});
	</script>
</body>

</html>