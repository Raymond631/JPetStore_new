<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>主页</title>
</head>

<body>
<%@ include file="../Common/Top.jsp" %>

<div id="Content">

	<div id="Welcome">
		<div id="WelcomeContent">

		</div>
	</div>

	<div id="Main">
		<div id="Sidebar">
			<div id="SidebarContent">
				<a href="${pageContext.request.contextPath}/Pet/petList?category=fish">Fish</a><br/>
				Saltwater, Freshwater<br/>
				<a href="${pageContext.request.contextPath}/Pet/petList?category=dogs">Dogs</a><br/>
				Various Breeds<br/>
				<a href="${pageContext.request.contextPath}/Pet/petList?category=reptiles">Reptiles</a><br/>
				Lizards, Turtles, Snakes<br/>
				<a href="${pageContext.request.contextPath}/Pet/petList?category=cats">Cats</a><br/>
				Various Breeds, Exotic Varieties<br/>
				<a href="${pageContext.request.contextPath}/Pet/petList?category=birds">Birds</a><br/>
				Exotic Varieties<br/>
			</div>
		</div>
		<div id="MainImage">
			<div id="MainImageContent">
				<map name="estoremap">
					<area alt="Birds" coords="72,2,280,250" href="${pageContext.request.contextPath}/Pet/petList?category=birds" shape="RECT"/>
					<area alt="Fish" coords="2,180,72,250" href="${pageContext.request.contextPath}/Pet/petList?category=fish" shape="RECT"/>
					<area alt="Dogs" coords="60,250,130,320" href="${pageContext.request.contextPath}/Pet/petList?category=dogs" shape="RECT"/>
					<area alt="Reptiles" coords="140,270,210,340" href="${pageContext.request.contextPath}/Pet/petList?category=reptiles" shape="RECT"/>
					<area alt="Cats" coords="225,240,295,310" href="${pageContext.request.contextPath}/Pet/petList?category=cats" shape="RECT"/>
					<area alt="Birds" coords="280,180,350,250" href="${pageContext.request.contextPath}/Pet/petList?category=birds" shape="RECT"/>
				</map>
				<img height="355" src="${pageContext.request.contextPath}/images/splash.gif" align="middle" usemap="#estoremap" width="350"/>
			</div>
		</div>

		<div id="RightSidebar">
			<div id="MyList">

			</div>
		</div>

		<div id="Separator">&nbsp;</div>
	</div>

	<%@include file="../Common/Bottom.jsp" %>
</body>
</html>