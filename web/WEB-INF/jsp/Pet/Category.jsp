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
	<script>
        function load()
        {
            // 这个地方应该是写一个默认选中的函数
        }

        $(function ()
        {
            $('.together').on('click', 'div', function ()
            {
                var allList = '<%= session.getAttribute("CategoryList") %>';

                $(this).addClass('cateClick');
                $(this).siblings().removeClass('cateClick');
                var category = $(this).text();
                let name = document.getElementById("name");
                name.innerText = category;
                console.log(category);
                console.log("...");
                console.log(allList);
            })
        })

        window.load();

        function onClicked()
        {
            let name = document.getElementById("specificName");
            name.innerText = "SpecificName";
            WhichSpecificImg();
        }

        function WhichSpecificImg()
        {
            document.getElementById('specificImg').src = "${pageContext.request.contextPath}/images/show2.jpg";
            <%--var myselect = document.getElementById("Payment");--%>
            <%--var index = myselect.selectedIndex; // selectedIndex代表的是你所选中项的index--%>
            <%--var name = myselect.options[index].value;--%>
            <%--if (name == "Alipay") {--%>
            <%--    document.getElementById('SpecificImg').src = "${pageContext.request.contextPath}/images/show1.jpg";--%>
            <%--} else {--%>
            <%--    document.getElementById('SpecificImg').src = "${pageContext.request.contextPath}/images/show2.png";--%>
            <%--}--%>
        }
	</script>
</head>

<body>

<%@include file="../Common/Top.jsp" %>

<div class="mainbox">

	<div class="center" id="content">
		<c:forEach items="${productMap}" var="product">
			<div class="smallCate" style=" background: url(${pageContext.request.contextPath}/images/show1.jpg) no-repeat; background-size: cover;">
				<div class="briefIntroduction">
					<div class="nameAndPrice" id="name">${product.value.getName()}</div>
					<div class="nameAndPrice">${product.value.getIntroduce()}</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<%@include file="../Common/Bottom.jsp" %>

</body>
</html>
