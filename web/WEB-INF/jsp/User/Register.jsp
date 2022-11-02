<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/27
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>注册</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/register.css">
</head>

<body>
<%@include file="../Common/Top.jsp" %>

<div class="box">
	<div class="left"></div>
	<div class="right">

		<%--输入是否为空，密码是否一致，验证码刷新--%>
		<form action="../User/register" method="post">
			<h3>Welcome to register</h3>
			<div>
				<span>Username:</span>
				<input type="text" name="username"/>
			</div>
			<div>
				<span>Password:</span>
				<input type="text" id="pwd" name="password"/>
			</div>
			<div>
				<span>Repeat password:</span>
				<input type="text" id="pwd2" name="repeatedPassword"/>
			</div>
			<div>
				<span>VerificationCode:</span>
				<input type="text" name="vCode" size="5" maxlength="4"/>
				<a href="newUser"><img border="0" src="../User/verificationCode" name="checkcode"></a>
			</div>

			<input type="submit" class="submit" value="Register"/>
		</form>
		<div>${requestScope.messageBox}</div>

	</div>
</div>

<%@include file="../Common/Bottom.jsp" %>

</body>
</html>