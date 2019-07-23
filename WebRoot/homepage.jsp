<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>SubCircle</title>

<link href="<%=path %>/css/bangumi.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/js/bangumi.js" type="text/javascript"></script>
</head>
<body class="bangumi bangumiNeue">
<div id="wrapperNeue" class="wrapperNeue">
<div id="headerNeue2">
    <div class="headerNeueInner clearit">
         <div class="bg musume_4"></div>
    <a href="<%=path%>/home" class="logo"></a>
        
    
<input type="checkbox" id="navMenuNeueToggle" />        
<label for="navMenuNeueToggle" class="menuCompact"></label>

<div id="navNeue2">
<div id="menuNeue">
<ul id="navMenuNeue" class="clearit">
<li><a href="" class="top chl anime"><span>动画</span></a>
                <div class="clear"></div>
<ul class="clearit">
<li><a href="kc02ShowRank.kchtml" class="nav">排行榜</a></li>
</ul>
</li>
<li><a href="" class="top chl"><span>书籍</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="kc03ShowRank.kchtml" class="nav">排行榜</a></li>
</ul>
</li>

<li><a href="" class="top chl game"><span>游戏</span></a>
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

<!-- 
登录模块和头像导航栏的判断
 -->
        
    	<!-- 顶部头像菜单 -->
	    <div class="idBadgerNeue">
	    	<c:choose>
	    		<c:when test="${empty user}">
	    			<div class="guest">
				    	<a href="<%=path %>/kd/login.jsp" class="guest login">登录</a>
			    		<a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a>
			    	</div>
	    		</c:when>
	    		<c:otherwise>
	    			<c:choose>
	            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
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
	            		</c:when>
	            		<c:otherwise>
							<c:choose>
				            	<c:when test="${!empty sessionScope.user.kkd108}">
				                <a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
								<span class="avatarNeue avatarSize32 ll" 
									style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
								</a>
				            	</c:when>
				            	<c:otherwise>
				                <a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
								<span class="avatarNeue avatarSize32 ll" 
									style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
								</a>
				            	</c:otherwise>
				            </c:choose>
	            		</c:otherwise>
	            	</c:choose>
	            	<!-- 用户或管理员入口 -->
					<ul id="badgeUserPanel">
					<c:choose>
			       		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
							<li><a href="<%=path%>/kd01UserMain.kdhtml">个人主页</a></li>                    
				       		<li><a href="<%=path%>/kc06AnimeColl.kdhtml">作品</a></li>
				       		<li><a href="<%=path%>/ka01PostRecord.kdhtml">论坛</a></li>
				       		<li><a href="<%=path%>/kb02ShopRecord.kdhtml">商城</a></li>
				       		<li class="row">
					        <a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a> | 
					        <a href="<%=path%>/kd/userpage_info.jsp">设置</a> | 
					        <a href="<%=path%>/logout.kdhtml">登出</a>
				        	</li>
				    	</c:when>
				    	<c:otherwise>
				    		<li><a href="<%=path%>/kd01AdminMain.kdhtml">个人主页</a></li>
				    		<c:choose>
				    			<c:when test="${sessionScope.kkd104 eq '0' }">
									<li><a href="<%= path %>/kd01QueryAdmin.kdhtml">Root管理员</a></li>
								</c:when>
								<c:when test="${sessionScope.kkd104 eq '1' }">
									<li><a href="<%= path %>/kd01QueryUser.kdhtml">作品管理员</a></li>
								</c:when>
								<c:when test="${sessionScope.kkd104 eq '2' }">
									<li><a href="<%= path %>/kd/shopadminpage_turn.jsp">商城管理员</a></li>
								</c:when>
								<c:when test="${sessionScope.kkd104 eq '3' }">
									<li><a href="<%= path %>/ka03QueryReport.kdhtml?flag=post">论坛管理员</a></li>
								</c:when>
				    		</c:choose>
				    		<li class="row">
				    		<a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a> | 
					        <a href="<%=path%>/kd/adminpage_info.jsp">设置</a> | 
					        <a href="<%=path%>/logout.kdhtml">登出</a>
				        	</li>
				    	</c:otherwise>
			        </c:choose>
			    	</ul>	
			    	<!-- 用户或管理员入口 -->
	    		</c:otherwise>
	    	</c:choose>
	    	
		</div>
		<!-- 顶部头像菜单 -->

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
    </div>
</div>

<div id="main" class="png_bg">
</div>
<div id="introWrapper">
    <div id="intro" class="columns clearit">
        <div id="columnIntroA" class="column">
            <div class="musume"></div>
            <div class="slider">
                <ul id="sliderNav">
                    <li><span class="active">探索</span></li>
                </ul>
                <div id="sliderSequence">
                <ul>
                    <li style="display: list-item;width:100%;height: 100%;position: absolute;z-index: 4" class="current-frame">
                        <p class="thumb snap1 animate1 animate-in"></p>
                        <p class="thumb snap2 animate2 animate-in"></p>
                        <p class="thumb snap3 animate3 animate-in"></p>
                        <div class="desc animate-in">
                        <h3>全方位作品资讯服务等你探索</h3>
                        <p>动画、书籍、游戏 综合资讯</p>
                        <p>迷你论坛实时讨论，分享交流</p>
                        <p>周边商城丰富作品周边商品等待购买</p>
                        <div class="signUp"><a href="<%=path %>/kd/signup.jsp" class="btnBlue">立即注册</a></div>
                        </div>   
                    </li>
                </ul>
                </div>                
            </div>
        </div>
        <div id="columnIntroB" class="column">
            <div>
            <h2 class="subtitle">周边商城 ≖‿≖✧  <small><a href="kb01QueryItems.kbhtml?page=1">...more</a></small></h2>
			<div id="sidePanelAward2018" class="SidePanelMini clearit">
			    <a href="kb01QueryItems.kbhtml?page=1" class="clearit" style="display:block; cursor: pointer;">
			    <div style="float: left; cursor: pointer; width: 105px; height: 120px; background: url('/img/shop_logo2.png'); background-size: 105px 120px; border-radius: 5px 0 0 5px;"></div>
			    <div style="float: left; cursor: pointer; margin: 10px 0 0 0; width: 158px; height: 100px; text-indent: -9999px; font-size: 0; line-height: 100%; background: url('/img/shop_logo2.png'); background-size: 100% 100%;"></div>
			    </a>
			</div>
			<style>
			#sidePanelAward2018 { 
			    padding: 0; background: #EB0000; cursor: pointer; line-height: 0; color: #FFF; border-color: transparent; 
			    -webkit-transition:transform linear 0.1s; -moz-transition:transform linear 0.1s;transition:transform linear 0.1s;
			    transform: perspective(200px) rotateY(0deg); transform-style: preserve-3d; z-index: -1;
			}
			#sidePanelAward2018:hover { transform: perspective(200px) rotateY(-10deg) translateZ(30px); }
			</style>
			</div>
		</div>    
    </div>
</div>
<div id="main" class="png_bg">

<div class="columns clearit">
<div id="columnHomeA" class="column">
<div class="featured">
<ul id="featuredItems" class="featuredItems">
<li class="anime clearit">
	<h2 class="title"><a href="kc02ShowRank.kchtml" class="l">动画</a></h2>
	<c:forEach items="${home.anime }" begin="0" end="4" var="anime">
    <div class="mainItem">
	<a href="Kc02ShowDetail.kchtml?kkc101=${anime.kkc101}">
	<div class="image" style="background:#000 url(${anime.kkc204}) 50%">
	    <div class="overlay">
	        		<p class="title">${anime.kkc202 }</p>
	    </div>
	</div>
	</a>
	<p class="info">
	    <small class="grey">${anime.kkc207 }人收藏</small>
	</p>
	</div>
	</c:forEach>
	<c:forEach items="${home.anime }" begin="5" end="6" var="anime">
    <div class="subitem clearit">
   		<a href="Kc02ShowDetail.kchtml?kkc101=${anime.kkc101}" class="grid" style="background-image:url('${anime.kkc204}');"></a>
   		<div class="inner">
       		<p class="title"><a href="Kc02ShowDetail.kchtml?kkc101=${anime.kkc101}" class="l">${anime.kkc202}</a></p>
       		<small class="grey">${anime.kkc207}人收藏</small>
   		</div>
    </div>
    </c:forEach>
</li>

<li class="anime clearit">
    <h2 class="title"><a href="kc03ShowRank.kchtml" class="l">书籍</a></h2>
    <c:forEach items="${home.book }" begin="0" end="4" var="book">
    <div class="mainItem">
	<a href="Kc03ShowDetail.kchtml?kkc101=${book.kkc101}">
	<div class="image" style="background:#000 url(${book.kkc304}) 50%">
	    <div class="overlay">
	        		<p class="title">${book.kkc302 }</p>
	    </div>
	</div>
	</a>
	<p class="info">
	    <small class="grey">${book.kkc307 }人收藏</small>
	</p>
	</div>
	</c:forEach>
	<c:forEach items="${home.book }" begin="5" end="6" var="book">
    <div class="subitem clearit">
   		<a href="Kc03ShowDetail.kchtml?kkc101=${book.kkc101}" class="grid" style="background-image:url('${book.kkc304}');"></a>
   		<div class="inner">
       		<p class="title"><a href="Kc03ShowDetail.kchtml?kkc101=${book.kkc101}" class="l">${book.kkc302}</a></p>
       		<small class="grey">${book.kkc307}人收藏</small>
   		</div>
    </div>
    </c:forEach>
</li>
<li class="anime clearit">
    <h2 class="title"><a href="kc04ShowRank.kchtml" class="l">游戏</a></h2>
    <c:forEach items="${home.game }" begin="0" end="4" var="game">
    <div class="mainItem">
	<a href="Kc04ShowDetail.kchtml?kkc101=${game.kkc101}">
	<div class="image" style="background:#000 url(${game.kkc404}) 50%">
	    <div class="overlay">
	        		<p class="title">${game.kkc402 }</p>
	    </div>
	</div>
	</a>
	<p class="info">
	    <small class="grey">${game.kkc407 }人收藏</small>
	</p>
	</div>
	</c:forEach>
	<c:forEach items="${home.game }" begin="5" end="6" var="game">
    <div class="subitem clearit">
   		<a href="Kc04ShowDetail.kchtml?kkc101=${game.kkc101}" class="grid" style="background-image:url('${game.kkc404}');"></a>
   		<div class="inner">
       		<p class="title"><a href="Kc04ShowDetail.kchtml?kkc101=${game.kkc101}" class="l">${game.kkc402}</a></p>
       		<small class="grey">${game.kkc407}人收藏</small>
   		</div>
    </div>
    </c:forEach>
 </li>
</ul>
</div>
</div>

<div id="columnHomeB" class="column">


<div class="sideInner">
<div id="home_tml"><div class="sidePanelHome png_bg" align="left">
<h2 class="subtitle">迷你论坛 ≖‿≖✧  <small><a href="<%=path%>/ka01MainForum.kahtml?id=0">...more</a></small></h2>
<ul class="timeline_img clearit" style="margin:0 10px;">
<c:forEach items="${home.posts }" var="post">
<li class="clearit">
	<div class="avatar">
	<a href="/user/278001" class="avatar">
		<img style="height:32px;width:32px;" src="${post.kkd108 }" 
			alt="${post.kkd105 }" onerror="this.src='<%=path%>/img/avatar/def_avatar.png'" class="avatar" />
		</a>
	</div>
	<div class="info clearit">
		<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${post.kkd101 }" class="l">${post.kkd105 }</a> 发帖 
		<a href="<%=path%>/ka01PostContent.kahtml?kka101=${post.kka101}" class="l">${post.kka102}</a>
		<p class="rr"><small class="time">${post.kka105 }</small></p>
	</div>	
</li>
</c:forEach>
</ul>
</div>
</div>
</div>


</div>
</div>
</div>
</div>
<div class="homeBg"></div>
<!-- 底部菜单栏 -->
<div id="dock">
    <div class="content">
    <c:choose>
    <c:when test="${empty user}">
        <ul class="clearit">
        <li class="first"><a href="<%=path %>/kd/login.jsp">登录</a></li>
        <li><a href="<%=path %>/kd/signup.jsp">注册</a></li>
        <li class="last"><a href="javascript:void(0);" id="showrobot">&nbsp;</a></li>
        </ul>
    </c:when>
    <c:otherwise>
    	<ul class="clearit">
        <c:choose>
       		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
       			 <li class="first"><a href="<%=path%>/kd01UserMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
       		</c:when>
       		<c:otherwise>
       			 <li class="first"><a href="<%=path%>/kd01AdminMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
       		</c:otherwise>
       	</c:choose>
        <li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a></li>
        <c:choose>
       		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
       			 <li><a href="<%=path%>/kd/userpage_info.jsp">设置</a></li>
       		</c:when>
       		<c:otherwise>
       			 <li><a href="<%=path%>/kd/adminpage_info.jsp">设置</a></li>
       		</c:otherwise>
       	</c:choose>
        <li><a href="<%=path%>/logout.kdhtml">登出</a></li>
        <li class="last"><a href="javascript:void(0);" id="showrobot">&nbsp;</a></li>
        </ul>
    </c:otherwise>
    </c:choose>
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
<p><strong>欢迎来到SubCircle！</strong></p>
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