<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
   		 <a href="/" class="logo">Bangumi 番组计划</a>
        
		<input type="checkbox" id="navMenuNeueToggle" />        
		<label for="navMenuNeueToggle" class="menuCompact"></label>
	<!-- 顶部导航 -->
	<div id="navNeue2">
		<div id="menuNeue">
		<ul id="navMenuNeue" class="clearit">
		<li><a href="/anime" class="top chl anime"><span>动画</span></a>
		                <div class="clear"></div>
		<ul class="clearit">
		<li><a href="kc02ShowRank.kchtml" class="nav">排行榜</a></li>
		</ul>
		</li>
		<li><a href="/book" class="top chl"><span>书籍</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="kc03ShowRank.kchtml" class="nav">排行榜</a></li>
		</ul>
		</li>
		
		<li><a href="/game" class="top chl game"><span>游戏</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="kc04ShowRank.kchtml" class="nav">排行榜</a></li>
		</ul>
		</li>
		</ul>
		</div>
	</div>
	<!-- 顶部导航 -->
	
    <!-- 顶部头像菜单 -->
    <div class="idBadgerNeue">
		<c:choose>
            	<c:when test="${!empty sessionScope.user.kkd108}">
                <a class="avatar" href="<%=path%>/kd/adminpage_main.jsp">
				<span class="avatarNeue avatarSize32 ll" 
					style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
				</a>
            	</c:when>
            	<c:otherwise>
                <a class="avatar" href="<%=path%>/kd/adminpage_main.jsp">
				<span class="avatarNeue avatarSize32 ll" 
					style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
				</a>
            	</c:otherwise>
            </c:choose>
		<ul id="badgeUserPanel">
			<li><a href="<%=path%>/kd/adminpage_main.jsp">账号</a></li>                    
	    	<c:choose>
				<c:when test="${sessionScope.kkd104 eq '0' }">
					<li><a href="<%= path %>/kd01QueryAdmin.kdhtml">Root管理员</a></li>
				</c:when>
				<c:when test="${sessionScope.kkd104 eq '1' }">
					<li><a href="<%= path %>/kd01QueryUser.kdhtml">作品管理员</a></li>
				</c:when>
				<c:when test="${sessionScope.kkd104 eq '2' }">
					<li><a href="<%= path %>/kd01QueryAdmin.kdhtml">商城管理员</a></li>
				</c:when>
				<c:when test="${sessionScope.kkd104 eq '3' }">
					<li><a href="<%= path %>/kd01QueryAdmin.kdhtml">论坛管理员</a></li>
				</c:when>
			</c:choose>
	        <li class="row">
		        <a href="#">短信</a> | 
		        <a href="<%=path%>/kd/adminpage_info.jsp">设置</a> | 
		        <a href="<%=path%>/logout.kdhtml">登出</a>
	        </li>
    	</ul>	
    </div>
    <!-- 顶部头像菜单 -->
	
	<!-- 顶部搜索栏 -->
	<div id="headerSearchWrapper">
		<div id="headerSearch">
	        <form action="" method="post">
			    <div class="inner">
				<select name="cat" id="siteSearchSelect">
					<option value="all">全部</option>
					<option value="2">动画</option>
					<option value="1">书籍</option>
					<option value="4">游戏</option>         
				</select>
				<input id="search_text" name="search_text" class="textfield" type="text" />
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
			<li><a href="<%= path %>/kd/adminpage_info.jsp" class="selected"><span>基本设置</span></a></li>
			<li><a href="<%= path %>/kd/adminpage_pwd.jsp" ><span>密码</span></a></li>
			</ul>
			<h1>我的个人设置</h1>
			</div>
		<!-- 切换栏 -->
		<hr class="board" />
	<div class="columns clearit">
		<div id="columnA" class="column">
			<!-- 头像上传 -->
			<form name="upload" method="post" action="<%=path%>/uploadAvatar" enctype="multipart/form-data">
				<span class="text">
					<table align="center" width="98%" cellspacing="0" cellpadding="5" class="settings">
						<tr>
						<td valign="top" width="12%">头像</td>
						<td valign="top">
							<c:choose>
			            	<c:when test="${!empty sessionScope.user.kkd108}">
			                	<span class="avatarNeue avatarSize75" style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>&nbsp;&nbsp;&nbsp;
			                	<span class="avatarNeue avatarSize48" style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>&nbsp;&nbsp;&nbsp;
			                	<span class="avatarNeue avatarReSize40" style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>&nbsp;&nbsp;&nbsp;
			                	<br><br>
			            	</c:when>
			            	<c:otherwise>
			                	<span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>&nbsp;&nbsp;&nbsp;
			                	<span class="avatarNeue avatarSize48" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>&nbsp;&nbsp;&nbsp;
			                	<span class="avatarNeue avatarReSize40" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>&nbsp;&nbsp;&nbsp;
			                	<br><br>
			            	</c:otherwise>
			            </c:choose>
							<input type="file" name="avatar" size="25" /><br>
							<small class="grey">仅支持上传.jpg或.png格式文件</small>
						</td>
						</tr>
						<tr>
							<td valign="top"><input class="inputBtn" value="上传头像" name="submit" type="submit" /></td>
							<td valign="top"><span class="green">${avatarMsg }</span></td>
						</tr>
					</table>
				</span>
			</form>
			<br>
			<!-- 头像上传 -->
			<!-- 信息修改 -->
		    <form name="set" method="post" action="<%=path %>/modifyInfo.kdhtml">
				<span class="text">
					<table align="center" width="98%" cellspacing="0" cellpadding="5" class="settings">
						<tr>
							<td valign="top" width="12%">UID</td>
							<td valign="top"><input name="kkd101" class="inputtext" type="text" value="${sessionScope.user.kkd101 }" readonly="readonly"></td>
						</tr>
						<tr>
							<td valign="top" width="12%">用户名</td>
							<td valign="top"><input name="kkd102" class="inputtext" type="text" value="${sessionScope.user.kkd102 }" readonly="readonly"></td>
						</tr>
						<tr>
							<td valign="top" width="12%">密码</td>
							<td valign="top"><a href="<%=path %>/kd/adminpage_pwd.jsp" class="l">修改密码</a></td>
						</tr>
						<tr>
						<td valign="top" width="12%">用户权限</td><td valign="top">
							<c:choose>
								<c:when test="${sessionScope.user.kkd104==0}">超级管理员</c:when>
								<c:when test="${sessionScope.user.kkd104==1}">作品管理员</c:when>
								<c:when test="${sessionScope.user.kkd104==2}">商城管理员</c:when>
								<c:when test="${sessionScope.user.kkd104==3}">论坛管理员</c:when>
							</c:choose>
						</td>
						</tr>
						<tr>
							<td valign="top" width="12%">昵称</td>
							<td valign="top"><input name="kkd105" class="inputtext" type="text" required="required" value="${sessionScope.user.kkd105 }"></td>
						</tr>
						<tr>
							<td valign="top" width="12%">签名</td>
							<td valign="top"><input name="kkd107" class="inputtext" type="text" value="${sessionScope.user.kkd107 }"></td>
						</tr>
						<tr>
							<td valign="top" width="12%">自我介绍</td>
							<td valign="top"><textarea id="newbio" name="kkd109" cols="45" rows="5" class="quick" style="width:380px;">${sessionScope.user.kkd109 }</textarea>
						</tr>
						<tr>
							<td valign="top">
							<input class="inputBtn" value="保存修改" name="submit" type="submit" />
							</td>
						</tr>
					</table>
				</span>
			</form>    
			<!-- 信息修改 -->
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
        <li class="first"><a href="<%=path%>/kd/adminpage_main.jsp">${sessionScope.user.kkd102 }</a></li>
        <li><a href="#">提醒</a></li>
        <li><a href="#">短信</a></li>
        <li><a href="<%=path%>/kd/adminpage_info.jsp">设置</a></li>
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
	<c:when test="${empty hint }">
		<strong>关于『昵称』</strong><br />
		昵称可以随意修改，修改后在某些页面可能无法立即生效，请保持冷静。<br />
		<strong>关于『用户名』</strong><br />
		用户名设置后将作为你唯一的ID使用在你个人页面的URL中，你<strong>只有一次</strong>设置的机会，用户名允许使用以字母开头的包括字母、数字或下划线的字符串。<br />
	</c:when>
	<c:otherwise>
		<strong>『${hint }』</strong><br />
		${msg }<br />
	</c:otherwise>
</c:choose>
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