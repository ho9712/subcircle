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
			<li><a href="<%=path %>/kd/userpage_info.jsp" class="selected"><span>基本设置</span></a></li>
			<c:if test="${sessionScope.kkd104==5 }">
				<li><a href="<%= path %>/kd03FindApp.kdhtml"><span>权限申请</span></a></li>
			</c:if>
			<li><a href="<%=path %>/kd/userpage_pwd.jsp" ><span>密码</span></a></li>
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
							<td valign="top"><a href="<%=path %>/kd/userpage_pwd.jsp" class="l">修改密码</a></td>
						</tr>
						<tr>
						<td valign="top" width="12%">用户权限</td><td valign="top">
							<c:choose>
								<c:when test="${sessionScope.user.kkd104==4}"><span style="font-size:20px;color:#0000ff">权限用户</span></c:when>
								<c:otherwise><span style="font-size:20px;color:#000000">普通用户</span>&nbsp;&nbsp;&nbsp;<a href="<%= path %>/kd03FindApp.kdhtml" class="l">申请权限</a></c:otherwise>
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
							<td valign="top" width="12%">收货地址</td>
							<td valign="top"><input name="kkd110" class="inputtext" type="text" value="${sessionScope.user.kkd110 }"></td>
						</tr>
						<tr>
							<td valign="top" width="12%">收货人</td>
							<td valign="top"><input name="kkd111" class="inputtext" type="text" value="${sessionScope.user.kkd111 }"></td>
						</tr>
						<tr>
							<td valign="top" width="12%">手机号</td>
							<td valign="top"><input name="kkd112" class="inputtext" type="text" value="${sessionScope.user.kkd112 }"></td>
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
	<c:when test="${empty hint }">
		<strong>关于『UID』</strong><br />
		UID在你注册时自动生成，且无法更改。<br />
		<strong>关于『用户名』</strong><br />
		用户名在注册完成后不可更改，它将作为你的登录凭证。<br />
		<strong>关于『昵称』</strong><br />
		昵称可以随意修改，修改后在某些页面可能无法立即生效，请保持冷静。<br />
		<strong>关于『用户权限』</strong><br />
		用户权限分为普通用户与权限用户，权限用户有权限对作品信息进行修改完善，普通用户可通过申请获取权限。<br />
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