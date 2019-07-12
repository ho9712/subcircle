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
	function modifyAdmin(kkd101,kkd102,kkd105,kkd108,kkd304,kkd302,kkd303)
	{
		document.getElementById("img").src=kkd108;
		document.getElementById("kkd101-hide").value=kkd101;
		document.getElementById("nickname").innerHTML=kkd105;
		document.getElementById("username").innerHTML=kkd102;
		document.getElementById("time").innerHTML=kkd304;
		document.getElementById("title").value=kkd302;
		document.getElementById("content").innerHTML=kkd303;
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
		<a class="avatar" href="<%=path%>/kd/adminpage_main.jsp">
			<img src="${sessionScope.user.kkd108}" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="33px" height="33px"/>
		</a>
		<ul id="badgeUserPanel">
			<li><a href="<%=path%>/kd/adminpage_main.jsp">账号</a></li>                    
	    	<li class="row"><a href="<%= path %>/kd01QueryAdmin.kdhtml">管理员</a></li>
	        <li class="row">
		        <a href="#">短信</a> | 
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
                <a href="<%=path%>/kd/adminpage_main.jsp" class="avatar"><span class="avatarNeue avatarSize75" style="background-image:url('${sessionScope.user.kkd108}')"></span></a>
            </div>

            <div class="inner">
                <a href="<%=path%>/kd/adminpage_main.jsp">${sessionScope.user.kkd102 }</a> <small class="grey">@${sessionScope.user.kkd101 }</small>
                <span id="friend_flag"></span>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
    
    <!-- 主页导航栏 -->
    <div class="navTabsWrapper">
		<ul class="navTabs">
			<li><a href="<%= path %>/kd/adminpage_main.jsp">账号</a></li>
        	<li><a href="<%= path %>/kd01QueryUser.kdhtml" class="focus">作品管理员</a></li>
        	<li><a href="#">消息</a></li>
		</ul>
	</div>
	<!-- 主页导航栏 -->
	<!-- 子导航栏 -->
	<div class="navSubTabsWrapper">
		<ul class="navSubTabs">
			<li><a href="<%= path %>/kd01QueryUser.kdhtml"><span>管理权限用户</span></a></li>
  	 		<li><a href="<%= path %>/kd03QueryApp.kdhtml" class="focus"><span>管理权限申请</span></a></li>
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
        
        	按 <a href="#" onclick="onClickSort()" class="btnGraySmall"><span>默认</span></a> · 
        	<a href="#" onclick="onClickSort(1)" class="btnGraySmall" ><span>时间</span></a> · 
        	<a href="#" onclick="onClickSort(2)" class="btnGraySmall" ><span>昵称</span></a> 排序
        
		</div>    
			<ul id="browserItemList" class="browserList">
				<c:forEach items="${apps }" var="app">
					<li id="item_9912" class="item odd clearit">
				   	<a href="<%= path %>/kd01FindAdmin.kdhtml?kkd101=${user.kkd101}" class="subjectCover cover ll">       
			           	<span class="image">
		             	<img src="${app.kkd108 }" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="cover" />
			       		</span>
				       	<span class="overlay"></span>
				   	</a>
				    <div class="inner">
				       	<div id="collectBlock_9912" class="collectBlock tip_i">
					    <p class="collectModify">
					    <c:choose>
					    	<c:when test="${app.kkd305 eq '0' }">
					    		<a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" 
						    	onclick="modifyAdmin('${app.kkd101}','${app.kkd102}','${app.kkd105}','${app.kkd108}','${app.kkd304}','${app.kkd302}','${app.kkd303}')" 
						    	title="处理权限申请" class="thickbox l">处理申请</a> | 
					    	</c:when>
					    	<c:when test="${app.kkd305 eq '1' }">
					    		<a href="#" class="l">已接受</a> | 
					    	</c:when>
					    	<c:when test="${app.kkd305 eq '2' }">
					    		<a href="#" class="l">已拒绝</a> | 
					    	</c:when>
					    </c:choose>
					    <a href="<%= path %>/kd03DelApp.kdhtml?kkd301=${app.kkd301}" class="l">删除</a>
					    </p>
				    	</div>
					       <h3>
					           <a href="<%= path %>/kd01FindAdmin.kdhtml?kkd101=${user.kkd101}" class="l">${app.kkd105 }</a> 
					       </h3>
				       <p class="info tip"><small class="grey">${app.kkd104 }</small></p>
				       <p class="collectInfo">
						<span class="tip_j">${app.kkd302 }</span> 
						</p>
				   	</div>
					</li>
				</c:forEach>
			</ul>
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
								<td valign="top" width="12%"><span style="font-size:15px">昵称:</span></td>
								<td valign="top"><span id="nickname" style="font-size:20px;color:#0000ff"></span></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:15px">用户名:</span></td>
								<td valign="top"><span id="username" style="font-size:20px;color:#0000ff"></span></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:15px">申请时间:</span></td>
								<td valign="top"><span id="time" style="font-size:20px;color:#0000ff"></span></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:15px">标题:</span></td>
								<td valign="top"><input id="title" class="inputtext" type="text" readonly="readonly"></td>
							</tr>
							<tr>
								<td valign="top" width="12%"><span style="font-size:15px">内容:</span></td>
								<td valign="top"><textarea id="content" rows="10" cols="50" readonly="readonly"></textarea></td>
							</tr>
							<tr>
								<td valign="middle" align="center">
								<input class="inputBtn" value="授予权限" name="submit" type="submit" formaction="<%=path %>/kd03DealApp.kdhtml?flag=accept"/>
								</td>
								<td valign="middle" align="left">
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
					<form id="myform" name="set" method="post" action="<%= path %>/kd03QueryApp.kdhtml">
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
        <li class="first"><a href="<%=path%>/kd/adminpage_main.jsp">${sessionScope.user.kkd102 }</a></li>
        <li><a href="#">提醒</a></li>
        <li><a href="#">短信</a></li>
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
		<strong>『权限申请管理页面』</strong><br />
		在这里，你可以管理所有来自用户的权限申请。<br />
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