<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>登录至 SubCircle</title>

<link rel="stylesheet" type="text/css" href="<%=path %>/css/bangumi.css" >
<script src="<%=path %>/js/bangumi.js" type="text/javascript"></script>
</head>

<body class="bangumi">
<div id="wrapperNeue" class="wrapperNeue">

<%-- <!-- 顶部栏 -->
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
    	<div class="guest">
	    	<a href="<%=path %>/kd/login.jsp" class="guest login">登录</a>
	    	<a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a>
    	</div>
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
	</div> --%>
	
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
    	<div class="guest">
	    	<a href="<%=path %>/kd/login.jsp" class="guest login">登录</a>
    		<a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a>
    	</div>
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

<!-- 页面主体 -->
<div id="main" class="png_bg">
	<div class="columnsLogin borderNeue clearit">
	    <h1>登录至 SubCircle</h1>
	    <div class="clearit">
	        <div id="columnLoginA" class="column">
	    		<form id="loginForm" method="post" name="login" action="<%=path %>/login.kdhtml">
		    		<p class="title"><label for="email">你的用户名</label></p>
		    		<p><input id="email" name="kkd102" class="inputtext" type="text" required="required"/></p>
		    		<p class="title"><label for="password">你的密码</label></p>
		    		<p><input id="password" name="kkd103" class="inputtext" type="password" required="required"></p>
		    		
					<br><br>
		    		<input class="inputBtn" type="submit" name="loginsubmit" value="登录">
	    		</form>
	        </div>
	        <div id="columnLoginB" class="column">
	            <div class="panel">
	            <p class="title">还没有 SubCircle 账户？</p>
	            <a href="<%=path %>/kd/signup.jsp" class="btnPink">立即注册</a>
	            </div>
	        </div>
	    </div>
    </div>
</div>
<!-- 页面主体 -->
</div>

<div class="homeBg"></div>
<!-- 底部菜单栏 -->
<div id="dock">
    <div class="content">
        <ul class="clearit">
        <li class="first"><a href="<%=path %>/kd/login.jsp">登录</a></li>
        <li><a href="<%=path %>/kd/signup.jsp">注册</a></li>
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
		<strong>『登录』</strong><br />
		使用你的SubCircle账号登录，体验网站完整服务。<br />
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