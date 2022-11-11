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

<div class="Content">

    <%--    <div id="Welcome">--%>
    <%--        <div id="WelcomeContent">--%>

    <%--        </div>--%>
    <%--    </div>--%>

    <div class="Main">
        <div id="Sidebar">

            <%--            <div id="SidebarContent">--%>
            <%--                <a href="../Pet/petList?category=fish">Fish</a><br/>--%>
            <%--                Saltwater, Freshwater<br/>--%>
            <%--                <a href="../Pet/petList?category=dogs">Dogs</a><br/>--%>
            <%--                Various Breeds<br/>--%>
            <%--                <a href="../Pet/petList?category=reptiles">Reptiles</a><br/>--%>
            <%--                Lizards, Turtles, Snakes<br/>--%>
            <%--                <a href="../Pet/petList?category=cats">Cats</a><br/>--%>
            <%--                Various Breeds, Exotic Varieties<br/>--%>
            <%--                <a href="../Pet/petList?category=birds">Birds</a><br/>--%>
            <%--                Exotic Varieties<br/>--%>
            <%--            </div>--%>

        </div>
        <%--		<div id="MainImage">--%>
        <%--			<div id="MainImageContent">--%>
        <%--				<map name="estoremap">--%>
        <%--					<area alt="Birds" coords="72,2,280,250" href="../Pet/petList?category=birds" shape="RECT"/>--%>
        <%--					<area alt="Fish" coords="2,180,72,250" href="../Pet/petList?category=fish" shape="RECT"/>--%>
        <%--					<area alt="Dogs" coords="60,250,130,320" href="../Pet/petList?category=dogs" shape="RECT"/>--%>
        <%--					<area alt="Reptiles" coords="140,270,210,340" href="../Pet/petList?category=reptiles" shape="RECT"/>--%>
        <%--					<area alt="Cats" coords="225,240,295,310" href="../Pet/petList?category=cats" shape="RECT"/>--%>
        <%--					<area alt="Birds" coords="280,180,350,250" href="../Pet/petList?category=birds" shape="RECT"/>--%>
        <%--				</map>--%>
        <%--				<img height="355" src="../images/splash.gif" align="middle" usemap="#estoremap" width="350"/>--%>
        <%--			</div>--%>
        <%--		</div>--%>
        <div class="layout">
            <ul>
                <li><a href="../Pet/petList?category=fish">
                    <img style="width: 100%;height: 100%; background-size: cover;" src="../images/fish.jpg">
                </a></li>
                <li><a href="../Pet/petList?category=dogs">
                    <img style="width: 100%;height: 100%; background-size: cover;" src="../images/dogs.jpg">
                </a></li>
                <li><a href="../Pet/petList?category=reptiles">
                    <img style="width: 100%;height: 100%; background-size: cover;" src="../images/reptiles.jpg">
                </a></li>
                <li><a href="../Pet/petList?category=cats">
                    <img style="width: 100%;height: 100%; background-size: cover;" src="../images/cats.jpg">
                </a></li>
                <li><a href="../Pet/petList?category=birds">
                    <img style="width: 100%;height: 100%; background-size: cover;" src="../images/birds.jpg">
                </a></li>
            </ul>
        </div>

        <div id="RightSidebar">
            <div id="MyList">

            </div>
        </div>

        <div id="Separator">&nbsp;</div>
    </div>


    <%--    <%@include file="../Common/Bottom.jsp" %>--%>
</body>
</html>

<style>
    .layout {
        width: 50%;
        height: 65%;
        margin-left: 40px;
        margin-top: 0;
    }

    .layout ul {
        width: 880px;
        height: 560px;
        background-color: white;
        border: 1px solid black;

    }

    .layout ul li {
        float: left;
        list-style: none;
        background-size: cover;
        width: 100%;
        height: 100%
    }

    .layout ul li:nth-child(1) {
        margin-left: 15px;
        margin-top: 15px;
        width: 320px;
        height: 530px;
        /*background-color: red;*/
        background-size: cover;
    }

    .layout ul li:nth-child(2) {
        margin-left: 350px;
        margin-top: -530px;
        width: 510px;
        height: 230px;
        /*background-color: red;*/
        background-size: cover;
    }

    .layout ul li:nth-child(3) {
        margin-left: 350px;
        margin-top: -280px;
        width: 230px;
        height: 280px;
        /*background-color: red;*/
        background-size: cover;
    }


    .layout ul li:nth-child(4) {
        margin-left: 595px;
        margin-top: -280px;
        width: 265px;
        height: 133px;
        /*background-color: red;*/
        background-size: cover;
    }

    .layout ul li:nth-child(5) {
        margin-left: 595px;
        margin-top: -134px;
        width: 265px;
        height: 133px;
        /*background-color: red;*/
        background-size: cover;
    }


</style>