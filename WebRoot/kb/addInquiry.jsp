<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<title>发布求购信息</title>
<link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
<jsp:include page="index.jsp" flush="true" /><!-- 引入导航栏 -->
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span10 offset2">
			
				<div align="center">
					<span style="font-size: 30px; font: bold;">发布求购信息</span>
				</div>
			
				<form id="inquiryPhotoForm" method="post" enctype="multipart/form-data">
					<img id = "showPhoto" src="" style="width: 100px;height:100px">
					<input type="file" name="inquiryItemPhoto" size="25" onchange="uploadPhoto()"/><br>
					<small class="grey">仅支持上传.jpg或.png格式文件</small>
				</form>
			
				<form id = "inquiryForm" action="" method="post">
					<table class="table" style="text-align: center">
						<tbody>
							<tr>
								<td style="width: 10%;">求购商品名</td>
								<td style="width: 90%;">
									<input type="text" name = "kkb702" required="required">
								</td>
							</tr>
							<tr>
								<td>求购商品描述</td>
								<td>
									<textarea placeholder="求购商品描述...100字以内" name = "kkb703" 
										style="width: 50%; overflow: auto;" rows="4" cols="20"></textarea>
								</td>
							</tr>
							<tr>
								<td>求购价</td>
								<td>
									<input type="number" name = "kkb705" 
										min = "0" step = "0.01" required="required">
								</td>
							</tr>
							<tr>
								<td>联系方式</td>
								<td>
									<input type="text" name = "kkb706"  required="required">
								</td>
							</tr>
							<tr>
								<td>收货地址</td>
								<td>
									<input type="text" name = "kkb707"  required="required">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="padding-left: 20%">
										<div class="btn-group btn-group-sm">
											<button type="button" class="btn btn-success"
												onclick="submitInquiryInfo('<%=request.getContextPath()%>/kb07AddInquiry.kbhtml?kkd101=${kkd101 }')">
												发布</button>
											<button type="button" class="btn btn-warning"
												onclick="onCancle()">取消</button>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" id = "kkb701" name = "kkb701" value="">
					<input type="hidden" id = "kkb704" name = "kkb704" value="">
					<input type="hidden" id = "kkb709" name = "kkb709" value="">
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function uploadPhoto()
		{
			$("#inquiryPhotoForm").attr("action","<%=request.getContextPath()%>/uploadPhotoServlet")
			$("#inquiryPhotoForm").ajaxSubmit({
		            type: "POST",
		            dataType: "text",
		            success: function (data)
		            {
		            	if(data)
		            	{
		            		$("#showPhoto").attr("src",data);
		            		$("#kkb704").attr("value",data);
		            	}
		            }//endsuccess
		       });//endajax		
		}
		
		function submitInquiryInfo(target) 
		{
			$("#kkb709").attr("value",GetDateNow());
			var msg = "确认提交操作吗";
			if (confirm(msg)==true)
		    {
       	 		$("#inquiryForm").attr("action",target);
        			$("#inquiryForm").submit();
        	}
		}
		
		function onCancle()
		{
			window.location.href = "<%=path%>/kb01QueryItems.kbhtml?page=1"
		}
		
		//通过时间获取唯一的求购号
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
		
	</script>
	
  <script src="<%=basePath %>/js/jquery.js"></script>
  <script src="https://cdn.bootcss.com/jquery.form/4.2.1/jquery.form.min.js"></script>
  <script src="<%=basePath %>/js/bootstrap.min.js"></script>
</body>
</html>