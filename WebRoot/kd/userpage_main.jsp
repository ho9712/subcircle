<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>${sessionScope.user.kkd102} 的主页</title>

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
		<a class="avatar" href="<%=path%>/kd/userpage_main.jsp">
			<img src="${sessionScope.user.kkd108}" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="33px" height="33px"/>
		</a>
		<ul id="badgeUserPanel">
			<li><a href="<%=path%>/kd/userpage_main.jsp">时光机</a></li>                    
       		<li><a href="#">作品</a></li>
       		<li><a href="#">论坛</a></li>
       		<li><a href="#">商城</a></li>
	    	
	        <li class="row">
		        <a href="#">短信</a> | 
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

<!-- 主页头部 -->
<div id="main" class="png_bg"></div>
<div id="headerProfile" class="clearit">
    <div class="subjectNav">
    <!-- 主页个人信息 -->
    <div class="headerContainer">
    	<h1 class="nameSingle">
            <div class="rr">
            </div>

            <div class="headerAvatar">
                <a href="<%=path%>/kd/userpage_main.jsp" class="avatar"><span class="avatarNeue avatarSize75" style="background-image:url('${sessionScope.user.kkd108}')"></span></a>
            </div>

            <div class="inner">
                <a href="<%=path%>/kd/userpage_main.jsp">${sessionScope.user.kkd102 }</a> <small class="grey">@${sessionScope.user.kkd101 }</small>
                <span id="friend_flag"></span>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
    
    <!-- 主页导航栏 -->
    <div class="navTabsWrapper">
		<ul class="navTabs">
			<li><a href="<%=path%>/kd/userpage_main.jsp" class="focus">时光机</a></li>                    
       		<li><a href="#">作品</a></li>
       		<li><a href="#">论坛</a></li>
       		<li><a href="#">商城</a></li>
       		<li><a href="#">消息</a></li>
		</ul>
	</div>
	<!-- 主页导航栏 -->
	<!-- 子导航栏 -->
	<div class="navSubTabsWrapper">
		<ul class="navSubTabs">
		</ul>
	</div>
	<!-- 子导航栏 -->
	
	</div>
</div>
<!-- 主页头部 -->

<div class="mainWrapper">
<div class="columns clearit">
	<!-- 主页主体A栏 -->
		<div id="columnA" class="column">
			<div id="user_home">
				<div class="user_box clearit">
					<ul class="network_service clearit">
					<li><span class="service" style="background-color:#F09199;">SubCircle</span>
					<span class="tip">${sessionScope.user.kkd106 } 加入</span></li>
					</ul>    
			        <div class="adminTools">
				    	<a href="<%=path%>/kd/userpage_info.jsp" class="btnGraySmall"><span>编辑</span></a>           
	                </div>
				</div>
			    <div id="blog" class="sort">
					<h2 class="drag">&nbsp;</h2>
					<div class="horizontalOptions clearit">
						<ul class="">
							<li class="title"><h2> 我的日志</h2></li>
							<li style="float:right"><small><a href="/user/481528/blog">...more</a></small></li>
						</ul>
					</div>
				
					<div class="content_inner clearit" align="left">
						<div align="center" class="clearit">
							<span class="green">还没有发表过日志?</span>
								<a href="/blog/create" class="l">>立即发表<</a><br />
							<span class="tip_j">你甚至可以通过日志为 SubCircle 的会员提供新闻</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- 主页主体A栏 -->
	
	<!-- 主页主体B栏 -->
		<div id="columnB" class="column">
			<div id="">
				<div class="SidePanel png_bg">
					<h2>/ 我的... <small><a href="/user/481528/timeline">...more</a></small></h2>
				
					<ul class="timeline">
						<li>
							<small class="feed">注册成为了 SubCircle 成员</small> 
							<small class="time">${sessionScope.user.kkd106 }</small>
						</li>
					</ul>
				</div>
			</div>
			<div id="sideLayout">
				<div id="friend" class="sort">
					<div class="SidePanel png_bg" align="left">
						<h2>/ 我的... <small><a href="/user/481528/friends">...more</a></small></h2>
						<hr class="board" />
						<a href="/user/481528/rev_friends">+ 谁加我为好友</a>
					</div>
				</div>
				<div id="group" class="sort">
					<div class="SidePanel png_bg" align="left">
					<h2>/ 我的... </h2>
					    <ul class="groupsLine">
					            </ul>
					</div>
				</div>
			</div>
			<div class="menu_inner">
			    	<p> <a href="/feed/user/481528/interests" class="l">/ </a></p>
			    	<p><a href="/user/481528/wiki" class="l">/ </a></p>
			</div>
		</div>
	<!-- 主页主体B栏 -->
</div>
</div>
</div>
<!-- 页面主体到此结束 -->

<div class="homeBg"></div>
<!-- 底部菜单栏 -->
<div id="dock">
    <div class="content">
        <ul class="clearit">
        <li class="first"><a href="<%=path%>/kd/userpage_main.jsp">${sessionScope.user.kkd102 }</a></li>
        <li><a href="#">提醒</a></li>
        <li><a href="#">短信</a></li>
        <li><a href="<%=path%>/kd/userpage_info.jsp">设置</a></li>
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
	<c:when test="${sessionScope.kkd104=='5' }">
		<strong>『用户个人主页』</strong><br />
		欢迎你，普通用户  <span class="green"><strong>${user.kkd105 }</strong></span> <br />
	</c:when>
	<c:when test="${sessionScope.kkd104=='4' }">
		<strong>『用户个人主页』</strong><br />
		欢迎你，权限用户  <span class="green"><strong>${user.kkd105 }</strong></span> <br />
	</c:when>
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