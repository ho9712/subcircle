<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>我的购物车</title>
<jsp:include page="index.jsp" flush="true" /> <!-- 引入导航栏 -->
<style type="text/css">
</style>
</head>
<body>
<%-- ${rows } --%>
	<div class="container-fluid">
		<!-- 容器 -->
		<div class="row-fluid">
			<!-- row -->
			<div class="span10 offset2">
				<!-- col -->
				<form action = "<%=request.getContextPath()%>/kb05CreateOrder.kbhtml" method="post">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="vertical-align: middle;">
									<input type="checkbox" onclick = "onSelectAll(this.checked);"
									 		name = "selectAll">全选
								</th>
								<th style="vertical-align: middle;">商品名</th>
								<th style="vertical-align: middle;">单价</th>
								<th style="vertical-align: middle;">数量</th>
								<th style="vertical-align: middle;">金额</th>
								<th style="vertical-align: middle;">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${rows }" var="ins" varStatus="vs">
								<tr name = "cartRecord">		<!-- 一条购物车记录 -->
									<td style="vertical-align: middle;">
										<input type="checkbox" name = "idlist" 
										onclick="onSelect(this.checked);" value = "${ins.kkb101 }">  
										<img
											class="img-thumbnail" src="${ins.kkb105 }" width="100"
											height="100" />
									</td>
									<td style="vertical-align: middle;">${ins.kkb102 }</td>
									<td style="vertical-align: middle;">
											￥<span>${ins.kkb103 }</span>
									</td>
									<td style="vertical-align: middle;">
										<input type="number" min="1" step="1" style="width: 60px;" 
											name = "itemCount" id="itemCount${ins.kkb101 }" 
											onchange = "updateItemCount(${ins.kkb101 },${ins.kkb103 });" 
											value="${ins.kkb402 }">
									</td>
									<td style="vertical-align: middle;" name ="itemPrice${ins.kkb101 }">
										￥<em>${ins.kkb103*ins.kkb402 }</em>
									</td>
									<td style="vertical-align: middle;">
									<a class="btn btn-success" href="#" 
										onclick="onCollect(${ins.kkb101 });">收藏</a>
										<a class="btn btn-danger" href="#" 
											onclick="delFromCart(${ins.kkb101 });">移除</a>
									</td>
								</tr>
							</c:forEach>
							<tr class="success">
								<td style="vertical-align: middle;">
									<input type="checkbox" onclick = "onSelectAll(this.checked);"
											name = "selectAll">
									全选
								</td>
								<td></td>
								<td></td>
								<td style="vertical-align: middle;" name = "itemsCount">已选 <em>0</em> 件商品</td>
								<td style="vertical-align: middle;" name = "itemsPrice">总计 <em>0</em> 元</td>
								<td style="vertical-align: middle;">
									<input type="submit" class="btn btn-warning" 
										disabled="disabled" id = "pay" value = "去结算">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- col-END -->
		</div>
		<!-- row-END -->
	</div>
	<!-- 容器END -->
	

	<script type="text/javascript">
	
	//idlist的checkbox的调用方法
	
	function onSelect(vsstate)
	{
		//只要复选框状态一发生变化更新选中商品的总数量和总金额
		updateSummaryInfo(); 
		
		var selectAllList = document.getElementsByName("selectAll");
		
		//只要有任意一个checkbox状态为false取消全选
		if(isSelectedAll())
		{
			for(var i = 0; i < selectAllList.length ;i++)
	        {
	        	selectAllList[i].checked = true;
	        }
		}
		else
		{
			for(var i = 0; i < selectAllList.length ;i++)
	        {
	        	selectAllList[i].checked = false;
	        }
		}
		
		//引起去结算按钮状态变更
		if(isSelectOne())
		{
			document.getElementById("pay").disabled = false;
		}
		else
		{
			document.getElementById("pay").disabled = true;
		}		
	}
	
	
	//所有idlist的复选框都被选中返回true
	function isSelectedAll()
	{
		var checklist = document.getElementsByName("idlist");
		 for(var i = 0; i < checklist.length ;i++)
         {
         	if(checklist[i].checked == false)
         	{
         		return false;
         	}
         }
		 return true;
	}
	
	//至少有一个idlist的复选框被选中返回true
	function isSelectOne() 
	{
		var checklist = document.getElementsByName("idlist");
		for(var i = 0; i < checklist.length ;i++)
        {
        	if(checklist[i].checked == true)
        	{
        		return true;
        	}
        }
		 return false;
	}
	
	// 全部选中和取消
	function onSelectAll(vsstate)
	{
		var checklist = document.getElementsByName("idlist");
		var selectAllList = document.getElementsByName("selectAll");
        if(vsstate)
        {
            for(var i = 0; i < checklist.length ;i++)
            {
            	checklist[i].checked = true;
            }
            document.getElementById("pay").disabled = false;
           
            for(var i = 0; i < selectAllList.length ;i++)
            {
            	selectAllList[i].checked = true;
            }

            document.getElementById("pay").disabled = false;
        }
        else
        {
            for(var i = 0; i < checklist.length ;i++)
            {
            	checklist[i].checked = false;
       		}
            
            for(var i = 0; i < selectAllList.length ;i++)
            {
            	selectAllList[i].checked = false;
            }
            
            document.getElementById("pay").disabled = true;        
		}
        
      	///在复选框状态发生变化后更新选中商品的总数量和总金额
        updateSummaryInfo();
	}
	
	
	//从购物车中移除该商品
	function delFromCart(kkb101)
	{
		/* var msg = "您确认移出该商品吗";
	    if (confirm(msg)==true)
	    {
		 	$.ajax({
	        	    type: "POST",
	            	url: "${pageContext.request.contextPath}/kb04DelFromMyCart.kbhtml?"
		    			+"kkb101="+kkb101,
		            dataType: "text",
		            success: function (data)
		            {
		            	if(data)
		            	{
		            		alert("移出购物车成功");
		            	}
		            }//endsuccess
		        });//endajax
	    } */
			
		var msg = "您确认移出该商品吗";
	    if (confirm(msg)==true)
	    {
	    	window.location.href="<%=request.getContextPath()%>/kb04DelFromMyCart.kbhtml?kkb101="+kkb101;
	    	alert("移除成功");
	    }
	    
	}
	
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
		
	<%-- window.location.href="<%=request.getContextPath()%>/kb03CollectItem.kbhtml?"
					+"kkb101="+kkb101;
		alert("收藏成功"); --%>
	}
	
	//显示选中商品总金额和总件数的控件
	var itemsCount = document.getElementsByName("itemsCount")[0].getElementsByTagName('em')[0];
	var itemsPrice = document.getElementsByName("itemsPrice")[0].getElementsByTagName('em')[0];
	
	//根据checkbox的状态改变更新选中总件数和总金额的值
	function updateSummaryInfo()
	{
		//选中的商品数和金额总数
		var selecItemsCount = 0;
		var selecItemsPrice = 0;
		///每一条购物车中商品记录
		var vCartRecord = document.getElementsByName("cartRecord");
		//每一条购物车中商品记录中的checkbox
		var vIdList = document.getElementsByName("idlist");
		//每一条购物车中商品记录中的商品数量(number控件)
		var vCountList = document.getElementsByName("itemCount");
		
		//vCartRecord和vIdList的数量是一致的
		for(var i = 0; i < vCartRecord.length;i++)
		{
			if(vIdList[i].checked)
			{
				selecItemsPrice += Number(vCartRecord[i].getElementsByTagName('em')[0].innerHTML);
				selecItemsCount += Number(vCountList[i].value);
			}
		}
		
		itemsCount.innerHTML = selecItemsCount;
		itemsPrice.innerHTML = selecItemsPrice;
	}
	
	
	//更新购物车中单项商品的总金额
	function updateItemCount(kkb101,kkb103)
	{
		var countID = "itemCount" + kkb101; //countID表示数量的控件的id(唯一)
		var priceID = "itemPrice" + kkb101;	//countID表示数量的控件的name(唯一)
		var updateCount = document.getElementById(countID).value;
		var itemPrice = document.getElementsByName(priceID)[0].getElementsByTagName('em')[0];
		
		 $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/kb04UpdateMyCart.kbhtml?"
	    			+"kkb101="+kkb101
	    			+"&kkb402="+updateCount,
/* 	            data: {"kkb101":kkb101,
	                    "kkb402":updateCount
	            }, */
	            dataType: "text",
	            success: function (data)
	            {
	            	if(data)
	            	{
	            		//先更新单项商品的金额
	            		itemPrice.innerHTML = updateCount * kkb103;
	            		//更新总金额和总件数
	            		updateSummaryInfo();
	            	}
	            }//endsuccess
	        });//endajax
		}
	
	
	//更新数量控件的值
 	<%-- function updateItemCount(kkb101)
	{
		var countID = "itemCount" + kkb101; //countID表示数量的控件的id(唯一)
		var updateCount = document.getElementById(countID).value;
		window.location.href="<%=request.getContextPath()%>/kb04UpdateMyCart.kbhtml?"
			+"kkb101="+kkb101
			+"&kkb402="+updateCount;
	} --%>
	
	 window.onload = function()
	 {
		onSelectAll(true);
	 } 
	</script>
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
		
</body>
</html>