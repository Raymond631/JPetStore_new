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
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/register.css">
	<title>登录界面</title>
</head>

<body>
<%@include file="../Common/Top.jsp" %>
${sessionScope.messageAccount}

<div class="box">
	<div class="left"></div>
	<div class="right">
		<form action="newUser" method="post">
			<h3>User Information</h3>
			User ID:<input type="text" name="username"/>
			New password:<input type="text" name="password"/>
			Repeat password:<input type="text" name="repeatedPassword"/>
			VerificationCode: <input type="text" name="vCode" size="5" maxlength="4"/>
			<a href="newUser"><img border="0" src="verificationCode" name="checkcode"></a>

			<h3>Account Information</h3>

			ReceiverName: <input type="text" name="ReceiverName" value="${sessionScope.User.receiverName}"/>
			Email:<input type="text" size="40" name="email" value="${sessionScope.User.email}"/>
			Phone:<input type="text" name="phone" value="${sessionScope.User.phoneNumber}"/>
			Country:<input type="text" size="40" name="country" value="${sessionScope.User.country}"/>
			Province:<input type="text" size="40" name="province" value="${sessionScope.User.province}"/>
			City:<input type="text" name="city" value="${sessionScope.User.city}"/>
			district:<input type="text" size="4" name="district" value="${sessionScope.User.district}"/>
			DetailedAddress:<input type="text" size="10" name="detailedAddress" value="${sessionScope.User.detailedAddress}"/>


			<h3>Profile Information</h3>
			Language Preference:
			<select name="languagePreference">
				<option value="english" selected="selected">english</option>
				<option value="japanese">japanese</option>
			</select>
			Favourite Category:
			<select name="favouriteCategoryId">
				<option value="FISH">FISH</option>
				<option selected="selected" value="DOGS">DOGS</option>
				<option value="REPTILES">REPTILES</option>
				<option value="CATS">CATS</option>
				<option value="BIRDS">BIRDS</option>
			</select>
			Enable MyList

			<input type="checkbox" name="listOption" value="${sessionScope.User.listOption}"/>
			Enable MyBanner
			<input type="checkbox" name="bannerOption" value="${sessionScope.User.bannerOption}"/>

			<input type="submit" class="submit" value="Save Account Information"/>
		</form>
	</div>
</div>

<%@include file="../Common/Bottom.jsp" %>

</body>
</html>