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
		<li><a href="/anime/chart" class="nav">排行榜</a></li>
		<li><a href="/calendar" class="nav">每日放送</a></li>
		<li><a href="/anime/tag" class="nav">动画标签</a></li>
		<li><a href="/anime/browser" class="nav">分类浏览</a></li>
		<li><a href="/anime/blog" class="nav">动画日志</a></li>
		<li><div class="sep">我看</div></li>
		<li><a href="/anime/list/481528/do" class="nav">在看</a></li>
		<li><a href="/anime/list/481528/wish" class="nav">想看</a></li>
		<li><a href="/anime/list/481528/collect" class="nav">看过</a></li>
		<li><a href="/anime/list/481528/on_hold" class="nav">搁置</a></li>
		<li><a href="/anime/list/481528/dropped" class="nav">抛弃</a></li>
		</ul>
		</li>
		<li><a href="/book" class="top chl"><span>书籍</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="/book/chart" class="nav">排行榜</a></li>
		<li><a href="/book/tag" class="nav">图书标签</a></li>
		<li><a href="/book/browser" class="nav">分类浏览</a></li>
		<li><a href="/book/blog" class="nav">图书日志</a></li>
		<li><div class="sep">我读</div></li>
		<li><a href="/book/list/481528/do" class="nav">在读</a></li>
		<li><a href="/book/list/481528/wish" class="nav">想读</a></li>
		<li><a href="/book/list/481528/collect" class="nav">读过</a></li>
		<li><a href="/book/list/481528/on_hold" class="nav">搁置</a></li>
		<li><a href="/book/list/481528/dropped" class="nav">抛弃</a></li>
		</ul>
		</li>
		<li><a href="/music" class="top chl"><span>音乐</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="/music/chart" class="nav">排行榜</a></li>
		<li><a href="/music/tag" class="nav">音乐标签</a></li>
		<li><a href="/music/browser" class="nav">浏览全部</a></li>
		<li><a href="/music/blog" class="nav">音乐日志</a></li>
		<li><div class="sep">我听</div></li>
		<li><a href="/music/list/481528/do" class="nav">在听</a></li>
		<li><a href="/music/list/481528/wish" class="nav">想听</a></li>
		<li><a href="/music/list/481528/collect" class="nav">听过</a></li>
		<li><a href="/music/list/481528/on_hold" class="nav">搁置</a></li>
		<li><a href="/music/list/481528/dropped" class="nav">抛弃</a></li>
		</ul>
		</li>
		<li><a href="/game" class="top chl"><span>游戏</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="/game/chart" class="nav">排行榜</a></li>
		<li><a href="/game/tag" class="nav">游戏标签</a></li>
		<li><a href="/game/browser" class="nav">平台浏览</a></li>
		<li><a href="/game/blog" class="nav">游戏日志</a></li>
		<li><div class="sep">我玩</div></li>
		<li><a href="/game/list/481528/do" class="nav">在玩</a></li>
		<li><a href="/game/list/481528/wish" class="nav">想玩</a></li>
		<li><a href="/game/list/481528/collect" class="nav">玩过</a></li>
		<li><a href="/game/list/481528/on_hold" class="nav">搁置</a></li>
		<li><a href="/game/list/481528/dropped" class="nav">抛弃</a></li>
		</ul>
		</li>
		<li><a href="/real" class="top chl real"><span>三次元</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="/real/chart" class="nav">排行榜</a></li>
		<li><a href="/real/tag" class="nav">三次元标签</a></li>
		<li><a href="/real/blog" class="nav">三次元日志</a></li>
		<li><a href="/real/browser/platform/jp" class="nav">日剧</a></li>
		<li><a href="/real/browser/platform/en" class="nav">欧美剧</a></li>
		<li><div class="sep">我看</div></li>
		<li><a href="/real/list/481528/do" class="nav">在看</a></li>
		<li><a href="/real/list/481528/wish" class="nav">想看</a></li>
		<li><a href="/real/list/481528/collect" class="nav">看过</a></li>
		<li><a href="/real/list/481528/on_hold" class="nav">搁置</a></li>
		<li><a href="/real/list/481528/dropped" class="nav">抛弃</a></li>
		</ul>
		</li>
		            <li><a href="/mono" class="top"><span>人物</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="/character" class="nav">虚构人物</a></li>
		<li><a href="/person" class="nav">现实人物</a></li>
		<li><div class="sep">我</div></li>
		<li><a href="/mono/update" class="nav">关注人物更新</a></li>
		<li><a href="/user/481528/mono/character" class="nav">收藏的角色</a></li>
		<li><a href="/user/481528/mono/person" class="nav">收藏的人物</a></li>				
			
		</ul>
		</li>
		<li><a href="/rakuen" class="top_lite"><span>超展开</span></a></li>
		<li><a href="/group"class="top"><span>小组</span></a>
		<div class="clear"></div>
		<ul class="clearit">
		<li><a href="/group/discover" class="nav">随便看看</a></li>
		<li><a href="/group/all" class="nav">所有小组</a></li>
		<li><div class="sep">我</div></li>
		<li><a href="/group/my_topic" class="nav">发表的话题</a></li>
		<li><a href="/group/my_reply" class="nav">回复的话题</a></li>
		<li><a href="/group/mine" class="nav">参加的小组</a></li>
		</ul>
		</li>
		<li><a href="javascript:void(0);" class="top"><span>探索</span></a>
		<div class="clear"></div>
		<ul class="explore clearit">
		
		<li class="single"><a href="/timeline">时空管理局</a></li>		
		                <li class="group">
		<span><a href="/blog">日志</a><a href="/index">目录</a><a href="/wiki">维基人</a></span>
		</li>				
		<li class="group"><span><a href="/magi">MAGI 问答</a><a href="/dollars">Dollars</a></span></li>				
		                <li class="group">
		<span class="root">客户端</span>
		<span><a href="/onair">onAir</a><a href="/group/topic/5155">Mobile</a></span>
		</li>				
		</ul>
		</li>
		<li class="doujin"><a href="http://doujin.bangumi.tv">天窗联盟</a></li>
		</ul>	
		</div>
	</div>
	<!-- 顶部导航 -->
	
    <!-- 顶部头像菜单 -->
    <div class="idBadgerNeue">
		<a class="avatar" href="<%=path%>/kd/rootadminpage_main.jsp">
			<img src="${sessionScope.user.kkd108}" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="33px" height="33px"/>
		</a>
		<ul id="badgeUserPanel">
	    	<li><a href="<%=path%>/kd/rootadminpage_main.jsp">账号</a></li>                    
	    	<li class="row"><a href="<%= path %>/kd01QueryAdmin.kdhtml">管理员</a></li>
	        <li class="row">
		        <a href="http://bangumi.tv/pm">短信</a> | 
		        <a href="<%=path%>/kd/rootadminpage_info.jsp">设置</a> | 
		        <a href="<%=path%>/logout.kdhtml">登出</a>
	        </li>
    	</ul>	
    </div>
    <!-- 顶部头像菜单 -->
    
    <!-- 顶部搜索栏 -->
    <div id="headerSearchWrapper">
		<div id="headerSearch">
        <form action="/subject_search" method="post">
    		<div class="inner">
				<select name="cat" id="siteSearchSelect">
				<option value="all">全部</option>
				<option value="2">动画</option>
				<option value="1">书籍</option>
				<option value="4">游戏</option>
				<option value="3">音乐</option>
				<option value="6">三次元</option>
				<option value="person">人物</option>			
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
			<li><a href="<%= path %>/kd/rootadminpage_info.jsp" class="selected"><span>基本设置</span></a></li>
			<li><a href="<%= path %>/kd/rootadminpage_pwd.jsp" ><span>密码</span></a></li>
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
							<img src="${sessionScope.user.kkd108}" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="75px" height="75px"/>
							<img src="${sessionScope.user.kkd108}" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="50px" height="50px"/>
							<img src="${sessionScope.user.kkd108}" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="35px" height="35px"/> <br /><br />
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
								<c:when test="${sessionScope.user.kkd104==0}">超级管理员</c:when>
								<c:when test="${sessionScope.user.kkd104==1}">作品管理员</c:when>
								<c:when test="${sessionScope.user.kkd104==2}">商城管理员</c:when>
								<c:when test="${sessionScope.user.kkd104==3}">论坛管理员</c:when>
								<c:when test="${sessionScope.user.kkd104==4}">权限用户</c:when>
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
        <li class="first"><a href="<%=path%>/kd/rootadminpage_main.jsp">${sessionScope.user.kkd102 }</a></li>
        <li><a href="http://bangumi.tv/notify/all">提醒</a></li>
        <li><a href="http://bangumi.tv/pm">短信</a></li>
        <li><a href="<%=path%>/kd/rootadminpage_info.jsp">设置</a></li>
        <li class="last"><a href="<%=path%>/logout.kdhtml">登出</a></li>
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
		<span class="green">${msg }</span><br><br>
		<strong>关于『昵称』</strong><br />
		昵称可以随意修改，修改后在某些页面可能无法立即生效，请保持冷静。<br />
		<strong>关于『用户名』</strong><br />
		用户名设置后将作为你唯一的ID使用在你个人页面的URL中，你<strong>只有一次</strong>设置的机会，用户名允许使用以字母开头的包括字母、数字或下划线的字符串。<br />
		</div>
		</div>
	<div class="ukagaka_balloon_pink_bottom"></div>	
	</div>
	</div>
	</div>
	</div>
<!-- 展示结束 -->

</body>
</html>