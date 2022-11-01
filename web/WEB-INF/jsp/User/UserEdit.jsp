<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: tender
  Date: 2022/10/28
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../Common/Top.jsp"%>

<div id="Catalog">
    <form action="saveUser" method="post">

        <h3>User Information</h3>
        <table>
            <tr>
                <td>User ID:</td>
                <td>${sessionScope.user.username}</td>
            </tr>
            <tr>
                <td>New Password</td>
                <td><input type="text" name = "password" autofocus="autofocus"></td>
            </tr>
            <tr>
            <td>Repeat password</td>
            <td><input type="text" name="repeatedPassword"></td>
            </tr>
        </table>

        <%@ include file="IncludeAccountFields.jsp"%>
        <input type="submit" name="editUser" value="save User Information">
    </form>
    <a href="viewListOrder?username=${sessionScope.user.username}">My Orders</a>
</div>
<%@include file="../Common/Bottom.jsp"%>