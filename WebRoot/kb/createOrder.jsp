<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>订单生成</title>
<link href="css/bootstrap.css" rel="stylesheet">
<jsp:include page="index.jsp" flush="true" /><!-- 引入导航栏 -->
</head>
<body>

	<div class="container-fluid">
		<!-- 容器 -->
		<div class="row-fluid">
			<!-- row -->
			<div class="span10 offset2">
				<!-- col -->
				<table class="table table-hover">
						<!-- 收获地址 -->
					<thead>
							
					</thead>
				
					<tbody>
						<tr>
							<td>收获地址</td>
						</tr>
					</tbody>
				
				</table>
				
				<table class="table table-hover">
						<!-- 订单列表 -->
					<thead>
						<tr>
							<th></th>
							<th style="vertical-align: middle;">商品名</th>
							<th style="vertical-align: middle;">单价</th>
							<th style="vertical-align: middle;">数量</th>
							</tr>
					</thead>
				
					<tbody>
						<c:forEach items="${rows }" var="ins" varStatus="vs">
							<tr>
								<td style="vertical-align: middle;"><img
									class="img-thumbnail"
									src="${ins.kkb105 }"
									width="100" height="100" /></td>

								<td style="vertical-align: middle;">${ins.kkb102 }</td><!-- 商品名 -->
					
								<td style="vertical-align: middle;" name = "orderItemCount">
									¥<em>${ins.kkb504 }</em>
								</td> <!-- 订单商品数量 -->
								
								<td style="vertical-align: middle;" name = "orderItemPrice">
									<em>${ins.kkb505 }</em>
								</td><!-- 订单商品单价 -->
							</tr>
							<tr>
								<td></td>
								<td style="vertical-align: middle;" colspan="3">备注${ins.kkb506 }</td>
							</tr>
						</c:forEach>
						<tr>
							<td style="vertical-align: middle;"></td>
							<td style="vertical-align: middle;" name = "orderCount">商品总件数:<em>0</em></td>
							<td style="vertical-align: middle;" name= "orderPrice">商品总金额¥:<em>0</em></td>
							<td style="vertical-align: middle;">
								<div class="btn-group btn-group-sm">
									<button class="btn btn-success" href="#" onclick="deleteOrderToPay()">
										返回购物车
									</button>
									<button class="btn btn-warning" href="#">
										提交订单
									</button>
									
								</div>
							</td>
						</tr>
					</tbody>
				
				</table>


			</div>
			<!-- col-END -->
		</div>
		<!-- row-END -->
	</div>
	<!-- 容器END -->

<script type="text/javascript">

	//待支付订单的总商品数,总金额控件
	var orderCount = document.getElementsByName("orderCount")[0]
			.getElementsByTagName('em')[0];
	var orderPrice = document.getElementsByName("orderPrice")[0]
			.getElementsByTagName('em')[0];
	
	//订单商品的数量集合及单价集合
	var orderItemCount = document.getElementsByName("orderItemCount");
	var orderItemPrice = document.getElementsByName("orderItemPrice");
	

	//订单中商品总件数和总金额
	function updateSummaryInfo()
	{
		var price = 0;
		var count = 0;
		//orderItemCount和orderItemPrice的数量是一致的并且对应的
		for (var i = 0; i < orderItemCount.length; i++)
		{
			price += Number(orderItemPrice[i]
					.getElementsByTagName('em')[0].innerHTML) * 
					Number(orderItemCount[i]
						.getElementsByTagName('em')[0].innerHTML);
			count += Number(orderItemCount[i]
					.getElementsByTagName('em')[0].innerHTML);
		}

		orderCount.innerHTML = count;
		orderPrice.innerHTML = price;
	}
	
	window.onload = function()
	{
		updateSummaryInfo();
	}
	
	
	//返回购物车(从订单表中删除该用户待支付订单)
	function deleteOrderToPay ()
	{
		window.location.href="<%=request.getContextPath()%>/kb05DelOrderToPay.kbhtml";
	}
	
</script>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>