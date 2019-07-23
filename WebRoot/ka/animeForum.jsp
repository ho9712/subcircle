<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>论坛</title>

<link rel="stylesheet" type="text/css" href="<%=path %>/css/bangumi.css" >
</head>
  <body class="bangumi">
  <style type="text/css">
	.line_limit{
		width:450px;
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>
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
    		<c:when test="${empty user}">
    			<div class="guest">
			    	<a href="<%=path %>/kd/login.jsp" class="guest login">登录</a>
		    		<a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a>
		    	</div>
    		</c:when>
    		<c:otherwise>
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

<!-- 以下为页面内容 -->
<div id="main" class="png_bg"></div>
<div id="headerProfile" class="clearit">
  <div class="subjectNav">
    <!-- 主页个人信息 -->
    <div class="headerContainer">
    	<h1 class="nameSingle">
            <div class="rr">
            </div>
            <div class="inner">
                <b class="grey">欢迎来到论坛~ </b>
                ${sessionScope.user.kkd105 }
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
     <!-- 论坛导航栏 -->
    <div class="subjectNav">
      <ul class="navTabs">
      <li><a href="ka01MainForum.kahtml?id=0" >全部</a></li>
        <li><a href="ka01AnimeForum.kahtml?id=1" class="focus">动画</a></li>
        <li><a href="ka01BookForum.kahtml?id=2">书籍</a></li>
        <li><a href="ka01GameForum.kahtml?id=3">游戏</a></li>
      </ul>
    </div>
</div>
</div>

<div class="mainWrapper">
<div class="columns clearit">
<div id="columnA" class="column">
  <div class="navTabsWrapper">
    
    <!-- 搜索框 -->
    <div id="forumSearch">
      <form action="<%=path %>/ka01SearchResult.kahtml" method="post">
      	<input type="hidden" name="id" value="1">
        <div class="inner">
          <input id="search_text" name="search_text" class="textfield" type="text"  style="float:left;width:80%;height:40px;border:2px solid #34495E"/>
          <input type="submit" name="submit" value="搜索" class="search" style="float:left;width:10%;height:44px;border:2px solid #34495E;background-color:#34495E;color:#ffffff"/>
        </div>
      </form>
    </div> 
      <br>
    <div>
    <br>
    <br>
     
     <!-- 贴子列表 -->
      <c:forEach items="${rows }" var="ins">
       <div class="SidePanel png_bg" style="width:85%;margin-left: 5px">
        
        <div id="columnA" style="width:100%;">
          <font size="3" style="width:80%;height:15px;margin-left: 10px">
            <c:if test="${sessionScope.user.kkd104 ne 3 }">
            <a href="#" onclick="itemInfo(${ins.kka101 })">
              <b>
              ${ins.kka102 }
              </b>
            </a>
            </c:if>
            <c:if test="${sessionScope.user.kkd104 == 3 }">
            <a href="<%=path%>/ka01AdmPostContent.kahtml?kka101=${ins.kka101}">
              <b>
              ${ins.kka102 }
              </b>
            </a>
            </c:if>
          </font>
          <div class="rr">
              <span style="color:#ff8f8f;">${ins.cnkka103 }</span>
          </div>
        </div>
        <br>
        <div  class="line_limit" style="margin-left: 15px">
          ${ins.kka104 }
        </div>
        <br>
        <div style="margin-left: 20px" align="right">
          ${ins.kkd105 }
        </div>
        <div style="margin-left: 20px" align="right">
          <small class="grey">${ins.kka105 }</small>
        </div>
       </div>
      </c:forEach>
    </div>
  </div>
</div>
        
        
<div id="columnB" class="column">
<div id="">
<br>
<br>
<br>
<br>
</div>
<div id="sideLayout">
<div id="post" class="sort">
<div class="SidePanel png_bg" align="left">
<h2>
<c:choose>
  <c:when test="${empty user }"><a href="<%=path %>/kd/nologin.jsp">我要发贴</a></c:when>
  <c:otherwise><a href="<%=path %>/ka/posting.jsp">我要发贴</a></c:otherwise>
</c:choose>
</h2>
</div>
</div>
</div>
<br/>
  <!-- 显示热点贴子 -->
   <div class="SidePanel png_bg">
	<h2>
		看看有哪些热门贴子吧~ 
	</h2>
	
	<table class="timeline">
		<c:forEach items="${rows1 }" var="ins" varStatus="status">
		  <c:if test="${status.count-1<5 }">
		  <hr class="board" />
				<tr class="first">
				<c:if test="${sessionScope.user.kkd104 ne 3 }">
					<a style="margin-left: 15px" href="#" onclick="itemInfo(${ins.kka101 })"> 
					<div style="float: left;" align="left">
						${status.count }.	${ins.kka102 } 
						</div>
						<div style="float: right;" align="right">热度${ins.number }</div>
						<div style="float: right;margin-right: 10px" align="right">${ins.cnkka103 }</div>
						
					</a>
				</c:if>
				<c:if test="${sessionScope.user.kkd104 == 3 }">
					<a
						href="<%=path%>/ka01AdmPostContent.kahtml?kka101=${ins.kka101}">
						<b> ${ins.kka102 } </b>
					</a>
				</c:if>
				</tr>
				 <hr class="board" />
		  </c:if>
				
		</c:forEach>
		
	</table>
</div>
<!-- 显示热点贴子结束 -->

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
	<c:when test="${empty sessionScope.user.kkd105 }">
		<strong>『欢迎你！游客』</strong><br />
		您可以搜索、浏览网站贴子！<br />
		如果想要发帖、回贴参与网站论坛，请及时登录！<br />
		如果还没有账户，请通过注册获取一个您的专属账户哦！<br />
	</c:when>
	<c:otherwise>
		<strong>『欢迎你！用户 ${sessionScope.user.kkd105 }』</strong><br />
		请尽情浏览网站贴子、参与网站讨论哦！<br />
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

<script type="text/javascript">
    function itemInfo(kka101)
	{
		window.location.href = "<%=path%>/ka01PostContent.kahtml?kka101=" + kka101;
	}
</script>
</body>
</html>