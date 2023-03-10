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
	<title>我的订单</title>
	<link rel="stylesheet" type="text/css" href="../css/shopping.css"/>
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script type="text/javascript" src="../js/MyOrder.js"></script>
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
			<h2>我的订单</h2>
			<p>点击订单编号查看详情</p>
		</div>
		<div class="topbar-info" id="J_userInfo">
			<a rel="nofollow" class="link link-order" href="#">欢迎光临：${sessionScope.user.username}</a>
			<span class="sep">|</span>
			<a rel="nofollow" class="link link-order" href="../Cart/cartList">我的购物车</a>
		</div>
	</div>
</header>
<!-- 商品内容 -->
<section class="page-main">
	<div class="container">
		<div class="cart-goods-list" id="J_cartListGoods">
			<div class="list-head myclear" data-checked="false">
				<div class="col col-name" style="padding-left: 40px;width: 300px">下单时间</div>
				<div class="col col-price" style="width: 300px">订单编号</div>
				<div class="col col-price" style="padding-left: 80px">收件人</div>
				<div class="col col-total" style="margin-left: 80px">金额</div>
				<div class="col col-action" style="margin-left: 120px">操作</div>
			</div>
			<div id="wapper"></div>
		</div>
		<h2 class="xm-recommend-title"><span id="J_span">已经到底啦！</span></h2>
	</div>
</section>
</body>
</html>