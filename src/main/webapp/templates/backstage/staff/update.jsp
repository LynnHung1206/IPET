<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.web.staff.model.entity.*"%>
<%@ page import="com.web.admin.model.entities.*"%>

<%
Staff staff = (Staff) request.getAttribute("staff");
%>
<%
// Admin admin = (Admin) request.getAttribute("admin");

List<Admin.PK> adminpk = new ArrayList<>();
for(Admin.PK pk: adminpk){
 pk = (Admin.PK)request.getAttribute("adminpk");
}
%>
<%
AdminFunc adminFunc = (AdminFunc) request.getAttribute("adminFunc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Staff Info</title>
<style>
#staffdata {
	margin: auto;
}
</style>
</head>
<body>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form action="register" method="post">
		<table id="staffdata">
			<tr>
				<td><label>姓名:</label></td>
				<td><input type="text" name="sname"
					pattern="[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}"
					value="<%=staff.getName()%>" required></td>
			</tr>

			<tr>
				<td><label>身分證字號:</label></td>
				<td><input type="text" name="uid" value="<%=staff.getUid()%>"
					required></td>
			</tr>
			<tr>
				<td><label>生日:</label></td>
				<td><input type="date" name="birth"
					value="<%=staff.getBth()%>" readonly required></td>
			</tr>
			<tr>
				<td>性別:</td>
				<td><label for="girl"><input type="radio" name="sex"
						value="<%=staff.getSex()%>" checked><%=staff.getSex()%></label></td>
			</tr>
			<tr>
				<td><label>Email:</label></td>
				<td><input type="email" name="email"
					value="<%=staff.getEmail()%>" required></td>
			</tr>
			<tr>
				<td><label>手機:</label></td>
				<td><input type="tel" name="phone"
					value="<%=staff.getPhone()%>" required></td>
			</tr>
			<tr>
				<td><label>市內電話:</label></td>
				<td><input type="tel" name="tel"
					value="${staff.getTel() == null?'':staff.getTel()}"></td>
			</tr>
			<tr>
				<td><label>地址:</label></td>
				<td><input type="text" name="address"
					value="<%=staff.getAdd()%>" required></td>
			</tr>
			<tr>
				<td><label>帳號:</label></td>
				<td><input type="text" name="acount"
					value="<%=staff.getAc()%>" readonly required></td>
			</tr>
			<tr>
				<td><label>密碼:</label></td>
				<td><input type="password" name="password"
					value="<%=staff.getPw()%>" required></td>
			</tr>
			<tr>
				<td><label> 職稱: </label></td>
				<td><select name="job">
						<option value="" disabled selected>請選擇</option>
						<option value="經理" ${staff.getPosi()== "經理"? 'selected':''}>經理</option>
						<option value="財務" ${staff.getPosi()== "財務"? 'selected':''}>財務</option>
						<option value="會計" ${staff.getPosi()== "會計"? 'selected':''}>會計</option>
						<option value="人事" ${staff.getPosi()== "人事"? 'selected':''}>人事</option>
						<option value="美容師" ${staff.getPosi()== "美容師"? 'selected':''}>美容師</option>
						<option value="美容助理" ${staffVO.getPosi()== "美容助理"? 'selected':''}>美容助理</option>
						<option value="一般人員" ${staff.getPosi()== "一般人員"? 'selected':''}>一般人員</option>
				</select></td>
			<tr>
				<jsp:useBean id="adminFuncSvc" scope="page"
					class="com.web.admin.model.service.AdminFuncService" />

			</tr>
			<tr>
				<jsp:useBean id="staffSvc" scope="page"
					class="com.web.staff.model.service.StaffService" />
				<td><label>狀態:</label></td>
				<td><select name="status">
						<option value="0" ${staff.getStatus() == 0 ?'selected':''}>在職</option>
						<option value="1" ${staff.getStatus() == 1 ?'selected':''}>離職</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="hidden" name="action" value="update">
					<input type="hidden" name="staffId" value="<%=staff.getId()%> ">
				</td>
				<td><input type="submit" value="送出修改" onclick="enter()"></td>
			</tr>


		</table>

	</form>
	<script type="text/javascript">
		function enter() {
			alert("修改成功");
		}
	</script>
</body>
</html>