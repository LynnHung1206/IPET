<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.salonService.model.*"%>
<%@ page import="com.web.salonService.model.entities.*"%>
<%@ page import="com.web.salonService.model.services.*"%>
<%@ page import="com.web.salonService.model.dao.*"%>
<%@ page import="com.web.salonService.model.dao.impl.*"%>
<%@ page import="java.util.*"%>

<%
CategoryService catsvc = new CategoryService();
List<Category> catlist = catsvc.selectAll();
pageContext.setAttribute("catlist", catlist);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | DataTables</title>
<!-- TODO: 目前先使用 完整css，後續再換成 min.css-->
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
<!-- IonIcons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
<style>
.cantSee {
	display: none !important;
}

/* ================== table區 ==================*/
#example2 thead {
	background-color: #6c757d;
	color: white;
}

/* ================== 彈出視窗 ====================*/
/* 彈出視窗出現時的暗色背景 */
#mainModal {
	display: none;
	position: fixed;
	z-index: 9999;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

/* 彈出視窗本人 */
.main-modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

/* 叉叉(X) */
#modalClose {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	text-align: right;
}

#modalClose:hover, #modalClose:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* ================== 選寵物父元素 ==================*/
#choose-pet-father {
	background-color: white;
}

/* ================== 寵物體型 ==================*/
#pet-size {
	border-radius: 0.25rem 0.25rem 0 0;
	background-color: #f3f5f6;
}

/* ================== 寵物品種 父元素 ==================*/
div.choose-type-price {
	border-bottom: 1px solid #ced4da;
	border-left: 1px solid #ced4da;
	border-right: 1px solid #ced4da;
	padding-right: 0.75rem;
	padding-bottom: 0.75rem;
	padding-top: 0.75rem;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	border-radius: 0 0 0.25rem 0.25rem;
}

/* ================== 品種選項 ==================*/
div.pet-type {
	display: inline-block;
	margin-left: 0.75rem;
	height: 2rem;
}

div.pet-type input.form-control {
	width: 20px;
	display: inline-block;
}

div label.pet-label {
	font-weight: 400 !important;
	display: inline;
	position: relative;
	bottom: 0.75rem;
	left: 0.25rem;
}
</style>
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!--  Navbar -->
		<div id="Mynavbar"></div>
		<!-- /.navbar -->

		<!-- 左邊選單區 Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="../../index.html" class="brand-link"> <!--  TODO: {LOGO} 修改LOGO!    -->
				<img src="${pageContext.request.contextPath}/static/backstage/img/AdminLTELogo.png" alt="AdminLTE Logo"
				class="brand-image img-circle"> <span
				class="brand-text font-weight-light">IPET</span>
			</a>

			<!-- Left Sidebar -->
			<div class="sidebar">

				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="${pageContext.request.contextPath}/static/backstage/img/Employee1.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">IPET 寵物員工1 </a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-header"><b>最新消息</b></li>
						<li class="nav-item">
							<!--  TODO: {最新消息管理-消息管理} 請修改消息管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {最新消息管理-消息管理} 可以修改消息管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-bullhorn"></i>
								<p>
									消息管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {最新消息管理-消息管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {最新消息管理-消息管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-header"><b>員工專區</b></li>
						<li class="nav-item">
							<!--  TODO: {員工專區-員工管理} 請修改員工管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {員工專區-員工管理} 可以修改員工管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-user-tie"></i>
								<p>
									員工管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {員工專區-員工管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {員工專區-員工管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {員工專區-權限管理} 請修改權限管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {員工專區-權限管理} 可以修改權限管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-user-lock"></i>
								<p>
									權限管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {員工專區-權限管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {員工專區-權限管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-header"><b>購物商城專區</b></li>
						<li class="nav-item">
							<!--  TODO: {購物商城專區-商品管理} 請修改商品管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {購物商城專區-商品管理} 可以修改商品管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-box"></i>
								<p>
									商品管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {購物商城專區-商品管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {購物商城專區-商品管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {購物商城專區-訂單管理} 請修改訂單管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {購物商城專區-訂單管理} 可以修改訂單管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-regular fa-clipboard-list"></i>
								<p>
									訂單管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {購物商城專區-訂單管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {購物商城專區-訂單管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-header"><b>寵物住宿專區</b></li>
						<li class="nav-item">
							<!--  TODO: {寵物住宿專區-住宿預約管理} 請修改住宿預約管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物住宿專區-住宿預約管理} 可以修改住宿預約管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-regular fa-clipboard-list"></i>
								<p>
									住宿預約管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物住宿專區-住宿預約管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物住宿專區-住宿預約管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {寵物住宿專區-房間管理} 請修改房間管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物住宿專區-房間管理} 可以修改房間管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-regular fa-bed"></i>
								<p>
									房間管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物住宿專區-房間管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物住宿專區-房間管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {寵物住宿專區-房務管理} 請修改房務管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物住宿專區-房務管理} 可以修改房務管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-broom"></i>
								<p>
									房務管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物住宿專區-房務管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物住宿專區-房務管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {寵物住宿專區-優惠管理} 請修改優惠管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物住宿專區-優惠管理} 可以修改優惠管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-receipt"></i>
								<p>
									住宿優惠管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物住宿專區-優惠管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物住宿專區-優惠管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-header"><b>寵物美容專區</b></li>
						<li class="nav-item menu-open">
							<!--  TODO: {寵物美容專區-美容預約管理} 請修改美容預約管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物美容專區-美容預約管理} 可以修改美容預約管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-regular fa-clipboard-list"></i>
								<p>
									美容預約管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物美容專區-美容預約管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物美容專區-美容預約管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="salon_reserve_all.html"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>預約總覽</p>
								</a></li>
								<li class="nav-item"><a href="salon_reserve_payed.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>已付訂金的預約</p>
								</a></li>
								<li class="nav-item"><a href="salon_reserve_cancelled.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>已取消的預約</p>
								</a></li>
								<li class="nav-item"><a href="salon_reserve_finished.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>已完成的預約</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {寵物美容專區-班表管理} 請修改班表管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物美容專區-班表管理} 可以修改班表管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-calendar-alt"></i>
								<p>
									班表管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物美容專區-班表管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物美容專區-班表管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {寵物美容專區-服務項目管理} 請修改服務項目管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物美容專區-服務項目管理} 可以修改服務項目管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-dog"></i>
								<p>
									服務項目管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物美容專區-服務項目管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物美容專區-服務項目管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-item">
							<!--  TODO: {寵物美容專區-優惠管理} 請修改優惠管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {寵物美容專區-優惠管理} 可以修改優惠管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-receipt"></i>
								<p>
									美容優惠管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {寵物美容專區-優惠管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {寵物美容專區-優惠管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-header"><b>會員專區</b></li>
						<li class="nav-item">
							<!--  TODO: {會員專區-會員資料管理} 請修改會員資料管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {會員專區-會員資料管理} 可以修改會員資料管理的icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-solid fa-users"></i>
								<p>
									會員資料管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {會員專區-會員資料管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {會員專區-會員資料管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
						<li class="nav-header"><b>客服專區</b></li>
						<li class="nav-item">
							<!--  TODO: {客服專區-客服管理} 請修改客服管理的 href  --> <a href="#"
							class="nav-link"> <!--  TODO: {客服專區-客服管理} 可以修改客服管理的 icon，參考網站: font awesome  -->
								<i class="nav-icon fas fa-sharp fa-solid fa-headset"></i>
								<p>
									客服管理 <i class="fas fa-angle-left right"></i>
									<!--      TODO: {客服專區-客服管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
									<span class="badge badge-info right">999</span>
								</p>
						</a> <!--    TODO: {客服專區-客服管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目1</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>項目2</p>
								</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h3 style="margin-top: .6rem;">美容服務</h3>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">美容服務</li>
							</ol>
						</div>
					</div>

					<!-- ================== 彈出視窗 ==================== -->
					<!-- Trigger/Open The Modal -->
					<!-- <button id="mainBtn">修改預約</button> -->

					<!-- The Modal -->
					<div id="mainModal">
						<!-- Modal content -->
						<div class="main-modal-content">
							<span id="modalClose">&times;</span>
							<p>一個施工中的彈出式視窗...</p>
						</div>
					</div>


				</div>
				<!-- /.container-fluid -->
			</section>
			<div>
				<form method="post" action="${pageContext.request.contextPath}/static/backstage/salon/svc.servlet">
					<input type="text" placeholder="查詢服務編號" name="svcId"><br>
					<input type="text" placeholder="查詢服務名稱" name="svcName"><br>
					<select name="catId" id="">
						<option style="display: none;" value="">服務類別</option>
						<c:forEach var="catVO" items="${catlist}">
							<option value="${catVO.catId}">${catVO.catName}</option>
						</c:forEach>
					</select><br>
					<input type="text" name="lowerPrice">～<input type="text" name="highestPrice"><br>
					<select name="svcStatus" id="">
						<option style="display: none;" value="">服務狀態</option>
						<option value="0">上架中</option>
						<option value="1">未上架</option>
					</select><br>

					<div id="choose-pet-father">
						<select id="pet-size" class="form-control custom-select">
							<option selected style="display: none;">請選擇寵物體型</option>
							<option>大型犬</option>
							<option>中型犬</option>
							<option>小型犬</option>
						</select>
						<div class="choose-type-price cantSee" id="showBigDog">
							<%
							List<PetType> listPetTypeVOs = new ArrayList<PetType>();
																	PetTypeDAOImpl petTypeDAO = new PetTypeDAOImpl();
																	listPetTypeVOs = petTypeDAO.findByPetSize("大型犬");
																	int count2 = 0;
																	for (PetType petType : listPetTypeVOs) {
																		int typeId = petType.getTypeId();
																		count2 += 1;
							%>
							<div class="pet-type">
								<input type="radio" id="pet-type<%=typeId%>" class="form-control aType" value="<%=typeId%>" name="typeId">
								<label for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
							</div>
							<%
							}
																	if (count2 == 0) {
							%>
							尚無資料
							<%
							}
							%>
						</div>
						<div class="choose-type-price cantSee" id="showMediumDog">
							<%
							List<PetType> list2 = new ArrayList<PetType>();
																	PetTypeDAOImpl petTypeDAO2 = new PetTypeDAOImpl();
																	list2 = petTypeDAO2.findByPetSize("中型犬");
																	int count3 = 0;
																	for (PetType petType : list2) {
																		int typeId = petType.getTypeId();
																		count3 += 1;
							%>
							<div class="pet-type">
								<input type="radio" id="pet-type<%=typeId%>"
									class="form-control aType" value="<%=typeId%>" name="typeId">
								<input type="hidden" value="<%=typeId%>"> <label
									for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
							</div>
							<%
							}
																	if (count3 == 0) {
							%>
							尚無資料
							<%
							}
							%>
						</div>

						<div class="choose-type-price cantSee" id="showSmallDog">
							<%
							List<PetType> list3 = new ArrayList<PetType>();
																	PetTypeDAOImpl petTypeDAO3 = new PetTypeDAOImpl();
																	list3 = petTypeDAO3.findByPetSize("小型犬");
																	int count4 = 0;
																	for (PetType petType : list3) {
																		int typeId = petType.getTypeId();
																		count4 += 1;
							%>
							<div class="pet-type">
								<input type="radio" id="pet-type<%=typeId%>" class="form-control aType" value="<%=typeId%>" name="typeId">
								<input type="hidden" value="<%=typeId%>">
								<label for="pet-type<%=typeId%>" class="pet-label"><%=petType.getTypeName()%></label>
							</div>
							<%
							}
							if (count4 == 0) {
							%>
							尚無資料
							<%
							}
							%>
						</div>
					</div>
					<input type="hidden" name="action" value="listServices_ByCompositeQuery">
					<button>查詢</button>
				</form>
				<a href="salon_addservice.jsp">新增資料</a>
			</div>
			<!-- Main content -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<!-- /.card-header -->
							<div class="card-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>服務編號</th>
											<th>服務名稱</th>
											<th>服務類別</th>
											<th>寵物種類</th>
											<th>服務單價</th>
											<th>狀態</th>
											<th>修改</th>
											<th>刪除</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="svcVO" items="${listServices_ByCompositeQuery}">
											<tr>
												<td>${svcVO.svcId}</td>
												<td>${svcVO.svcName}</td>
												<td>${svcVO.categoryVO.catName}</td>
												<td>${svcVO.petTypeVO.typeName}</td>
												<td>${svcVO.svcPrice}</td>
												<c:if test="${svcVO.svcStatus == 1}" var="true">
													<td>未上架</td>
												</c:if>
												<c:if test="${svcVO.svcStatus == 0}" var="true">
													<td>上架中</td>
												</c:if>
												<td>
	<!--											<i class="nav-icon fas fa-solid fa-pen"></i> -->
													<form METHOD="post" ACTION="svc.servlet"style="margin-bottom: 0px;">
														<input type="submit" value="修改">
														<input type="hidden" name="svcId" value="${svcVO.svcId}">														
														<input type="hidden" name="action" value="getOne_For_Update">
													</form>
												</td>
												<td>
													<form METHOD="post" ACTION="svc.servlet"style="margin-bottom: 0px;">
														<input type="submit" value="刪除">
														<input type="hidden" name="svcId" value="${svcVO.svcId}">														
														<input type="hidden" name="action" value="delete">
													</form>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
									</tfoot>
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
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<div id="Myfooter"></div>

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
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/jszip/jszip.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/pdfmake/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/pdfmake/vfs_fonts.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/backstage/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<!-- Navbar script-->
	<script>
		$(function() {
			$("#Mynavbar").load("../../navbar_pages.html");
		})
	</script>

	<!-- Footer script-->
	<script>
		$(function() {
			$("#Myfooter").load("../../footer.html");
		})
	</script>
	<!-- Page specific script -->
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});

			/*===================== 彈出視窗 ==========================*/
			const mainModal = document.getElementById("mainModal");

			//點擊按鈕時打開彈出視窗
			$("#mainBtn").click(function() {
				mainModal.style.display = "block";
				document.body.style.overflow = "hidden";
			});

			//點擊叉叉(X) 或 彈出視窗外面 關閉視窗
			$("#modalClose").click(function() {
				mainModal.style.display = "none";
				document.body.style.overflow = "auto";
			});

			$(window).click(function() {
				if (event.target == mainModal) {
					mainModal.style.display = "none";
					document.body.style.overflow = "auto";
				}
			});

			/*===================== 點擊 card-header 開關 ==========================*/

			$(".card-header").click(function() {
				$(this).next().slideToggle();
				const i = $(this).find("i");
				if (i.hasClass("fa-minus")) {
					i.removeClass("fa-minus").addClass("fa-plus");
				} else if (i.hasClass("fa-plus")) {
					i.removeClass("fa-plus").addClass("fa-minus");
				}
			});

			/*===================== 點擊 大中小標籤 換犬種 ==========================*/
			$("#pet-size").change(function() {
				if ($("#pet-size :selected").text() === "大型犬") {
					$("#showBigDog").removeClass("cantSee");
					$("#showMediumDog").addClass("cantSee");
					$("#showSmallDog").addClass("cantSee");
				} else if ($("#pet-size :selected").text() === "中型犬") {
					$("#showBigDog").addClass("cantSee");
					$("#showMediumDog").removeClass("cantSee");
					$("#showSmallDog").addClass("cantSee");
				} else if ($("#pet-size :selected").text() === "小型犬") {
					$("#showBigDog").addClass("cantSee");
					$("#showMediumDog").addClass("cantSee");
					$("#showSmallDog").removeClass("cantSee");
				}
			});

		});
	</script>
</body>

</html>