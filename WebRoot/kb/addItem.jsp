<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>
<head>
<title>管理商品</title>
<link href="<%=basePath %>/css/bootstrap.css" rel="stylesheet">
<jsp:include page="index.jsp" flush="true" /><!-- 引入导航栏 -->
</head>
<body>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span10 offset2">
				
				<div align="center">
				<c:choose>
					<c:when test="${ins != null}">
						<span style="font-size: 30px; font: bold;">修改商品信息</span>
					</c:when>
					<c:otherwise>
						<span style="font-size: 30px; font: bold;">添加商品</span>
					</c:otherwise>
				</c:choose>
				</div>
				<form id="photoForm" method="post" enctype="multipart/form-data">
					<img id = "showPhoto" src="${ins.kkb105 }" style="width: 100px;height:100px">
					<input type="file" name="itemPhoto" size="25" onchange="uploadPhoto()"/><br>
					<small class="grey">仅支持上传.jpg或.png格式文件</small>
				</form>
				
				<form id="itemInfoForm"  action="" method="post">
				<table class="table">
					<tbody>
						<tr>
							<td>商品名</td>
							<td>
								<input type="text" required="required" name = "kkb102" value="${ins.kkb102 }">
							</td>
						</tr>
						<tr>
							<td>售价</td>
							<td>
								<input type="number" name = "kkb103" 
									min = "0" step = "0.01" required="required"
									value="${ins.kkb103 }">
							</td>
						</tr>
						<tr>
							<td>商品描述</td>
							<td>
								<textarea placeholder="商品描述...100字以内" name = "kkb104"
									style="width: 80%; overflow: auto;" rows="2" cols="20">${ins.kkb104 }</textarea>
							</td>
						</tr>
						<tr>
							<td>商品类型</td>
							<td>
								<e:select name = "kkb106"
									value="动漫:1,游戏:2,书籍:3" defval="${ins.kkb106 }"/>
							</td>
						</tr>
						<tr>
							<td>关联作品名</td>
							<td>
								<input type="text" name = "kkb107" value="${ins.kkb107 }">
							</td>
						</tr>
						<tr>
							<td>库存</td>
							<td>
								<input type="number" name = "kkb108" 
									min = "0" step = "1" required="required"
									value="${ins.kkb108 }">
							</td>
						</tr>
						<tr>
							<td>备注</td>
							<td>
								<input type="text" name = "kkb109" value="${ins.kkb109 }">
							</td>
						</tr>
						<tr>
							<td>设置热销</td>
							<td>
								<e:select name = "kkb111"
									value="热销:1,非热销:0" defval="${ins.kkb111 }"/>
							</td>
						</tr>
					
						<tr>
							<td colspan="2" align="center">
								<div align="center">
									<div class="btn-group btn-group-sm">
										<c:choose>
										<c:when test="${ins == null}">
											<button type="button" class="btn btn-success" 
												onclick="submitItemInfo('<%=request.getContextPath()%>/kb01AddItem.kbhtml')">
												添加</button>
											<button type="button" class="btn btn-warning" onclick="onCancle()">取消</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-success"
												 onclick="submitItemInfo('<%=request.getContextPath()%>/kb01ModifyItemInfo.kbhtml')">修改</button>
											<button type="button" class="btn btn-warning" onclick="onCancle()">取消</button>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
							</td>
							
						</tr>
					</tbody>
				</table>
					<input type="hidden" id = "kkb101" name = "kkb101" value="${ins.kkb101 }">
					<input type="hidden" id = "kkb105" name = "kkb105" value="${ins.kkb105 }">
				</form>
				
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function uploadPhoto()
		{
			$("#photoForm").attr("action","<%=request.getContextPath()%>/uploadPhotoServlet")
			$("#photoForm").ajaxSubmit({
		            type: "POST",
		            dataType: "text",
		            success: function (data)
		            {
		            	if(data)
		            	{
		            		$("#showPhoto").attr("src",data);
		            		$("#kkb105").attr("value",data);
		            	}
		            }//endsuccess
		       });//endajax		
		}
	
		function submitItemInfo(target) 
		{
			if(document.getElementById("kkb105").value != null 
					&& document.getElementById("kkb105").value != "")
			{	
				var msg = "确认提交操作吗";
				if (confirm(msg)==true)
			    {
        	 		$("#itemInfoForm").attr("action",target);
         			$("#itemInfoForm").submit();
         		}
         	}
			else
			{
				alert("还未上传商品图片");
			}

		}
		
		function onCancle()
		{
			window.location.href = "<%=path%>/kb01QueryItems.kbhtml?page=1"
		}
		
	</script>

	<script src="<%=basePath %>/js/jquery.js"></script>
	<script src="https://cdn.bootcss.com/jquery.form/4.2.1/jquery.form.min.js"></script>
  <script src="<%=basePath %>/js/bootstrap.min.js"></script>
</body>
</html>