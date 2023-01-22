<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.web.product.model.entity.Product"%>

<%
Product prodVO = (Product) request.getAttribute("prodVO"); //ProdServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>商品資料修改 - update_pord_input.jsp</title>

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
				<h3>商品資料修改 - update_prod_input.jsp</h3>
				<h4>
					<a href="${pageContext.request.contextPath}/templates/backstage/prod/select_page.jsp"><img src="images/ghu.jpg" width="100"
						height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/ipet-back/prod/updateProdInput" name="form1" enctype="multipart/form-data">
		<table>
				<tr>
					<td>商品編號:<font color=red><b>*</b></font></td>
					<td><%=prodVO.getProdID()%></td>
				</tr>

			<!-- 這裡代表直接取原本的值跟顯示欄位 -->
			<tr>
				<td>商品名稱:</td>
				<td><input type="TEXT" name="prodName" size="45"
					value="<%=prodVO.getProdName()%>" /></td>
			</tr>
			<tr>
				<td>價錢:</td>
				<td><input type="TEXT" name="prodPrice" size="45"
					value="<%=prodVO.getProdPrice()%>" /></td>
			</tr>

			<tr>
				<td>商品描述:</td>
				<td><input type="TEXT" name="prodDescription" size="45"
					value="<%=prodVO.getProdDescription()%>" /></td>
			</tr>
			<tr>
				<td>上架狀態:</td>
				<td><input type="TEXT" name="prodStatus" size="45"
					value="<%=prodVO.getProdStatus()%>" /></td>
			</tr>

				<jsp:useBean id="prodTypeSvc" scope="page" class="com.web.product.model.service.ProductTypeServiceBack" />
				
			</tr>
				<tr>
					<td>類別:<font color=red><b>*</b></font></td>
					<td><select size="1" name="typeID">
						<c:forEach var="prodTypeVO" items="${prodTypeSvc.all}">
							<option value="${prodTypeVO.typeID}"
								${(prodVO.typeID==prodTypeVO.typeID)? 'selected':'' }>${prodTypeVO.typeName}
						</c:forEach>
					</select></td>
				</tr>

		</table>
		<input
			type="file" name="imgFile" value="上傳圖片" accept="image/*" />
		 <input type="hidden" name="action" value="update" > <input
			type="hidden" name="prodID" value="<%=prodVO.getProdID()%>">
			
		<input type="submit" value="送出修改">
	</FORM>

<!-- 	<FORM method="post" action="prod.do" enctype="multipart/form-data"> -->
<%-- 		<input type="hidden" name="prodID" value="<%=prodVO.getProdID()%>"> --%>
<!-- 		<input type="hidden" name="action" value="upload_img" /> 選取檔案:<input -->
<!-- 			type="file" name="imgFile" /> <input type="submit" value="新增圖片"> -->
<!-- 	</FORM> -->
</body>

</html>