<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.member.model.entity.*"%>

<%
Member member = (Member) request.getAttribute("getNewPWMember");
%>

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
				<h2>密碼修改</h2>
				<ul>
					<li><a href="index.html">home</a></li>
					<li class="active">Change Password</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login-register-area pt-95 pb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-7 col-md-12 ml-auto mr-auto">
					<div class="login-register-wrapper" style="margin: 0 auto; text-align: center;">
					
						<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					
						<form action="${pageContext.request.contextPath}/ipet-back/member/toEditPW" method="post">
						
							<table id="memberdata" align="center">
								<tr>
									<td><input type="hidden" name="memName"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}"
										value="<%=member.getMemName()%>"  required></td>
								</tr>

								<tr>
									<td><input type="hidden" name="memUid"
										value="<%=member.getMemUid()%>" readonly required></td>
								</tr>
								<tr>
									<td><input type="hidden" name="memBth"
										value="<%=member.getMemBth()%>" readonly required></td>
								</tr>
								<tr>
									<td><input type="hidden" name="memSex"
										value="<%=member.getMemSex()%>" readonly required></td>
								</tr>
								<tr>
									<td><input type="hidden" name="memEmail"
										value="<%=member.getMemEmail()%>"  required></td>
								</tr>
								<tr>
									<td><input type="hidden" name="memPhone"
										value="<%=member.getMemPhone()%>"  required></td>
								</tr>
								<tr>
									<td><input type="hidden" name="memTel"
										value="${member.getMemTel() == null?'':member.getMemTel()}" ></td>
								</tr>
								<tr>
									<td><input type="hidden" name="memAdd"
										value="<%=member.getMemAdd()%>" ></td>
								</tr>
								<tr>
									<td><input type="hidden" name="memAc"
										value="<%=member.getMemAc()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>請輸入密碼:</label></td>
									<td><input type="text" name="memPw"
										value="<%=member.getMemPw()%>" required></td>
								</tr>
								<tr>
									<jsp:useBean id="memberSvc" scope="page"
										class="com.web.member.model.service.MemberService" />
									<td><label></label></td>
									<td><input type="hidden" name="memStatus"
										value="<%=member.getMemStatus()%>" readonly required></td>
								</tr>
								<tr>
									<td><input type="hidden" name="action" value="updatePW" style="background-color: lightgary;">
										<input type="hidden" name="memId"
										value="<%=member.getMemId()%> "></td>
									<td><input type="submit" value="送出修改" onclick="enter()" style="background-color: gary;"></td>
								</tr>

							</table>

			
						</form>
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