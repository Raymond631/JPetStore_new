<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Raymond Li
  Date: 2022/11/5
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>用户日志</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/userLog.css"/>
</head>

<body>
<div class="mainBox">
	<div class="top">
		<div class="topLeft">
			<div>User Log</div>
		</div>
	</div>
	<div class="bottom">
		<div class="container">
			<table id="example" class="table table-hover responsive nowrap" style="width:100%;overflow-y: scroll">
				<thead>
				<tr>
					<th>id</th>
					<th>username</th>
					<th>time</th>
					<th>ip</th>
					<th>url</th>
					<th>sqlType</th>
					<th>operationContent</th>
					<th>status</th>
				</tr>
				</thead>
				<tbody>
				<%
					int id = 1;
				%>
				<c:forEach items="${requestScope.userLogList}" var="userLog">
					<tr>
						<td>
							<%
								out.println("#" + id);
								id++;
							%>
						</td>
						<td>${userLog.getUsername()}</td>
						<td>${userLog.getTime()}</td>
						<td>${userLog.getIp()}</td>
						<td>${userLog.getUrl()}</td>
						<td>${userLog.getSqlType()}</td>
						<td>${userLog.getOperationContent()}</td>
						<td>${userLog.getStatus()}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
