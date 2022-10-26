<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Bottom</title>
</head>
<body>
<div id="Footer">
	<div id="PoweredBy">
		<a href="https://cse.csu.edu.cn/" class="external" target="_blank">中南大学计算机学院</a><br>
		<a href="https://space.bilibili.com/388835447/" class="external" target="_blank">Web应用开发技术——宋铁老师</a>
	</div>

	<c:if test="${sessionScope.accountBean == null}">
		<div id="Banner"></div>
	</c:if>
	<c:if test="${sessionScope.accountBean != null}">
		<div id="Banner">
			<img src="${pageContext.request.contextPath}/images/banner_dogs.gif">
		</div>
	</c:if>

</div>
</body>
</html>
