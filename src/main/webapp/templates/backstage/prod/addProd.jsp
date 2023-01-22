<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.product.model.entity.Product"%>

<%
Product prodVO = (Product) request.getAttribute("prodVO");
%>
<!-- line 100 -->
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�ӫ~��Ʒs�W - addEmp.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>�ӫ~��Ʒs�W - addProd.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img
						src="${pageContext.request.contextPath}/prod/images/acc123.jpg"
						width="100" height="100" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="${pageContext.request.contextPath}/ipet-back/prod/addOneProd"
		name="form1" enctype="multipart/form-data">
		<table>
			<tr>
				<td>�ӫ~�W��:</td>
				<td><input type="TEXT" name="prodName" size="45"
					value="<%=(prodVO == null) ? "�p���氮" : prodVO.getProdName()%>" /></td>
			</tr>
			<tr>
				<td>����:</td>
				<td><input type="TEXT" name="prodPrice" size="45"
					value="<%=(prodVO == null) ? "300" : prodVO.getProdPrice()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~�y�z:</td>
				<td><input type="TEXT" name="prodDescription" size="45"
					value="<%=(prodVO == null) ? "�o�O�@�Ӱӫ~�y�z" : prodVO.getProdDescription()%>" /></td>
			</tr>



			<jsp:useBean id="prodTypeSvc" scope="page"
				class="com.web.product.model.service.ProductTypeServiceBack" />
			<tr>
				<td>���O:<font color=red><b>*</b></font></td>
				<td><select size="1" name="typeID">
						<c:forEach var="prodTypeVO" items="${prodTypeSvc.all}">
							<option value="${prodTypeVO.typeID}"
								${(prodVO.typeID==prodTypeVO.typeID)? 'selected':'' }>${prodTypeVO.typeName}
						</c:forEach>
				</select></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="file" name="imgFile" value="�W�ǹϤ�" accept="image/*" /> <input
			type="submit" value="�e�X�s�W">
	</FORM>

</body>



</html>