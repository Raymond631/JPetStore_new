<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/11/1
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" type="text/css" href="../css/category.css"/>
</head>
<body>
<%@include file="../Common/Top.jsp" %>

<div class="mainBox">
	<div class="left">
		<div class="left-top">
			<div><img class="picture" id="picture" src="../images/show1.jpg"/>
			</div>
		</div>
		<div class="left-bottom">
			<div class="information">
				<div id="specificName" class="nameAndPrice">${requestScope.product.getProductID()}</div>
				<div id="specificPrice" class="nameAndPrice">${requestScope.product.getName()}</div>
				<div id="description" class="nameAndPrice">${requestScope.product.getIntroduce()}</div>
			</div>
		</div>
	</div>

	<%--    这里面放一个table吧--%>
	<div class="right">
		<div class="smallCateTable">

			<table style="text-align: center">
				<tr>
					<th><b>Item ID</b></th>
					<th><b>Description</b></th>
					<th><b>Stock</b></th>
					<th><b>List Price</b></th>
					<th>&nbsp;</th>
				</tr>

				<c:forEach items="${requestScope.product.getItemMap()}" var="item">
					<tr>
						<td>${item.key}</td>
						<td>${item.value.getDescription()}</td>
						<td>${item.value.getStock()}</td>
						<td>${item.value.getListPrice()}</td>
						<td><a class="button" href="../Cart/addCartItem?itemID=${item.key}">Add to cart</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<%@include file="../Common/Bottom.jsp" %>
</body>
</html>
