<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>商品${ins.kkb102 }详情</title>
<link href="css/bootstrap.css" rel="stylesheet">
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
							<td>${objList[0].kkb103 }</td>
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
					
				<div class="btn-group btn-group-sm">
					<button type="button" class="btn btn-success"
						onclick="onCollect(${objList[0].kkb101 })">收藏</button>
					<button type="button" class="btn btn-warning"
							onclick="onAddToCart(${objList[0].kkb101 })">加入购物车</button>
					<button type="button" class="btn btn-danger"
							onclick="submitForm();">
						立即购买
					</button>
				</div>
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
				<table class="table">
					<tbody>
						<tr class="error">
						<c:set var="score" value=""/>
						<c:set var="count" value="${0}"/>
						<c:forEach items="${objList[1] }" var="rateInfo" varStatus="vs">
							<c:set var="score" value="${rateInfo.kkb602 + score}"/>
							<c:set var="count" value="${1 + count}"/>
						</c:forEach>
							<td>评分</td>
							<td>
							<c:choose>
								<c:when test="${count != 0 }">							
									${score/count }
								</c:when>
								<c:otherwise>
									暂无评分信息
								</c:otherwise>
							</c:choose>
							</td>
							<td></td>
						</tr>
						<c:forEach items="${objList[1] }" var="rateInfo" varStatus="vs">
							<tr class="info">
								<td>用户${rateInfo.kkd101 }</td>
								<td>${rateInfo.kkb602 }</td>
								<td>${rateInfo.kkb603 }</td>
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
            	if(data)
            	{
            		alert("收藏成功");
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
</script>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>