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
#msg {
	width: 50px;
	height: 50px;
	position: fixed;
	right: 50px;
	bottom: 50px;
	opacity: 0.5;

	/* 整個標籤透明度0-1 */
}

#msg:hover {
	opacity: 1;
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
	<a id=msg style="z-index: 999" href="customer-service.html"><img
		alt=""
		src="${pageContext.request.contextPath}/static/frontstage/img/msn-icon.png"></a>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>會員登入 / 會員註冊</h2>
				<ul>
					<li><a href="index.html">home</a></li>
					<li class="active">Login / Register</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login-register-area pt-95 pb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-12 ml-auto mr-auto">
					<div class="login-register-wrapper">
					
						<div class="login-register-tab-list nav">
							<a class="active" data-toggle="tab" href="#lg1">
								<h4>會員登入</h4>
							</a> <a data-toggle="tab" href="#lg2">
								<h4>會員註冊</h4>
							</a>
						</div>
						<div class="tab-content">
							<div id="lg1" class="tab-pane active">
								<div class="login-form-container">
									<div class="login-register-form">
									<h1 style="color: red;">${wrong}</h1>
									<form method="post" action="${pageContext.request.contextPath}/ipet-back/member/login">
										<div>
											<input type="text" class="form-control" placeholder="帳號"
												id="memAc" name="memAc" required>
											<div class="input-group-append">
												<div class="input-group-text">
													<span class="fas fa-envelope"></span>
												</div>
											</div>
										</div>
										<div>
											<input type="password" class="form-control" placeholder="密碼"
												id="memPw" name="memPw" required>
											<div class="input-group-append">
												<div class="input-group-text">
													<span class="fas fa-lock"></span>
												</div>
											</div>
										</div>
										<div id="errMsg" class="error" style="color: red"></div>
										<div class="row">
											<!-- /.col -->
											<div class="col-4" style="margin: auto;">
												<button type="submit" class="btn btn-primary btn-block"
													id="btnlogin">Sign In</button>
											</div>
											<!-- /.col -->
										</div>
									</form>
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