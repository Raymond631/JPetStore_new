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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/category.css"/>
	<!-- 引入jquery -->
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script>
        // function toSmallCategory(e) {
        //     let cate = $(e).text();
        //     console.log(cate);
        // }

        <%--$(function () {--%>
        <%--    $('.center').on('click', 'div', function () {--%>
        <%--        &lt;%&ndash;var allList = '<%= session.getAttribute("CategoryList") %>';&ndash;%&gt;--%>

        <%--        //                $(this).addClass('cateClick');--%>
        <%--        //                $(this).siblings().removeClass('cateClick');--%>
        <%--        var category = $(this).getElementById();--%>
        <%--        console.log(category);--%>
        <%--    })--%>
        <%--})--%>

	</script>
</head>
<body>
<%@include file="../Common/Top.jsp" %>
<div class="mainbox">

	<%--中间部分--%>
	<div class="center" id="content">

		<c:forEach items="${sessionScope.category}" var="pet" varStatus="line">
			<%--            <c:if test="${line.count%3==0}"><br></c:if>--%>
			<%--            <a herf="${pageContext.request.contextPath}">--%>
			<div class="smallCate"
			     style=" background: url(${pageContext.request.contextPath}/images/show1.jpg) no-repeat; background-size: cover;"
			     id=${pet} onclick="window.location.href='${pageContext.request.contextPath}/Pet/petProduction?production=${pet}'">
				<div class="briefIntroduction">
					<div class="nameAndPrice">${pet}</div>
					<span class="nameAndPrice">ID</span>
				</div>
			</div>
			<%--            </a>--%>
		</c:forEach>
	</div>

</div>
<%@include file="../Common/Bottom.jsp" %>
</body>
</html>
