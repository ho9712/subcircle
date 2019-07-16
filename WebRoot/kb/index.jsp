<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<title>Market</title>
<link href="css/bootstrap.css" rel="stylesheet">
<style type="text/css">
#bom {
	position: fixed;
	left: 0px;
	bottom: 0;
	_position: absolute;
	_top: expression(document.documentElement.clientHeight +  
		 document.documentElement.scrollTop - this.offsetHeight);
}

#top {
	position: fixed;
	top: 15%;
	width: 15%;
	_position: absolute;
	_bottom: expression(document.documentElement.clientHeight +  
		 document.documentElement.scrollTop - this.offsetHeight);
}


/* #top_1 {
	position: fixed;
	left:16.7%;
	_position: absolute;
	_bottom: expression(document.documentElement.clientHeight +  
		 document.documentElement.scrollTop - this.offsetHeight);
} */
</style>
</head>
<body>

<% String path = request.getContextPath();%>
	<div class="row-fluid" align="center">
		<!--站点导航栏-商城导航栏 ()-->

		<div class="span2">
			<!-- 站点导航栏 -->
			<div id = "top">
				<ul class="nav nav-list">
					<li><a href="#">站点首页</a></li>
					<hr>
					<li><a href="#">迷你论坛</a></li>
					<hr>
					<li class="active"><a href="#" onclick="marketCenter()">周边商城</a></li>
					<hr>
					<li><a href="#">个人空间</a></li>
				</ul>
			</div>
			<div id="bom">
				<img class="img-thumbnail"
					src="http://uploadv3.anitoys.com/anitoys/images/test/20190530/k867sby0s4eudifq9dv0wg3rl5i22fk9.jpg"
					width="200" height="200" />
			</div>
		</div>
		<!-- 站点导航栏结束 -->

		<c:choose>
		<c:when test="${sessionScope.kkd104 != null }">
			<c:choose>
			<c:when test="${sessionScope.kkd104 != 2 }">
				<div class="span10">
					<!-- 商城模块导航栏 -->
					<ul class="nav nav-pills">
						<li><a href="#" onclick="ToMyCart()">我的购物车</a></li>
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">我的订单 <strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#" onclick="showOrder('0')">待支付订单</a></li>
								<li><a href="#" onclick="showOrder('1')">待收货订单</a></li>
								<li><a href="#" onclick="showOrder('2')">已完成订单</a></li>
							</ul>
						</li>
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">求购 <strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">求购信息列表</a></li>
								<li><a href="#">我的求购列表</a></li>
								<li><a href="#">我的响应列表</a></li>
								<li><a href="#">待处理列表</a></li>
							</ul></li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class="span10">
					<!-- 商城模块导航栏 -->
					<ul class="nav nav-pills">
						<li><a href="<%=request.getContextPath()%>/kb/addItem.jsp">上架商品</a></li>
						<li class="dropdown"><a href="#" data-toggle="dropdown"
							class="dropdown-toggle">管理求购<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="#">求购信息列表</a></li>
								<li><a href="#">我的求购列表</a></li>
								<li><a href="#">我的响应列表</a></li>
								<li><a href="#">待处理列表</a></li>
							</ul></li>
					</ul>
				</div>
			</c:otherwise>
			</c:choose>
		<!-- 商城模块导航栏 结束-->
		</c:when>
		<c:otherwise>
			<div class="span10">
				<!-- 商城模块导航栏 -->
				<ul class="nav nav-pills">
					<li><a href="#" onclick="goLogin()">我的购物车</a></li>
					<li class="dropdown"><a href="#" data-toggle="dropdown"
						class="dropdown-toggle">我的订单 <strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="goLogin()">待支付订单</a></li>
							<li><a href="#" onclick="goLogin()">待收货订单</a></li>
							<li><a href="#" onclick="goLogin()">已完成订单</a></li>
						</ul>
					</li>
					<li class="dropdown"><a href="#" data-toggle="dropdown"
						class="dropdown-toggle">求购 <strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="goLogin()">求购信息列表</a></li>
							<li><a href="#" onclick="goLogin()">我的求购列表</a></li>
							<li><a href="#" onclick="goLogin()">我的响应列表</a></li>
							<li><a href="#" onclick="goLogin()">待处理列表</a></li>
						</ul></li>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
	<!-- 导航栏结束 -->
<script type="text/javascript">

	function ToMyCart() 
	{
		window.location.href="<%=path%>/kb04MyCartCenter.kbhtml";
	}
	
	function showOrder(orderState)
	{
		window.location.href="<%=path%>/kb05QueryAllOrder.kbhtml?"
			+"kkb502=" + orderState;
	}
	
	function marketCenter()
	{
		window.location.href="<%=path%>/kb01QueryItems.kbhtml";
	}
	
	function goLogin()
	{
		window.location.href="<%=path%>/kd/login.jsp";	
	}
</script>

</body>