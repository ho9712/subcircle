<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<title>商品${ins.kkb102 }详情</title>
<link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
<jsp:include page="index.jsp" flush="true"/>	<!-- 引入导航栏 -->
</head>
<body>
	<div class="container-fluid">
		<!-- 容器 -->
		<div class="row-fluid" height="400px">
			<!-- row1 商品展示区-->
			<div class="span3 offset2" align="center">
				<!-- row1左--商品图片区-->
				<img class="img-thumbnail" src="${objList[0].kkb105 }" width="300"
					height="300" />
			</div>
			<!-- row1左边结束--商品图片区-->

			<div class="span7" align="left">
				<!-- row1右边--商品信息区-->
				<h3>${objList[0].kkb102 }</h3>
				<table class="table">
					<!-- <thead>
						<tr>
							<th>编号</th>
							<th>产品</th>
							<th>交付时间</th>
							<th>状态</th>
						</tr>
					</thead> -->
					<tbody>
						<tr>
							<td>售价</td>
							<td>¥ <span style="font-size:20px;color:#ff0000;">${objList[0].kkb103 }</span></td>
						</tr>
						<tr class="success">
							<td>商品类型</td>
							<td>${objList[0].kkb106 }</td>
						</tr>
						<tr class="error">
							<td>关联作品</td>
							<td>${objList[0].kkb107 }</td>
						</tr>
						<tr class="warning">
							<td>商品描述</td>
							<td>${objList[0].kkb104 }</td>
						</tr>
						<tr class="info">
							<td>商品库存</td>
							<td>${objList[0].kkb108 }</td>
						</tr>
					</tbody>
				</table>
				
				<form id="myForm" action="" method="post">
				<label> 数量: <input type="number" step="1" min="1" value="1"
							style="width: 60px;" id="kkb402" name = "kkb504">
				</label>
				
					<!-- 隐藏域传输数据  -->
					<input type="hidden" id="kkb101" name="kkb101" value="${objList[0].kkb101 }" /> 
					<input type="hidden" id="kkb505" name="kkb505" value="${objList[0].kkb103 }" /> 
					<input type="hidden" id="kkb507" name="kkb507" value="" />
					<!-- 生成的是待支付订单kkb502的状态是0 -->
					<input type="hidden" id="kkb502" name="kkb502" value="0" />
					<!-- 用于定位订单来源  取消订单返回的位置标识-->
					<input type="hidden" id="backLocation" name="backLocation" value="2" />
				</form>

				<c:choose>
					<c:when test="${sessionScope.kkd104 == 2}">


						<div class="btn-group btn-group-sm">
							<button type="button" class="btn btn-success"
									onclick="modifyItemInfo(${objList[0].kkb101 })">修改信息</button>
							<button type="button" class="btn btn-warning"
								onclick="deleteItem(${objList[0].kkb101 })">下架商品</button>
						</div>
					</c:when>
					<c:when test="${sessionScope.kkd104 == null}">
						<button type="button" class="btn btn-success" onclick="goLogin()">去登入</button>
					</c:when>
					<c:otherwise>

						<div class="btn-group btn-group-sm">
							<button type="button" class="btn btn-success"
								onclick="onCollect(${objList[0].kkb101 })">收藏</button>
							<button type="button" class="btn btn-warning"
								onclick="onAddToCart(${objList[0].kkb101 })">加入购物车</button>
							<button type="button" class="btn btn-danger"
								onclick="submitForm();">立即购买</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- row1右边结束--商品信息区-->
		</div>
		<!-- row1结束 -->
		<hr>

		<div class="row-fluid">
			<!-- row2 商品评分评价区-->
			<div class="span10 offset2">
				<!-- row2第一行-->
				<h3>购买者评价:</h3>
				<table class="table" style="vertical-align: middle;">
					<tbody>
						<tr class="error">
						<c:set var="score" value=""/>
						<c:set var="count" value="${0}"/>
						<c:forEach items="${objList[1] }" var="rateInfo" varStatus="vs">
							<c:set var="score" value="${rateInfo.kkb602 + score}"/>
							<c:set var="count" value="${1 + count}"/>
						</c:forEach>
							<td style="width: 15%">评分</td>
							<td style="width: 15%">
							<c:choose>
								<c:when test="${count != 0 }">							
									
								<div id = "starAll"></div>
								<input type="hidden" id = "scoreAll" value="${score/count }">
								
								</c:when>
								<c:otherwise>
									暂无评分信息
								</c:otherwise>
							</c:choose>
							</td>
							<c:choose>
								<c:when test="${sessionScope.kkd104 == 2}">
								<td colspan="2"></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
							</c:choose>
						</tr>
						<c:forEach items="${objList[1] }" var="rateInfo" varStatus="vs">
							<tr class="info">
								<td>
									<div align="left" style="padding-top: 10px">
										<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${rateInfo.kkd101}">
										 <img class="img-circle image-responsive"
											src="${rateInfo.kkd108 }" 
											style="width: 50px; height: 50px;"
											onerror="this.src='<%=path %>/img/avatar/def_avatar.png'">
											<br> <span
											style="width: 80%; word-break: break-word; font-size: 10px; font: bold; padding-left: 5px">
												${rateInfo.kkd105 } </span>
										</a>
									</div>
								</td>
								<td style="vertical-align: middle;">
									<div>
										<div id = "star"></div>
										<input type="hidden" name ="kkb602" value="${rateInfo.kkb602 }">
									</div> 
								</td>
								<td style="vertical-align: middle;">${rateInfo.kkb603 }</td>
								<c:choose>
									<c:when test="${sessionScope.kkd104 == 2}">
										<td>
											<button class="btn btn-danger" onclick="deleteRate(${rateInfo.kkb601 })">
											删除</button>
										</td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- row2 商品评分评价区   结束-->
	</div>
	<!-- 容器结束 -->
<script type="text/javascript">

//从购物车中加入该商品至用户收藏列表
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
		var kkb402 = document.getElementById('kkb402').value;
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

	//通过时间获取唯一的商户订单号
	function GetDateNow() 
	{
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
	
	function submitForm()
	{
		var kkb507 = GetDateNow();
		document.getElementById("kkb507").value = kkb507;
		 $("#myForm").attr("action","<%=request.getContextPath()%>/kb05CreateOrder.kbhtml");
		 $("#myForm").submit();
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
	
	//管理员删除评价
	function deleteRate(kkb601)
	{
		var msg = "确定删除该评价吗"
		if(confirm(msg) == true)
		{
			window.location.href = "<%=request.getContextPath()%>/kb06DelRate.kbhtml?kkb601=" + kkb601;	
		}
	}
	
	//星星评分显示	
	function rat(){
		var kkb602List = document.getElementsByName("kkb602");
		var i = 0;
		$('td div #star').each(function(index,element){
			var score = kkb602List[i].value;
			i++;
			$(this).raty({
				hints: ['1','2', '3', '4', '5'],
				path: "<%=basePath %>/img",
				starOff: 'star-off-big.png',
				starOn: 'star-on-big.png',
				size: 30,
				start: 40,
				showHalf: true,
            	score:score,
            	readOnly:true
            });   //设置点亮的星数 这里设置为3颗星星默认点亮，可以从后台获得对应项的分数来动态显示星星数，这里先写死。并使用只读属性，表示不能点选　　　　　　　　　
          });
		
		//所有用户平均评分
		var scoreAll = $("#scoreAll").val();
		$("#starAll").raty({
			hints: ['1','2', '3', '4', '5'],
			path: "<%=basePath %>/img",
			starOff: 'star-off-big.png',
			starOn: 'star-on-big.png',
			size: 30,
			start: 40,
			showHalf: true,
        	score:scoreAll,
        	readOnly:true
        });   //设置点亮的星数 这
		
	}
	
	window.onload = function()
	{
		rat();
	}
	
	
</script>

<script src="<%=basePath %>/js/jquery.js"></script>
<script src="<%=basePath %>/js/jquery.raty.js" type="text/javascript"></script>
<script src="<%=basePath %>/js/bootstrap.min.js"></script>

</body>
</html>