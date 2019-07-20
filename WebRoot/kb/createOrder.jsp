<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<title>订单生成</title>
<link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
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
						<tr class="warning">
							<td>收货地址</td>
							<td>收货人</td>
							<td>联系方式</td>
						</tr>
						<tr class="info">
							<td>${rows[0].kkd110 }</td>
							<td>${rows[0].kkd111 }
							<td>${rows[0].kkd112 }
						</tr>
					</tbody>
				
				</table>
			<form id = "myForm" action="" method="post">
				<table class="table table-hover">
						<!-- 订单列表 -->
					<thead>
						<tr  class = "error">
							<th></th>
							<th style="font-size: 25px;font:bold;">商品名</th>
							<th style="font-size: 25px;font:bold;">单价</th>
							<th style="font-size: 25px;font:bold;">数量</th>
							</tr>
					</thead>
					<hr>
				
					<tbody>	
						<c:forEach items="${rows }" var="ins" varStatus="vs">
							<!-- 订单流水号-->
							<input type="hidden" name="kkb501List" value="${ins.kkb501 }"/>

							<!-- 订单中商品id-->
							<input type="hidden" name="kkb101List" value="${ins.kkb101 }"/>


							<tr class= "warning">
								<td style="vertical-align: middle;"><img
									class="img-thumbnail"
									src="${ins.kkb105 }"
									width="100" height="100" /></td>

								<td style="vertical-align: middle;font-size: 20px;">${ins.kkb102 }</td><!-- 商品名 -->
						
								
								<td style="vertical-align: middle;font-size: 20px;" name = "orderItemPrice">
									¥<em>${ins.kkb505 }</em>
								</td><!-- 订单商品单价 -->
								
								<td style="vertical-align:middle;font-size: 20px;" name = "orderItemCount">
									<em>${ins.kkb504 }</em>
								</td> <!-- 订单商品数量 -->
							
							</tr>
							<tr class="info">
								<c:choose>
									<c:when test="${flag == 0}">
										<td>
											<div style="font-size: 20px;padding-left: 30px;padding-top:15px;">备注</div>
										</td>
										<td colspan="3">
											<textarea placeholder="订单备注...100字以内"  name = "kkb506List"
												style="width: 80%; overflow: auto;" rows="2" cols="20">${ins.kkb506 }</textarea>
										</td>
									</c:when>
									<c:when test="${flag == 1}">
										<td>
											<div style="font-size: 20px;padding-left: 30px;padding-top:15px;">备注</div>
										</td>
										<td colspan="3">
											<textarea placeholder="订单备注...100字以内"  name = "kkb506List" readonly="readonly"
												style="width: 80%; overflow: auto;" rows="2" cols="20">${ins.kkb506 }</textarea>
										</td>
									</c:when>
									
									<c:when test="${flag == 2}">
										<c:choose>
										<c:when test="${rows[0].kkb508 == 0 }">
											<td>
												<div style="font-size: 20px;padding-left: 30px;">
													<span>评分</span>
													<br>
													<br>
													<e:select name="kkb602"
														value="5:5,4:4,3:3,2:2,1:1" defval="${ins.kkb602 }"/>
												</div>
											</td>
											<td colspan="3">
												<textarea placeholder="订单评价...100字以内" name = "kkb603" 
													style="width: 80%; overflow: auto;" rows="3" cols="20">${ins.kkb603 }</textarea>
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<div style="font-size: 20px;padding-left: 30px;">
													<span>评分</span>
													<br>
													<br>
													<e:select name="kkb602" readonly="true"
														value="5:5,4:4,3:3,2:2,1:1" defval="${ins.kkb602 }"/>
												</div>
											</td>
											<td colspan="3">
												<textarea placeholder="订单评价...100字以内" name = "kkb603"  readonly="readonly"
													style="width: 80%; overflow: auto;" rows="3" cols="20">${ins.kkb603 }</textarea>
											</td>
										</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>

									
							</tr>
						</c:forEach>
						<tr class = "success">
							<td style="vertical-align: middle;"></td>
							<td style="vertical-align: middle;" name = "orderCount">商品总件数:<em style="font-size: 30px;">0</em></td>
							<td style="vertical-align: middle;font-size: 20px;" name= "orderPrice">
								商品总金额¥:<em style="font-size: 30px;">0</em>
							</td>
							<td style="vertical-align: middle;">
								<div class="btn-group btn-group-sm">
										<!-- 根据不同订单状态的详情显示不同的操作 -->
										<c:choose>
											<c:when test="${flag == 0}">
												<input type="submit" class="btn btn-success" href="#"
													formaction="<%=request.getContextPath()%>/kb05DelOrderToPay.kbhtml"
													value="取消订单">
												<input type="button" class="btn btn-warning" href="#"
													onclick = "dealOrder();"
													value="提交订单">
											</c:when>
											<c:when test="${flag == 1}">
												<input type="submit" class="btn btn-success" href="#"
													formaction=""
													value="申请退款">
												<input type="submit" class="btn btn-warning" href="#"
													formaction="<%=request.getContextPath()%>/kb05UpdateOrderState.kbhtml"
													value="确认收货" >
											</c:when>
											<c:when test="${flag == 2}">
												<input type="submit" class="btn btn-success" href="#"
													formaction="<%=request.getContextPath()%>/kb05DelOrderToPay.kbhtml"
													value="删除订单">
												<c:choose>
													<c:when test="${rows[0].kkb508 == 0 }">
														<input type="submit" class="btn btn-warning" href="#"
															formaction="<%=request.getContextPath()%>/kb06CreateRate.kbhtml"
															value="评价">
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-warning">已评价</button>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
									</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<!-- 隐藏域传输数据 -->
				<!-- 传输订单总商品数给servlet updateSummaryInfo()方法会设置该控件value-->
				<input type="hidden" id = "totalCount" name="totalCount" value="0"/>
				<!-- 商户订单号-->							
				<input type="hidden" id = "WIDout_trade_no" name="WIDout_trade_no" value="${rows[0].kkb507 }"/>
				<!-- 商户订单号-->							
				<input type="hidden" id = "kkb507" name="kkb507" value="${rows[0].kkb507 }"/>
				
				<!-- 订单状态-->							
				<input type="hidden" id = "kkb502" name="kkb502" value="${flag }"/>
				
				<!-- 传输订单描述 -->
				<input type="hidden" id = "WIDsubject" name="WIDsubject" value="0"/>
				<!-- 传输订单总金额给servlet updateSummaryInfo()方法会设置该控件value-->
				<input type="hidden" id = "WIDtotal_amount" name="WIDtotal_amount" value="0"/>
				
				<!-- 用于取消订单时标识返回页面位置-->
				<input type="hidden" id = "backLocation" name="backLocation" value="${backLocation }"/>
				
				<!-- 从itemInfo创建的订单用于取消时传递该商品id-->							
				<input type="hidden" id = "kkb101" name="kkb101" value="${rows[0].kkb101 }"/>
			</form>		
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
	

	//显示订单中商品总件数和总金额
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
	
		
		//设置传输给servlet的订单总金额,总商品数量,订单描述
		document.getElementById("totalCount").value = count;
		document.getElementById("WIDtotal_amount").value = price;
		document.getElementById("WIDsubject").value = "向翟种付款";
	}
	
	//先更新订单信息(备注)再前往支付
	function dealOrder()
	{
		$("#myForm").attr("action","<%=request.getContextPath()%>/kb05UpdateOrderInfo.kbhtml")
		$("#myForm").ajaxSubmit({
	            type: "POST",
	            success: function (data)
	            {
	            	if(data)
	            	{
	            		$("#myForm").attr("action","<%=request.getContextPath()%>/kb/alipay.trade.page.pay.jsp");
	            		 $("#myForm").submit();	//前往支付
	            	}
	            }//endsuccess
	       });//endajax
	}
	
	window.onload = function()
	{
		updateSummaryInfo();
	}
	
	
</script>


<script src="<%=basePath %>/js/jquery.js"></script>
<script src="https://cdn.bootcss.com/jquery.form/4.2.1/jquery.form.min.js"></script>
<script src="<%=basePath %>/js/bootstrap.min.js"></script>

</body>
</html>