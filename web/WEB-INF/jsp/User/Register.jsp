<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册</title>
	<link rel="stylesheet" href="../css/Login.css"/>
	<script type="text/javascript" src="../js/jquery-3.6.2.js"></script>
	<script type="text/javascript" src="../js/register.js"></script>
</head>
<body>
<div class="wrap">
	<!-- 头部logo -->
	<header class="header-wrap">
		<div class="header-logo">
			<a href="../">
				<img src="../images/login/placeholder.png">
			</a>
		</div>
	</header>
	<!-- 主要内容 -->
	<section class="main-wrap">
		<div class="layout_panel">
			<div class="mian-content">
				<div id="nav-tabs" class="nav_tabs">
					<a class="navtab-link now" href="javascript: void(0);">注册</a>
				</div>
				<div class="loginbox">
					<div class="btn login_area">
						<form action="../User/register" method="post" id="registerForm" autocomplete="off">
							<input class="item_account" type="text" name="username" id="username" placeholder="用户名" required="required">
							<div id="name_repeat" class="err_tip"></div>
							<input class="item_account" type="password" placeholder="密码" id="pwd" name="password" required="required">
							<input class="item_account" type="password" placeholder="确认密码" id="password_repeat" name="password_repeat" required="required">
							<input class="code_input" type="text" name="vCode" id="code" placeholder="验证码" required="required">
							<a class="code_link">
								<img id="verificationCode" class="code_img" src="../User/verificationCode" alt="验证码" onclick="newVerification()">
							</a>
							<div id="errer" class="err_tip">
								<span class="error-con">${requestScope.messageBox}</span>
							</div>
							<input class="btnadpt item_account" type="submit" value="注册">
						</form>
						<div class="other_panel myclear">
							<div class="links_area">
								<a href="../User/showLogin">已有账号？立即登录</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 底部声明 -->
	<footer class="footer-wrap">
		<div class="myclear">
			<ul class="lang-select-list">
				<li><a class="current" href="javascript: void(0);">简体</a>|</li>
				<li><a href="javascript: void(0);">繁体</a>|</li>
				<li><a href="javascript: void(0);">English</a>|</li>
				<li><a href="javascript: void(0);">常见问题</a>|</li>
				<li><a href="javascript: void(0);">隐私政策</a></li>
			</ul>
		</div>
		<div class="footer-intro">
			中南大学版权所有
		</div>
	</footer>
</div>
</body>
</html>