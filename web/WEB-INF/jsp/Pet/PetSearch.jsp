<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>我的订单</title>
	<link rel="stylesheet" type="text/css" href="../css/shopping.css"/>
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script type="text/javascript" src="../js/petSearch.js"></script>
</head>
<body>
<!-- 头部 -->
<header class="site-header site-mini-header">
	<div class="container">
		<!--logo -->
		<div class="header-logo">
			<a class="logo ir" href=".."></a>
		</div>
		<!-- 标题 -->
		<div class="header-title has-more" id="J_miniHeaderTitle">
			<h2>搜索结果</h2>
			<p>点击宠物名称查看详情</p>
		</div>
		<div class="topbar-info" id="J_userInfo">
			<a rel="nofollow" class="link link-order" href="#">欢迎光临：${sessionScope.user.username}</a>
			<span class="sep">|</span>
			<a rel="nofollow" class="link link-order" href="..">返回首页</a>
		</div>
	</div>
</header>
<!-- 商品内容 -->
<section class="page-main">
	<div class="container">
		<div class="cart-goods-list" id="J_cartListGoods">
			<div class="list-head myclear" data-checked="false">
				<div class="col col-name" style="padding-left: 130px;width: 270px">图片</div>
				<div class="col col-price">名称</div>
				<div class="col col-price" style="margin-left: 100px">价格</div>
				<div class="col col-price" style="padding-left: 90px;margin-left: 110px">描述</div>
			</div>
			<div id="wapper"></div>
		</div>
		<h2 class="xm-recommend-title"><span id="J_span">已经到底啦！</span></h2>
	</div>
</section>
</body>
</html>
