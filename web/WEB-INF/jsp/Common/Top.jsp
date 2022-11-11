<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/10/23
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Top ♡</title>

    <link rel="stylesheet" type="text/css" href="../css/top.css"/>
</head>
<body>

<div class="allheader">
    <div class="logo">
        <div class="logoImg">
            <a href="../Pet/homePage"><img src="../images/logo-topbar.gif"/></a>
        </div>
        <div class="logoName">
            <h1 class="gradient-text">Jpetstore</h1>
        </div>
    </div>

    <!-- <div id="Search" class="search" data-hide-for="large">
        <div id="SearchContent">
            <form action="../Pet/searchPet">
                <div class="input-group">
                    <input class="input-group-field" type="text" name="keyword" placeholder="Product Search">
                    <div class="input-group-button">
                        <button type="submit" class="button">Search</button>
                    </div>
                </div>
            </form>

        </div>
    </div> -->
    <div class="cover">
        <form action="../Pet/searchPet">
            <div class="tb">
                <div class="td"><input class="allinput" type="text" name="keyword" placeholder="Product Search"
                                       required></div>
                <div class="td" id="s-cover">
                    <button type="submit">
                        <div id="s-circle"></div>
                        <span></span>
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div class="allright">
        <div id="Menu">
            <div id="MenuContent">
                <a href="../Cart/cartList"><img align="middle" name="img_cart" src="../images/cart.gif"/></a>
                <img align="middle" src="../images/separator.gif"/>

                <c:if test="${sessionScope.user == null}">
                    <a href="../User/showLogin">Sign In</a>
                    <img align="middle" src="../images/separator.gif"/>
                    <a href="../User/showRegister">Sign Up</a>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <a href="../Order/orderList">My Orders</a>
                    <img align="middle" src="../images/separator.gif"/>
                    <a href="../User/personalCenter">My Account</a>
                    <img align="middle" src="../images/separator.gif"/>
                    <a href="../User/signOut">Sign Out</a>
                </c:if>

                <img align="middle" src="../images/separator.gif"/>
                <a href="../help.html">?</a>
            </div>
        </div>
    </div>

</div>

</body>
</html>
