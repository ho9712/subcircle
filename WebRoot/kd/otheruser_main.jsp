<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>${other.kkd105 } 的主页</title>

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
    	<c:when test="${empty user}">
    		<div class="idBadgerNeue">
		    	<div class="guest">
			    	<a href="<%=path %>/kd/login.jsp" class="guest login">登录</a>
		    		<a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a>
		    	</div>
			</div>
    	</c:when>
    	<c:otherwise>
			<c:choose>
            	<c:when test="${!empty sessionScope.user.kkd108}">
            	<c:choose>
            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
            			<a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
						<span class="avatarNeue avatarSize32 ll" 
							style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
						</a>
            		</c:when>
            		<c:otherwise>
            			<a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
						<span class="avatarNeue avatarSize32 ll" 
							style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
						</a>
            		</c:otherwise>
            	</c:choose>
            	</c:when>
            	<c:otherwise>
            	<c:choose>
            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
            			<a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
						<span class="avatarNeue avatarSize32 ll" 
							style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
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
            <!-- 头像或默认头像，以及头像返回页面 -->
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
    	</c:otherwise>
    	</c:choose>
    	<!-- 用户或管理员入口 -->
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
            	<c:if test="${!empty user}">
            	<a href="<%=path%>/kd/message_send.jsp?kkd102=${other.kkd102 }" class="chiiBtn"><span>发送短消息</span></a>
            	</c:if>
            </div>

            <div class="headerAvatar">
            <c:choose>
            	<c:when test="${!empty other.kkd108}">
           		 <a href="<%=path%>/kd/kd01FindOther.kdhtml?kkd101=${other.kkd101}" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('${other.kkd108}')"></span>
                </a>
            	</c:when>
            	<c:otherwise>
           		<a href="<%=path%>/kd/kd01FindOther.kdhtml?kkd101=${other.kkd101}" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png')"></span>
                </a>
            	</c:otherwise>
            </c:choose>
            </div>

            <div class="inner">
                <a href="<%=path%>/kd/kd01FindOther.kdhtml?kkd101=${other.kkd101}">${other.kkd105 }</a> <small class="grey">@${other.kkd102 }</small>
                <span id="friend_flag"></span>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
    
    <!-- 主页导航栏 -->
    <div class="navTabsWrapper">
		<ul class="navTabs">
			<li><a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${other.kkd101}" class="focus">主页</a></li>                    
       		<li><a href="<%=path%>/kc06OtherAnimeColl.kdhtml?kkd101=${other.kkd101}">Ta的作品</a></li>
       		<li><a href="<%=path%>/ka01OtherPostRecord.kdhtml?kkd101=${other.kkd101}">Ta的论坛</a></li>
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
					<div class="intro">
						<blockquote class="intro">
						<div class="bio">
						<c:choose>
							<c:when test="${!empty other.kkd109}"><pre>${other.kkd109 }</pre><br><br></c:when>
							<c:otherwise>这个人很懒，什么也没有留下...<br><br></c:otherwise>
						</c:choose>
						</div>
						</blockquote>
					</div> 
					<ul class="network_service clearit">
					<li><span class="service" style="background-color:#F09199;">SubCircle</span>
					<span class="tip">${other.kkd106 } 加入</span></li>
					</ul>    
				</div>
			    <!-- 主页动画 -->
			    <div id="blog" class="sort">
					<h2 class="drag">&nbsp;</h2>
					<div class="horizontalOptions clearit">
						<ul class="">
							<li class="title">
							<h2> 
							<a href="<%=path%>/kc06OtherAnimeColl.kdhtml?kkd101=${other.kkd101}">Ta的动画</a>
							</h2>
							&nbsp;&nbsp;&nbsp;&nbsp;(${colls.animeCount.number }部收藏)
							</li>
						</ul>
					</div>
				
					<div class="content_inner clearit" align="left">
					<c:choose>
					<c:when test="${empty colls.animeColl}">
						<div align="center" class="clearit">
							<span class="green">Ta还没有收藏过动画</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="clearit">
				    		<div class="substatus">收藏</div>
				    		<ul class="coversSmall clearit" style="margin-right:0;">
				    		<c:forEach items="${colls.animeColl }" var="animeColl">
           		    		<li class="clearit">
	           		    		<a href="Kc02ShowDetail.kchtml?kkc101=${animeColl.kkc101}" title="カウボーイビバップ">
	           		    		<span class="pictureFrameGroup">
		           		    		<span class="image"><img src="${animeColl.kkc204 }"></span>
		           		    		<span class="overlay"></span>
	           		    		</span>
	           		    		<span class="name">${animeColl.kkc202 }</span>
	           		    		</a>
           		    		</li>
           		    		</c:forEach>
	    		    		</ul>
				    	</div>
			    	</c:otherwise>
			    	</c:choose>
					</div>
				</div>
				<!-- 主页动画 -->
				<!-- 主页书籍 -->
			    <div id="blog" class="sort">
					<h2 class="drag">&nbsp;</h2>
					<div class="horizontalOptions clearit">
						<ul class="">
							<li class="title">
							<h2> 
							<a href="<%=path%>/kc06OtherBookColl.kdhtml?kkd101=${other.kkd101}">Ta的书籍</a>
							</h2>
							&nbsp;&nbsp;&nbsp;&nbsp;(${colls.bookCount.number }部收藏)
							</li>
						</ul>
					</div>
				
					<div class="content_inner clearit" align="left">
						<c:choose>
						<c:when test="${empty colls.bookColl}">
							<div align="center" class="clearit">
								<span class="green">Ta还没有收藏过书籍</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="clearit">
					    		<div class="substatus">收藏</div>
					    		<ul class="coversSmall clearit" style="margin-right:0;">
					    		<c:forEach items="${colls.bookColl }" var="bookColl">
	           		    		<li class="clearit">
		           		    		<a href="Kc03ShowDetail.kchtml?kkc101=${bookColl.kkc101}" title="カウボーイビバップ">
		           		    		<span class="pictureFrameGroup">
			           		    		<span class="image"><img src="${bookColl.kkc304 }"></span>
			           		    		<span class="overlay"></span>
		           		    		</span>
		           		    		<span class="name">${bookColl.kkc302 }</span>
		           		    		</a>
	           		    		</li>
	           		    		</c:forEach>
		    		    		</ul>
					    	</div>
				    	</c:otherwise>
				    	</c:choose>
					</div>
				</div>
				<!-- 主页书籍 -->				
				<!-- 主页游戏 -->
			    <div id="blog" class="sort">
					<h2 class="drag">&nbsp;</h2>
					<div class="horizontalOptions clearit">
						<ul class="">
							<li class="title">
							<h2> 
							<a href="<%=path%>/kc06OtherGameColl.kdhtml?kkd101=${other.kkd101}">Ta的游戏</a>
							</h2>
							&nbsp;&nbsp;&nbsp;&nbsp;(${colls.gameCount.number }部收藏)
							</li>
						</ul>
					</div>
				
					<div class="content_inner clearit" align="left">
						<c:choose>
						<c:when test="${empty colls.gameColl}">
							<div align="center" class="clearit">
								<span class="green">Ta还没有收藏过游戏</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="clearit">
					    		<div class="substatus">收藏</div>
					    		<ul class="coversSmall clearit" style="margin-right:0;">
					    		<c:forEach items="${colls.gameColl }" var="gameColl">
	           		    		<li class="clearit">
		           		    		<a href="Kc04ShowDetail.kchtml?kkc101=${gameColl.kkc101}" title="カウボーイビバップ">
		           		    		<span class="pictureFrameGroup">
			           		    		<span class="image"><img src="${gameColl.kkc404 }"></span>
			           		    		<span class="overlay"></span>
		           		    		</span>
		           		    		<span class="name">${gameColl.kkc402 }</span>
		           		    		</a>
	           		    		</li>
	           		    		</c:forEach>
		    		    		</ul>
					    	</div>
				    	</c:otherwise>
				    	</c:choose>
					</div>
				</div>
				<!-- 主页游戏 -->
			</div>
		</div>
	<!-- 主页主体A栏 -->
	
	<!-- 主页主体B栏 -->
		<div id="columnB" class="column">
			<div id="">
				<div class="SidePanel png_bg">
					<h2>/ 我的历史 </h2>
				
					<ul class="timeline">
						<li>
							<small class="feed">注册成为了 SubCircle 成员</small> 
							<small class="time">${other.kkd106 }</small>
						</li>
					</ul>
				</div>
			</div>
			<div id="sideLayout">
				<div id="friend" class="sort">
					<div class="SidePanel png_bg" align="left">
						<h2>/ Ta的论坛 <small><a href="<%=path%>/ka01OtherPostRecord.kdhtml?kkd101=${other.kkd101}">...more</a></small></h2>
						<ul class="timeline">
							<c:forEach items="${posts }" var="post">
							<li>
								<small class="feed">发表了:</small>
								<a href="<%=path%>/ka01PostContent.kahtml?kka101=${post.kka101}" class="l"> 
								<small class="feed">${post.kka102 }</small>
								</a> 
								<small class="time">${post.kka105 }</small>
							</li>
							</c:forEach>
						</ul>
						<hr class="board" />
						<a href="<%=path%>/ka01OtherPostRecord.kdhtml?kkd101=${other.kkd101}">+ 查看更多</a>
					</div>
				</div>
			</div>
			<div class="menu_inner">
			    	<p> <a href="#" class="l">/ </a></p>
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
<strong>『Ta的主页』</strong><br />
欢迎来到  <span class="green"><strong>${other.kkd105 }</strong></span> 的主页！ <br />
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