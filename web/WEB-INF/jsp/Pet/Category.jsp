<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/10/23
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Category</title>
    <link rel="stylesheet" type="text/css" href="../css/category.css"/>
</head>
<body>
<%@include file="../Common/Top.jsp" %>

<div class="mainBox">
    <div style="margin-left: -110px;margin-right: 10px">
        <h1>${sessionScope.category}</h1>
    </div>
    <div class="center" id="content">

        <c:forEach items="${sessionScope.productMap}" var="product" varStatus="line">
            <div class="smallCate" style=" background: url(../images/show1.jpg) no-repeat; background-size: cover;"
                 id=${product.key} onclick="window.location.href='../Pet/petProduct?productID=${product.key}'">
                <div class="productID">
                        ${product.value.getProductID()}
                </div>
                <div class="briefIntroduction">
                    <div class="info">${product.value.getName()}</div>
                    <div class="info" style="font-size: 18px;">${product.value.getIntroduce()}</div>
                </div>
            </div>
        </c:forEach>

    </div>
</div>

<%@include file="../Common/Bottom.jsp" %>
</body>
</html>
