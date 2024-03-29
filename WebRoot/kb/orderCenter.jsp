<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<title>我的订单</title>
<link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
<jsp:include page="index.jsp" flush="true" />
<!-- 引入导航栏 -->
<style type="text/css">
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- 容器 -->
		<div class="row-fluid">
			<!-- row -->
			<div class="span10 offset2">
				<!-- col -->
				<c:choose>
					<c:when test="${flag == 0}">
						<h3 align="center">待支付订单</h3>
					</c:when>
					<c:when test="${flag == 1}">
						<h3 align="center">待收货订单</h3>
					</c:when>
					<c:when test="${flag == 2}">
						<h3 align="center">已完成订单</h3>
					</c:when>
				</c:choose>
				<hr>
				
				<c:choose>
					<c:when test="${objList == null}">
						<div align="center">
							<font color="darkgray" size="6"> 
							不存在相关的订单信息
							</font>
						</div>
					</c:when>
					
				</c:choose>
					<!-- 循环显示每一笔订单 -->
					<c:forEach items="${objList }" var="rows" varStatus="objVs">
						<c:set var="orderPrice" value="${0 }" />
						<!-- 订单总金额 -->
						<c:set var="orderCount" value="${0 }" />
						<!-- 订单总商品数 -->
						<c:set var="itemCount" value="${0 }" />
						<!-- 订单总商品种类数 -->
						<table style="width: 100%">
							<tbody>
								<tr>
									<td>
										<div>
											<span style="font-size: 20px; color: buttonshadow;">订单号:</span>
											<a href="#" onclick="queryOrderByNum('${flag }','${rows[0].kkb507 }')">
												<span style="font-size: 20px; color: red;">
													&nbsp;${rows[0].kkb507 }</span>
											</a>
										</div>
									</td>
								</tr>

								<tr>
									<td>
										<!-- 标识每一个轮播图 -->
										<div id="${rows[0].kkb507 }"
											class="carousel slide pad_010 b_k" data-ride="carousel">
											<!-- 轮播（Carousel）指标 -->
											<ol class="carousel-indicators">
												<li data-target="#${rows[0].kkb507 }" data-slide-to="0"
													class="active"></li>
												<li data-target="#${rows[0].kkb507 }" data-slide-to="1"></li>
												<li data-target="#${rows[0].kkb507 }" data-slide-to="2"></li>
											</ol>
											<!-- 轮播（Carousel）项目 一张轮播图显示五张-->
											<div class="carousel-inner bor_btm">
												<c:choose>
													<c:when test="${fn:length(rows) < 6 }">
														<div class="item active">
															<div class="pic">
																<c:forEach items="${rows }" var="ins" varStatus="insVs">

																	<!-- 订单信息迭代更新 -->
																	<c:set var="orderCount"
																		value="${orderCount + ins.kkb504 }"></c:set>
																	<c:set var="orderPrice"
																		value="${orderPrice + ins.kkb504*ins.kkb505 }"></c:set>
																	<c:set var="itemCount" value="${itemCount + 1 }"></c:set>

																	<img src="${ins.kkb105 }"
																		style="width: 150px; height: 150px; padding-left: 50px"
																		onclick="itemInfo(${ins.kkb101 })">
																	<span style="font-size: 20px; color: maroon;">x&nbsp;${ins.kkb504 }
																	</span>

																</c:forEach>
															</div>
															<!-- 轮播图说明区 -->
															<div class="carousel-caption" style="height: 10px">
																<h4 align="center">
																	<a href="#"
																		onclick="queryOrderByNum('${flag }','${rows[0].kkb507 }')">
																		订单号:${rows[0].kkb507 } </a>
																</h4>
															</div>
														</div>
													</c:when>
													<c:otherwise>
														<div class="item active">
															<!-- 轮播图第一张 -->
															<div class="pic">
																<!-- 图片迭代区 -->
																<c:forEach items="${rows }" var="ins" begin="0" step="1"
																	end="4">

																	<!-- 订单信息迭代更新 -->
																	<c:set var="orderCount"
																		value="${orderCount + ins.kkb504 }"></c:set>
																	<c:set var="orderPrice"
																		value="${orderPrice + ins.kkb504*ins.kkb505 }"></c:set>
																	<c:set var="itemCount" value="${itemCount + 1 }"></c:set>

																	<img src="${ins.kkb105 }"
																		style="width: 150px; height: 150px; padding-left: 50px"
																		onclick="itemInfo(${ins.kkb101 })">
																	<span style="font-size: 20px; color: maroon;">x&nbsp;${ins.kkb504 }
																	</span>
																</c:forEach>
															</div>
															<!-- 轮播图说明区 -->
															<div class="carousel-caption" style="height: 10px">
																<h4 align="center">
																	<a href="#"
																		onclick="queryOrderByNum('${flag }','${rows[0].kkb507 }')">
																		订单号:${rows[0].kkb507 } </a>
																</h4>
															</div>

														</div>
														<c:forEach begin="0" step="1" varStatus="index"
															end="${(fn:length(rows)-5)/5}">
															<div class="item">
																<div class="pic">
																	<c:forEach items="${rows }" var="ins"
																		begin="${index.count * 5 }" step="1"
																		end="${(index.count+1)* 5 - 1}">

																		<!-- 订单信息迭代更新 -->
																		<c:set var="orderCount"
																			value="${orderCount + ins.kkb504 }"></c:set>
																		<c:set var="orderPrice"
																			value="${orderPrice + ins.kkb504*ins.kkb505 }"></c:set>
																		<c:set var="itemCount" value="${itemCount + 1 }"></c:set>

																		<img src="${ins.kkb105 }"
																			style="width: 150px; height: 150px; padding-left: 50px"
																			onclick="itemInfo(${ins.kkb101 })">
																		<span style="font-size: 20px; color: maroon;">x&nbsp;${ins.kkb504 }
																		</span>
																	</c:forEach>
																</div>
																<!-- 轮播图说明区 -->
																<div class="carousel-caption" style="height: 10px">
																	<h4 align="center">
																		<a href="#"
																			onclick="queryOrderByNum('${flag }','${rows[0].kkb507 }')">
																			订单号:${rows[0].kkb507 } </a>
																	</h4>
																</div>
															</div>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</div>
											<!-- 轮播（Carousel）导航 -->
											<a class="carousel-control left" href="#${rows[0].kkb507 }"
												data-slide="prev">&lsaquo;</a> <a
												class="carousel-control right" href="#${rows[0].kkb507 }"
												data-slide="next">&rsaquo;</a>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div>
											<span
												style="font-size: 15px; color: buttonshadow; float: left">共&nbsp;</span>
											<span
												style="font-size: 25px; color: black; float: left; font: bold;">${itemCount}</span>
											<span
												style="font-size: 15px; color: buttonshadow; float: left">&nbsp;种商品,共&nbsp;</span>
											<span
												style="font-size: 25px; color: black; float: left; font: bold;">${orderCount}</span>
											<span
												style="font-size: 15px; color: buttonshadow; float: left;">&nbsp;件&nbsp;
											</span> <span
												style="font-size: 15px; color: buttonshadow; float: left;">&nbsp;总金额:&nbsp;</span>
											<span
												style="font-size: 25px; ccolor: black; float: left; font: bold;">¥${orderPrice }</span>

											<c:choose>
												<c:when test="${flag == 0}">
													<div class="btn-group btn-group-sm" style="float: right;">
														
														<button type="button" 
															class="btn btn-success"
															onclick = "submitForm(${orderPrice},${rows[0].kkb507 },'<%=request.getContextPath()%>/kb05DelOrderToPay.kbhtml')">
															取消订单
														</button>
														
														<button type="button" 
															class="btn btn-warning"
															onclick = "submitForm(${orderPrice},${rows[0].kkb507 },'<%=request.getContextPath()%>/kb/alipay.trade.page.pay.jsp')">
															去支付
														</button>
												
													</div>
												</c:when>
												<c:when test="${flag == 1}">
													<div class="btn-group btn-group-sm" style="float: right;">
														<button type="button" class="btn btn-success" onclick="">申请退款</button>
														
														<button type="button" 
															class="btn btn-warning"
															onclick = "submitForm(${orderPrice},${rows[0].kkb507 },'<%=request.getContextPath()%>/kb05UpdateOrderState.kbhtml')">
															确认收货
														</button>
														
													</div>
												</c:when>
												<c:when test="${flag == 2}">
													<div class="btn-group btn-group-sm" style="float: right;">
														<button type="button" class="btn btn-success" 
															onclick = "submitForm(${orderPrice},${rows[0].kkb507 },'<%=request.getContextPath()%>/kb05DelOrderToPay.kbhtml')">
														删除订单</button>
														<c:choose>
															<c:when test="${rows[0].kkb508 == 0 }">
														<button type="button" class="btn btn-warning"
															 onclick="queryOrderByNum('${flag }','${rows[0].kkb507 }')">去评价</button>
															</c:when>
															<c:otherwise>
																<button type="button" class="btn btn-warning">已评价</button>
															</c:otherwise>
														</c:choose>
													</div>
												</c:when>
											</c:choose>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<hr>
					</c:forEach>
					
					<!-- form表单动态获取数据 -->
					<form id="myForm" method="post">
						<!-- 隐藏域传输数据 -->
						<!-- 商户订单号 传给支付接口-->
						<input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no"
							value="" />
						<!-- 商户订单号 传给servlet-->
						<input type="hidden" id="kkb507" name="kkb507"
							value="" />
						<!-- 传输订单描述 -->
						<input type="hidden" id="WIDsubject" name="WIDsubject"
							value="向翟种付款" />
						<!-- 传输订单总金额-->
						<input type="hidden" id="WIDtotal_amount" name="WIDtotal_amount"
							value="" />
						<!-- 用于定位订单来源  取消订单返回的位置标识 -->
						<input type="hidden" id="backLocation" name="backLocation" value="4" />
						<!-- 取消订单返回的位置标识 -->
						<input type="hidden" id="kkb502" name="kkb502"
							value="${flag }" />
						
				</form>
					
			</div>
			<!-- col-END -->
		</div>
		<!-- row-END -->
	</div>
	<!-- 容器END -->
	<script type="text/javascript">
	
	/* 商品详情页 */
	function itemInfo(kkb101)
	{
		window.location.href = "<%=request.getContextPath()%>/kb01FindItemById.kbhtml?kkb101=" + kkb101;
	}
	
	//根据商户订单号查询订单详情
	function queryOrderByNum(kkb502,kkb507)
	{
		 /*backLocation用于定位订单来源  取消订单返回的位置标识 */
		window.location.href = "<%=request.getContextPath()%>/kb05QueryOrderInfo.kbhtml?"
				+"backLocation=4"
				+"&kkb502=" + kkb502
				+"&kkb507=" + kkb507;
	}
	
	
	function submitForm(orderPrice,kkb507,target)
	{
		 var msg = "您确认提交该操作吗"
		 if(confirm(msg)==true)
		 {
			 $("#WIDout_trade_no").attr("value",kkb507);
			 $("#kkb507").attr("value",kkb507);
			 $("#WIDtotal_amount").attr("value",orderPrice);
			 $("#myForm").attr("action",target);
			 $("#myForm").submit();
			 alert("操作成功");
		 }
	}
	
	</script>
	
	<script src="<%=basePath %>/js/jquery.js"></script>
	<script src="<%=basePath %>/js/bootstrap.min.js"></script>

</body>
</html>