<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>${sessionScope.user.kkd102} 的个人设置</title>

<link rel="stylesheet" type="text/css" href="<%=path %>/css/bangumi.css" />
<script src="<%=path %>/js/bangumi.js" type="text/javascript"></script>
</head>

<body class="bangumi">
<div id="wrapperNeue" class="wrapperNeue">
<!-- 顶部栏 -->
<div id="headerNeue2">
    <div class="headerNeueInner clearit">
         <div class="bg musume_4"></div>
   		 <a href="<%=path%>/home" class="logo"></a>
        
		<input type="checkbox" id="navMenuNeueToggle" />        
		<label for="navMenuNeueToggle" class="menuCompact"></label>
	<!-- 顶部导航 -->
	<div id="navNeue2">
		<div id="menuNeue">
		<ul id="navMenuNeue" class="clearit">
		<li><a href="#" class="top chl anime"><span>动画</span></a>
		                <div class="clear"></div>
		<ul class="clearit">
		<li><a href="kc02ShowRank.kchtml" class="nav">排行榜</a></li>
		</ul>
		</li>
		<li><a href="#" class="top chl"><span>书籍</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="kc03ShowRank.kchtml" class="nav">排行榜</a></li>
		</ul>
		</li>
		
		<li><a href="#" class="top chl game"><span>游戏</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="kc04ShowRank.kchtml" class="nav">排行榜</a></li>
		</ul>
		</li>
		
		<li>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="kb01QueryItems.kbhtml?page=1">
			<img alt="前往商城" src="<%=path%>/img/shop_logo.png" style="width:150px;height:50px;">
			</a>&nbsp;&nbsp;
		</li>
		<li>
			<a href="<%=path %>/ka01MainForum.kahtml?id=0">
			<img alt="前往论坛" src="<%=path%>/img/forum_logo.png" style="width:150px;height:50px;">
			</a>&nbsp;&nbsp;
		</li>
		</ul>
		</div>
	</div>
	<!-- 顶部导航 -->
	
    <!-- 顶部头像菜单 -->
    <div class="idBadgerNeue">
		<c:choose>
           	<c:when test="${!empty sessionScope.user.kkd108}">
               <a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
			<span class="avatarNeue avatarSize32 ll" 
				style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
			</a>
           	</c:when>
           	<c:otherwise>
               <a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
			<span class="avatarNeue avatarSize32 ll" 
				style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
			</a>
           	</c:otherwise>
        </c:choose>
		<ul id="badgeUserPanel">
			<li><a href="<%=path%>/kd01UserMain.kdhtml">个人主页</a></li>                    
       		<li><a href="<%=path%>/kc06AnimeColl.kdhtml">作品</a></li>
       		<li><a href="<%=path%>/ka01PostRecord.kdhtml">论坛</a></li>
       		<li><a href="<%=path%>/kb02ShopRecord.kdhtml">商城</a></li>
	    	
	        <li class="row">
		        <a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a> | 
		        <a href="<%=path%>/kd/userpage_info.jsp">设置</a> | 
		        <a href="<%=path%>/logout.kdhtml">登出</a>
	        </li>
    	</ul>	
    </div>
    <!-- 顶部头像菜单 -->
	
	<!-- 顶部搜索栏 -->
	<div id="headerSearchWrapper">
		<div id="headerSearch">
	        <form action="kc02Search.kchtml" method="post">
		    <div class="inner">
		    <select name="kkcs" id="siteSearchSelect">
				<option value="2">动画</option>
				<option value="1">书籍</option>
				<option value="4">游戏</option> 
			</select>
			<input id="search_text" name="kksk" class="textfield" type="text" />
		    <input type="submit" name="submit" value="搜索" class="search" />
		    </div>
			</form>
	    </div>   
	</div>   
	<!-- 顶部搜索栏 -->
    </div>
</div>
<!-- 顶部栏 -->

<!-- 顶部栏以下 -->
	<div id="main" class="png_bg">
		<!-- 切换栏 -->
			<div id="header">
				<ul class="secTab rr">
				<li><a href="<%=path %>/kd/userpage_info.jsp"><span>基本设置</span></a></li>
				<li><a href="<%= path %>/kd03FindApp.kdhtml" class="selected"><span>权限申请</span></a></li>
				<li><a href="<%=path %>/kd/userpage_pwd.jsp"><span>密码</span></a></li>
				</ul>
				<h1>权限申请</h1>
			</div>
		<!-- 切换栏 -->
		<hr class="board" />
		
		<div class="columns clearit">
			<div id="columnA" class="column">
			    <div class="light_odd">
					<span class="tip">
					<c:choose>
						<c:when test="${empty app }">
							<form method="post" action="<%= path %>/kd03CommitApp.kdhtml">		
							<table align="center" width="99%" class="settings">
							<tr><td valign="top" width="10%">标题</td>
								<td valign="top">
								<input id="tpc_title" name="kkd302" placeholder="字数请保证在20字以内！" 
									class="inputtext" type="text" value="" required="required"> 
									<span class="alarm"></span>
								</td>
							</tr>
							<tr>
							<td valign="top" width="10%">正文</td>
							<td valign="top">
							<e:textarea rows="15" cols="45" name="kkd303" style="width:550px;" placeholder="在此输入你的申请信息..."/>
							<span class="alarm"></span>
							</td>
							</tr>
							
							<tr>
							<td valign="top" width="10%"></td>
							<td valign="top">
							<div id="submitBtnO"><input class="inputBtn" value="向管理员发送权限申请" name="submit" type="submit" /> </div>
							</td>
							</tr>
							</table>
							<div id="related_value_list">
							</div>
				        	</form>
						</c:when>
						<c:otherwise>
							<table align="center" width="99%" class="settings">
							<tr><td valign="top" width="10%">标题</td>
								<td valign="top">
								<input id="tpc_title" name="title" class="inputtext" type="text" value="${app.kkd302 }" readonly="readonly"> <span class="alarm"></span>
								</td>
							</tr>
							<tr>
							<td valign="top" width="10%">正文</td>
							<td valign="top">
							<textarea  name="text" cols="45" rows="15" style="width:550px;" readonly="readonly">${app.kkd303 }</textarea>
							<span class="alarm"></span>
							</td>
							</tr>
							
							<tr>
							<td valign="top" width="10%">申请时间</td>
							<td valign="top">
							<div id="submitBtnO">${app.kkd304 } </div>
							</td>
							</tr>
							
							<tr>
							<td valign="top" width="10%">状态</td>
							<td valign="top">
							<div id="submitBtnO">
								<c:choose>
									<c:when test="${app.kkd305 eq '待审核' }">
										<span style="font-size:20px;color: #0000ff">${app.kkd305 } </span>
									</c:when>
									<c:when test="${app.kkd305 eq '审核拒绝' }">
										<span style="font-size:20px;color: #ff0000">${app.kkd305 } </span>
									</c:when>
								</c:choose>
							</div>
							</td>
							</tr>
							</table>
						</c:otherwise>
					</c:choose>
				        
					</span>
				</div>  
			</div>
		
			<div id="columnB" class="column">
			</div>
		</div>
	</div>
</div>
<!-- 页面主体到此结束 -->

<div class="homeBg"></div>
<!-- 底部菜单栏 -->
<div id="dock">
    <div class="content">
         <ul class="clearit">
        <li class="first"><a href="<%=path%>/kd01UserMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
        <li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a></li>
        <li><a href="<%=path %>/kd/userpage_info.jsp">设置</a></li>
        <li><a href="<%=path%>/logout.kdhtml">登出</a></li>
        <li class="last"><a href="javascript:void(0);" id="showrobot">&nbsp;</a></li>
        </ul>
    </div>
</div>
<!-- 底部菜单栏 -->


<!-- 展示 -->
<div id="robot" >
<div id="ukagaka_shell">
<div class="ui_10 shell_1">
<div id="ukagaka_voice"></div>
<div id="robot_balloon" class="ukagaka_balloon_pink">
<div class="tools"><a href="javascript:void(0);" id="ukagaka_menu"></a></div>    
<div class="inner">
<div id="robot_speech" class="speech" >
<c:choose>
	<c:when test="${!empty app}">
		<c:choose>
			<c:when test="${app.kkd305 eq '待审核' }">
				<strong>『申请已提交』</strong><br />
				你的权限申请已提交至管理员审核，请耐心等待...
			</c:when>
			<c:when test="${app.kkd305 eq '审核拒绝' }">
				<strong>『申请已被拒绝』</strong><br />
				你可以前往<a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">消息</a>查看被拒绝原因，并联系管理员...
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${empty hint }">
		<strong>关于『权限』</strong><br />
		权限用户可对作品信息进行修改，请不要滥用权限破坏网站。<br />
		申请权限前请先加<strong>Q群xxxxxxx</strong>审核，通过才可获得权限。
	</c:when>
	<c:otherwise>
		<strong>『${hint }』</strong><br />
		${msg }<br />
	</c:otherwise>
</c:choose>
<br>
<!-- 消息提示 -->
<c:if test="${!empty msgs }">
	你收到了 <span class="green">${fn:length(msgs) }</span> 封新的短消息~点击下面的链接前往查看<br>
	<c:forEach items="${msgs }" var="msg" begin="0" end="2">
		<span style="color:#8f8fff">${msg.sender }:</span> 
		<a href="<%=path%>/kd02FindMsgDetail.kdhtml?flag=receive&kkd201=${msg.kkd201}&username=${user.kkd102}">${msg.title }</a>
		<br>
	</c:forEach>
	<c:if test="${fn:length(msgs) >3}">
		<a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}" ><span>...前往收件箱查看更多</span></a>
	</c:if>
</c:if>
<!-- 消息提示 -->
</div>
</div>
<div class="ukagaka_balloon_pink_bottom"></div>	
</div>
</div>
</div>
</div>
<!-- 展示 -->

</body>
</html>