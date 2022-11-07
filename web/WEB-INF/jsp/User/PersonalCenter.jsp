<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/selfCenter.css"/>
</head>

<body>
<%@ include file="../Common/Top.jsp" %>
<div class="mainBox">
	<div class="left">
		<h3>User Information</h3>
		<div class="left-top">
			<div class="info">
				<div class="userName">
					<span>Name:</span>
					<span style="padding-left: 70px">${sessionScope.user.getUsername()}</span>
				</div>
				<div class="password">
					<div>
						Password:
						<input style="margin-left: 0 ;width: 60%;font-size: 25px;"
						       type=" password"
						       name="originalPassword"
						       value=""
						       autocomplete="off"
						/></div>
				</div>
			</div>
			<div class="changePassword">
				<div>changePassword</div>
			</div>
		</div>
		<h3>Profile Information</h3>
		<div class="left-bottom">
			<div class="frontProfile">Language Preference:</div>
			<div class="profileInformation"></div>
			<div class="frontProfile">Favourite Category:</div>
			<div class="profileInformation"></div>
			<div class="frontProfile">Enable MyList:</div>
			<div class="profileInformation"></div>
			<div class="frontProfile">Enable MyBanner:</div>
			<div class="profileInformation"></div>
		</div>
	</div>
	<div class="right">
		<h3>Account Information</h3>
		<div class="account">
			<div class="frontAccount">ReceiverName:</div>
			<div class="accountInformation"></div>
			<div class="frontAccount">Email:</div>
			<div class="accountInformation"></div>
			<div class="frontAccount">Phone:</div>
			<div class="accountInformation"></div>
			<div class="frontAccount">Country:</div>
			<div class="accountInformation"></div>
			<div class="frontAccount">Province:</div>
			<div class="accountInformation"></div>
			<div class="frontAccount">City:</div>
			<div class="accountInformation"></div>
			<div class="frontAccount">district:</div>
			<div class="accountInformation"></div>
			<div class="frontAccount">DetailedAddress:</div>
			<div class="accountInformation"></div>
		</div>
	</div>
</div>

<%@include file="../Common/Bottom.jsp" %>
</body>
</html>