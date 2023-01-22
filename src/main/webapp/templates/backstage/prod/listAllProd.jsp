<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.product.model.service.ProductServiceBack"%>
<%@ page import="com.web.product.model.service.ProductTypeServiceBack"%>
<%@ page import="com.web.product.model.entity.Product"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
ProductServiceBack prodSvc = new ProductServiceBack();
List<Product> list = prodSvc.getAll();
pageContext.setAttribute("list", list);


%>


<html>
<head>
<title>�Ҧ��ӫ~��� - listAllProd.jsp</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>�����m�߱ĥ� EL ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ����u��� - listAllProd.jsp</h3>
				<h4>
					<a href="${pageContext.request.contextPath}/templates/backstage/prod/select_page.jsp"><img
						src="${pageContext.request.contextPath}/static/backstage/img/dog1.png"
						width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�ӫ~�s��</th>
			<th>�ӫ~�W��</th>
			<th>����</th>
			<th>�ӫ~�y�z</th>
			<th>�s�W�ɶ�</th>
			<th>�W�[���A</th>
			<th>���O</th>
			<th>�Ϥ�</th>
			<th>�ק�</th>
			<th>�R��</th>
		</tr>

		<jsp:useBean id="prodTypeSvc" scope="page"
 			class="com.web.product.model.service.ProductTypeServiceBack" /> 
 			
<%-- 		<jsp:useBean id="prod_IMGSvc" scope="page" --%>
<%--  			class="com.web.product.model.service.ProductImgServiceBack" />  --%>
		<%@ include file="page1.file"%>
		<c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${prodVO.prodID}</td>
				<td>${prodVO.prodName}</td>
				<td>${prodVO.prodPrice}</td>
				<td>${prodVO.prodDescription}</td>
				<td>${prodVO.addedTime}</td>
				<td>${prodVO.prodStatus}</td>
				<td>${prodVO.typeID}-[${prodVO.productType.typeName}]</td>
				<td><img src="<%=request.getContextPath()%>/ipet-back/prod/DBGifReader?prodID=${prodVO.prodID}" width="100px"></td>
				
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ipet-back/prod/getOneForUpdate"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="prodID" value="${prodVO.prodID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ipet-back/prod/delete"
						style="margin-bottom: 0px;">
						<input type="submit" value="�R��"> <input type="hidden"
							name="prodID" value="${prodVO.prodID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>


	</table>
	<%@ include file="page2.file"%>

</body>
</html>