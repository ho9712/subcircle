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
<title>待处理列表</title>
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
				<h3 align="center">待处理列表</h3>
				<c:choose>
				<c:when test="${empty rows}">
					<hr>
					<div align="center">
						<font color="darkgray" size="5">
							还没有其他用户响应您的求购呢~~
							<hr>
							再耐心等等吧
						</font>
					</div>
				</c:when>
				<c:otherwise>	
					<c:forEach items="${rows }" var="ins" varStatus="vs">
						<table  class="table" style="width: 100%">
							<tbody>
								<tr>
									<td colspan="6">
										<div>
											<span style="font-size: 20px; color: buttonshadow;">求购号:</span>
											<a id="myModel" href="#modal-container" role="button"
															 data-toggle="modal"
															 onclick = "passInquiryInfo('${ins.kkd101 }','${ins.kkb702}','${ins.kkb703}','${ins.kkb704}','${ins.kkb705}','${ins.kkb709}','${ins.kkd105}','${ins.kkd108}')">
												<span style="font-size: 20px; color: red;">
													&nbsp;${ins.kkb709 }</span>
											</a>
										</div>
									</td>
								</tr>
								
								<tr  class="error">
									<td width="20%" style="vertical-align: middle;"></td>
									<td width="20%" style="vertical-align: middle;">求购商品名</td>
									<td width="15%" style="vertical-align: middle;">求购价</td>
									<td width="15%" style="vertical-align: middle;">响应人数</td>
									<td width="15%" style="vertical-align: middle;">响应者</td>
									<td width="15%"></td>
								</tr>
								
								<tr class ="info">
									<td style="vertical-align: middle;">
										<c:choose>
										<c:when test="${ins.kkb704 != null }">
											<img class="img-thumbnail"  style="width: 100px;height: 100px"
												src="${ins.kkb704 }">
										</c:when>
										<c:otherwise>
											<img class="img-thumbnail"  style="width: 100px;height: 100px"
												src="" alt="用户未上传图片">
										</c:otherwise>
										</c:choose>	
									</td>
									<td style="vertical-align: middle;">
										${ins.kkb702 }
									</td>
									<td style="vertical-align: middle;">
										¥${ins.kkb705 }
									</td>
									<td style="vertical-align: middle;">
										${ins.resCount }
									</td>
									<td>
										<div align="left" style="padding-top:10px">
											<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${ins.kkd101}">
											 <img
												class="img-circle image-responsive"
												src="${ins.kkd108 }"
												style="width:50px; height: 50px;"
												onerror="this.src='<%=path %>/img/avatar/def_avatar.png'">
												<br>
												<span
												style="width: 80%; word-break: break-word; font-size: 10px; font: bold;padding-left: 5px">
													${ins.kkd105 }
												</span>
											</a>
										</div>
									</td>
									<td style="vertical-align: middle;">

										<div class="btn-group btn-group-sm">
											<button type="button" class="btn btn-success"
												onclick="updateResponse('${ins.kkb801 }','2')">拒绝</button>
											<button type="button" class="btn btn-warning"
												onclick="updateResponse('${ins.kkb701 }','${ins.kkb801 }','3')">确认</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
				</c:forEach>
				
				<!-- 遮罩窗体 -->
				<div id="modal-container" class="modal hide fade modal-lg" role="dialog"
				 aria-labelledby="myModalLabel" aria-hidden="true" style="width:30%">
					<div class="modal-header">
						 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel" style="color: maroon;" align="center">
							求购信息详情
						</h3>
					</div>
						
					<div class="modal-body" >
						<div>
							<table class="table table-hover">
								<tbody>
									<tr>
										<td  style="vertical-align: middle;width: 50%">
											<div align="left">
												<img id = "InquiryItemImg"
													class="img-thumbnail" src=""  
													style="width:200px; height: 200px;">
												<hr>
											</div>
										</td>
										<td>
											<div align="center" style="padding-top: 10px">
												<span style="font-size:20px;">响应者</span>
													<hr>
												<a id="userLink" href="">
												 <img class="img-circle image-responsive"
										   			id = "InquiryUserImg"	src=""
												    style="width: 80px; height: 80px;"
												    onerror="this.src='<%=path %>/img/avatar/def_avatar.png'">
													<br> <span id="InquiryUserName"
													style="width: 80%; word-break: break-word; font-size: 10px; font: bold; padding-left: 5px">
														</span>
												</a>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<span  style="font-size:15px;">求购商品</span>										
										</td>
										<td style="vertical-align: middle;">
											<div align="left">
												<span id="InquiryItemName">求购商品名</span>
											</div>	
										</td>
									</tr>
									<tr>
										<td>
											<span style="font-size:15px;">求购价</span>										
										</td>
										<td style="vertical-align: middle;">
											<div align="left" >
												¥<span id="InquiryItemPrice">价格</span>
											</div>	
										</td>
									</tr>
									<tr >
									<td style="vertical-align: middle;" colspan="2">
										<div align="left">
											<textarea rows="5" cols="30" id="InquiryItemDes" readonly="readonly"
											style="overflow:auto;width:100%;"placeholder="用户未填写求购商品描述..."></textarea> 
										</div>
									</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="modal-footer">
						<div class="btn-group btn-group-lg" align="center">
						 	<button class="btn btn-success" data-dismiss="modal" aria-hidden="true">关闭</button> 
						 </div>
					</div>
				</div>
				<!-- 遮罩窗体 结束-->
				</c:otherwise>
				</c:choose>
				
			</div>
			<!-- col-END -->
		</div>
		<!-- row-END -->
	</div>
	<!-- 容器END -->
	<script type="text/javascript">
	
	//向遮罩窗体传递信息
	function passInquiryInfo(kkd101,kkb702,kkb703,kkb704,kkb705,kkb709,kkd105,kkd108)
	{
		document.getElementById("myModalLabel").innerHTML = kkb709;
		document.getElementById("InquiryItemImg").src =kkb704;
		document.getElementById("InquiryUserImg").src = kkd108;
		document.getElementById("InquiryUserName").innerHTML = kkd105;
		document.getElementById("InquiryItemName").innerHTML = kkb702;
		document.getElementById("InquiryItemPrice").innerHTML = kkb705;
		document.getElementById("InquiryItemDes").value = kkb703;
		document.getElementById("userLink").href = "<%=path%>/kd01FindOther.kdhtml?kkd101=" + kkd101;
	}
	
	//更新响应的状态
	function updateResponse(kkb701,kkb801,kkb802)
	{
		var msg = "";
		if(kkb802 == "3")
		{
			msg = "您确认接受该响应吗"
		}
		else if(kkb802 == "2")
		{
			msg = "您确认拒绝该响应吗"
		}
		
		if(confirm(msg) == true)
		{
			$.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath}/kb08UpdateResponse.kbhtml?"
	            	+"kkb801="+kkb801
	            	+"&kkb802="+kkb802,
	            dataType: "text",
	            success: function (data)
	            {
					if(data == "true")
	            	{
						alert("操作成功");
						$.ajax({
				            type: "POST",
				            url: "${pageContext.request.contextPath}/Kb07UpdateInquiry.kbhtml?"
				            	+"kkb708=3"
				            	+"&kkb701="+kkb701,
				            dataType: "text",
				            success: function (data)
				            {
				            	
				            }
						});
						location.reload();
	            	}
					else
					{
						alert("操作失败");
					}
	            }//endsuccess
	       });//endajax
		}
	}
	
	</script>
	
	<script src="<%=basePath %>/js/jquery.js"></script>
	<script src="<%=basePath %>/js/bootstrap.min.js"></script>
</body>
</html>