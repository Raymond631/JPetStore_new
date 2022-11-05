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


<%--<div id="Content">--%>
<%--    <div id="CenterForm">--%>
<%--        <form action="../User/updateUser" method="post">--%>

<%--            <h3>User Information</h3>--%>
<%--            <table>--%>
<%--                <colgroup>--%>
<%--                    <col style="width: 25%"/>--%>
<%--                    <col/>--%>
<%--                </colgroup>--%>
<%--                <tr>--%>
<%--                    <td>Username:</td>--%>
<%--                    <td>${sessionScope.user.getUsername()}</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Original password:</td>--%>
<%--                    <td>--%>
<%--                        <input type="password" name="originalPassword" value="" autocomplete="off"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>New password:</td>--%>
<%--                    <td>--%>
<%--                        <input type="password" name="newPassword" value="" autocomplete="off"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Confirm password:</td>--%>
<%--                    <td>--%>
<%--                        <input type="password" name="repeatedPassword" value="" autocomplete="off"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>

<%--            <h3>Account Information</h3>--%>
<%--            <table>--%>
<%--                <colgroup>--%>
<%--                    <col style="width: 25%"/>--%>
<%--                    <col/>--%>
<%--                </colgroup>--%>
<%--                <tr>--%>
<%--                    <td>ReceiverName:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" name="receiverName" value="${requestScope.receiver.getReceiverName()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Email:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" size="40" name="email" value="${requestScope.receiver.getEmail()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Phone:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" name="phone" value="${requestScope.receiver.getPhoneNumber()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Country:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" size="40" name="country" value="${requestScope.receiver.getCountry()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Province:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" size="40" name="province" value="${requestScope.receiver.getProvince()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>City:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" name="city" value="${requestScope.receiver.getCity()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>district:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" size="4" name="district" value="${requestScope.receiver.getDistrict()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>DetailedAddress:</td>--%>
<%--                    <td>--%>
<%--                        <input type="text" size="10" name="detailedAddress"--%>
<%--                               value="${requestScope.receiver.getDetailedAddress()}"/>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>


<%--            <h3>Profile Information</h3>--%>
<%--            <table>--%>
<%--                <colgroup>--%>
<%--                    <col style="width: 25%"/>--%>
<%--                    <col/>--%>
<%--                </colgroup>--%>
<%--                <tr>--%>
<%--                    <td>Language Preference:</td>--%>
<%--                    <td>--%>
<%--                        <select name="languagePreference">--%>
<%--                            <option value="english" selected>English</option>--%>
<%--                            <option value="german">German</option>--%>
<%--                            <option value="french">French</option>--%>
<%--                            <option value="korean">Korean</option>--%>
<%--                            <option value="japanese">Japanese</option>--%>
<%--                        </select>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Favourite Category:</td>--%>
<%--                    <td>--%>
<%--                        <select name="favouriteCategoryId">--%>
<%--                            <option value="FISH">Fish</option>--%>
<%--                            <option value="DOGS" selected>Dogs</option>--%>
<%--                            <option value="REPTILES">Reptiles</option>--%>
<%--                            <option value="CATS">Cats</option>--%>
<%--                            <option value="BIRDS">Birds</option>--%>
<%--                        </select>--%>
<%--                        <span class="error-msg"></span>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Enable MyList</td>--%>
<%--                    <td>--%>
<%--                        <input type="checkbox" name="listOption" value="true"/>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>Enable MyBanner</td>--%>
<%--                    <td>--%>
<%--                        <input type="checkbox" name="bannerOption" value="true" checked/>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>

<%--            <div class="button-bar">--%>
<%--                <button type="submit" class="button">Save Account Information</button>--%>
<%--            </div>--%>
<%--        </form>--%>

<%--        <a href="viewListOrder?username=${sessionScope.user.username}">My Orders</a>--%>
<%--    </div>--%>
<%--</div>--%>

<%@include file="../Common/Bottom.jsp" %>
</body>
</html>