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
		vform.action="<%=path%>/kb03ShopColl.kdhtml?page=${param.page}&order="+vorder;
		vform.submit();
	}
	function delShopColl(kkb301)
	{
		var msg="确定将商品从收藏中移除?";
		if(confirm(msg))
		{
			window.location.href="<%=path%>/kb03DelShopColl.kdhtml?page=${param.page}&order=${param.order}&kkb301="+kkb301;		
			alert("删除成功！");
		}
	}
</script>
<style type="text/css">
	.line_limit{
		width:500px;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
<title>发帖记录</title>


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
       		<li><a href="#">商城</a></li>
	    	
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
			<li><a href="<%=path%>/kd01UserMain.kdhtml">主页</a></li>                    
       		<li><a href="<%=path%>/kc06AnimeColl.kdhtml">作品</a></li>
       		<li><a href="<%=path%>/ka01PostRecord.kdhtml">论坛</a></li>
       		<li><a href="#" class="focus">商城</a></li>
       		<li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">消息</a></li>
		</ul>
	</div>
	<!-- 主页导航栏 -->
	<!-- 子导航栏 -->
	<div class="navSubTabsWrapper">
		<ul class="navSubTabs">
			<li><a href="<%=path%>/kb02ShopRecord.kdhtml"><span>商品浏览记录</span></a></li>
  	 		<li><a href="<%=path%>/kb03ShopColl.kdhtml" class="focus"><span>商品收藏记录</span></a></li>
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
		<c:when test="${empty goods}">
			<div class="section">
				<a href="<%=path%>/kb01QueryItems.kbhtml?page=1" class="rr l">前往商城</a>
	            <br><h2 class="title">你还没有收藏过商品...</h2>
	        	<div>
	        		<ul class="coversSmall">
	           		</ul>
	        	</div>
	        </div>
	        <div class="section_line clear"></div>
		</c:when>
		<c:otherwise>
    	<div id="browserTools" class="clearit">
        
        	按 时间<a href="#" onclick="onClickSort(1)" class="btnGraySmall" ><span>升序</span></a> · 
        	<a href="#" onclick="onClickSort(2)" class="btnGraySmall" ><span>降序</span></a> 排序
		</div>    
			<!-- 查询所有发帖记录 -->
			<c:forEach items="${goods }" var="good">
			<div id="entry_list">
			<div class="item clearit">
			<a href="<%=path%>/kb01FindItemById.kbhtml?kkb101=${good.kkb101}" class="subjectCover cover ll">       
	            <span class="image">
                       <img src="${good.kkb105 }" alt="${good.kkb105 }" class="cover" style="width:100px;height:100px;"/>
		        </span>
		        <span class="overlay"></span>
		    </a>
			<a href="#" onclick="delShopColl('${good.kkb301}')" class="btnGraySmall rr"><span>删除收藏</span></a>
			<div style="padding-left: 110px;">
			<h2 class="title">商品: 
			<a href="<%=path%>/kb01FindItemById.kbhtml?kkb101=${good.kkb101}" class="l"> ${good.kkb102 }</a>
			</h2>
			<div class="time"><small class="time">收藏时间: ${good.kkb302 }</small> </div>
			<div class="content">
			<p class="line_limit">商品介绍: ${good.kkb104 }</p>
			<p>关联作品: ${good.kkb107}</p>
			</div>
			</div>
			<div class="tools clearit">
				<div class="tags">售价: 
					￥ <span style="font-size:20px;color:#ff8f8f;">${good.kkb103 }</span>
				</div>
			</div>
			</div>
			</div>
			</c:forEach>
			<div id="multipage"></div>

			<!-- 查询所有发帖记录 -->
			
		</c:otherwise>
		</c:choose>
		
		<!-- 分页 -->
		<div id="multipage">
			<div class="page_inner">
				<c:choose>
					<c:when test="${totalCount.count/12 <1}"></c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${empty param.page }">
								<strong class="p_cur">1</strong>
								<c:if test="${totalCount.count/12 >1}">
									<c:forEach begin="2" end="10" var="p">
										<c:choose>
											<c:when test="${p ge totalCount.count/12+1}">
											</c:when>
											<c:otherwise>
												<a href="<%=path%>/kb03ShopColl.kdhtml?page=${p }&order=${param.order}" class="p">${p }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:if>
								<a href="<%=path%>/kb03ShopColl.kdhtml?page=2&order=${param.order}" class="p">&rsaquo;&rsaquo;</a>
							</c:when>
							<c:otherwise>
								<!-- 左移 -->
								<c:if test="${param.page >1}">
									<a href="<%=path%>/kb03ShopColl.kdhtml?page=${param.page-1}&order=${param.order}" class="p">&lsaquo;&lsaquo;</a>
								</c:if>
								<!-- 左移 -->
								
								<!-- 页数小于10 大于10 总页数-当前页数小于10 -->
								<c:choose>
									<c:when test="${param.page ge 3}">
										<c:forEach begin="${param.page-2 }" end="${param.page+7}" var="p">
										<c:choose>
											<c:when test="${p ge totalCount.count/12+1}">
											</c:when>
											<c:otherwise>
												<c:choose>
												<c:when test="${p eq param.page}">
													<strong class="p_cur">${p}</strong>
												</c:when>
												<c:otherwise>
													<a href="<%=path%>/kb03ShopColl.kdhtml?page=${p}&order=${param.order}" class="p">${p}</a>
												</c:otherwise>
											</c:choose>
											</c:otherwise>
										</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach begin="1" end="10" var="p">
										<c:choose>
											<c:when test="${p ge totalCount.count/12+1}">
											</c:when>
											<c:otherwise>
												<c:choose>
												<c:when test="${p eq param.page}">
													<strong class="p_cur">${p}</strong>
												</c:when>
												<c:otherwise>
													<a href="<%=path%>/kb03ShopColl.kdhtml?page=${p}&order=${param.order}" class="p">${p}</a>
												</c:otherwise>
											</c:choose>
											</c:otherwise>
										</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								
								<!-- 右移 -->
								<c:if test="${param.page < totalCount.count/12}">
									<a href="<%=path%>/kb03ShopColl.kdhtml?page=${param.page+1}&order=${param.order}" class="p">&rsaquo;&rsaquo;</a>
								</c:if>
								<!-- 右移 -->
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- 分页 -->
		
		</div>
		
		
	<!-- 主页主体A栏 -->
	
	<!-- 主页主体B栏 -->
		<div id="columnSubjectBrowserB" class="column">
			<div id="columnSubjectInBrowserB" class="clearit">
				<div class="SidePanel png_bg">
					<h2>/ 根据条件检索 </h2>
					<form id="myform" name="set" method="post" action="<%=path%>/kb03ShopColl.kdhtml">
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
									<td valign="top" width="15%">收藏时间[B]</td>
									<td valign="top">
										<e:date name="bkkb302" style="border:1px
											solid #BEB4A7;padding:1px
											4px;width:120px;height:20px;padding:3px
											5px;text-align:left;font-size:14px;line-height:130%"/>
									</td>
								</tr>
								<tr>
									<td valign="top" width="15%">收藏时间[E]</td>
									<td valign="top">
										<e:date name="ekkb302" style="border:1px
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
	<c:when test="${empty hint }">
		<strong>『商城收藏记录』</strong><br />
		这里记录了你在周边商城中收藏过的心仪的商品。 <br />
	</c:when>
	<c:otherwise>
		<strong>『${hint }』</strong><br />
		${msg }<br />
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