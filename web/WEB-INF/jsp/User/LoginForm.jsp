<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../Common/Top.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/Login.css">
    <title>登录界面</title>
</head>

<body>
<div class="all">
<div class="login">
    <div class="box">
        <p class="table">Login</p>
        <form action="sigonForm">
            <input type="text" placeholder="ID">
            <input type="password" placeholder="Password">
            <div class="vf">
                <input type="text" name="vCode" placeholder="verificationCode"/>
                <a href="Login"><img border="0" src="verificationCode" name="checkcode"></a>
            </div>
            <input class="submit" type="submit" value="Login">
            <div class="Tbottom">
                Need a username and password?
                <a href="newAccountForm">Register Now!</a>
            </div>
        </form>
    </div>
</div>
</div>
</body>

</html>
<%@include file="../Common/Bottom.jsp"%>

