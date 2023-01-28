<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.web.member.model.entity.*"%>

<%
Member member = (Member) session.getAttribute("member");
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
	<a id=msg style="z-index: 999" href="${pageContext.request.contextPath}/templates/frontstage/customerservice/customer-service.jsp"><img
		alt=""
		src="${pageContext.request.contextPath}/static/frontstage/img/msn-icon.png"></a>
	<div class="breadcrumb-area pt-95 pb-95 bg-img"
		style="background-image:url(${pageContext.request.contextPath}/static/frontstage/img/banner/banner-2.jpg);">
		<div class="container">
			<div class="breadcrumb-content text-center">
				<h2>會員資料修改</h2>
				<ul>
					<li><a href="index.html">home</a></li>
					<li class="active">Member Profile</li>
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
					
						<form action="${pageContext.request.contextPath}/ipet-back/member/toEdit" method="post">
						
							<table id="memberdata" align="center">
								<tr>
									<td><label>姓名:</label></td>
									<td><input type="text" name="memName"
										pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}"
										value="<%=member.getMemName()%>"  required></td>
								</tr>

								<tr>
									<td><label>身分證字號:</label></td>
									<td><input type="text" name="memUid"
										value="<%=member.getMemUid()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>生日:</label></td>
									<td><input type="date" name="memBth"
										value="<%=member.getMemBth()%>" readonly required></td>
								</tr>
								<tr>
									<td>性別:</td>
									<td><input type="text" name="memSex"
										value="<%=member.getMemSex()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>Email:</label></td>
									<td><input type="email" name="memEmail"
										value="<%=member.getMemEmail()%>"  required></td>
								</tr>
								<tr>
									<td><label>手機:</label></td>
									<td><input type="tel" name="memPhone"
										value="<%=member.getMemPhone()%>"  required></td>
								</tr>
								<tr>
									<td><label>市內電話:</label></td>
									<td><input type="tel" name="memTel"
										value="${member.getMemTel() == null?'':member.getMemTel()}" ></td>
								</tr>
								<tr>
									<td><label>地址:</label></td>
									<td><input type="text" name="memAdd"
										value="<%=member.getMemAdd()%>" readonly></td>
								</tr>
								<tr>
									<td><label>帳號:</label></td>
									<td><input type="text" name="memAc"
										value="<%=member.getMemAc()%>" readonly required></td>
								</tr>
								<tr>
									<td><label>密碼:</label></td>
									<td><input type="password" name="memPw"
										value="<%=member.getMemPw()%>" required></td>
								</tr>
								<tr>
									<jsp:useBean id="memberSvc" scope="page"
										class="com.web.member.model.service.MemberService" />
									<td><label>狀態:</label></td>
									<td><select name="memStatus" style="background-color: #ECEFF8;height: 45px;">
											<option value="0" ${member.getMemStatus() == 0 ?'selected':''}>正常</option>
											<option value="1" ${member.getMemStatus() == 1 ?'selected':''}>停權</option>
									</select></td>
								</tr>
								<tr>
									<td><input type="hidden" name="action" value="updatefront" style="background-color: lightgary;">
										<input type="hidden" name="memId"
										value="<%=member.getMemId()%> "></td>
									<td><input type="submit" value="送出修改" onclick="enter()" style="background-color: lightgary;"></td>
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