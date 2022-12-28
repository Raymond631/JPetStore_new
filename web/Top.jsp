<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>JPetStore</title>
	<link rel="stylesheet" href="css/style.css"/>
	<script type="text/javascript" src="js/jquery-3.6.2.js"></script>
	<script src="js/index.js" charset="utf-8"></script>
	<script type="text/javascript" src="js/Search.js"></script>
</head>
<body>
<!-- 头部 -->
<header id="header">
	<!-- 顶部导航栏start -->
	<div class="site-topbar">
		<div class="container">
			<!-- 导航栏 -->
			<nav class="topbar-nav">
				<a href="#">JPetStore</a>
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
				<a href="Cart/cartList">
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
					<a href="User/showLogin">登录</a>
					<span class="sep">|</span>
					<a href="User/showRegister">注册</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.user!=null}">
				<div class="topbar-info">
					<a href="#">欢迎光临：${sessionScope.user.username}</a>
					<span class="sep">|</span>
					<a href="User/signOut">退出登录</a>
					<span class="sep">|</span>
					<a href="Order/orderList">我的订单</a>
				</div>
			</c:if>
		</div>
	</div>
	<!-- 顶部导航栏end -->

	<!-- 头部导航栏start -->
	<div class="site-header">
		<div class="container myclear">
			<!-- logo -->
			<div class="header-logo">
				<ul class="myclear">
					<li><a href="/JPetStore_war_exploded"></a></li>
					<li></li>
				</ul>
			</div>
			<!-- 导航栏 -->
			<nav class="header-nav myclear">
				<ul id="J_childrenList">
					<li class="nav-item">
						<a href="#dogs">狗狗</a>
					</li>
					<li class="nav-item">
						<a href="#cats">猫猫</a>
					</li>
					<li class="nav-item">
						<a href="#birds">鸟类</a>
					</li>
					<li class="nav-item">
						<a href="#fish">水族</a>
					</li>
					<li class="nav-item">
						<a href="#reptiles">两栖爬行</a>
					</li>
				</ul>
			</nav>
			<!-- 搜索 -->
			<div class="myclear header-search ">
				<input id="search" class="search-text" type="text"/>
				<input class="search-btn" type="text"/>
				<div id="J_keywordList" class="keyword-list">
					<ul class="result-list">
						<li><a href="javascript:;">Dogs</a></li>
						<li><a href="javascript:;">Cats</a></li>
						<li><a href="javascript:;">Birds</a></li>
						<li><a href="javascript:;">Fish</a></li>
						<li><a href="javascript:;">Reptiles</a></li>
						<li><a href="javascript:;">Poodle</a></li>
						<li><a href="javascript:;">Manx</a></li>
						<li><a href="javascript:;">Finch</a></li>
						<li><a href="javascript:;">Goldfish</a></li>
						<li><a href="javascript:;">Rattlesnake</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 头部导航栏end -->
</header>

<%--<html>--%>
<%--<head>--%>
<%--	<title>Top</title>--%>
<%--	<link rel="stylesheet" type="text/css" href="../css/jpetstore.css" media="screen"/>--%>
<%--	<link rel="stylesheet" type="text/css" href="../css/aspectran.css"/>--%>
<%--	<link rel="stylesheet" type="text/css" href="../css/top.css"/>--%>
<%--	<link rel="stylesheet" type="text/css" href="../css/NavigationBar.css">--%>
<%--	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>--%>
<%--	<script src="../js/Search.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="header">--%>
<%--	<div class="logo">--%>
<%--		<div class="logoName">--%>
<%--			<h1 class="gradient-text">Jpetstore</h1>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	<div class="top-cover">--%>
<%--		<form action="../Pet/searchPet" method="post" name="searchForm" id="searchForm" autocomplete="off">--%>
<%--			<div class="tb">--%>
<%--				<div class="td">--%>
<%--					<input type="text" name="keyword" id="keyword" placeholder="Product Search" required>--%>
<%--				</div>--%>
<%--				<div class="td" id="s-cover">--%>
<%--					<button type="submit">--%>
<%--						<div id="s-circle"></div>--%>
<%--						<span></span>--%>
<%--					</button>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</form>--%>
<%--		<div id="productAutoComplete">--%>
<%--			<ul id="productAutoList"></ul>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	<div class="top-right">--%>
<%--		<a href="../Cart/cartList">--%>
<%--			<img align="middle" name="img_cart" src="../images/shopping.png"/>--%>
<%--		</a>--%>
<%--		<c:if test="${sessionScope.user == null}">--%>
<%--			<a href="../User/showLogin">--%>
<%--				<img align="middle" name="img_cart" src="../images/login.png"/>--%>
<%--			</a>--%>
<%--			<a href="../User/showRegister">--%>
<%--				<img align="middle" name="img_cart" src="../images/register.png"/>--%>
<%--			</a>--%>
<%--		</c:if>--%>
<%--		<c:if test="${sessionScope.user != null}">--%>
<%--			<a href="../Order/orderList">--%>
<%--				<img align="middle" name="img_cart" src="../images/order.png"/>--%>
<%--			</a>--%>
<%--			<a href="../User/personalCenter">--%>
<%--				<img align="middle" name="img_cart" src="../images/self.png"/>--%>
<%--			</a>--%>
<%--			<a href="../User/signOut">--%>
<%--				<img align="middle" name="img_cart" src="../images/logout.png"/>--%>
<%--			</a>--%>
<%--		</c:if>--%>
<%--	</div>--%>
<%--</div>--%>

<%--<nav id="navbar" style="z-index: 9999">--%>
<%--	<ul class="navbar-items flexbox-col">--%>
<%--		<li class="navbar-logo flexbox-left">--%>
<%--			<a class="navbar-item-inner flexbox" href="../">--%>
<%--				<span style="font-size: 20px">Home</span>--%>
<%--			</a>--%>
<%--		</li>--%>
<%--		<li class="navbar-item flexbox-left">--%>
<%--			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=fish">--%>
<%--				<div class="navbar-item-inner-icon-wrapper flexbox">--%>
<%--					<ion-icon name="search-outline">Fish</ion-icon>--%>
<%--				</div>--%>
<%--				<span class="link-text">Saltwater, Freshwater</span>--%>
<%--			</a>--%>
<%--		</li>--%>
<%--		<li class="navbar-item flexbox-left">--%>
<%--			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=dogs">--%>
<%--				<div class="navbar-item-inner-icon-wrapper flexbox">--%>
<%--					<ion-icon name="home-outline">Dogs</ion-icon>--%>
<%--				</div>--%>
<%--				<span class="link-text">Various Breeds</span>--%>
<%--			</a>--%>
<%--		</li>--%>
<%--		<li class="navbar-item flexbox-left">--%>
<%--			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=reptiles">--%>
<%--				<div class="navbar-item-inner-icon-wrapper flexbox">--%>
<%--					<ion-icon name="folder-open-outline">Reptiles</ion-icon>--%>
<%--				</div>--%>
<%--				<span class="link-text"> Lizards, Turtles, Snakes</span>--%>
<%--			</a>--%>
<%--		</li>--%>
<%--		<li class="navbar-item flexbox-left">--%>
<%--			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=cats">--%>
<%--				<div class="navbar-item-inner-icon-wrapper flexbox">--%>
<%--					<ion-icon name="pie-chart-outline">Cats</ion-icon>--%>
<%--				</div>--%>
<%--				<span class="link-text">Various Breeds, Exotic Varieties</span>--%>
<%--			</a>--%>
<%--		</li>--%>
<%--		<li class="navbar-item flexbox-left">--%>
<%--			<a class="navbar-item-inner flexbox-left" href="../Pet/petList?category=birds">--%>
<%--				<div class="navbar-item-inner-icon-wrapper flexbox">--%>
<%--					<ion-icon name="people-outline">Birds</ion-icon>--%>
<%--				</div>--%>
<%--				<span class="link-text"> Exotic Varieties</span>--%>
<%--			</a>--%>
<%--		</li>--%>
<%--	</ul>--%>
<%--</nav>--%>
<%--</body>--%>
<%--</html>--%>
