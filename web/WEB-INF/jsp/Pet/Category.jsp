<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/10/23
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>


<html>
<head>
	<title>Category</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/category.css"/>
	<!-- 引入jquery -->
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
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
                // //创建一个Ajax对象
                // const xhr = new XMLHttpRequest();
                // //初始化，设置请求方法和url
                // xhr.open("Get", "Category.Small?category=" + category, true);
                // //发送
                // xhr.send();
                // //状态0（未初始化） 1（open调用完毕） 2（send调用完毕） 3（返回了部分结果） 4（返回了所有结果）
                // xhr.onreadystatechange = function () {
                //     //处理返回结果
                //     console.log("未返回？");
                //     if (xhr.readyState === 4) {
                //         //返回成功
                //         console.log("返回成功");
                //         var content = document.getElementById("content");
                //         //这里的name需要传过来的时候获取
                //         if (xhr.status >= 200 && xhr.status < 300) {
                //
                //             var animals = xhr.responseText;
                //             // content.innerText = animals;
                //             name.innerText = animals;
                //         } else {
                //             console.log("内返回失败");
                //         }
                //     }
                // }
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
	<!--左侧部分 -->
	<div class="left">
		<div>
			<h2 class="bigcate"> ${sessionScope.category}</h2>
			<div class="together">
				<c:forEach items="${sessionScope.nameList}" var="name">
					<div class="cate" id="cateDefault">${name}</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<%--中间部分--%>
	<div class="center" id="content">
		<div>
			<div class="smallCate" style=" background: url(images/show1.jpg) no-repeat; background-size: cover;"
			     onclick="onClicked()">
				<div class="briefIntroduction">
					<div class="nameAndPrice" id="name"></div>
					<div class="nameAndPrice">Price</div>
				</div>
			</div>
			<div class="smallCate" style=" background: url(images/show2.jpg) no-repeat; background-size: cover;">
				<div class="briefIntroduction">
					<div class="nameAndPrice">Name</div>
					<div class="nameAndPrice">Price</div>
				</div>
			</div>
			<div class="smallCate">

			</div>
		</div>
		<div>
			<div class="smallCate"></div>
			<div class="smallCate"></div>
			<div class="smallCate"></div>
		</div>
	</div>

	<%--右边部分--%>
	<div class="right">
		<div><img class="picture" id="specificImg" src="${pageContext.request.contextPath}/images/show1.jpg"/></div>
		<div id="specificName">name</div>
		<div id="specificPrice">price</div>
		<div id="description">description</div>
	</div>

</div>
<%@include file="../Common/Bottom.jsp" %>
</body>
</html>
