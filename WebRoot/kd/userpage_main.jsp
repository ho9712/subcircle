<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>${sessionScope.user.kkd102} 的主页</title>

<%-- <script type="text/javascript">
	setInterval(function(){
		getMsg();
	}, 10000);
	
	function getMsg()
	{
		$.ajax({
			type:"POST",
			url:"<%=path%>/getMsg?username=${user.kkd102}",
			processData:false,
			dataType:"json",
			success:function()	
			{
				
			}
		});
	}
</script> --%>

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
            <c:choose>
            	<c:when test="${!empty sessionScope.user.kkd108}">
           		 <a href="<%=path%>/kd01UserMain.kdhtml" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('${sessionScope.user.kkd108}')"></span>
                </a>
            	</c:when>
            	<c:otherwise>
           		<a href="<%=path%>/kd01UserMain.kdhtml" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png')"></span>
                </a>
            	</c:otherwise>
            </c:choose>
            </div>

            <div class="inner">
                <a href="<%=path%>/kd01UserMain.kdhtml">${sessionScope.user.kkd105 }</a> <small class="grey">@${sessionScope.user.kkd102 }</small>
                <span id="friend_flag"></span>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
    
    <!-- 主页导航栏 -->
    <div class="navTabsWrapper">
		<ul class="navTabs">
			<li><a href="<%=path%>/kd01UserMain.kdhtml" class="focus">主页</a></li>                    
       		<li><a href="<%=path%>/kc06AnimeColl.kdhtml">作品</a></li>
       		<li><a href="<%=path%>/ka01PostRecord.kdhtml">论坛</a></li>
       		<li><a href="<%=path%>/kb02ShopRecord.kdhtml">商城</a></li>
       		<li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">消息</a></li>
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
				    	<a href="<%=path%>/kd/userpage_info.jsp" class="btnGraySmall"><span>编辑个人信息</span></a>           
	                </div>
				</div>
				<!-- 主页动画 -->
			    <div id="blog" class="sort">
					<h2 class="drag">&nbsp;</h2>
					<div class="horizontalOptions clearit">
						<ul class="">
							<li class="title"><h2> <a href="<%=path%>/kc06AnimeColl.kdhtml">我的动画</a> </h2>
							&nbsp;&nbsp;&nbsp;&nbsp;(${colls.animeCount.number }部收藏)</li>
						</ul>
					</div>
				
					<div class="content_inner clearit" align="left">
					<c:choose>
					<c:when test="${empty colls.animeColl}">
						<div align="center" class="clearit">
							<span class="green">还没有收藏过动画?</span>
								<a href="kc02ShowRank.kchtml" class="l">>前往收藏<</a><br />
							<span class="tip_j">其他用户浏览你的主页时能根据你的收藏判断你的兴趣</span>
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
							<li class="title"><h2> <a href="<%=path%>/kc06BookColl.kdhtml">我的书籍</a> </h2>
							&nbsp;&nbsp;&nbsp;&nbsp;(${colls.bookCount.number }部收藏)</li>
						</ul>
					</div>
				
					<div class="content_inner clearit" align="left">
						<c:choose>
						<c:when test="${empty colls.bookColl}">
							<div align="center" class="clearit">
								<span class="green">还没有收藏过书籍?</span>
									<a href="kc03ShowRank.kchtml" class="l">>前往收藏<</a><br />
								<span class="tip_j">其他用户浏览你的主页时能根据你的收藏判断你的兴趣</span>
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
							<li class="title"><h2> <a href="<%=path%>/kc06GameColl.kdhtml">我的游戏</a> </h2>
							 &nbsp;&nbsp;&nbsp;&nbsp;(${colls.gameCount.number }部收藏)</li>
						</ul>
					</div>
				
					<div class="content_inner clearit" align="left">
						<c:choose>
						<c:when test="${empty colls.gameColl}">
							<div align="center" class="clearit">
								<span class="green">还没有收藏过游戏?</span>
									<a href="kc04ShowRank.kchtml" class="l">>前往收藏<</a><br />
								<span class="tip_j">其他用户浏览你的主页时能根据你的收藏判断你的兴趣</span>
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
							<small class="time">${sessionScope.user.kkd106 }</small>
						</li>
					</ul>
				</div>
			</div>
			<div id="sideLayout">
				<div id="friend" class="sort">
					<div class="SidePanel png_bg" align="left">
						<h2>/ 我的论坛 <small><a href="<%=path%>/ka01PostRecord.kdhtml">...more</a></small></h2>
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
						<a href="<%=path%>/ka01PostRecord.kdhtml">+ 查看我的全部发帖</a>
					</div>
				</div>
				<div id="group" class="sort">
					<div class="SidePanel png_bg" align="left">
						<h2>/ 我的商城 <small><a href="<%=path%>/kb03ShopColl.kdhtml">...more</a></small></h2>
						<ul class="timeline">
							<c:forEach items="${goods }" var="good">
							<li>
								<small class="feed">收藏了:</small>
								<a href="<%=path%>/kb01FindItemById.kbhtml?kkb101=${good.kkb101}" class="l"> 
								<small class="feed">${good.kkb102 }</small>
								</a> 
								<small class="time">${good.kkb302 }</small>
							</li>
							</c:forEach>
						</ul>
						<hr class="board" />
						<a href="<%=path%>/kb03ShopColl.kdhtml">+ 查看更多</a>
					</div>
				</div>
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
        <li class="first"><a href="<%=path%>/kd01UserMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
        <li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a></li>
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