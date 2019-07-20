<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>

<title>Market</title>
<link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
#bom {
	position: fixed;
	left: 0px;
	bottom:20px;
	_position: absolute;
	_top: expression(document.documentElement.clientHeight +  
		 document.documentElement.scrollTop - this.offsetHeight);
}

#top {
	position: fixed;
	width: 15%;
	_position: absolute;
	_bottom: expression(document.documentElement.clientHeight +  
		 document.documentElement.scrollTop - this.offsetHeight);
}

</style>
</head>
<body>
	<div class="row-fluid" align="center">
		<!--站点导航栏-商城导航栏 ()-->


		<div class="span2">
			
			<!-- 站点导航栏 -->
			<div id = "top">
				<div>
						<c:choose>
						<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
							<a href="<%=path%>/kd01UserMain.kdhtml">
				 			<img class="img-circle image-responsive" 
				 				src="${sessionScope.user.kkd108 }" 
				 				onerror="this.src='<%=path %>/img/avatar/def_avatar.png'"
				 				style="width: 100px;height: 100px;">
				 			</a>
						</c:when>
						<c:otherwise>
							<a href="<%=path%>/kd01AdminMain.kdhtml">
				 			<img class="img-circle image-responsive" 
				 				src="${sessionScope.user.kkd108 }" 
				 				onerror="this.src='<%=path %>/img/avatar/def_avatar.png'"
				 				style="width: 100px;height: 100px;">
				 			</a>
						</c:otherwise>
					</c:choose>
				</div>
				<br>
				<div>
					<c:choose>
						<c:when test="${user == null}">
							<span
								style="width: 80%; word-break: break-word; font-size: 20px; font: bold;">
								<a href="<%=path%>/kd01UserMain.kdhtml"> 亲爱的游客<%=(int)(Math.random()*10000)%>
							</a>
							</span>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
									<span
										style="width: 80%; word-break: break-word; font-size: 20px; font: bold;">
										<a href="<%=path%>/kd01UserMain.kdhtml">
											${sessionScope.user.kkd105 } </a>
									</span>
								</c:when>
								<c:otherwise>
									<span
										style="width: 80%; word-break: break-word; font-size: 20px; font: bold;">
										<a href="<%=path%>/kd01AdminMain.kdhtml">
											${sessionScope.user.kkd105 } </a>
									</span>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
				<div style="padding-top: 50px">
					<ul class="nav nav-list">
						<li><a href="#">
							<span style="font-size:20px;font: bold;">站点首页</span>
							</a>
						</li>
						<hr>
						<li><a href="<%=path%>/ka01MainForum.kahtml?id=0">
							<span style="font-size:20px;font: bold;">迷你论坛</span>
							</a>
						</li>
						<hr>
						<li class="active"><a href="#" onclick="marketCenter()">
							<span style="font-size:20px;font: bold;">周边商城</span>
							</a>
						</li>
						<hr>
						<c:choose>
							<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
								<li >
									<a href="<%=path%>/kd01UserMain.kdhtml">
										<span style="font-size:20px;font: bold;">个人空间</span>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="<%=path%>/kd01AdminMain.kdhtml">
										<span style="font-size:20px;font: bold;">个人空间</span>
									</a>
								</li>>
							</c:otherwise>
						</c:choose>



					</ul>
				</div>
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
								<li><a href="<%=path%>/Kb07QueryInquiry.kbhtml?kkb708=2">求购信息列表</a></li>
								<li><a href="<%=path%>/Kb07QueryMyInquiry.kbhtml?kkd101=${kkd101}">我的求购列表</a></li>
								<li><a href="<%=path%>/Kb08QueryMyResponse.kbhtml?kkd101=${kkd101}">我的响应列表</a></li>
								<li><a href="<%=path%>/Kb07QueryResToMyInquiry.kbhtml?kkd101=${kkd101}">待处理列表</a></li>
								<li><a href="<%=path%>/kb/addInquiry.jsp">发布求购</a></li>
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
								<li><a href="<%=path%>/Kb07QueryInquiry.kbhtml?kkb708=1">待审核求购</a></li>
								<li><a href="<%=path%>/Kb07QueryInquiry.kbhtml?kkb708=2">求购信息列表</a></li>
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
		window.location.href="<%=path%>/kb01QueryItems.kbhtml?page=1";
	}
	
	function goLogin()
	{
		window.location.href="<%=path%>/kd/nologin.jsp";	
	}
</script>
<%-- 	<script src="<%=basePath %>/js/jquery.js"></script>
	<script src="<%=basePath %>/js/bootstrap.min.js"></script> --%>
</body>
</html>