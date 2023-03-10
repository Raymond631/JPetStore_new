<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>详情</title>
	<link rel="stylesheet" href="../css/orderSubmit.css">
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script type="text/javascript" src="../js/OrderDetails.js"></script>
</head>
<body>
<div class="order_head">
	<div class="head_background">
		<div class="head_box">
			<a href="../" class="head_left_a"><img src="../images/header/logo.png" alt="" class="head_left_p"></a>
			<h1 class="head_h1">订单详情</h1>
			<div class="head_right">
				<span class="head_right_in">欢迎光临：${sessionScope.user.username}</span>
				<span class="head_right_in">|</span>
				<a href="../Order/showMyOrder" class="head_right_in">返回订单列表</a>
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
			<div class="order_lien_in"></div>
		</div>
		<div class="order_box" id="adr_list">
			<a class="order_box_in address_box"></a>
			<a class="order_box_in address_box"></a>
			<a class="order_box_in address_box"></a>
		</div>
		<div class="order_line order_line_bordtr">
			<div class="order_lien_in" id="payMethod">
				<h3 class="order_title">支付方式</h3>
			</div>
			<div class="order_lien_in"></div>
		</div>
		<div class="order_line order_line_bordtr">
			<div class="order_lien_in">
				<h3 class="order_title">宠物清单</h3>
			</div>
			<div class="order_lien_in"></div>
		</div>
		<div id="order_item">

		</div>
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
			<a href="../Order/showMyOrder" class="pay_a" id="order_submit">返回订单列表</a>
		</div>
	</div>
</div>
</body>
</html>