<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<style type="text/css">
html, body {
	font: 15px verdana, Times New Roman, arial, helvetica, sans-serif,
		Microsoft JhengHei;
	width: 90%;
	height: 90%;
	background: #eeeeda;
}

#userName {
	position: absolute;
	top: 50%;
	left: 50%;
	height: 30px;
	width: 250px;
	margin: -50px 121px 0 -130px;
}

#outPopUp {
	position: absolute;
	width: 500px;
	height: 300px;
	z-index: 15;
	top: 50%;
	left: 50%;
	margin: -200px 250px 0 -250px;
}

.button {
	background-color: #0078ae;
	color: #ffffff;
	border-radius: 5px;
	position: absolute;
	width: 100px;
	height: 40px;
	top: 50%;
	left: 50%;
	top: 50%;
	left: 50%;
	margin: 20px 200px 0 -50px;
}
</style>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/bootstrap.min.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/animate.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/simple-line-icons.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/themify-icons.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/owl.carousel.min.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/slick.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/meanmenu.min.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/style.css"> --%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/frontstage/css/responsive.css"> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/modernizr-2.8.3.min.js"></script> --%>
<title>IPET Customer Service</title>
</head>
<body>
<%-- 	<%@include file="/templates/frontstage/common/header.jsp"%> --%>

	<div id="outPopUp">
		<h1 align="center">歡迎使用IPET線上客服</h1>
		<form id="myForm" action="<%=request.getContextPath()%>/chat.do"
			method="POST">
			<input id="userName" name="userName" class="text-field" type="text"
				readonly="readonly" value="客服人員" /> <input type="submit" id="send"
				class="button" value="進入" />
		</form>
	</div>
	
<%-- <%@include file="/templates/frontstage/common/footer.jsp"%> --%>

	    <!-- all js here -->
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/vendor/jquery-1.12.0.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/popper.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/bootstrap.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/jquery.counterup.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/waypoints.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/elevetezoom.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/ajax-mail.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/owl.carousel.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/plugins.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/static/frontstage/js/main.js"></script> --%>
	
</body>
<script>
	var inputUserName = document.getElementById("userName");
	inputUserName.focus();

	function sendName() {
		var userName = inputUserName.value.trim();
		if (userName === "") {
			alert("Input a user name");
			inputUserName.focus();
			return;
		} else {
			document.getElementById("myForm").submit();
		}
	}
	
</script>

</html>