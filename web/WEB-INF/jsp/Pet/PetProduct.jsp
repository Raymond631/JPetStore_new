<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/11/1
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/category.css"/>
    <script>
    </script>
</head>
<body>
<%@include file="../Common/Top.jsp" %>

<div class="mainBox">
    <div class="left">
        <div class="left-top">
            <div><img class="picture" id="picture" src="../images/product1.jpg"/>
            </div>
        </div>
        <div class="left-bottom">
            <div id="specificName" class="nameInfo">${requestScope.product.getProductID()}</div>
            <div id="specificPrice" class="priceInfo">${requestScope.product.getName()}</div>
            <div id="description" class="description">${requestScope.product.getIntroduce()}</div>
        </div>
    </div>

    <%--    这里面放一个table吧--%>
    <div class="right">
        <%--        <div class="smallCateTable">--%>
        <%--            <table class="table">--%>
        <%--                <tr>--%>
        <%--                    <th class="th"><b>Item ID</b></th>--%>
        <%--                    <th class="th"><b>Description</b></th>--%>
        <%--                    <th class="th"><b>Stock</b></th>--%>
        <%--                    <th class="th"><b>List Price</b></th>--%>
        <%--                    <th class="th"><b>Quantity</b></th>--%>
        <%--                    <th class="th">&nbsp;</th>--%>
        <%--                </tr>--%>

        <%--                <c:forEach items="${requestScope.product.getItemMap()}" var="item">--%>
        <%--                    <tr>--%>
        <%--                        <td><p>${item.key}</p></td>--%>
        <%--                        <td><p>${item.value.getDescription()}</p></td>--%>
        <%--                        <td><p>${item.value.getStock()}</p></td>--%>
        <%--                        <td><p>${item.value.getListPrice()}</p></td>--%>
        <%--                        <td><p><input type="number" name="${item.key}" size="3" maxlength="3" value="1"/></p></td>--%>
        <%--                        <td>--%>
        <%--                            <p><a class="button">Add to cart</a></p>--%>
        <%--                                &lt;%&ndash;                            href="../Cart/addCartItem?itemID=${item.key}"&ndash;%&gt;--%>
        <%--                        </td>--%>
        <%--                    </tr>--%>
        <%--                </c:forEach>--%>
        <%--            </table>--%>
        <%--    </div>--%>
        <c:forEach items="${requestScope.product.getItemMap()}" var="item">
            <div class="box">
                <div class="boxLeft">
                    <div>
                            ${item.value.getDescription()}
                    </div>
                </div>
                <div class="boxMiddle">
                    <div class="ID">${item.key}</div>
                    <div class="stock">${item.value.getStock()}</div>
                    <span style="padding-left: -120px">￥</span>
                    <span class="itemPrice">${item.value.getListPrice()}</span>
                </div>
                <div class="boxRight">
                    <a class="toCart" href="../Cart/addCartItem?itemID=${item.key}"> Add to cart</a>
                        <%--                        href="../Cart/addCartItem?itemID=${item.key}"--%>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%@include file="../Common/Bottom.jsp" %>
</body>
</html>
