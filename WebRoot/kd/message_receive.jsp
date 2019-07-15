<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<script type="text/javascript">
	function onClickSort(vorder)
	{
		var vform=document.getElementById("myform");
		vform.action="<%= path %>/kd02QueryReceive.kdhtml?order="+vorder;
		vform.submit();
	}
</script>
<title>Root管理员页面</title>


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
    		<!-- 头像或默认头像，以及头像返回页面 -->
			<c:choose>
            	<c:when test="${!empty sessionScope.user.kkd108}">
            	<c:choose>
            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
            			<a class="avatar" href="<%=path%>/kd/userpage_main.jsp">
						<span class="avatarNeue avatarSize32 ll" 
							style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
						</a>
            		</c:when>
            		<c:otherwise>
            			<a class="avatar" href="<%=path%>/kd/adminpage_main.jsp">
						<span class="avatarNeue avatarSize32 ll" 
							style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
						</a>
            		</c:otherwise>
            	</c:choose>
            	</c:when>
            	<c:otherwise>
            	<c:choose>
            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
            			<a class="avatar" href="<%=path%>/kd/userpage_main.jsp">
						<span class="avatarNeue avatarSize32 ll" 
							style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
						</a>
            		</c:when>
            		<c:otherwise>
            			<a class="avatar" href="<%=path%>/kd/adminpage_main.jsp">
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
				<li><a href="<%=path%>/kd/userpage_main.jsp">个人主页</a></li>                    
	       		<li><a href="#">作品</a></li>
	       		<li><a href="#">论坛</a></li>
	       		<li><a href="#">商城</a></li>
	       		<li class="row">
		        <a href="#">短信</a> | 
		        <a href="<%=path%>/kd/userpage_info.jsp">设置</a> | 
		        <a href="<%=path%>/logout.kdhtml">登出</a>
	        	</li>
	    	</c:when>
	    	<c:otherwise>
	    		<li><a href="<%=path%>/kd/adminpage_main.jsp">个人主页</a></li>
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
           		 <a href="<%=path%>/kd/userpage_main.jsp" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('${sessionScope.user.kkd108}')"></span>
                </a>
            	</c:when>
            	<c:otherwise>
           		<a href="<%=path%>/kd/userpage_main.jsp" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png')"></span>
                </a>
            	</c:otherwise>
            </c:choose>
            </div>

            <div class="inner">
                <a href="<%=path%>/kd/adminpage_main.jsp">${sessionScope.user.kkd105 }</a> <small class="grey">@${sessionScope.user.kkd102 }</small>
                <span id="friend_flag"></span>
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
				<li><a href="<%=path%>/kd/userpage_main.jsp">主页</a></li>                    
	       		<li><a href="#">作品</a></li>
	       		<li><a href="#">论坛</a></li>
	       		<li><a href="#">商城</a></li>
	    	</c:when>
	    	<c:otherwise>
	    		<li><a href="<%=path%>/kd/adminpage_main.jsp">主页</a></li>
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
			<li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}" class="focus"><span>收件箱</span></a></li>
			<li><a href="<%=path%>/kd/message_send.jsp"><span>发送消息</span></a></li>
  	 		<li><a href="<%= path %>/kd02QuerySend.kdhtml?username=${user.kkd102}" ><span>已发送</span></a></li>
		</ul>
	</div>
	<!-- 子导航栏 -->
	
	</div>
</div>
<!-- 主页头部 -->
<div class="mainWrapper">
<div class="columns clearit" xmlns:v="http://rdf.data-vocabulary.org/#">
	<!-- 主页主体A栏 -->
		
		<div id="columnSubjectBrowserA" class="column">
    	<div id="browserTools" class="clearit">
        
        	按时间 <a href="#" onclick="onClickSort('0')" class="btnGraySmall"><span>升序</span></a> · 
        	<a href="#" onclick="onClickSort('1')" class="btnGraySmall" ><span>降序</span></a>  排序
        
		</div>    
			<!-- 查询所有接收消息 -->
			<ul id="browserItemList" class="browserList">
				<c:forEach items="${receives }" var="receive">
					<li id="item_9912" class="item odd clearit">
				   	<!-- 头像 -->
					   	<c:choose>
			            	<c:when test="${!empty receive.kkd108}">
			           		 <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${receive.kkd101 }" class="avatar">
			                	<span class="avatarNeue avatarSize48 ll" style="background-image:url('${receive.kkd108}');background-size:100% auto;"></span>
			                </a>
			            	</c:when>
			            	<c:otherwise>
			           		<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${receive.kkd101 }" class="avatar">
			                	<span class="avatarNeue avatarSize48 ll" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size:100% auto;"></span>
			                </a>
			            	</c:otherwise>
			            </c:choose>
				   	<!-- 头像 -->
				    <div class="inner">
				    	<!-- 用户信息 -->
				       <span class="userInfo">
				       		<small class="grey">标题:</small>
					    	<strong><a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${admin.kkd101 }" class="l">${receive.kkd204 }</a></strong>
				    	</span><br>
				    	<small class="grey">来自:</small>
				    	<c:choose>
				    		<c:when test="${receive.kkd104 eq '0'}">
				       			<small style="color:#ff0000">超级管理员</small>
				       		</c:when>
				       		<c:when test="${receive.kkd104 eq '1'}">
				       			<small style="color:#ff8f8f">作品管理员</small>
				       		</c:when>
				       		<c:when test="${receive.kkd104 eq '2'}">
				       			<small style="color:#6faf0f">商城管理员</small>
				       		</c:when>
				       		<c:when test="${receive.kkd104 eq '3'}">
				       			<small style="color:#8f8fff">论坛管理员</small>
				       		</c:when>
				       		</c:choose>
				    	<a href="<%=path%>/kd01FindOther.kdhtml?kkd102=${receive.kkd202 }" class="l">
					    	${receive.kkd105 } 
					    	<small>@${receive.kkd202 }</small>
				    	</a><br>
				    	<small class="grey">状态:</small>
				    	<c:choose>
				    		<c:when test="${receive.kkd206 eq '0'}">
				    			<small style="color:#ff8f8f">未读</small>
				    		</c:when>
				    		<c:otherwise>
				    			<small style="color:#6faf0f">已读</small>
				    		</c:otherwise>
				    	</c:choose>
				       <p class="info tip">
				       	<small class="grey">正文:</small>
				       	<span class="tip_j">${receive.kkd205 }</span>
				       </p>
				       	<p class="collectInfo">
			       		<small class="grey">日期:</small>
						<small class="grey">${receive.kkd207 } </small>
						</p>
						<!-- 用户信息 -->
						<!-- 右边按钮 -->
				       	<div id="collectBlock_9912" class="collectBlock tip_i">
					    <p class="collectModify">
						    <a href="<%= path %>/kd02DelMsg.kdhtml?kkd201=${receive.kkd201}&flag=receiver&username=${receive.kkd203}" class="l">删除</a>
						    </p>
				    	</div>
				    	<!-- 右边按钮 -->
				   	</div>
					</li>
				</c:forEach>
			</ul>
			<!-- 查询所有接收消息 -->
			
			<div id="multipage"></div>
		</div>
		
		
	<!-- 主页主体A栏 -->
	
	<!-- 主页主体B栏 -->
		<div id="columnSubjectBrowserB" class="column">
			<div id="columnSubjectInBrowserB" class="clearit">
				<div class="SidePanel png_bg">
					<h2>/ 根据条件检索 </h2>
					<form id="myform" name="set" method="post" action="<%= path %>/kd02QueryReceive.kdhtml">
						<input type="hidden" name="username" value="${user.kkd102 }">
						<span class="text">
							<table align="center" width="98%" cellspacing="0" cellpadding="5" class="settings">
								<tr>
									<td valign="top" width="15%">发送人</td>
									<td valign="top">
										<e:text name="sender" style="border:1px
											solid #BEB4A7;padding:1px
											4px;width:120px;height:20px;padding:3px
											5px;text-align:left;font-size:14px;line-height:130%"/>
									</td>
								</tr>
								<tr>
									<td valign="top" width="15%">状态</td>
									<td valign="top">
										<e:select value="未读:0,已读:1" name="kkd206" style="height:30px;width:100px;" header="true"/>
									</td>
								</tr>
								<tr>
									<td valign="top" width="15%"><input class="inputBtn" value="点击搜索" name="next" type="submit"></td>
								</tr>
							</table>
						</span>
					</form>
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
        <c:choose>
       		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
       			 <li class="first"><a href="<%=path%>/kd/userpage_main.jsp">${sessionScope.user.kkd102 }</a></li>
       		</c:when>
       		<c:otherwise>
       			 <li class="first"><a href="<%=path%>/kd/adminpage_main.jsp">${sessionScope.user.kkd102 }</a></li>
       		</c:otherwise>
       	</c:choose>
        <li><a href="#">提醒</a></li>
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
		<strong>『收件箱』</strong><br />
		在这里，你可以查看来自其他用户的消息。<br />
	</c:when>
	<c:otherwise>
		<strong>『${hint }』</strong><br />
		${msg}<br />
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