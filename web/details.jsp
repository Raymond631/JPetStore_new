<!-- 头部 -->
<%@include file="Top.jsp" %>

<%-- 详情 --%>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/detail.css">
<script src="js/detail.js"></script>
<section>
	<div class="de_container w">
		<div class="product_intro clearfix">
			<!-- 预览区域 -->
			<div class="preview_wrap fl">
				<div class="preview_img">
					<img src="http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg" alt="">
					<div class="mask"></div>
					<div class="big">
						<img src="http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg" alt="" class="bigImg">
					</div>
				</div>
			</div>
			<!-- 产品详细信息 -->
			<div class="itemInfo_wrap fr">
				<div class="sku_name">
					Apple iPhone 6s（A1700）64G玫瑰金色 移动通信电信4G手机
				</div>
				<div class="summary">
					<dl class="summary_price">
						<dt>价格</dt>
						<dd>
							<i class="price">￥5299.00 </i>
						</dd>
					</dl>
					<dl class="choose_color">
						<dt>选择颜色</dt>
						<dd>
							<a href="javascript:;" class="current">玫瑰金</a>
							<a href="javascript:;">金色</a>
							<a href="javascript:;">白色</a>
							<a href="javascript:;">土豪色</a>
						</dd>
					</dl>
					<div class="choose_btns">
						<div class="choose_amount">
							<input type="text" value="1">
							<a href="javascript:;" class="add">+</a>
							<a href="javascript:;" class="reduce">-</a>
						</div>
						<a href="#" class="addcar">加入购物车</a>
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
			<a href="User/personalCenter" class="home2"><span>个人中心</span></a>
			<a href="Cart/cartList" class="home5"><span>购物车</span></a>
		</c:if>
		<a href="#top" class="img_yincang"><span>回到顶部</span></a>
	</div>
</footer>
</body>
</html>
