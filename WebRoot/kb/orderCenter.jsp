<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>我的订单</title>
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
				<!-- 循环显示每一笔订单 -->
				<c:forEach items="${objList }" var="rows" varStatus="objVs">
					<c:set var="orderPrice"  value="${0 }"/>	<!-- 订单总金额 -->
					<c:set var="orderCount"  value="${0 }"/>	<!-- 订单总商品数 -->
					<c:set var="itemCount"  value="${0 }"/>		<!-- 订单总商品种类数 -->
						<table style="width: 100%">
							<tbody>
								<tr>
									<td>
										<div>
											<span style="font-size: 20px; color: buttonshadow;">订单号:</span>
											<a href="#" onclick="queryOrderByNum(${rows[0].kkb507 })">
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
																		value="${orderPrice + ins.kkb505 }"></c:set>
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
																		onclick="queryOrderByNum(${rows[0].kkb507 })">
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
																		value="${orderPrice + ins.kkb505 }"></c:set>
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
																		onclick="queryOrderByNum(${rows[0].kkb507 })">
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
																			value="${orderPrice + ins.kkb505 }"></c:set>
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
																			onclick="queryOrderByNum(${rows[0].kkb507 })">
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
														<button type="button" class="btn btn-success" onclick="">取消订单</button>
														<button type="button" class="btn btn-warning" onclick="">去支付</button>
													</div>
												</c:when>
												<c:when test="${flag == 1}">
													<div class="btn-group btn-group-sm" style="float: right;">
														<button type="button" class="btn btn-success" onclick="">申请退款</button>
														<button type="button" class="btn btn-warning" onclick="">确认收货</button>
													</div>
												</c:when>
												<c:when test="${flag == 2}">
													<div class="btn-group btn-group-sm" style="float: right;">
														<button type="button" class="btn btn-success" onclick="">删除订单</button>
														<button type="button" class="btn btn-warning" onclick="">去评价</button>
													</div>
												</c:when>
											</c:choose>

										</div>
									</td>
								</tr>

							</tbody>
						</table>
						<hr>
						
									
					<form id="myForm${rows[0].kkb507 }">
						<!-- 隐藏域传输数据 -->
						<!-- 商户订单号-->
						<input type="hidden" id="WIDout_trade_no" name="WIDout_trade_no"
							value="${rows[0].kkb507 }" />
						<!-- 传输订单描述 -->
						<input type="hidden" id="WIDsubject" name="WIDsubject" value="向翟种付款" />
						<!-- 传输订单总金额给servlet updateSummaryInfo()方法会设置该控件value-->
						<input type="hidden" id="WIDtotal_amount" name="WIDtotal_amount"
							value="${orderPrice }" />
					</form>
						
				</c:forEach>
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
	function queryOrderByNum(kkb507)
	{
		window.location.href = "<%=request.getContextPath()%>/kb05QueryOrderInfo.kbhtml?kkb507=" + kkb507;
	}
	</script>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
</body>
</html>