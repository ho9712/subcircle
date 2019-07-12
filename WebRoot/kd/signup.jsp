<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>登录至 Bangumi 番组计划</title>

<link rel="stylesheet" type="text/css" href="<%=path %>/css/bangumi.css" >
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
    <h1>注册成为 SubCircle 会员</h1>
    <div class="clearit">
        <div id="columnLoginA" class="column">        
            
            <div id="signupFormWrapper">
                <form id="signupForm" method="post" name="signup" action="<%=path %>/userSignUp.kdhtml">
                <p class="title"><label for="email">你的用户名(6-12位)</label></p>
                <p><input id="email" name="kkd102" class="inputtext" type="text" required="required" /></p>
                <p class="title"><label for="password">设置一个密码(6-16位)</label></p>
                <p><input id="password" name="kkd103" class="inputtext" type="password" required="required" /></p>
                <p class="title"><label for="password2">确认密码 </label></p>
                <p><input id="password2" name="kkd103-1" class="inputtext" type="password" required="required" /></p>
                <p class="title"><label for="nickname">设置一个昵称</label></p>
                <p><input id="nickname" name="kkd105" class="inputtext" type="text" required="required" /></p>
                <div id="rechaptcha_form"></div>
                <p class="title"><input class="inputBtn" type="submit" name="regsubmit" value="注册会员" /></p>
                </form>
            </div>
        </div>
        <div id="columnLoginB" class="column">
            <div class="panel">
            <p class="title">已经注册过 SubCircle 账户？</p>
            <a href="<%=path %>/kd/login.jsp" class="btnPink">立即登录</a>
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
		<strong>『注册』</strong><br />
		在这里，你可以注册你个人的SubCircle账号。<br />
		<strong>关于『用户名』</strong><br />
		用户名在注册完成后不可更改，它将作为你的登录凭证。<br />
		<strong>关于『昵称』</strong><br />
		昵称可以随意修改，修改后在某些页面可能无法立即生效，请保持冷静。<br />
		<strong>关于『密码』</strong><br />
		密码将作为你登陆网站的唯一手段，注册时请保证两次输入的密码保持一致。<br />
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

</body></html>