<%--
  Created by IntelliJ IDEA.
  User: PRay
  Date: 2022/12/28
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/ProductAllBack.css">
	<title>Title</title>
</head>
<body>
<%@include file="LeftBack.jsp" %>
<div class="mainBox">
	<div class="topGraph">
		<div class="rank">
			<div class="rankLabel">
				Sales ranking
			</div>
			<div class="rankExplain">
				Comparison of sales in the past month
			</div>
			<table>
				<tr>
					<td>
						<div class="rankNumber" style="background-color:#1C84C6;">1</div>
					</td>
					<td id="firstCategory">
						${requestScope.json.get("sales_rank").get(0).get("Category")}
					</td>
					<td id="firstPrice">
						${requestScope.json.get("sales_rank").get(0).get("sale")*135}
					</td>
				</tr>
				<tr>
					<td>
						<div class="rankNumber" style="background-color: #23c6c8;">2</div>
					</td>
					<td id="secondCategory">
						${requestScope.json.get("sales_rank").get(1).get("Category")}
					</td>
					<td id="secondPrice">
						${requestScope.json.get("sales_rank").get(1).get("sale")*130}
					</td>
				</tr>
				<tr>
					<td>
						<div class="rankNumber" style="background-color: rgb(26,179,148);">3</div>
					</td>
					<td id="thirdCategory">
						${requestScope.json.get("sales_rank").get(2).get("Category")}
					</td>
					<td id="thirdPrice">
						${requestScope.json.get("sales_rank").get(2).get("sale")*132}
					</td>
				</tr>
				<tr>
					<td>
						<div class="rankNumber" style="background-color: rgb(209,218,222);">4</div>
					</td>
					<td id="fourthCategory">
						${requestScope.json.get("sales_rank").get(3).get("Category")}
					</td>
					<td id="fourthPrice">
						${requestScope.json.get("sales_rank").get(3).get("sale")*123}
					</td>
				</tr>
				<tr>
					<td>
						<div class="rankNumber" style="background-color: rgb(26,179,148);">5</div>
					</td>
					<td id="fifthCategory">
						${requestScope.json.get("sales_rank").get(4).get("Category")}
					</td>
					<td id="fifthPrice">
						${requestScope.json.get("sales_rank").get(4).get("sale")*124}
					</td>
				</tr>
			</table>
		</div>
		<div class="totalPrice">
			<canvas id="myChart" width="600px" height="300px"></canvas>
		</div>
		<div class="doughnutChart">
			<div style="text-align: center; font-size: 20px;">
				Sales
			</div>
			<canvas id="myDoughnutChart" width="250px" height="250px"></canvas>
		</div>
	</div>
	<div class="order">
		<div class="label">
			<div style="margin-left: 10px;"> Order</div>
		</div>
		<table>
			<tr>
				<th>
					Category
				</th>
				<th>
					Finished
				</th>
				<th>
					Unfinished
				</th>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(0).get("Category")}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(0).get("sale")*17}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(0).get("sale")}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(1).get("Category")}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(1).get("sale")*17}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(1).get("sale")}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(2).get("Category")}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(2).get("sale")*17}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(2).get("sale")}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(3).get("Category")}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(3).get("sale")*17}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(3).get("sale")}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(4).get("Category")}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(4).get("sale")*17}
				</td>
				<td>
					${requestScope.json.get("sales_rank").get(4).get("sale")}
				</td>
			</tr>
		</table>
	</div>
	<div class="info">
		<div class="label">
			<div style="margin-left: 20px;"> Pet Information</div>
		</div>
		<table>
			<tr>
				<th>
					Category
				</th>
				<th>
					Category Numbner
				</th>
				<th>
					Purchase price
				</th>
				<th>
					Sell Price
				</th>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(0).get("Category")}
				</td>
				<td>
					2
				</td>
				<td id="catPurchase">
					${requestScope.json.get("sales_rank").get(0).get("sale")*67}
				</td>
				<td id="catSell">
					${requestScope.json.get("sales_rank").get(0).get("sale")*135}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(1).get("Category")}
				</td>
				<td>
					6
				</td>
				<td id="dogPurchase">
					${requestScope.json.get("sales_rank").get(1).get("sale")*39}
				</td>
				<td id="dogSell">
					${requestScope.json.get("sales_rank").get(1).get("sale")*130}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(2).get("Category")}
				</td>
				<td>
					4
				</td>
				<td id="fishPurchase">
					${requestScope.json.get("sales_rank").get(2).get("sale")*63}
				</td>
				<td id="fishSell">
					${requestScope.json.get("sales_rank").get(2).get("sale")*132}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(3).get("Category")}
				</td>
				<td>
					4
				</td>
				<td id="reptilePurchase">
					${requestScope.json.get("sales_rank").get(3).get("sale")*61}
				</td>
				<td id="reptilrSell">
					${requestScope.json.get("sales_rank").get(3).get("sale")*123}
				</td>
			</tr>
			<tr>
				<td>
					${requestScope.json.get("sales_rank").get(4).get("Category")}
				</td>
				<td>
					2
				</td>
				<td id="birdPurchase">
					${requestScope.json.get("sales_rank").get(4).get("sale")*62}
				</td>
				<td id="birdSell">
					${requestScope.json.get("sales_rank").get(4).get("sale")*124}
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
<script src="../js/ProductAllBack.js"></script>
</html>
