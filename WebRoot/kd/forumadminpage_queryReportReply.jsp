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
		vform.action="<%= path %>/kd03QueryApp.kdhtml?order="+vorder;
		vform.submit();
	}
	function delReport(kka301)	
	{
		var msg="确定要删除该举报？";
		if(confirm(msg))
		{
			window.location.href="<%= path %>/ka03DelReport.kdhtml?flag=reply&kka301="+kka301;
			alert("删除成功！");
		}
	}
</script>
<title>查看贴子回复举报</title>


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
		<ul id="badgeUserPanel">
			<li><a href="<%=path%>/kd01AdminMain.kdhtml">个人主页</a></li>                    
	    	<li><a href="#">论坛管理员</a></li>
	        <li class="row">
		        <a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a> | 
		        <a href="<%=path%>/kd/adminpage_info.jsp">设置</a> | 
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
           		 <a href="<%=path%>/kd01AdminMain.kdhtml" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('${sessionScope.user.kkd108}')"></span>
                </a>
            	</c:when>
            	<c:otherwise>
           		<a href="<%=path%>/kd01AdminMain.kdhtml" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png')"></span>
                </a>
            	</c:otherwise>
            </c:choose>
            </div>

            <div class="inner">
                <a href="<%=path%>/kd01AdminMain.kdhtml">${sessionScope.user.kkd105 }</a> <small class="grey">@${sessionScope.user.kkd102 }</small>
                <span id="friend_flag"></span>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
    
    <!-- 主页导航栏 -->
    <div class="navTabsWrapper">
		<ul class="navTabs">
			<li><a href="<%=path%>/kd01AdminMain.kdhtml">主页</a></li>
        	<li><a href="#" class="focus">论坛管理员</a></li>
        	<li><a href="<%=path%>/kd02QueryReceive.kdhtml?username=${user.kkd102}">消息</a></li>
		</ul>
	</div>
	<!-- 主页导航栏 -->
	<!-- 子导航栏 -->
	<div class="navSubTabsWrapper">
		<ul class="navSubTabs">
			<li><a href="<%= path %>/ka03QueryReport.kdhtml?flag=post"><span>查看举报贴子</span></a></li>
  	 		<li><a href="<%= path %>/ka03QueryReport.kdhtml?flag=reply" class="focus"><span>查看举报回复</span></a></li>
  	 		<li><a href="<%= path %>/ka01MainForum.kahtml?id=0"><span>前往管理论坛</span></a></li>
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
    	 
    	 <c:choose>
    	 <c:when test="${!empty reports}">
    	 	<c:forEach items="${reports }" var="report">
			<div id="entry_list">
			<div class="item clearit">
			<a href="#" onclick="delReport('${report.kka301}')" class="btnGraySmall rr"><span>删除举报</span></a>
			<h2 class="title">回复内容: #${report.kka201} ${report.kka202 }</h2>
			<h2 class="title">贴子: 
				<a href="<%= path %>/ka01PostContent.kahtml?kka101=${report.kka101}" class="l"> ${report.kka102 }</a>
			</h2>
			<div class="time"><small class="time">举报时间: ${report.kka303 }</small> </div>
			<div class="content">举报理由: ${report.kka302 }</div>
			<div class="tools clearit">
				<div class="tags">所属板块: 
					<a href="ka01AnimeForum.kahtml?id=${report.kka103 }" class="l">${report.ckka103 }</a> 
				</div>
			</div>
			</div>
			</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="section">
	            <br><h2 class="title">没有收到来自用户的举报...</h2>
	        	<div>
	        		<ul class="coversSmall">
	           		</ul>
	        	</div>
	        </div>
	        <div class="section_line clear"></div>
		</c:otherwise>
		</c:choose>
			
			<div id="multipage"></div>
			<!-- 弹窗 -->
		<div id="panel" style="display:none;">
			<div class="collectBox clearit">
			    <!-- 信息修改 -->
				 <form name="set" method="post" action="">
				 	<input id="kkd101-hide" name="kkd101" type="hidden" >
					<span class="text">
						<table align="center" width="98%" cellspacing="0" cellpadding="5" class="settings">
							<tr>
								<td valign="top" align="center">
								<img id="img" src="" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="50px" height="50px"/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:12px">昵称:</span></td>
								<td valign="top"><span id="nickname" style="font-size:15px;color:#8f8fff"></span></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:12px">用户名:</span></td>
								<td valign="top"><span id="username" style="font-size:15px;color:#8f8fff"></span></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:12px">申请时间:</span></td>
								<td valign="top"><span id="time" style="font-size:15px;color:#8f8fff"></span></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:12px">标题:</span></td>
								<td valign="top"><input id="title" class="inputtext" type="text" readonly="readonly"></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:12px">内容:</span></td>
								<td valign="top"><textarea id="content" rows="10" cols="50" readonly="readonly"></textarea></td>
							</tr>
							<tr>
								<td valign="middle" align="center" colspan="2">
								<input class="inputBtn" value="授予权限" name="submit" type="submit" formaction="<%=path %>/kd03DealApp.kdhtml?flag=accept"/>
								<input class="inputBtn" value="拒绝申请" name="submit" type="submit" formaction="<%=path %>/kd03DealApp.kdhtml?flag=refuse"/>
								</td>
							</tr>
						</table>
					</span>
				</form>    
				<!-- 信息修改 -->
			</div>
		</div>
		<!-- 弹窗 -->
		</div>
		
		
	<!-- 主页主体A栏 -->
	
	<!-- 主页主体B栏 -->
		<div id="columnSubjectBrowserB" class="column">
			<div id="columnSubjectInBrowserB" class="clearit">
				<div class="SidePanel png_bg">
					<h2>/ 根据条件检索 </h2>
					<form id="myform" name="set" method="post" action="<%= path %>/ka03QueryReport.kdhtml?flag=reply">
						<span class="text">
							<table align="center" width="98%" cellspacing="0" cellpadding="5" class="settings">
								<tr>
									<td valign="top" width="5%">关键字</td>
									<td valign="top">
										<e:text name="keyword" style="border:1px
											solid #BEB4A7;padding:1px
											4px;width:120px;height:20px;padding:3px
											5px;text-align:left;font-size:14px;line-height:130%"/>
									</td>
								</tr>
								<tr>
									<td valign="top" width="15%">所属板块</td>
									<td valign="top">
										<e:select value="动画:1,书籍:2,游戏:3" name="plate" style="height:30px;width:100px;" header="true"/>
									</td>
								</tr>
								<tr>
									<td valign="top" width="15%">举报时间[B]</td>
									<td valign="top">
										<e:date name="bkka303" style="border:1px
											solid #BEB4A7;padding:1px
											4px;width:120px;height:20px;padding:3px
											5px;text-align:left;font-size:14px;line-height:130%"/>
									</td>
								</tr>
								<tr>
									<td valign="top" width="15%">举报时间[E]</td>
									<td valign="top">
										<e:date name="ekka303" style="border:1px
											solid #BEB4A7;padding:1px
											4px;width:120px;height:20px;padding:3px
											5px;text-align:left;font-size:14px;line-height:130%"/>
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
        <li class="first"><a href="<%=path%>/kd01AdminMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
        <li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a></li>
        <li><a href="<%=path%>/kd/adminpage_info.jsp">设置</a></li>
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
		<strong>『查看贴子回复举报』</strong><br />
		在这里，你可以查看并管理所有来自用户对论坛模块贴子的回复的举报。<br />
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