<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>周边商城</title>
<link href="css/bootstrap.css" rel="stylesheet">
<jsp:include page="index.jsp" flush="true" /><!-- 引入导航栏 -->
</head>
<body>
	<%-- ${rows.get(1) } --%>
	<%-- ${hotItems } --%>
	<div class="container-fluid">
		<!-- 容器 -->
		<div class="row-fluid" align="center">
			<div class="span10 offset2">
				<div>
					<input class="input-medium search-query" type="text"
						style="width: 50%; height: 20px;" />
					<button class="btn btn-default" contenteditable="true"
						type="submit">查找</button>
				</div>


				<!-- 轮播图 -->
				<div class="carousel slide" id="myCarousel" align="center">
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
										<label><font color="#ff0000" size="2px"> 售价:</font>${ins.kkb103 }
										</label>
										<div class="btn-group btn-group-sm">
											<button type="button" class="btn btn-success"
											  		onclick="onCollect(${ins.kkb101 })">收藏</button>
											<button type="button" class="btn btn-warning"
												onclick="onAddToCart(${ins.kkb101 })">加入购物车</button>
											<a id="myModel" href="#modal-container" role="button" 
												class="btn btn-danger" data-toggle="modal"
												onclick = "passItemInfo('${ins.kkb102 }','${ins.kkb103 }','${ins.kkb105 }')">
												立即购买
											</a>
											<!-- <button type="button" class="btn btn-danger">立即购买</button> -->
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:forEach>

				<div class="pagination">
					<!-- 翻页 -->
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li class="disabled"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
					<br> <input class="input-medium search-query" type="text"
						style="width: 20px; height: 20px;"></input>
					<button class="btn btn-success" contenteditable="true"
						type="submit">跳转</button>
				</div>
				
	
				<!-- 遮罩窗体 -->
				<div id="modal-container" class="modal hide fade modal-lg" role="dialog"
				 aria-labelledby="myModalLabel" aria-hidden="true" style="height:70%">
					
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
												<span style="font-size:30px;color:buttonshadow;">5</span>
											</div>
										</td>
										<td style="vertical-align: middle;">
											<div align="center" >
												<h4 id="simpleName">商品名</h4>
												<hr>
												<span style="font-size:20px;color:red" >售价:¥</span>
												<span id="simplePrice" style="font-size:30px;color:red">价格</span>
												<hr>
												<span style="font-size:20px;color:buttonshadow;">数量:</span>
												<input type="number" min = "1" step = "1" 
												style="width: 60px;font-size:15px" value = "1">
											</div>	
										</td>
									</tr>
									<tr >
									<td style="vertical-align: middle;" colspan="2">
										<div align="left">
											<textarea rows="5" cols="30" 
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
						 	<button class="btn btn-success">确定</button>
						 </div>
					</div>
				</div>
				<!-- 遮罩窗体 结束-->
				
			</div>
			<!-- span10结束 -->
		</div>
		<!-- row结束 -->
	</div>
	<!-- 容器结束 -->

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">

	//根据商品id查看相应商品详情并为登入用户生成浏览记录
	function itemInfo(kkb101)
	{
		window.location.href = "<%=request.getContextPath()%>/kb01FindItemById.kbhtml?kkb101=" + kkb101;
	}
	
	//根据商品id加入用户收藏列表
	function onCollect(kkb101)
	{
		window.location.href="<%=request.getContextPath()%>/kb03CollectItem.kbhtml?"
					+"kkb101="+kkb101;
		alert("收藏成功");
	}
	
	//根据商品id以及数量加入用户购物车中
	function onAddToCart(kkb101)
	{
		var kkb402 = 1;			//从周边商城模块加入购物车数量默认为1
		window.location.href="<%=request.getContextPath()%>/kb04AddToMyCart.kbhtml?"
				+"kkb101="+kkb101
				+"&kkb402="+kkb402;
		alert("加入购物车成功");
	}
	
	//点击立即购买传递info给遮罩窗体
	function passItemInfo(kkb102,kkb103,kkb105)
	{
		document.getElementById("simpleName").innerHTML = kkb102;
		document.getElementById("simplePrice").innerHTML = kkb103;
		document.getElementById("simpleImg").src = kkb105;
	}
	

	</script>
</body>
</html>