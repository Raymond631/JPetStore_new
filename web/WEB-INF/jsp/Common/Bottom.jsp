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
    <link rel="stylesheet" type="text/css" href="../css/jpetstore.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="../css/aspectran.css"/>
    <title>Bottom</title>

</head>
<body>
<div id="Footer" style="height: 100px;margin-top: 30px;width: 1519px; margin-left: -15px;background-color: black">
    <div id="PoweredBy" style="height: 40px;margin-top: -20px">
        <a href="https://cse.csu.edu.cn/" class="external" target="_blank">中南大学计算机学院</a><br>
        <a href="https://space.bilibili.com/388835447/" class="external" target="_blank">Web应用开发技术——宋铁老师</a>
    </div>

    <c:if test="${sessionScope.user == null}">
        <div id="Banner" style="height: 20px"></div>
    </c:if>
    <c:if test="${sessionScope.user != null}">
        <div id="Banner" style="height: 20px">
            <img src="../images/banner_dogs.gif">
        </div>
    </c:if>

</div>
</body>
</html>
