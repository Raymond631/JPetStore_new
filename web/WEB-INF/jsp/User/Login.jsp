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
	<script>
        function check()
        {
            var username = document.getElementById("username");
            let name = loginForm.username.value;
            if (username.value.trim() == "")
            {//没有输入用户名是显示提示
                var findNodes = document.getElementById("name");
                findNodes.innerText = "用户名不能为空";
                return false;
            } else
            {//输入了内容后清除节点内容
                document.getElementById("name").textContent = "";
            }

            var password = document.getElementById("password");
            let pass = loginForm.password.value;
            if (password.value.trim() == "")
            {
                var findNodes2 = document.getElementById("pass");
                findNodes2.innerText = "密码不能为空";
                return false;
            } else
            {
                document.getElementById("pass").innerText = "";
            }
        }
	</script>
</head>

<body>
<%@ include file="../Common/Top.jsp" %>

<div class="all">
	<div class="login">
		<div class="box">

			<p class="table">Login</p>

			<form action="../User/login" method="post" name="loginForm">
				<div>
					<input type="text" name="username" id="username" placeholder="Username">
				</div>
				<div>
					<input type="password" name="password" id="password" placeholder="Password">
				</div>
				<div class="vf">
					<input type="text" name="vCode" id="code" placeholder="verificationCode"/>
					<a href="../User/verificationCode"><img border="0" src="../User/verificationCode" name="checkcode"></a>
					<span id="name" style="margin-left: 20px; width: 20px"></span>
					<span id="pass" style="margin-left: 40px; width: 20px"></span>
				</div>
				<div style="color: red ;text-align: right">${requestScope.messageBox}</div>
				<input class="submit" type="submit" value="Login" onclick="return check();">
			</form>

			<div class="Tbottom">
				Need an account?<a href="../User/showRegister">Register Now!</a>
			</div>

		</div>
	</div>
</div>

<%@include file="../Common/Bottom.jsp" %>
</body>
</html>