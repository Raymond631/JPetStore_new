<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/29
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>JPetStore</title>
	<link rel="stylesheet" type="text/css" href="./css/jpetstore.css" media="screen"/>
</head>
<body id="entrance">

<div id="Content">
	<h2>Welcome to JPetStore</h2>
	<a href="${pageContext.request.contextPath}/Cart/cartList">cartList</a><br>
	<a href="${pageContext.request.contextPath}/Order/orderList">orderList</a><br>
	<br>

	<a href="${pageContext.request.contextPath}/Pet/petList?category=fish">Fish</a><br>
	<a href="${pageContext.request.contextPath}/Pet/petList?category=dogs">Dogs</a><br>
	<a href="${pageContext.request.contextPath}/Pet/petList?category=reptiles">Reptiles</a><br>
	<a href="${pageContext.request.contextPath}/Pet/petList?category=cats">Cats</a><br>
	<a href="${pageContext.request.contextPath}/Pet/petList?category=birds">Birds</a><br>

	<p><a href="main">Enter the Store</a></p>
</div>

</body>
</html>
