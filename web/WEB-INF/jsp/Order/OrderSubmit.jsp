<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>填写订单信息</title>
	<link rel="stylesheet" href="../css/orderSubmit.css">
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script type="text/javascript" src="../js/orderSubmit.js"></script>
</head>
<body>
<div class="order_head">
	<div class="head_background">
		<div class="head_box">
			<a href="../" class="head_left_a"><img src="../images/header/logo.png" alt="" class="head_left_p"></a>
			<h1 class="head_h1">确认订单</h1>
			<div class="head_right">
				<span class="head_right_in">欢迎光临：${sessionScope.user.username}</span>
				<span class="head_right_in">|</span>
				<a href="../Order/showMyOrder" class="head_right_in">我的订单</a>
			</div>
		</div>
	</div>
</div>
<div class="order_body">
	<div class="order_body_background">
		<div class="order_line">
			<div class="order_lien_in order_in">
				<h3 class="order_title">收货地址</h3>
			</div>
			<div class="order_lien_in">
				<a href="#" class="order_lien_in">单击选择地址，双击修改地址</a>
			</div>
			<div class="order_lien_in"></div>
		</div>
		<div class="order_box" id="adr_list">
			<a class="order_box_in address_box">
				<div class="order_box_circle"><p class="order_box_p1">+</p></div>
				<p class="order_box_p">填加新地址</p>
			</a>
			<a class="order_box_in address_box">
				<div class="order_box_circle"><p class="order_box_p1">+</p></div>
				<p class="order_box_p">填加新地址</p>
			</a>
			<a class="order_box_in address_box">
				<div class="order_box_circle"><p class="order_box_p1">+</p></div>
				<p class="order_box_p">填加新地址</p>
			</a>
		</div>
		<div class="order_line order_line_bordtr">
			<div class="order_lien_in">
				<h3 class="order_title">支付方式</h3>
			</div>
			<p class="order_PStime">微信支付</p>
			<p class="order_PStime">支付宝</p>
			<p class="order_PStime">货到付款</p>
			<div class="order_lien_in"></div>
		</div>
		<div class="order_line order_line_bordtr">
			<div class="order_lien_in">
				<h3 class="order_title">宠物清单</h3>
			</div>
			<div class="order_lien_in">
				<a href="../Cart/cartList"><span class="order_span_rigth" style="color: #ff6700">返回购物车→</span></a>
			</div>
			<div class="order_lien_in"></div>
		</div>

		<div id="order_item"></div>

		<div class="order_line order_line_bordtr">
			<div class="order_lien_in">
				<p class="order_price_11"><br>应付总额:</p>
			</div>
			<div class="order_price1">
				<p class="order_price_2">
					<span id="cost" style="font-size: 35px"></span>元
				</p>

			</div>
		</div>
		<div class="pay">
			<a href="javascript:newOrder();" class="pay_a" id="order_submit">结算</a>
		</div>
	</div>
</div>
</body>
</html>


<%--<html>--%>
<%--<head>--%>
<%--	<title>OrderForm</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@include file="../../../Top.jsp" %>--%>
<%--<div class="Content">--%>
<%--	<div id="CenterForm">--%>
<%--		<form method="post" action="../Order/orderPay" autocomplete="off">--%>
<%--			<h3>Shipping Address</h3>--%>
<%--			<table>--%>
<%--				<colgroup>--%>
<%--					<col style="width: 25%"/>--%>
<%--					<col/>--%>
<%--				</colgroup>--%>
<%--				<tr>--%>
<%--					<td>Receiver Name:</td>--%>
<%--					<td>--%>
<%--						<input type="text" name="Name" value="${requestScope.receiver.receiverName}"/>--%>
<%--						<span class="error-msg"></span>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<td>Phone Number:</td>--%>
<%--					<td><input type="text" name="Phone" value="${requestScope.receiver.phoneNumber}"/>--%>
<%--						<span class="error-msg"></span></td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<td>Country:</td>--%>
<%--					<td>--%>
<%--						<input type="text" name="Country" value="${requestScope.receiver.country}"/>--%>
<%--						<span class="error-msg"></span>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<td>Province:</td>--%>
<%--					<td>--%>
<%--						<input type="text" name="Province" value="${requestScope.receiver.province}"/>--%>
<%--						<span class="error-msg"></span>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<td>City:</td>--%>
<%--					<td>--%>
<%--						<input type="text" name="City" value="${requestScope.receiver.city}"/>--%>
<%--						<span class="error-msg"></span>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<td>District:</td>--%>
<%--					<td>--%>
<%--						<input type="text" name="District" value="${requestScope.receiver.district}"/>--%>
<%--						<span class="error-msg"></span>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--				<tr>--%>
<%--					<td>Detailed Address:</td>--%>
<%--					<td>--%>
<%--						<input type="text" name="Address" value="${requestScope.receiver.detailedAddress}"/>--%>
<%--						<span class="error-msg"></span>--%>
<%--					</td>--%>
<%--				</tr>--%>
<%--			</table>--%>
<%--			<h3>Ordering Products</h3>--%>
<%--			<table style="text-align: center">--%>
<%--				<tr>--%>
<%--					<th><b>Item ID</b></th>--%>
<%--					<th><b>Product ID</b></th>--%>
<%--					<th><b>Description</b></th>--%>
<%--					<th><b>Stock</b></th>--%>
<%--					<th><b>Quantity</b></th>--%>
<%--					<th><b>List Price</b></th>--%>
<%--					<th><b>Total Cost</b></th>--%>
<%--				</tr>--%>
<%--				<c:forEach items="${sessionScope.cartItemList}" var="cartItem">--%>
<%--					<tr>--%>
<%--						<td>${cartItem.itemID}</td>--%>
<%--						<td>${cartItem.productID}</td>--%>
<%--						<td style="text-align: left">${cartItem.description}</td>--%>
<%--						<td>${cartItem.stock}</td>--%>
<%--						<td>${cartItem.quantity}</td>--%>
<%--						<td>$${cartItem.listPrice}</td>--%>
<%--						<td>$${(cartItem.listPrice)*(cartItem.quantity)}</td>--%>
<%--					</tr>--%>
<%--				</c:forEach>--%>
<%--				<tr>--%>
<%--					<td colspan="5"></td>--%>
<%--					<td><strong>Sub Total:</strong></td>--%>
<%--					<td><strong>$${sessionScope.allCost}</strong></td>--%>
<%--				</tr>--%>
<%--			</table>--%>
<%--			<div class="button-bar">--%>
<%--				<button type="submit" class="button">Submit</button>--%>
<%--				<button type="button" class="button" onclick="location.href='../Cart/cartList';">Cancel</button>--%>
<%--			</div>--%>
<%--		</form>--%>
<%--	</div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
