<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prod : Home</title>
</head>
<body>
	<h2>Prod : Home</h2>
	<p>資料查詢:</p>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<ul>
		<li><a href="listAllProd.jsp">List</a> all Prods</li>
	</ul>
	<form method="post" action="${pageContext.request.contextPath}/ipet-back/prod/listOneProd">
		<b>輸入商品編號 (如1,2,3):</b> <input type="text" name="prodID" /> <input
			type="hidden" name="action" value="getOne_For_Display" /> <input
			type="submit" value="送出" />
		<h4>(資料格式驗證 by Controller ).</h4>
	</form>

	<h3>商品管理</h3>

	<ul>
		<li><a href='addProd.jsp'>Add</a> a new Prod.</li>
	</ul>


</body>
</html>