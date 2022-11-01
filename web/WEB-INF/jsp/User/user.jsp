<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/27
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../Common/Top.jsp"%>

${sessionScope.messageAccount}


<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="css/register.css">
  <title>登录界面</title>
</head>

<body>
<div class="box">
  <div class="left"></div>
  <div class="right">
    <form action="newUser" method="post">
      <h3>User Information</h3>
      User ID:<input type="text" name="username"/>
      New password:<input type="text" name="password" />
      Repeat password:<input type="text" name="repeatedPassword" />
      VerificationCode: <input type="text" name="vCode" size="5" maxlength="4"/>
      <a href="newUser"><img border="0" src="verificationCode" name="checkcode"></a>

      <%@ include file="IncludeAccountFields.jsp"%>
      <input type="submit" class="submit" value="Save Account Information" />
    </form>
  </div>
</div>
</body>
<%@include file="../Common/Bottom.jsp"%>
