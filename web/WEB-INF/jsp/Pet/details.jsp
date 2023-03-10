<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>JPetStore</title>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/base.css">
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/detail.css">
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script src="../js/detail.js"></script>
</head>
<body>
<!-- 头部 -->
<header id="header">
	<!-- 顶部导航栏start -->
	<div class="site-topbar">
		<div class="container">
			<!-- 导航栏 -->
			<nav class="topbar-nav">
				<a href="/JPetStore_war_exploded">JPetStore</a>
				<span class="sep">|</span>
				<a href="https://www.ixiupet.com/zixun/">宠物资讯</a>
				<span class="sep">|</span>
				<a href="https://www.ixiupet.com/zhanhui/">宠物展会</a>
				<span class="sep">|</span>
				<a href="https://www.ixiupet.com/xuanpin/">选品库</a>
				<span class="sep">|</span>
				<a href="https://www.ixiupet.com/baike/">宠物百科</a>
				<span class="sep">|</span>
				<a href="https://www.ixiupet.com/tupian/">萌宠图片</a>
				<span class="sep">|</span>
				<a href="https://www.ixiupet.com/pinpai/">品牌大全</a>
				<span class="sep">|</span>
				<a href="https://www.ixiupet.com/pinzhong/">宠物品种</a>
				<span class="sep">|</span>
				<a href="javascript:;" id="J_siteDownloadApp">下载app</a>
			</nav>
			<!-- 购物车 -->
			<div id="J_miniCartTrigger" class="topbar-cart top-cart">
				<a href="../Cart/cartList">
					<em></em>
					购物车
				</a>
				<div id="J_miniCartMenu" class="cart-menu">
					购物车中还没有商品，赶紧选购吧！
				</div>
			</div>
			<!-- 登录注册 -->
			<c:if test="${sessionScope.user==null}">
				<div class="topbar-info">
					<a href="../User/showLogin">登录</a>
					<span class="sep">|</span>
					<a href="../User/showRegister">注册</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.user!=null}">
				<div class="topbar-info">
					<a href="#">欢迎光临：${sessionScope.user.username}</a>
					<span class="sep">|</span>
					<a href="../User/signOut">退出登录</a>
					<span class="sep">|</span>
					<a href="../Order/showMyOrder">我的订单</a>
				</div>
			</c:if>
		</div>
	</div>
	<!-- 顶部导航栏end -->

	<!-- nav start -->
	<div class="nav">
		<div class="w">
			<div class="dropdown fl">
				<div class="dt" onclick="window.location=''">
					<a href="/JPetStore_war_exploded"><img src="../images/header/logo.png"></a>
				</div>
			</div>
			<!-- 右侧导航 -->
			<div class="navitems fl">
				<ul>
					<li><a href="/JPetStore_war_exploded/#dogs">狗狗</a></li>
					<li><a href="/JPetStore_war_exploded/#cats">猫猫</a></li>
					<li><a href="/JPetStore_war_exploded/#birds">鸟类</a></li>
					<li><a href="/JPetStore_war_exploded/#fish">水族</a></li>
					<li><a href="/JPetStore_war_exploded/#reptiles">两栖爬行</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- nav end -->
</header>
<%-- 详情 --%>
<section>
	<div class="de_container w">
		<div class="product_intro clearfix">
			<!-- 预览区域 -->
			<div class="preview_wrap fl">
				<div class="preview_img">
					<img id="pet_img" src="" alt="">
					<div class="mask"></div>
					<div class="big">
						<img src="http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg" alt="" class="bigImg">
					</div>
				</div>
			</div>
			<!-- 产品详细信息 -->
			<div class="itemInfo_wrap fr">
				<div class="sku_name" id="pet_name"></div>
				<div class="summary">
					<dl class="summary_price">
						<dt>价格</dt>
						<dd>
							<i class="price" id="pet_price"></i>
						</dd>
					</dl>
					<dl class="choose_color">
						<dt>选择宠物</dt>
						<dd id="pet_list"></dd>
					</dl>
					<div class="choose_btns">
						<div class="choose_amount">
							<input id="item_num" type="text" value="1">
							<a href="javascript:num_up();" class="add">+</a>
							<a href="javascript:num_down();" class="reduce">-</a>
						</div>
						<a href="javascript:addToCart();" class="addcar" id="addToCart">加入购物车</a>
						<span id="msg"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 页脚 -->
<footer>
	<!-- 固定 -->
	<div class="div_home">
		<c:if test="${sessionScope.user!=null}">
			<a href="../User/SelfCenter" class="home2"><span>个人中心</span></a>
			<a href="../Cart/cartList" class="home5"><span>购物车</span></a>
		</c:if>
		<a href="#top" class="img_yincang"><span>回到顶部</span></a>
	</div>
</footer>
</body>
</html>
