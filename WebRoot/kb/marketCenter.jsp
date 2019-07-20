<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<title>周边商城</title>
<link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
<style type="text/css">		/* 取消number控件的上下箭头 */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
}
 
input[type="number"] {
    -moz-appearance: textfield;
}
</style>
<jsp:include page="index.jsp" flush="true" /><!-- 引入导航栏 -->
</head>
<body>
<c:choose>
	<c:when test="${empty objMap.items }">
		<fmt:formatNumber var="pageNum" value="${1}" pattern="#"/>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${fn:contains(objMap.items[0].pageNum,'.0000') }">
				<fmt:formatNumber var="pageNum" value="${objMap.items[0].pageNum}" pattern="#"/>
			</c:when>
			<c:otherwise>
				<fmt:formatNumber var="pageNum" value="${objMap.items[0].pageNum + 0.5}" pattern="#"/>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
	<%-- ${rows.get(1) } --%>
	<%-- ${hotItems } --%>
	<div class="container-fluid">
		<!-- 容器 -->
		<div class="row-fluid" align="center">
			<div class="span10 offset2">
				<form id = "searchForm" action="<%=path %>/Kb01QueryItems.kbhtml" method="post">
				<div align="center">
					<input class="input-medium search-query" type="text"
						style="width: 50%; height: 20px;" placeholder="搜索"
						name = "searchText" id="searchText"
						value = "${param.searchText }"/>
					<br>
					<br>
					<div style="padding-right:300px;">
						<span>价格区间:¥  </span>
						<input  type="number"  class="input-medium search-query"
								style="width: 30px;height: 20px;"
								min = "0"  name = "bPrice" id = "bPrice"
						 		οnkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"
						 		style="ime-mode:Disabled"
						 		value = "${param.bPrice }">
						 	———— ¥
						 <input  type="number"  class="input-medium search-query"
								style="width: 30px;height: 20px;"
								name = "ePrice" id = "ePrice"
						 		οnkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"
						 		style="ime-mode:Disabled"
						 		value = "${param.ePrice }">
						  	 <button class="btn btn-default" contenteditable="true"
							onclick="querySearchRes(1)" style="float: right" >查找</button>
					 </div>	
				
				</div>
				<input type="hidden" id = "page" name = "page" value="1">
			</form>

				<!-- 轮播图 -->
				<div class="carousel slide"  data-ride="carousel" id="myCarousel" align="center">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#myCarousel"></li>
						<li data-slide-to="1" data-target="#myCarousel"></li>
						<li data-slide-to="2" data-target="#myCarousel"></li>
					</ol>
					<div class="carousel-inner">
						<c:forEach items="${objMap.hotItems }" var="ins" varStatus="vs">
							<c:choose>
								<c:when test="${vs.count == 1 }">
									<div class="item active">
										<img onclick="itemInfo(${ins.kkb101 })" src="${ins.kkb105 }"
											style="width: 400px; height: 400px;" />
										<div class="carousel-caption">
											<h4>
												<a href="#" onclick="itemInfo(${ins.kkb101 })">
													${ins.kkb102 }</a>
											</h4>
											<p>${ins.kkb104 }</p>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="item">
										<img onclick="itemInfo(${ins.kkb101 })" src="${ins.kkb105 }"
											style="width: 400px; height: 400px;" />
										<div class="carousel-caption">
											<a href="#" onclick="itemInfo(${ins.kkb101 })">
												${ins.kkb102 }</a>
											<p>${ins.kkb104 }</p>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<a data-slide="prev" href="#myCarousel"
						class="left carousel-control">‹</a> <a data-slide="next"
						href="#myCarousel" class="right carousel-control">›</a>
				</div>
				<!-- 轮播图结束 -->
				
			<c:choose>
				<c:when test="${empty objMap.items}">
					<div align="center">
						<font color="darkgray" size="6">
							没找到符合条件的商品呢~~
						</font>
					</div>
				</c:when>
				<c:otherwise>	
				<!-- 商品展示区 -->
				<c:forEach begin="1" step="1" end="3" varStatus="i">
					<ul class="thumbnails">
						<c:forEach items="${objMap.items }" var="ins" begin="${(i.count-1)*4 }"
							step="1" end="${(i.count-1)*4+3 }">
							<li class="span3">
								<div class="thumbnail">
									<img onclick="itemInfo(${ins.kkb101 })" src="${ins.kkb105 }"
										width="300" height="300" />
									<div class="caption">
										<h4>
											<a href="#" onclick="itemInfo(${ins.kkb101 })">
												${ins.kkb102 }</a>
										</h4>
										<p>${ins.kkb104 }</p>
										<label>
											售价: ￥ <span style="font-size:20px;color:#ff0000;">${ins.kkb103 }</span>
										</label>
										<c:choose>
											<c:when test="${sessionScope.kkd104 == 2}">

												<div class="btn-group btn-group-sm">
													<button type="button" class="btn btn-success"
														onclick="modifyItemInfo(${ins.kkb101 })">修改信息</button>
													<button type="button" class="btn btn-warning"
														onclick="deleteItem(${ins.kkb101 })">下架商品</button>
												</div>
											</c:when>
											<c:when test="${sessionScope.kkd104 == null}">
												<button type="button" class="btn btn-success"
													onclick="goLogin()">去登入</button>
											</c:when>
											<c:otherwise>
												<div class="btn-group btn-group-sm">
													<button type="button" class="btn btn-success"
														onclick="onCollect(${ins.kkb101 })">收藏</button>
													<button type="button" class="btn btn-warning"
														onclick="onAddToCart(${ins.kkb101 })">加入购物车</button>
													<a id="myModel" href="#modal-container" role="button"
														class="btn btn-danger" data-toggle="modal"
														onclick="passItemInfo('${ins.kkb101 }','${ins.kkb102 }','${ins.kkb103 }','${ins.kkb105 }')">
														立即购买 </a>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>

				<div class="pagination">
					<!-- 翻页 -->
					<ul class="pagination">
						<li>
							<c:if test="${param.page >1}"><a href="#" onclick="querySearchRes(${param.page - 1})">&laquo;</a></c:if>
						</li>
						<c:choose>
							<c:when test="${param.page < pageNum - 3}">	
								<c:forEach begin = "1" step = "1" end = "5" varStatus="vs">
									<c:choose>
										<c:when test="${vs.count == 1 }"><li class = "active"><a href="#" onclick="querySearchRes(${param.page})">${empty param.page?'1':param.page}</a></li></c:when>
										<c:otherwise><li><a href="#" onclick="querySearchRes(${param.page + vs.count - 1})">${empty param.page?'1':param.page + vs.count - 1}</a></li></c:otherwise>							
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach begin = "1" step = "1" end = "${pageNum - param.page + 1 }" varStatus="vs">
									<c:choose>
										<c:when test="${vs.count == 1 }"><li class = "active"><a href="#" onclick="querySearchRes(${param.page})">${empty param.page?'1':param.page}</a></li></c:when>
										<c:otherwise><li><a href="#" onclick="querySearchRes(${param.page + vs.count - 1})">${empty param.page?'1':param.page + vs.count - 1}</a></li></c:otherwise>							
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<li>
							<c:choose>
								<c:when test="${param.page < pageNum }">
									<a href="#" onclick="querySearchRes(${param.page + 1})">&raquo;</a>
								</c:when>
							</c:choose>
						</li>
					</ul>
					
					<div align="center">
						<input  type="number"  class="input-medium search-query"
									style="width: 30px;height: 20px;"
									min = "1" max = "${pageNum }" id = "targetPage"
							 		οnkeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"
							 		style="ime-mode:Disabled"
							 		onKeyDown="if(event.keyCode==13) {loadTarget();}">
						
						<button class="btn btn-success" onclick="loadTarget()">跳转</button>
					</div>
					
					<div align="center">
						<span>第${param.page }页/共${pageNum }页</span>
					</div >
					
				</div>
				
	
				<!-- 遮罩窗体 -->
				<div id="modal-container" class="modal hide fade modal-lg" role="dialog"
				 aria-labelledby="myModalLabel" aria-hidden="true" style="height:70%">
				<form action="<%=path%>/kb05CreateOrder.kbhtml" method="post">
					<div class="modal-header">
						 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel" style="color: maroon;">
							生成订单
						</h3>
					</div>
						
					<div class="modal-body" >
						<div>
							<table class="table table-hover">
								<tbody>
									<tr>
										<td style="vertical-align: middle;">
											<div align="center">
												<img id = "simpleImg"
													class="img-thumbnail" src="" width="100px"
													height="100px" />
												<hr>
												<span style="font-size:20px;color:buttonshadow;">评分:</span>
												<span id="modalScore" style="font-size:20px;color:buttonshadow;">暂无评分信息</span>
											</div>
										</td>
										<td style="vertical-align: middle;">
											<div align="center" >
												<h4 id="simpleName">商品名</h4>
												<hr>
												<span style="font-size:20px;color:red" >售价:¥</span>
												<span  id="simplePrice" style="font-size:30px;color:red">价格</span>
												<hr>
												<span style="font-size:20px;color:buttonshadow;">数量:</span>
												<input type="number" min = "1" step = "1" name="kkb504"
												style="width: 60px;font-size:15px" value = "1">
											</div>	
										</td>
									</tr>
									<tr >
									<td style="vertical-align: middle;" colspan="2">
										<div align="left">
											<textarea rows="5" cols="30" name="kkb506"
											style="overflow:auto;width:100%;"placeholder="订单备注...100字以内"></textarea> 
										</div>
									</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="modal-footer">
						<div class="btn-group btn-group-lg" align="center">
						 	<button class="btn " data-dismiss="modal" aria-hidden="true">取消</button> 
						 	<input type="submit" class="btn btn-success"  value="购买">
						 </div>
					</div>
					
					<!-- 隐藏域传输数据 -->
					<input type="hidden" id="kkb101" name="kkb101" value="" /> 
					<input type="hidden" id="kkb505" name="kkb505" value="" /> 
					<input type="hidden" id="kkb507" name="kkb507" value="" />
					<!-- 生成的是待支付订单 kkb502状态为0 -->
					<input type="hidden" id="kkb502" name="kkb502" value="0" />
					<!-- 用于定位订单来源  取消订单返回的位置标识-->
					<input type="hidden" id="backLocation" name="backLocation" value="1" />
					</form>
				</div>
				<!-- 遮罩窗体 结束-->
				
			</div>
			<!-- span10结束 -->
		</div>
		<!-- row结束 -->
	</div>
	<!-- 容器结束 -->

	<script type="text/javascript">

	//根据商品id查看相应商品详情并为登入用户生成浏览记录
	function itemInfo(kkb101)
	{
		window.location.href = "<%=request.getContextPath()%>/kb01FindItemById.kbhtml?kkb101=" + kkb101;
	}
	
	//加入该商品至用户收藏列表
	function onCollect(kkb101)
	{
		 $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/kb03CollectItem.kbhtml?"
	    			+"kkb101="+kkb101,
	            dataType: "text",
	            success: function (data)
	            {
	            	if(data == "true")
	            	{
	            		alert("收藏成功");
	            	}
	            	else
	            	{
	            		alert("您已收藏过该商品去个人主页看看吧")
	            	}
	            }//endsuccess
	       });//endajax
	}
	
	//根据商品id以及数量加入用户购物车中
	function onAddToCart(kkb101)
	{
		var kkb402 = 1;			//从周边商城模块加入购物车数量默认为1
		 $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/kb04AddToMyCart.kbhtml?"
	            	+"kkb101="+kkb101
					+"&kkb402="+kkb402,
	            dataType: "text",
	            success: function (data)
	            {
	            	if(data)
	            	{
	            		alert("加入购物车成功");
	            	}
	            }//endsuccess
	       });//endajax
	}
	
	//点击立即购买传递info给遮罩窗体
	function passItemInfo(kkb101,kkb102,kkb103,kkb105)
	{
		document.getElementById("simpleName").innerHTML = kkb102;
		document.getElementById("simplePrice").innerHTML = kkb103;
		document.getElementById("simpleImg").src = kkb105;
		
		var kkb507 = GetDateNow();
		document.getElementById("kkb101").value = kkb101;
		document.getElementById("kkb505").value = kkb103;
		document.getElementById("kkb507").value = kkb507; 
		
		$.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/getRateByIdServlet?"
            	+"kkb101="+kkb101,
            dataType: "text",
            success: function (data)
            {
            	 if(data != "")
            	 {
				 	document.getElementById("modalScore").innerHTML = data;        
				 }
            	 else
            	 {
            		 document.getElementById("modalScore").innerHTML = "暂无评分信息";
            	 }
            }//endsuccess
       });//endajax
				
	}
	
	//通过时间获取唯一的商户订单号
	function GetDateNow() {
		var vNow = new Date();
		var sNow = "";
		sNow += String(vNow.getFullYear());
		sNow += String(vNow.getMonth() + 1);
		sNow += String(vNow.getDate());
		sNow += String(vNow.getHours());
		sNow += String(vNow.getMinutes());
		sNow += String(vNow.getSeconds());
		sNow += String(vNow.getMilliseconds());
		return sNow;
	}
	
	
	function goLogin()
	{
		window.location.href="<%=request.getContextPath()%>/kd/nologin.jsp";	
	}
	
	//商城管理员修改商品信息
	function modifyItemInfo(kkb101)
	{
		window.location.href = "<%=request.getContextPath()%>/kb01GetModifyItemInfo.kbhtml?kkb101=" + kkb101;	
	}
	
	//商城管理员下架商品
	function deleteItem(kkb101)
	{
		var msg = "确定下架该商品吗"
		if(confirm(msg) == true)
		{
			$.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/kb01DelItem.kbhtml?"
	            	+"kkb101="+kkb101,
	            dataType: "text",
	            success: function (data)
	            {
	            	window.location.href = "<%=request.getContextPath()%>/kb01QueryItems.kbhtml?page=1"
	            }//endsuccess
	       });//endajax
		}
	}	
	
	//跳转目标页面
	function loadTarget()
	{
		var targetPage = document.getElementById("targetPage").value;
		var pageNum = ${pageNum};
		if(targetPage > pageNum)
		{
			alert("超出目标页面");
		}
		else if(targetPage != null && targetPage != "")
		{
			querySearchRes(targetPage);
		}
		else
		{
			alert("请选择跳转页面!");
		}
	}
	
	function querySearchRes(targetPage) 
	{
		$("#page").attr("value",targetPage);		//更新page的值
		$("#searchForm").submit();
	}
	</script>
	
	<script src="<%=basePath %>/js/jquery.js"></script>
	<script src="<%=basePath %>/js/bootstrap.min.js"></script>
	
</body>
</html>