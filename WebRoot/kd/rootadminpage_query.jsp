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
		vform.action="<%= path %>/kd01QueryAdmin.kdhtml?order="+vorder;
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
		<a class="avatar" href="<%=path%>/kd/adminpage_main.jsp">
			<img src="${sessionScope.user.kkd108}" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="port" width="33px" height="33px"/>
		</a>
		<ul id="badgeUserPanel">
			<li><a href="<%=path%>/kd/adminpage_main.jsp">账号</a></li>                    
	    	<li class="row"><a href="<%= path %>/kd01QueryAdmin.kdhtml">管理员</a></li>
	        <li class="row">
		        <a href="http://bangumi.tv/pm">短信</a> | 
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
        	<li><a href="<%= path %>/kd01QueryAdmin.kdhtml" class="focus">管理员</a></li>
        	<li><a href="http://bangumi.tv/user/481528/index">消息</a></li>
		</ul>
	</div>
	<!-- 主页导航栏 -->
	<!-- 子导航栏 -->
	<div class="navSubTabsWrapper">
		<ul class="navSubTabs">
			<li><a href="<%= path %>/kd01QueryAdmin.kdhtml" class="focus"><span>现有管理员账号</span></a></li>
  	 		<li><a href="<%= path %>/kd/rootadminpage_add.jsp" ><span>添加管理员账户</span></a></li>
		</ul>
	</div>
	<!-- 子导航栏 -->
	
	</div>
</div>
<!-- 主页头部 -->
<div class="mainWrapper">
<div class="columns clearit" xmlns:v="http://rdf.data-vocabulary.org/#" typeof="v:Movie">
	<!-- 主页主体A栏 -->
		
		<div id="columnSubjectBrowserA" class="column">
    	<div id="browserTools" class="clearit">
        
        	按 <a href="#" onclick="onClickSort()" class="btnGraySmall"><span>默认</span></a> · 
        	<a href="#" onclick="onClickSort(1)" class="btnGraySmall" ><span>时间</span></a> · 
        	<a href="#" onclick="onClickSort(2)" class="btnGraySmall" ><span>权限</span></a> · 
        	<a href="#" onclick="onClickSort(3)" class="btnGraySmall" ><span>昵称</span></a> 排序
        
		</div>    
			<ul id="browserItemList" class="browserList">
				<c:forEach items="${admins }" var="admin">
					<li id="item_9912" class="item odd clearit">
				   	<a href="<%= path %>/kd01FindAdmin.kdhtml?kkd101=${admin.kkd101}" class="subjectCover cover ll">       
			           	<span class="image">
		             	<img src="${admin.kkd108 }" onerror="this.src='<%=path %>/img/avatar/def_avatar.png'" class="cover" />
			       		</span>
				       	<span class="overlay"></span>
				   	</a>
				    <div class="inner">
				       	<div id="collectBlock_9912" class="collectBlock tip_i">
					    <p class="collectModify">
					    <a href="<%= path %>/kd01FindAdmin.kdhtml?kkd101=${admin.kkd101}" title="修改" class="thickbox l">修改</a> | 
					    <a href="<%= path %>/kd01DelAdmin.kdhtml?kkd101=${admin.kkd101}" class="l">删除</a>
					    </p>
				    	</div>
					       <h3>
					           <a href="<%= path %>/kd01FindAdmin.kdhtml?kkd101=${admin.kkd101}" class="l">${admin.kkd105 }</a> 
					       </h3>
				       <p class="info tip"><small class="grey">${admin.admin }</small></p>
				       <p class="collectInfo">
						<span class="tip_j">${admin.kkd106 }</span> 
						</p>
				   	</div>
					</li>
				</c:forEach>
			</ul>
			<div id="multipage"></div>
		</div>
	<!-- 主页主体A栏 -->
	
	<!-- 主页主体B栏 -->
		<div id="columnSubjectBrowserB" class="column">
			<div id="columnSubjectInBrowserB" class="clearit">
				<div class="SidePanel png_bg">
					<h2>/ 根据条件检索 </h2>
					<form id="myform" name="set" method="post" action="<%= path %>/kd01QueryAdmin.kdhtml">
						<span class="text">
							<table align="center" width="98%" cellspacing="0" cellpadding="5" class="settings">
								<tr>
									<td valign="top" width="15%">关键字</td>
									<td valign="top">
										<e:text name="keyword" style="border:1px
											solid #BEB4A7;padding:1px
											4px;width:120px;height:20px;padding:3px
											5px;text-align:left;font-size:14px;line-height:130%"/>
									</td>
								</tr>
								<tr>
									<td valign="top" width="15%">管理员权限</td>
									<td valign="top">
										<e:select value="作品管理员:1,商城管理员:2,论坛管理员:3" name="qkkd104" style="height:30px;width:100px;" header="true"/>
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
        <li><a href="http://bangumi.tv/notify/all">提醒</a></li>
        <li><a href="http://bangumi.tv/pm">短信</a></li>
        <li><a href="<%=path%>/kd/adminpage_info.jsp">设置</a></li>
        <li class="last"><a href="<%=path%>/logout.kdhtml">登出</a></li>
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
		<strong>『Root管理员功能页面』</strong><br />
		在这里，你可以管理各模块管理员账号。<br />
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