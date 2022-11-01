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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/category.css"/>
</head>
<body>
<%@include file="../Common/Top.jsp" %>

<div class="mainBox">
	<div class="left">
		<div class="left-top">
			<div><img class="picture" id="picture" src="${pageContext.request.contextPath}/images/show1.jpg"/>
			</div>
		</div>
		<div class="left-bottom">
			<div class="information">
				<div id="specificName" class="nameAndPrice">${requestScope.production}</div>
				<div id="specificPrice" class="nameAndPrice">price</div>
				<div id="description" class="nameAndPrice">description</div>
			</div>
		</div>
	</div>

	<%--    这里面放一个table吧--%>
	<div class="right">
		<div class="smallCateTable">
			<table style="text-align: center">
				<tr>
					<th><b>Item ID</b></th>
					<th><b>Product ID</b></th>
					<th><b>Description</b></th>
					<th><b>Stock</b></th>
					<th><b>Quantity</b></th>
					<th><b>List Price</b></th>
					<th><b>Total Cost</b></th>
					<th>&nbsp;</th>
				</tr>

				<c:forEach items="${sessionScope.cartItemList}" var="cartItem">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<a class="button"
							   href="${pageContext.request.contextPath}/Cart/removeCartItem?itemID=${cartItem.itemID}">Remove</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<%@include file="../Common/Bottom.jsp" %>
</body>
</html>
