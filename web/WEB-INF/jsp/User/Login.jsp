<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/Login.css">
	<title>登录界面</title>
</head>

<body>
<%@ include file="../Common/Top.jsp" %>

<div class="all">
	<div class="login">
		<div class="box">

			<p class="table">Login</p>

			<form action="../User/login" method="post">
				<div>
					<input type="text" name="username" placeholder="Username">
				</div>
				<div>
					<input type="password" name="password" placeholder="Password">
				</div>
				<div class="vf">
					<input type="text" name="vCode" placeholder="verificationCode"/>
					<a href="../User/verificationCode"><img border="0" src="../User/verificationCode" name="checkcode"></a>
				</div>

				<input class="submit" type="submit" value="Login">
			</form>

			<div>${requestScope.messageBox}</div>

			<div class="Tbottom">
				Need an account?<a href="../User/showRegister">Register Now!</a>
			</div>

		</div>
	</div>
</div>

<%@include file="../Common/Bottom.jsp" %>
</body>
</html>