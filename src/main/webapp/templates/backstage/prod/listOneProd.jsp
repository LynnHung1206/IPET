<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.web.product.model.entity.Product"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  Product prodVO = (Product) request.getAttribute("prodVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title> 商品資料 - listOneProd.jsp</title>

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
	width: 600px;
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

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>商品資料 - ListOneProd.jsp</h3>
		 <h4><a href="${pageContext.request.contextPath}/templates/backstage/prod/select_page.jsp"><img src="images/acc123.jpg" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>價錢</th>
		<th>商品描述</th>
		<th>上架狀態</th>
		<th>商品類別</th>
		<th>新增時間</th>
		<th>圖片</th>
	</tr>
	<tr>
		<td><%=prodVO.getProdID()%></td>
		<td><%=prodVO.getProdName()%></td>
		<td><%=prodVO.getProdPrice()%></td>
		<td><%=prodVO.getProdDescription()%></td>
		<td><%=prodVO.getProdStatus()%></td>
		<td>${prodVO.typeID}-[${prodVO.productType.typeName}]</td>
		<td><%=prodVO.getAddedTime()%></td>
<td><img src="<%=request.getContextPath()%>/ipet-back/prod/DBGifReader?prodID=${prodVO.prodID}" width="100px"></td>
	</tr>
</table>

</body>
</html>