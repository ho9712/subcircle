<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>消息</title>
<style> 
pre {
white-space: pre-wrap;
word-wrap: break-word;
} 
</style> 


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
    		<!-- 头像或默认头像，以及头像返回页面 -->
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
		        <a href="#">短信</a> | 
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
                <c:choose>
           		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
	               <a href="<%=path%>/kd01UserMain.kdhtml">${sessionScope.user.kkd105 }</a> 
	               <small class="grey">@${sessionScope.user.kkd102 }</small>
	               <span id="friend_flag"></span>
                </c:when>
                <c:otherwise>
                	<a href="<%=path%>/kd01AdminMain.kdhtml">${sessionScope.user.kkd105 }</a> 
	               <small class="grey">@${sessionScope.user.kkd102 }</small>
	               <span id="friend_flag"></span>
                </c:otherwise>
            </c:choose>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
    
    <!-- 主页导航栏 -->
    <div class="navTabsWrapper">
		<ul class="navTabs">
        <!-- 用户或管理员入口 -->
		<c:choose>
       		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
				<li><a href="<%=path%>/kd01UserMain.kdhtml">主页</a></li>                    
	       		<li><a href="<%=path%>/kc06AnimeColl.kdhtml">作品</a></li>
	       		<li><a href="<%=path%>/ka01PostRecord.kdhtml">论坛</a></li>
	       		<li><a href="<%=path%>/kb02ShopRecord.kdhtml">商城</a></li>
	    	</c:when>
	    	<c:otherwise>
	    		<li><a href="<%=path%>/kd01AdminMain.kdhtml">主页</a></li>
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
	    	</c:otherwise>
        </c:choose>
    	<!-- 用户或管理员入口 -->
    	<li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}" class="focus">消息</a></li>
		</ul>
	</div>
	<!-- 主页导航栏 -->
	<!-- 子导航栏 -->
	<div class="navSubTabsWrapper">
		<ul class="navSubTabs">
			<li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}" ><span>收件箱</span></a></li>
			<li><a href="<%=path%>/kd/message_send.jsp"><span>发送消息</span></a></li>
  	 		<li><a href="<%= path %>/kd02QuerySend.kdhtml?username=${user.kkd102}" ><span>已发送</span></a></li>
		</ul>
	</div>
	<!-- 子导航栏 -->
	
	</div>
</div>
<!-- 主页头部 -->
<div class="mainWrapper">
<div id="contentPM" class="clearit">
	<div align="left">
		<div id="comment_box">
			<div class="item clearit">
			    <!-- 头像 -->
				   	<c:choose>
		            	<c:when test="${!empty map.message.kkd108}">
		           		 <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${map.message.kkd101 }" class="avatar">
		                	<span class="avatarNeue avatarSize32 ll" style="background-image:url('${map.message.kkd108 }');background-size:100% auto;"></span>
		                </a>
		            	</c:when>
		            	<c:otherwise>
		           		<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${map.message.kkd101 }" class="avatar">
		                	<span class="avatarNeue avatarSize32 ll" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size:100% auto;"></span>
		                </a>
		            	</c:otherwise>
		            </c:choose>
			   	<!-- 头像 -->
		        <div class="text_main_even">
				<div class="text_pm">
				<div class="rr"><small class="grey">${map.message.kkd207 } / </small></div>
				<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${map.message.kkd101 }" class="l">${map.message.kkd105 }</a>: 
				<strong>${map.message.kkd204 }</strong>
				<hr class="board" /><pre>${map.message.kkd205 }</pre>
				</div>
				</div>
			</div>
			<!-- 循环显示所有回复 -->
			<c:forEach items="${map.replys }" var="reply" varStatus="count">
				<c:choose>
					<c:when test="${count.index%2==0 }">
						<div class="item clearit">
					    <!-- 头像 -->
						   	<c:choose>
				            	<c:when test="${!empty reply.kkd108}">
				           		 <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${reply.kkd101 }" class="avatar">
				                	<span class="avatarNeue avatarSize32 rr" style="background-image:url('${reply.kkd108}');background-size:100% auto;"></span>
				                </a>
				            	</c:when>
				            	<c:otherwise>
				           		<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${reply.kkd101 }" class="avatar">
				                	<span class="avatarNeue avatarSize32 rr" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size:100% auto;"></span>
				                </a>
				            	</c:otherwise>
				            </c:choose>
					   	<!-- 头像 -->
					        <div class="text_main_odd">
							<div class="text_pm">
							<div class="rr">
								<small class="grey">${reply.kkd503 } / </small>
							</div>
							<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${reply.kkd101 }" class="l">${reply.kkd105 }</a>: 
							<pre>${reply.kkd502 }</pre>
							</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="item clearit">
					    <!-- 头像 -->
						   	<c:choose>
				            	<c:when test="${!empty reply.kkd108}">
				           		 <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${reply.kkd101 }" class="avatar">
				                	<span class="avatarNeue avatarSize32 ll" style="background-image:url('${reply.kkd108}');background-size:100% auto;"></span>
				                </a>
				            	</c:when>
				            	<c:otherwise>
				           		<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${reply.kkd101 }" class="avatar">
				                	<span class="avatarNeue avatarSize32 ll" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size:100% auto;"></span>
				                </a>
				            	</c:otherwise>
				            </c:choose>
					   	<!-- 头像 -->
					        <div class="text_main_even">
							<div class="text_pm">
							<div class="rr">
								<small class="grey">${reply.kkd503 } / </small>
							</div>
							<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${reply.kkd101 }" class="l">${reply.kkd105 }</a>: 
							<pre>${reply.kkd502 }</pre>
							</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 循环显示所有回复 -->
		</div>
		<div class="light_odd">
			<h2 class="title"> / 回复</h2>
			<span class="tip">
			<form method="post" action="<%= path %>/kd02ReplyMsg.kdhtml">
				<input type="hidden" name="kkd201" value="${param.kkd201 }">
				<input type="hidden" name="kkd102" value="${user.kkd102 }">
				<input type="hidden" name="flag" value="${param.flag }">
				<textarea name="kkd502" id="msg_body" cols="45" rows="5" class="quick" required="required"></textarea><br />
				<div id="submitBtnO">
					<input class="inputBtn" value="回复" name="submit" type="submit" /> 
				</div>
			</form>
			</span>
		</div>
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
    </div>
</div>
<!-- 底部菜单栏 -->

<!-- 展示 -->
<div id="robot" >
<div id="ukagaka_shell">
<div class="ui_10 shell_1">
<div id="ukagaka_voice"></div>
<div id="robot_balloon" class="ukagaka_balloon_pink">
<div class="tools"><a href="#" id="ukagaka_menu"></a></div>    
<div class="inner">
<div id="robot_speech" class="speech" >
<c:choose>
	<c:when test="${empty hint }">
		<strong>『查看消息』</strong><br />
		在这里，你可以查看消息详情，并进行回复。<br />
	</c:when>
	<c:otherwise>
		<strong>『${hint }』</strong><br />
		${msg}<br />
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