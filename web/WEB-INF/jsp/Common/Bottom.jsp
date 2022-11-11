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
    <title>Bottom</title>
    <%--    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>--%>
    <%--    <script type="text/javascript" src=".live2d/lib/L2Dwidget.min.js"></script>--%>
    <%--    <script>--%>
    <%--        window.L2Dwidget.init({--%>
    <%--            pluginRootPath: 'live2d/',--%>
    <%--            pluginJsPath: 'lib/',--%>
    <%--            pluginModelPath: 'live2d-widget-model-shizuku/assets/', //中间这个haru_2就是你的宠物,想换个宠物,换这个就可以了--%>
    <%--            tagMode: false,--%>
    <%--            debug: false,--%>
    <%--            model: {jsonPath: '../live2d/live2d-widget-model-shizuku/assets/shizuku.model.json'},--%>
    <%--            display: {position: 'left', width: 250, height: 400},  //调整大小,和位置--%>
    <%--            mobile: {show: true},   //要不要盯着你的鼠标看--%>
    <%--            log: false,--%>
    <%--        })--%>
    <%--        //刷新在线状态--%>
    <%--    </script>--%>
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
