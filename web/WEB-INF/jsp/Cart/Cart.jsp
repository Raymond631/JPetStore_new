<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>购物车</title>
	<link rel="stylesheet" type="text/css" href="../css/shopping.css"/>
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script type="text/javascript" src="../js/shopping.js"></script>
</head>
<body>
<!-- 头部 -->
<header class="site-header site-mini-header">
	<div class="container">
		<!--logo -->
		<div class="header-logo">
			<a class="logo ir" href="../"></a>
		</div>
		<!-- 标题 -->
		<div class="header-title has-more" id="J_miniHeaderTitle">
			<h2>我的购物车</h2>
			<p>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</p>
		</div>
		<div class="topbar-info" id="J_userInfo">
			<a rel="nofollow" class="link link-order" href="#">欢迎光临：${sessionScope.user.username}</a>
			<span class="sep">|</span>
			<a rel="nofollow" class="link link-order" href="../Order/showMyOrder">我的订单</a>
		</div>
	</div>
</header>
<!-- 商品内容 -->
<section class="page-main">
	<div class="container">
		<div class="cart-goods-list" id="J_cartListGoods">
			<div class="list-head myclear" data-checked="false">
				<div class="col col-check"><i class="iconfont icon-checkbox J_select" id="J_selectAll">√</i>全选</div>
				<div class="col col-img">&nbsp;</div>
				<div class="col col-name">商品名称</div>
				<div class="col col-price">单价</div>
				<div class="col col-num">数量</div>
				<div class="col col-total">小计</div>
				<div class="col col-action">操作</div>
			</div>
			<div id="wapper">

			</div>
			<div class="cart-bar myclear cart-bar-fixed">
				<div class="section-left">
					<a href="../" class="back-shopping J_goShoping">继续购物</a>
					<span class="cart-total">
								共
								<i id="J_cartTotalNum">1</i>
								件商品，已选择
								<i id="J_selTotalNum">0</i>
								件
							</span>
					<span class="total-price">
								合计：<em id="J_cartTotalPrice">0</em>元
							</span>
					<a class="btn btn-disabled" id="J_goCheckout">去结算</a>
				</div>
				<div class="no-select-tip" id="J_noSelectTip">
					请勾选需要结算的商品
					<i class="arrow arrow-a"></i>
					<i class="arrow arrow-b"></i>
				</div>
			</div>
		</div>
		<h2 class="xm-recommend-title"><span id="J_span">已经到底啦！</span></h2>
	</div>
</section>
</body>
</html>


<%--<html>--%>
<%--<head>--%>
<%--	<title>购物车</title>--%>
<%--	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>--%>
<%--	<script type="text/javascript" src="../js/Cart.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@include file="../Common/Top.jsp" %>--%>
<%--<div class="Content">--%>
<%--	<div id="Catalog">--%>
<%--		<div id="Cart">--%>
<%--			<h3>Shopping Cart</h3>--%>
<%--			<table style="text-align: center">--%>
<%--				<tr>--%>
<%--					<th><b>Item ID</b></th>--%>
<%--					<th><b>Product ID</b></th>--%>
<%--					<th><b>Description</b></th>--%>
<%--					<th><b>Stock</b></th>--%>
<%--					<th><b>Quantity</b></th>--%>
<%--					<th><b>List Price</b></th>--%>
<%--					<th><b>Total Cost</b></th>--%>
<%--					<th>&nbsp;</th>--%>
<%--				</tr>--%>
<%--				<c:if test="${sessionScope.cartItemList.isEmpty()}">--%>
<%--					<tr>--%>
<%--						<td colspan="8">Your cart is empty.</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<td colspan="4"></td>--%>
<%--						<td></td>--%>
<%--						<td><strong>Sub Total:</strong></td>--%>
<%--						<td><strong>$0.00</strong></td>--%>
<%--						<td></td>--%>
<%--					</tr>--%>
<%--				</c:if>--%>
<%--				<c:if test="${!sessionScope.cartItemList.isEmpty()}">--%>
<%--					<c:forEach items="${sessionScope.cartItemList}" var="cartItem">--%>
<%--						<tr>--%>
<%--							<td>${cartItem.itemID}</td>--%>
<%--							<td>${cartItem.productID}</td>--%>
<%--							<td>${cartItem.description}</td>--%>
<%--							<td>${cartItem.stock}</td>--%>
<%--							<td><input type="number" class="itemQuantity" name="${cartItem.itemID}" value="${cartItem.quantity}"/></td>--%>
<%--							<td>$${cartItem.listPrice}</td>--%>
<%--							<td>$${(cartItem.listPrice)*(cartItem.quantity)}</td>--%>
<%--							<td><a class="button" href="../Cart/removeCartItem?itemID=${cartItem.itemID}">Remove</a></td>--%>
<%--						</tr>--%>
<%--					</c:forEach>--%>
<%--					<tr>--%>
<%--						<td colspan="4"></td>--%>
<%--						<td>--%>
<%--							<button class="button" id="updateCart">Update Cart</button>--%>
<%--						</td>--%>
<%--						<td><strong>Sub Total:</strong></td>--%>
<%--						<td><strong>$${sessionScope.allCost}</strong></td>--%>
<%--						<td><a class="button" href="../Cart/removeCartItem?itemID=0">Remove All</a></td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<td colspan="8"><a class="button" href="../Order/orderSubmit">Proceed to Checkout</a></td>--%>
<%--					</tr>--%>
<%--				</c:if>--%>
<%--			</table>--%>
<%--		</div>--%>
<%--		<div id="Separator">&nbsp;</div>--%>
<%--	</div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>