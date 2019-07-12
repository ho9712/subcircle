<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>我的订单</title>
<jsp:include page="index.jsp" flush="true" /> <!-- 引入导航栏 -->
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
				<form action = "<%=request.getContextPath()%>/kb05CreateOrder.kbhtml" method="post">
					<table class="table table-hover">
						<tbody>
							<tr>
								<td>
									<div>
										<span style="font-size: 20px; color: buttonshadow;">订单号:</span>
										<span style="font-size: 10px; color: red;">xxx</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>
								<c:forEach begin = "1" step = "1" end = "20">
								<img class="img-thumbnail"
									src="http://uploadv3.anitoys.com/anitoys/images/test/20190613/tscdny7srbh44pymf0dzuqg90xaparsd.jpg"
									width="100px" height="100px" />
									</c:forEach> 
									
									<hr> <span style="font-size: 15px; color: buttonshadow;">
										共x种商品,共xx件 </span>
									<div class="btn-group btn-group-sm" style="float:right;">
										<button type="button" class="btn btn-success"
											onclick="">取消订单</button>
										<button type="button" class="btn btn-warning"
											onclick="">去支付</button>
									</div>
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

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>