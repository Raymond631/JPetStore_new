<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/11/1
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
<%@include file="../Common/Top.jsp" %>
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
<%@include file="../Common/Bottom.jsp" %>

</body>
</html>
