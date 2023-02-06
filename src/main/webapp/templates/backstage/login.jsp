<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IPET | Log in</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
<style>
.fa-envelope:before {
	content: "";
}

.fa-lock:before {
	content: "";
}

body {
	background-image:
		url('${pageContext.request.contextPath}/static/frontstage/img/layDog.jpg');
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>

<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<b style="color: lightgray;">IPET Login System </b>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">

				<%-- 				<form action="${pageContext.request.contextPath}/ipet-back/staff/login" method="POST"> --%>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="ID"
						id="account" name="account" required>
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-envelope"></span>
						</div>
					</div>
				</div>
				<div class="input-group mb-3">
					<input type="password" class="form-control" placeholder="Password"
						id="password" name="password" required>
					<div class="input-group-append">
						<div class="input-group-text">
							<span class="fas fa-lock"></span>
						</div>
					</div>
				</div>
				<div id="errMsg" class="error" style="color: pink"></div>
				<div class="row">
					<!-- /.col -->
					<div class="col-4" style="margin: auto;">
						<button type="submit" class="btn btn-primary btn-block"
							id="btnlogin">Sign In</button>
					</div>
					<!-- /.col -->
				</div>
				<!-- 				</form> -->

			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/static/backstage/js/adminlte.min.js"></script>

	<script>
	
const account = document.querySelector('#account');
const password = document.querySelector('#password');
const btnlogin = document.querySelector('#btnlogin');
const errMsg = document.querySelector('#errMsg');




btnlogin.addEventListener('click',function(){
	fetch('${pageContext.request.contextPath}/ipet-back/login',{
		method : 'POST',
		header : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify({
			ac : account.value,
			pw : password.value
		})
	})
	.then(resp=>resp.json())
    .then(body => {
        errMsg.textContent = '';
        const { successful, message } = body;
        console.log(successful);
        if (successful) {
          const { id, name } = body;
          sessionStorage.setItem('id', id);
          sessionStorage.setItem('name', name);
          location = '${pageContext.request.contextPath}/templates/backstage/back-index.jsp';
        } else {
          errMsg.textContent = message;
        }
      });
	});
	
	
	

</script>

</body>

</html>