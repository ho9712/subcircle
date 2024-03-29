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
	function checkDel(kkd201,sign,username)
	{
		document.getElementById("kkd201").value=kkd201;
		document.getElementById("sign").value=sign;
		document.getElementById("username").value=username;
	}
</script>
<style type="text/css">
	.line_limit{
		width:300px;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
<title>收件箱</title>


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
	    		<a href="#">短信</a> | 
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
            <!-- 头像或默认头像，以及头像返回页面 -->
			<c:choose>
            	<c:when test="${!empty sessionScope.user.kkd108}">
            	<c:choose>
            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
            			<a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
						<span class="avatarNeue avatarSize75" 
							style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
						</a>
            		</c:when>
            		<c:otherwise>
            			<a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
						<span class="avatarNeue avatarSize75" 
							style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
						</a>
            		</c:otherwise>
            	</c:choose>
            	</c:when>
            	<c:otherwise>
            	<c:choose>
            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
            			<a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
						<span class="avatarNeue avatarSize75" 
							style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
						</a>
            		</c:when>
            		<c:otherwise>
            			<a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
						<span class="avatarNeue avatarSize75" 
							style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
						</a>
            		</c:otherwise>
            	</c:choose>
            	</c:otherwise>
            </c:choose>
            <!-- 头像或默认头像，以及头像返回页面 -->
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
    	<li><a href="#" class="focus">消息</a></li>
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
    	   
			<!-- 查询所有接收消息 -->
			<c:choose>
				<c:when test="${!empty receives}">
				<div id="browserTools" class="clearit">
		        	按时间 <a href="#" onclick="onClickSort('0')" class="btnGraySmall"><span>升序</span></a> · 
		        	<a href="#" onclick="onClickSort('1')" class="btnGraySmall" ><span>降序</span></a>  排序
				</div> 
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
					    	<strong><a href="<%=path%>/kd02FindMsgDetail.kdhtml?flag=receive&kkd201=${receive.kkd201}" class="l">${receive.kkd204 }</a></strong>
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
				    	<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${receive.kkd101 }" class="l">
					    	${receive.kkd105 } 
					    	<small>@${receive.kkd202 }</small>
				    	</a><br>
				    	<small class="grey">状态:</small>
				    	<c:choose>
				    		<c:when test="${receive.kkd206 eq '0'}">
				    			<small style="font-size:16px;color:#ff8f8f">未读</small>
				    		</c:when>
				    		<c:otherwise>
				    			<small style="font-size:16px;color:#6faf0f">已读</small>
				    		</c:otherwise>
				    	</c:choose>
				       <p class="line_limit">
				       	<small class="grey">正文:</small>
				       	<span class="tip_j">${receive.kkd205 }</span>
				       </p>
				       	<p class="collectInfo">
			       		<small class="grey">日期:</small>
						<small class="grey">${receive.kkd207 } </small>
						</p>
						<!-- 用户信息 -->
						<!-- 右边按钮 -->
				       	<%-- <div id="collectBlock_9912" class="collectBlock tip_i">
					    <p class="collectModify">
						    <a href="<%= path %>/kd02DelMsg.kdhtml?kkd201=${receive.kkd201}&flag=receiver&username=${receive.kkd203}" class="l">删除</a>
						    </p>
				    	</div> --%>
				    	<div id="collectBlock_9912" class="collectBlock tip_i">
						    <p class="collectModify">
						    <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" 
						    	onclick="checkDel('${receive.kkd201}','receiver','${receive.kkd203}')" 
						    	title="删除消息" class="thickbox l">删除消息</a> 
						    </p>
				    	</div>
				    	<!-- 右边按钮 -->
				   	</div>
					</li>
				</c:forEach>
				</ul>
				
				<!-- 弹窗 -->
				<div id="panel" style="display:none;">
					<div class="collectBox clearit">
					    <!-- 信息修改 -->
						 <form name="set" method="post" action="<%= path %>/kd02DelMsg.kdhtml">
						 	<input id="kkd201" name="kkd201" type="hidden" >
						 	<input id="sign" name="sign" type="hidden" >
						 	<input id="username" name="username" type="hidden" >
							<span class="text">
								<table align="center" width="98%" cellspacing="0" cellpadding="5" class="settings">
									<tr>
									<td valign="middle" align="center" colspan="2">
										<span style="font-size:25px;color:#ff8f8f">确定要删除该消息？</span>
									</td>
									</tr>
									<tr>
										<td valign="middle" align="center" colspan="2">
										<input class="inputBtn" value="删除消息" name="submit" type="submit" />
										</td>
									</tr>
								</table>
							</span>
						</form>    
						<!-- 信息修改 -->
					</div>
				</div>
				<!-- 弹窗 -->
				
				</c:when>
				<c:otherwise>
					<div class="section">
			            <br><h2 class="title">你的收件箱空空如也...</h2>
			        	<div>
			        		<ul class="coversSmall">
			           		</ul>
			        	</div>
			        </div>
			        <div class="section_line clear"></div>
				</c:otherwise>
			</c:choose>
			
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
       			 <li class="first"><a href="<%=path%>/kd01UserMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
       		</c:when>
       		<c:otherwise>
       			 <li class="first"><a href="<%=path%>/kd01AdminMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
       		</c:otherwise>
       	</c:choose>
        <li><a href="#">短信</a></li>
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