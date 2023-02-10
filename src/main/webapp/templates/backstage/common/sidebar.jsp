<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<body>
	<!-- 左邊選單區 Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4"
		id="sidebar">
		<!-- Brand Logo -->
		<a href="${pageContext.request.contextPath}/ipet-back/home"
			class="brand-link"> <!--  TODO: {LOGO} 修改LOGO!    --> <img
			src="${pageContext.request.contextPath}/static/backstage/img/AdminLTELogo.png"
			alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
			style="opacity: .8"> <span class="brand-text font-weight-light">IPET
				寵物</span>
		</a>

		<!-- Left Sidebar -->
		<div class="sidebar">

			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					<img
						src="${pageContext.request.contextPath}/static/backstage/img/Employee1.jpg"
						class="img-circle elevation-2" alt="User Image">
				</div>
				<div class="info">
					<p style="color: white;">${sessionScope.name}<a
							href="${pageContext.request.contextPath}/ipet-back/loginOut"
							style="display: inline-block"><img
							src="${pageContext.request.contextPath}/static/backstage/img/logout.png"
							style="width: 20%; display: inline-block;"></a>
					</p>
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
          <!--  TODO: {最新消息管理-消息管理} 請修改消息管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {最新消息管理-消息管理} 可以修改消息管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-bullhorn"></i>
            <p>
              消息管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {最新消息管理-消息管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
<!--               <span class="badge badge-info right">999</span> -->
            </p>
          </a>
          <!--    TODO: {最新消息管理-消息管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/news/getAllList" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>最新消息列表</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/news/addNew" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>新增最新消息</p>
              </a>
            </li>
          </ul>
        </li>
        <c:if test="${sessionScope.adminId == 4 || sessionScope.adminId == 6 || sessionScope.adminId == 7}">
        <li class="nav-header"><b>員工專區</b></li>
        <li class="nav-item">
          <!--  TODO: {員工專區-員工管理} 請修改員工管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {員工專區-員工管理} 可以修改員工管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-user-tie"></i>
            <p>
              員工管理
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <!--    TODO: {員工專區-員工管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/staff/allStaffList" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>員工總覽</p>
              </a>
            </li>
<!--             <li class="nav-item"> -->
<!--               <a href="#" class="nav-link"> -->
<!--                 <i class="far fa-circle nav-icon"></i> -->
<!--                 <p>項目2</p> -->
<!--               </a> -->
<!--             </li> -->
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {員工專區-權限管理} 請修改權限管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {員工專區-權限管理} 可以修改權限管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-user-lock"></i>
            <p>
              權限管理
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <!--    TODO: {員工專區-權限管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/admin/admin" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>員工權限與新增權限</p>
              </a>
            </li>
<!--             <li class="nav-item"> -->
<!--               <a href="#" class="nav-link"> -->
<!--                 <i class="far fa-circle nav-icon"></i> -->
<!--                 <p>項目2</p> -->
<!--               </a> -->
<!--             </li> -->
          </ul>
        </li>
        </c:if>
					<c:if test="${sessionScope.adminId == 1 || sessionScope.adminId == 7}">
        <li class="nav-header"><b>購物商城專區</b></li>
        <li class="nav-item">
          <!--  TODO: {購物商城專區-商品管理} 請修改商品管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {購物商城專區-商品管理} 可以修改商品管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-box"></i>
            <p>
              商品管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {購物商城專區-商品管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
              <span class="badge badge-info right"></span>
            </p>
          </a>
          <!--    TODO: {購物商城專區-商品管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/prod/listAllProd1" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>商品列表</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/prod/addOneProd1" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>新增商品</p>
              </a>
            </li>
            
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {購物商城專區-訂單管理} 請修改訂單管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {購物商城專區-訂單管理} 可以修改訂單管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-regular fa-clipboard-list"></i>
            <p>
              訂單管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {購物商城專區-訂單管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
              <span class="badge badge-info right"></span>
            </p>
          </a>
          <!--    TODO: {購物商城專區-訂單管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/prod/orderMange" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>訂單總覽</p>
              </a>
            </li>
          </ul>
        </li>
        </c:if>
					<c:if test="${sessionScope.adminId == 3 || sessionScope.adminId == 7}">
        <li class="nav-header"><b>寵物住宿專區</b></li>
        <li class="nav-item">
          <!--  TODO: {寵物住宿專區-住宿預約管理} 請修改住宿預約管理的 href  -->
          <a href="" class="nav-link">
            <!--  TODO: {寵物住宿專區-住宿預約管理} 可以修改住宿預約管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-regular fa-clipboard-list"></i>
            <p>
              住宿訂單
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {寵物住宿專區-住宿預約管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
              <span class="badge badge-info right"></span>
            </p>
          </a>
          <!--    TODO: {寵物住宿專區-住宿預約管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>住宿列表</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {寵物住宿專區-房間管理} 請修改房間管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {寵物住宿專區-房間管理} 可以修改房間管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-regular fa-bed"></i>
            <p>
              房間管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {寵物住宿專區-房間管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
              <span class="badge badge-info right"></span>
            </p>
          </a>
          <!--    TODO: {寵物住宿專區-房間管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/hotel/showRoom" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>房間列表</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {寵物住宿專區-房型管理} 請修改房型管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {寵物住宿專區-房務管理} 可以修改房型管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-broom"></i>
            <p>
              房型管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {寵物住宿專區-房型管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
              <span class="badge badge-info right"></span>
            </p>
          </a>
          <!--    TODO: {寵物住宿專區-房型管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/roomType/showRoomType" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>房型列表</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {寵物住宿專區-優惠管理} 請修改優惠管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {寵物住宿專區-優惠管理} 可以修改優惠管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-receipt"></i>
            <p>
              住宿優惠管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {寵物住宿專區-優惠管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
              <span class="badge badge-info right"></span>
            </p>
          </a>
          <!--    TODO: {寵物住宿專區-優惠管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/hotel/showRoomDiscount" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>優惠列表</p>
              </a>
            </li>
          </ul>
        </li>
        </c:if>
					<c:if test="${sessionScope.adminId == 2 || sessionScope.adminId == 7}">
        <li class="nav-header"><b>寵物美容專區</b></li>
        <li class="nav-item">
          <!--  TODO: {寵物美容專區-美容預約管理} 請修改美容預約管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {寵物美容專區-美容預約管理} 可以修改美容預約管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-regular fa-clipboard-list"></i>
            <p>
              美容預約管理
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <!--    TODO: {寵物美容專區-美容預約管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/appoint/appoints" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>預約總覽</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/appoint/appoints_payed" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>已付訂金的預約</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/appoint/appoints_finished" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>已完成的預約</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/appoint/appoints_cancelled" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>已取消的預約</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/appoint/appoints_outdated" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>逾時未到的預約</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {寵物美容專區-班表管理} 請修改班表管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {寵物美容專區-班表管理} 可以修改班表管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-calendar-alt"></i>
            <p>
              班表管理
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <!--    TODO: {寵物住宿專區-住宿預約管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/job/jobs_calendar" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>班表瀏覽</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/job/jobs_list" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>班表列表</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {寵物美容專區-服務項目管理} 請修改服務項目管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {寵物美容專區-服務項目管理} 可以修改服務項目管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-dog"></i>
            <p>
              服務項目管理
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <!--    TODO: {寵物美容專區-服務項目管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/service/allService" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>服務總覽</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/service/addService" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>新增服務</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <!--  TODO: {寵物美容專區-優惠管理} 請修改優惠管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {寵物美容專區-優惠管理} 可以修改優惠管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-receipt"></i>
            <p>
              美容優惠管理
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <!--    TODO: {寵物美容專區-優惠管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/salonSale/allSale" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>優惠總覽</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/salonSale/addSale" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>新增優惠</p>
              </a>
            </li>
          </ul>
        </li>
        </c:if>
					<c:if test="${sessionScope.adminId == 6 || sessionScope.adminId == 7}">
        <li class="nav-header"><b>會員專區</b></li>
        <li class="nav-item">
          <!--  TODO: {會員專區-會員資料管理} 請修改會員資料管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {會員專區-會員資料管理} 可以修改會員資料管理的icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-solid fa-users"></i>
            <p>
              會員資料管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {會員專區-會員資料管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
            </p>
          </a>
          <!--    TODO: {會員專區-會員資料管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/member/allMemberList" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>會員列表</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/pet/allPetList" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>寵物列表</p>
              </a>
            </li>
          </ul>
        </li>
        </c:if>
					<c:if test="${sessionScope.adminId == 5 || sessionScope.adminId == 7}">
        <li class="nav-header"><b>客服專區</b></li>
        <li class="nav-item">
          <!--  TODO: {客服專區-客服管理} 請修改客服管理的 href  -->
          <a href="#" class="nav-link">
            <!--  TODO: {客服專區-客服管理} 可以修改客服管理的 icon，參考網站: font awesome  -->
            <i class="nav-icon fas fa-sharp fa-solid fa-headset"></i>
            <p>
              客服管理
              <i class="fas fa-angle-left right"></i>
              <!--      TODO: {客服專區-客服管理} 請評估是否有要顯示未讀訊息數量，暫時顯示 999         -->
            </p>
          </a>
          <!--    TODO: {客服專區-客服管理} 請評估是否要有子項目，需要的話請於按照  <li class="nav-item">... </li> 進行新增  -->
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/ipet-back/question/allQuestionList" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>常見問題列表</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/templates/backstage/customerservice/index.jsp" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>線上客服</p>
              </a>
            </li>
          </ul>
        </li>
        </c:if>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->

	</aside>
	<!-- /.aside -->
</body>