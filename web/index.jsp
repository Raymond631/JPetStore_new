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
	<script type="text/javascript" src="js/SearchTip.js"></script>
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
				<a href="#" id="J_siteDownloadApp">下载app</a>
			</nav>
			<!-- 购物车 -->
			<div id="J_miniCartTrigger" class="topbar-cart top-cart">
				<a href="Cart/cartList">
					<em></em>
					购物车
				</a>
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
					<a href="Order/showMyOrder">我的订单</a>
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
						<a href="/JPetStore_war_exploded/#dogs">狗狗</a>
					</li>
					<li class="nav-item">
						<a href="/JPetStore_war_exploded/#cats">猫猫</a>
					</li>
					<li class="nav-item">
						<a href="/JPetStore_war_exploded/#birds">鸟类</a>
					</li>
					<li class="nav-item">
						<a href="/JPetStore_war_exploded/#fish">水族</a>
					</li>
					<li class="nav-item">
						<a href="/JPetStore_war_exploded/#reptiles">两栖爬行</a>
					</li>
				</ul>
			</nav>
			<!-- 搜索 -->
			<div class="myclear header-search">
				<form action="Pet/searchPet" method="get" autocomplete="off">
					<input id="search" class="search-text" type="text" name="keyword" style="border-color: #ff6700"/>
					<input id="search_btn" class="search-btn" type="submit" value="" style="border-color: #ff6700"/>
				</form>
				<div id="J_keywordList" class="keyword-list">
					<ul class="result-list" id="tips"></ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 头部导航栏end -->
</header>
<!-- 主页 -->
<section>
	<!-- home-container start -->
	<header class="home-container">
		<div class="container">
			<div id="J_homeSwiper" class="swiper-wrapper">
				<!--左侧导航栏-->
				<ul id="J_categoryList" class="swiper-category-list">
					<li class="category-li">
						<a class="title" href="#dogs">
							宠物狗
							<em></em>
						</a>
						<div class="children">
							<ul class="children-list myclear">
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Bulldog">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg" alt="">
										<span class="text">Bulldog</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Chihuahua">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150617/3-15061G055460-L.jpg"
										     alt="">
										<span class="text">Chihuahua</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Dalmation">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/150413/3-150413105534b0.jpg" alt="">
										<span class="text">Dalmation</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Poodle">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/150410/2-150410144413b3.jpg" alt="">
										<span class="text">Poodle</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=GoldenRetriever">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150520/3-1505201145220-L.jpg"
										     alt="">
										<span class="text">Golden Retriever</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=LabradorRetriever">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150525/3-1505250931020-L.jpg"
										     alt="">
										<span class="text">Labrador Retriever</span>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="category-li">
						<a class="title" href="#cats">
							宠物猫
							<em></em>
						</a>
						<div class="children">
							<ul class="children-list myclear">
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Persian">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg" alt="">
										<span class="text">Persian</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Manx">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/150410/3-15041014351HZ.jpg" alt="">
										<span class="text">Manx</span>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="category-li">
						<a class="title" href="#birds">
							宠物鸟
							<em></em>
						</a>
						<div class="children">
							<ul class="children-list myclear">
								<li>
									<a class="link myclear" href="Pet/showDetails?name=AmazonParrot">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150521/3-1505210941520-L.jpg"
										     alt="">
										<span class="text">Amazon Parrot</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Finch">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/150305/2-150305163023627.jpg" alt="">
										<span class="text">Finch</span>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="category-li">
						<a class="title" href="#fish">
							水族宠物
							<em></em>
						</a>
						<div class="children">
							<ul class="children-list myclear">
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Koi">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150417/3-15041G459570-L.jpg"
										     alt="">
										<span class="text">Koi</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Goldfish">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/150305/2-1503051622519B.jpg" alt="">
										<span class="text">Goldfish</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Angelfish">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg"
										     alt="">
										<span class="text">Angelfish</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=TigerShark">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150525/3-1505251130140-L.jpg"
										     alt="">
										<span class="text">Tiger Shark</span>
									</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="category-li">
						<a class="title" href="#reptiles">
							两栖爬行
							<em></em>
						</a>
						<div class="children">
							<ul class="children-list myclear">
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Iguana">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150420/3-1504201405240-L.jpg"
										     alt="">
										<span class="text">Iguana</span>
									</a>
								</li>
								<li>
									<a class="link myclear" href="Pet/showDetails?name=Rattlesnake">
										<img class="small-img"
										     src="http://img.ixiupet.com/uploads/allimg/150519/3-15051Z930560-L.jpg"
										     alt="">
										<span class="text">Rattlesnake</span>
									</a>
								</li>
							</ul>
						</div>
					</li>
				</ul>
				<!--轮播图-->
				<ul class="swiper-list myclear">
					<li>
						<a href="javascript:;">
							<img src="https://pic.90sheji.com/design/00/60/20/09/36d0211e17c6e1152bb42ae411743545.png%21/fh/465/quality/90/unsharp/true/compress/true/canvas/1000x465a0a0/cvscolor/FFFFFFFF">
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="https://img.zcool.cn/community/01e8a060a3175b11013e3b7d5f3f37.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100">
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="https://img.zcool.cn/community/01b7d25f16e36da801215aa00321ff.jpg@1280w_1l_2o_100sh.jpg">
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="https://img.zcool.cn/community/01a0935efc3d70a801215aa0139294.jpg@1280w_1l_2o_100sh.jpg">
						</a>
					</li>
					<li>
						<a href="javascript:;">
							<img src="https://img.zcool.cn/community/0173c25bc4586aa801213deaefe7dc.jpg@2o.jpg">
						</a>
					</li>
				</ul>
				<ul class="swiper-pagination myclear">
					<li class="active"></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<!--轮播图翻页-->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
			<div class="home-hero-sub myclear">
				<ul class="home-channel-list myclear">
					<li><a href="javascript:;"><img src="images/section/header/m1.png" alt="主粮">主粮</a></li>
					<li><a href="javascript:;"><img src="images/section/header/m2.png" alt="零食">零食</a></li>
					<li><a href="javascript:;"><img src="images/section/header/m3.png" alt="玩具">玩具</a></li>
					<li><a href="javascript:;"><img src="images/section/header/m4.png" alt="清洁">清洁</a></li>
					<li><a href="javascript:;"><img src="images/section/header/m5.png" alt="装扮">装扮</a></li>
					<li><a href="javascript:;"><img src="images/section/header/m6.png" alt="护理">护理</a></li>
				</ul>
				<ul class="home-promo-list myclear">
					<li><a href=""><img
							src="https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00202-2862.jpg"
							alt=""></a></li>
					<li><a href=""><img
							src="https://img0.baidu.com/it/u=1410510505,4239539557&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500"
							alt=""></a></li>
					<li><a href=""><img
							src="https://img1.baidu.com/it/u=3188500518,1904352856&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=318"
							alt=""></a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- home-container end -->

	<!-- 主体内容的分页部分start -->
	<div class="page-main">
		<div class="container">

			<a name="dogs"></a>
			<div class="main main-iphon">
				<div class="box-hd">
					<h2>狗狗</h2>
					<div class="more2">
						<a class="more-link" href="javascript:;">查看全部<i></i></a>
					</div>
				</div>
				<div class="box-content myclear">
					<div class="left">
						<ul>
							<li class="brick-item">
								<a href="javascript:;">
									<img src="https://images.pexels.com/photos/1906153/pexels-photo-1906153.jpeg?auto=compress&cs=tinysrgb&w=600"
									     alt="">
								</a>
							</li>
						</ul>
					</div>
					<div class="right" style="display: block;">
						<ul class="myclear">
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Bulldog">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg" alt="">
									</div>
									<h3 class="title">Bulldog</h3>
									<p class="desc">Friendly dog from England</p>
									<p class="price">$18.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Chihuahua">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150617/3-15061G055460-L.jpg"
											alt=""></div>
									<h3 class="title">Chihuahua</h3>
									<p class="desc">Great companion dog</p>
									<p class="price">$125.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Dalmation">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150413/3-150413105534b0.jpg" alt="">
									</div>
									<h3 class="title">Dalmation</h3>
									<p class="desc">Great dog for a Fire Station</p>
									<p class="price">$18.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Poodle">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150410/2-150410144413b3.jpg" alt="">
									</div>
									<h3 class="title">Poodle</h3>
									<p class="desc">Cute dog from France</p>
									<p class="price">$18.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=GoldenRetriever">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150520/3-1505201145220-L.jpg"
											alt=""></div>
									<h3 class="title">Golden Retriever</h3>
									<p class="desc">Great family dog</p>
									<p class="price">$155.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=LabradorRetriever">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150525/3-1505250931020-L.jpg"
											alt=""></div>
									<h3 class="title">Labrador Retriever</h3>
									<p class="desc">Great hunting dog</p>
									<p class="price">$135.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150523/3-1505231055560-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150416/3-150416134913937.jpg" alt="">
									</div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<a name="cats"></a>
			<div class="main main-iphon">
				<div class="box-hd">
					<h2>猫猫</h2>
					<div class="more2">
						<a class="more-link" href="javascript:;">查看全部<i></i></a>
					</div>
				</div>
				<div class="box-content myclear">
					<div class="left">
						<ul>
							<li class="brick-item"><a href="javascript:;"><img
									src="https://cdn.pixabay.com/photo/2020/03/23/08/45/cat-4959941__340.jpg"
									alt=""></a></li>
						</ul>
					</div>
					<div class="right" style="display: block;">
						<ul class="myclear">
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Persian">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg" alt="">
									</div>
									<h3 class="title">Persian</h3>
									<p class="desc">Friendly house cat, doubles as a princess</p>
									<p class="price">$93.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Manx">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150410/3-15041014351HZ.jpg" alt="">
									</div>
									<h3 class="title">Manx</h3>
									<p class="desc">Great for reducing mouse populations</p>
									<p class="price">$23.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150403/2-1504031J035.jpg" alt="">
									</div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150603/3-1506031001400-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150410/3-15041011232C39.jpg" alt="">
									</div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150309/2-1503091F253250.jpg" alt="">
									</div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150403/2-1504031S512.jpg" alt="">
									</div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150603/3-1506031129130-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<a name="birds"></a>
			<div class="main main-iphon">
				<div class="box-hd">
					<h2>鸟类</h2>
					<div class="more2">
						<a class="more-link" href="javascript:;">查看全部<i></i></a>
					</div>
				</div>
				<div class="box-content myclear">
					<div class="left">
						<ul>
							<li class="brick-item"><a href="javascript:;"><img
									src="https://cdn.pixabay.com/photo/2014/07/26/19/29/weaver-402521__340.jpg"
									alt=""></a></li>
						</ul>
					</div>
					<div class="right" style="display: block;">
						<ul class="myclear">
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=AmazonParrot">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150521/3-1505210941520-L.jpg"
											alt=""></div>
									<h3 class="title">Amazon Parrot</h3>
									<p class="desc">Great companion for up to 75 years</p>
									<p class="price">$193.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Finch">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150305/2-150305163023627.jpg" alt="">
									</div>
									<h3 class="title">Finch</h3>
									<p class="desc">Great stress reliever</p>
									<p class="price">$15.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150505/3-1505051512060-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150417/3-15041G05631X8.jpg" alt="">
									</div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150417/3-15041F9335D92.jpg" alt="">
									</div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150505/3-1505051513460-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150521/3-1505210920260-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150417/3-15041G00S1S7.jpg" alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<a name="fish"></a>
			<div class="main main-iphon">
				<div class="box-hd">
					<h2>水族</h2>
					<div class="more2">
						<a class="more-link" href="javascript:;">查看全部<i></i></a>
					</div>
				</div>
				<div class="box-content myclear">
					<div class="left">
						<ul>
							<li class="brick-item"><a href="javascript:;"><img
									src="https://cdn.pixabay.com/photo/2017/08/03/10/59/nature-2575575__340.jpg"
									alt=""></a></li>
						</ul>
					</div>
					<div class="right" style="display: block;">
						<ul class="myclear">
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Koi">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150417/3-15041G459570-L.jpg"
											alt=""></div>
									<h3 class="title">Koi</h3>
									<p class="desc">Fresh Water fish from Japan</p>
									<p class="price">$18.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Goldfish">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/150305/2-1503051622519B.jpg" alt="">
									</div>
									<h3 class="title">Goldfish</h3>
									<p class="desc">Fresh Water fish from China</p>
									<p class="price">$5.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Angelfish">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg"
											alt=""></div>
									<h3 class="title">Angelfish</h3>
									<p class="desc">Salt Water fish from Australia</p>
									<p class="price">$16.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=TigerShark">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150525/3-1505251130140-L.jpg"
											alt=""></div>
									<h3 class="title">Tiger Shark</h3>
									<p class="desc">Salt Water fish from Australia</p>
									<p class="price">$18.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150525/3-1505251112520-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150417/3-15041G433040-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150417/3-15041G50S60-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150423/3-1504230924050-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<a name="reptiles"></a>
			<div class="main main-iphon">
				<div class="box-hd">
					<h2>两栖爬行</h2>
					<div class="more2">
						<a class="more-link" href="javascript:;">查看全部<i></i></a>
					</div>
				</div>
				<div class="box-content myclear">
					<div class="left">
						<ul>
							<li class="brick-item"><a href="javascript:;"><img
									src="https://cdn.pixabay.com/photo/2022/03/20/16/21/iguana-7081261__340.jpg"
									alt=""></a></li>
						</ul>
					</div>
					<div class="right" style="display: block;">
						<ul class="myclear">
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Iguana">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150420/3-1504201405240-L.jpg"
											alt=""></div>
									<h3 class="title">Iguana</h3>
									<p class="desc">Friendly green friend</p>
									<p class="price">$18.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="Pet/showDetails?name=Rattlesnake">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150519/3-15051Z930560-L.jpg"
											alt=""></div>
									<h3 class="title">Rattlesnake</h3>
									<p class="desc">Doubles as a watch dog</p>
									<p class="price">$18.50</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150417/3-15041GRH80-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150515/3-1505150920160-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150420/3-1504200Z5230-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150519/3-15051Z95F60-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150420/3-1504201204160-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
							<li class="brick-item brick-item-m">
								<a href="javascript:;">
									<div class="figure-img"><img
											src="http://img.ixiupet.com/uploads/allimg/150523/3-150523093Z20-L.jpg"
											alt=""></div>
									<h3 class="title">……</h3>
									<p class="desc">……</p>
									<p class="price">缺货</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 主体内容的分页部分end -->
</section>
<!-- 页脚 -->
<footer>
	<!-- 固定 -->
	<div class="div_home">
		<c:if test="${sessionScope.user!=null}">
			<a href="User/SelfCenter" class="home2"><span>个人中心</span></a>
			<a href="Cart/cartList" class="home5"><span>购物车</span></a>
		</c:if>
		<a href="#top" class="img_yincang"><span>回到顶部</span></a>
	</div>
</footer>
</body>
</html>