<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.member.model.entity.*"%>

<%
Member member = (Member) request.getAttribute("member");
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

#memberdata {
	margin: auto;
}

</style>

<style type="text/css">

input#allMember {
	background-color: lightgray;
	border: none;
	border-radius: 5px;
}

input#allMember, #search:hover {
	cursor: pointer;
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
				<h2>會員註冊</h2>
				<ul>
					<li><a href="index.html">home</a></li>
					<li class="active">Register</li>
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
							<a class="active" href="${pageContext.request.contextPath}/templates/frontstage/member/login.jsp">
								<h4>會員登入</h4>
							</a> <a href="${pageContext.request.contextPath}/templates/frontstage/member/register.jsp">
								<h4>會員註冊</h4>
							</a>
						</div>
						<!-- 中間頁面 Content Wrapper. Contains page content -->
						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>

						<div class="content-wrapper">
							<!-- Content Header (Page header) -->
							<section class="content-header">
								<div class="container-fluid">
									<div id="newMember">
									
										<form
											action="${pageContext.request.contextPath}/ipet-back/member/getAllList"
											method="post">
											<table id="memberdata">
												<tr>
													<td><label>姓名:</label></td>
													<td><input type="text" name="memName" value="<%= (member==null)? "" : member.getMemName()%>"
														pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}" autofocus
														required></td>
												</tr>
												<tr>
													<td></td>
													<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和
																, 且長度必需在2到10之間</i></span></td>
												</tr>
												<tr>
													<td><label>身分證字號:</label></td>
													<td><input type="text" name="memUid" value="<%= (member==null)? "" : member.getMemUid()%>" pattern="^[A-Z]{1}[1-2]{1}[0-9]{8}$" required></td>
												</tr>
												<tr>
													<td><label>生日:</label></td>
													<td><input type="date" name="memBth" value="<%= (member==null)? "" : member.getMemBth()%>" required></td>
												</tr>
												<tr>
													<td><label>性別:</label></td>
													<td><select name="memSex" style="height: 45px; background-color: #ECEFF8;text-indent: 1em;">
															<option value="男"
																${(member.memSex=="男")? 'selected':'' }>男
															<option value="女"
																${(member.memSex=="女")? 'selected':'' }>女
													</select></td>
												</tr>
												<tr>
													<td><label>Email:</label></td>
													<td><input type="email" name="memEmail" value="<%= (member==null)? "" : member.getMemEmail()%>" pattern="^[^@\s]+@[^@\s]+\.[^@\s]+$" required></td>
												</tr>
												<tr>
													<td><label>手機:</label></td>
													<td><input type="tel" name="memPhone" pattern="[/^09[0-9]{8}$/]" value="<%= (member==null)? "" : member.getMemPhone()%>" required></td>
												</tr>
												<tr>
													<td><label>室內電話:</label></td>
													<td><input type="tel" name="memTel" pattern="[/^0[0-9]{8}$/]" value="<%= (member==null)? "" : member.getMemTel()%>" ></td>
												</tr>
												<tr>
													<td><label>地址:</label></td>
													<td><input type="text" name="memAdd" value="<%= (member==null)? "" : member.getMemAdd()%>" required></td>
												</tr>
												<tr>
													<td><label>帳號:</label></td>
													<td><input type="text" name="memAc"
														pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}" value="<%= (member==null)? "" : member.getMemAc()%>" required></td>
												</tr>
												<tr>
													<td></td>
													<td><span style="font-size: 10px;"><i>只能是中、英文字母、數字和_
																, 且長度必需在2到10之間</i></span></td>
												</tr>

												<tr>
													<td><label>密碼:</label></td>
													<td><input type="password" name="memPw"  required></td>
												</tr>
												
												<tr>
													<td><label>確認密碼:</label></td>
													<td><input type="password" name="memPw2" required></td>
												</tr>
												<tr>
													<td><label></label></td>
													<td><h1 style="color: red;font-size: 10px;">${wrong}</h1></td>
												</tr>

												<tr>
													<td><input type="hidden" name="action" value="insert"></td>
													<td><input type="submit" value="送出" onclick="enter()"
														style="background-color: lightgray"></td>
												</tr>
											</table>
										</form>
									</div>
									<div class="row mb-2">
										<script>
											const dateControl = document
													.querySelector('input[type="date"]');
											dateControl.value = '1990-01-01';
										</script>
									</div>
								</div>
								<!-- /.container-fluid -->
							</section>
							<%-- /.content-header --%>
						</div>
						<!-- /.content-wrapper -->
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
</body>

</html>