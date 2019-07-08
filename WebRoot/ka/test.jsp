<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
      var count=0;
      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vkka102)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdEmp.html?kka102="+vkka102;
    	 //alert(vform.action);
    	 vform.submit();
      }
  </script>

<title>Collection</title>
<link href="<%=path %>/ka/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
	#bom
	 {
	    position:fixed;
	    left:0px;
	    bottom:0;
	    _position:absolute;
	    _top:expression(document.documentElement.clientHeight + document.documentElement.scrollTop - this.offsetHeight);
	}
	
	#top
	 {
	     position:fixed;
	     top:15%;
	  	 width:15%;
	  	  _position:absolute;
	  	_bottom:expression(document.documentElement.clientHeight + document.documentElement.scrollTop - this.offsetHeight);
	}
</style>
</head>



<body>
${msg }
	<div class="container-fluid">
		<!-- 容器 -->

		<div class="row-fluid" align="center">
			<!--商城导航栏及搜索栏轮播图  (第一列)-->

			<div class="span2">
				<div id = "top">
					<ul class="nav nav-list">
						<li class="active"><a href="#">站点首页</a></li>
						<hr>
						<li><a href="#">迷你论坛</a></li>
						<hr>
						<li><a href="#">周边商城</a></li>
						<hr>
						<li><a href="#">个人空间</a></li>
					</ul>
				</div>
				<div id = "bom">
					<img class = "img-thumbnail"
						src="http://uploadv3.anitoys.com/anitoys/images/test/20190530/k867sby0s4eudifq9dv0wg3rl5i22fk9.jpg" 
						width = "250" height = "250"/>
				</div>
			</div>


			<div class="span10">

				<ul class="nav nav-pills">
					<li><a href="#">个人信息1</a></li>
					<li><a href="#">个人信息2</a></li>
					<li class="dropdown"><a href="#" data-toggle="dropdown"
						class="dropdown-toggle">个人收藏<strong class="caret"></strong></a>
						<ul class="dropdown-menu">
							<li><a href="#">收藏的作品</a></li>
							<li><a href="#">收藏的商品</a></li>
							<input type="submit" name="next" value="收藏的帖子">
						</ul></li>
				</ul>
				<h3 class="home_title">我收藏的贴子</h3>
				
				<form id="myform" action="<%=path%>/test.html" method="post">
				<table width="80%" border=0 style="table-layout:fixed" >
				  
				    <tr>
				      <td width="50%" align="left">标题</th>
				      <td width="10%" align="left">话题</th>
				      <td width="15%" align="left">作者</th>
				      <td width="25%" align="right">时间</th>
				    </tr>
				 
				
				    <tr>
				      <td class="odd">
				        <a href="#">11111</a>
				      </td>
				      <td class="odd" align="left">
				        <a>动画</a>
				      </td>
				      <td class="odd" align="left">
				        <a>PCD</a>
				      </td>
				      <td class="odd" align="right">
				        <small>2019-7-8 10:43</small>
				      </td>
				    </tr>
				
				
				
				
				<c:choose>
				  <c:when test="${rows!=null }">
				    <c:forEach items="${rows }" var="ins" varStatus="vs">
				      <tr>
				        <td>
				          <!-- #  空锚 -->
				          <a href="#">${ins.kka102 }</a>
				        </td>
				        <td>${ins.kka103 }</td>
				        <td>${ins.kkd105 }</td>
				        <td align="right">${ins.kka105 }</td>
				      </tr>
				    </c:forEach>
				    <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
		              <tr>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		                <td></td>
		              </tr>
		            </c:forEach>
				  </c:when>
				  <c:otherwise>
	                <c:forEach begin="1" step="1" end="15">
	                  <tr>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                  </tr>
	                </c:forEach>
	              </c:otherwise>
				</c:choose>	
				</table>
				<table border="1" width="95%" align="center">
	              <tr>
	                <td align="center">
	                 <input type="submit" name="next" value="查询">
	                </td>
	              </tr>
	            </table>
				</form>
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
			</div>
			<!-- span10结束 -->
		</div>
	</div>
	<!-- 容器结束 -->

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>