<%@page import="com.web.admin.model.service.AdminFuncService"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.web.admin.model.service.*" %>
<%@page import="com.web.admin.model.entities.*" %>
<%@ page import="java.util.*"%>
<%
AdminFuncService adminFuncSvc = new AdminFuncService();
List<AdminFunc> list = adminFuncSvc.getAll();
pageContext.setAttribute("list",list);
%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>IPET 寵物</title>
  <!-- TODO: 目前先使用 完整css，後續再換成 min.css-->
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/plugins/fontawesome-free/css/all.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/backstage/css/adminlte.css">
<style>
#new{

margin-bottom:400px;}

</style>

</head>
<!--
`body` tag options:

  Apply one or more of the following classes  to the body tag
  to get the desired effect

  * sidebar-collapse
  * sidebar-mini
-->
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!--  Navbar -->
  <%@ include file="/templates/backstage/common/navbar.jsp" %>
  <!-- /.navbar -->

  <!-- 左邊選單區 Main Sidebar Container -->
  <%@ include file="/templates/backstage/common/sidebar.jsp" %>
  <!-- /.aside -->

  <!-- 中間頁面 Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
      <div id="new">
      <h1>新增員工權限</h1>
      <form method="post" action="${pageContext.request.contextPath}/ipet-back/admin/addNewAdmin">
      <input type="text" name="admin">
      <input type="submit" >
      </form>
      </div>
      <div>
      <h1>修改員工權限</h1>
      <table id="edit">
      <tr>
      <td>權限編號</td>
      <td>權限名稱</td>
      </tr>
      <c:forEach var="adminFunc" item="${list}">
      </c:forEach>>
      
      
      </table>
      </div>
      
        <div class="row mb-2">
          <div class="col-sm-6">
          
          
          
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->

    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- Main Footer -->
  <%@ include file="/templates/backstage/common/footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/backstage/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/static/backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="${pageContext.request.contextPath}/static/backstage/js/adminlte.js"></script>
</body>
</html>
