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
      <div id="headerNeue2">
        <div class="headerNeueInner clearit">
         <div class="bg musume_2"></div>
         <a href="/" class="logo">Bangumi 番组计划</a>
    
         <input type="checkbox" id="navMenuNeueToggle" />    	
         <label for="navMenuNeueToggle" class="menuCompact"></label>    
    
         <div id="navNeue2">
           <div id="menuNeue">
             <ul id="navMenuNeue" class="clearit">
               <li><a href="/anime" class="top chl anime"><span>动画</span></a>
    			<div class="clear"></div>
                <ul class="clearit">
                  <li><a href="/anime/chart" class="nav">排行榜</a></li>
                  <li><a href="/calendar" class="nav">每日放送</a></li>
                  <li><a href="/anime/tag" class="nav">动画标签</a></li>
                  <li><a href="/anime/browser" class="nav">分类浏览</a></li>
                  <li><a href="/anime/blog" class="nav">动画日志</a></li>
                </ul>
               </li>
             <li><a href="/book" class="top chl"><span>书籍</span></a>
               <div class="clear"></div>
                 <ul class="clearit">
                   <li><a href="/book/chart" class="nav">排行榜</a></li>
                   <li><a href="/book/tag" class="nav">图书标签</a></li>
                   <li><a href="/book/browser" class="nav">分类浏览</a></li>
                   <li><a href="/book/blog" class="nav">图书日志</a></li>
                 </ul>
             </li>
             <li><a href="/music" class="top chl"><span>音乐</span></a>
               <div class="clear"></div>
                 <ul class="clearit">
                   <li><a href="/music/chart" class="nav">排行榜</a></li>
                   <li><a href="/music/tag" class="nav">音乐标签</a></li>
                   <li><a href="/music/browser" class="nav">浏览全部</a></li>
                   <li><a href="/music/blog" class="nav">音乐日志</a></li>
                 </ul>
             </li>
<li><a href="/game" class="top chl"><span>游戏</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/game/chart" class="nav">排行榜</a></li>
<li><a href="/game/tag" class="nav">游戏标签</a></li>
<li><a href="/game/browser" class="nav">平台浏览</a></li>
<li><a href="/game/blog" class="nav">游戏日志</a></li>
</ul>
</li>
<li class="doujin"><a href="http://doujin.bangumi.tv">天窗联盟</a></li>
</ul>	
</div>
</div>
<div class="idBadgerNeue">
<div class="guest"><a href="<%=path %>/kd/login.jsp" class="guest login">登录</a><a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a></div>
	
</div><div id="headerSearchWrapper">
<div id="headerSearch">
        <form action="/subject_search" method="post">
    <div class="inner">
<select name="cat" id="siteSearchSelect">
<option value="all">全部</option>
<option value="2">动画</option>
<option value="1">书籍</option>
<option value="4">游戏</option>
<option value="3">音乐</option>
<option value="6">三次元</option>
<option value="person">人物</option>			
</select>
<input id="search_text" name="search_text" class="textfield" type="text" />
        <input type="submit" name="submit" value="搜索" class="search" />
    </div>
</form>
    </div>   
</div>  
    </div>
</div>
<!-- 以上为导航栏 -->

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
                <b class="grey">欢迎来到论坛~</b>
                <a href="<%=path%>/kd/userpage_main.jsp">${sessionScope.user.kkd105 }</a>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
     <!-- 论坛导航栏 -->
    <div class="subjectNav">
      <ul class="navTabs">
      <li><a href="ka01MainForum.kahtml?id=0" >全部</a></li>
        <li><a href="ka01AnimeForum.kahtml?id=1">番剧</a></li>
        <li><a href="ka01BookForum.kahtml?id=2" class="focus">书籍</a></li>
        <li><a href="ka01GameForum.kahtml?id=3" >游戏</a></li>
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
      	<input type="hidden" name="id" value="2">
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
      <c:forEach items="${rows }" var="ins">
       <div class="SidePanel png_bg" style="width:85%;margin-left: 5px">
        
        <div id="columnA">
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
        </div>
        <br>
        <div  class="line_limit" style="margin-left: 15px">
          ${ins.kka104 }
        </div>
        <br>
        <div style="float:left;">
          <font size="2" style="width:10%;height:15px;margin-left: 15px">
              ${ins.kkd105 }
          </font>
        </div>
        <br>
        <div style="margin-left: 20px" align="right">
          ${ins.kka105 }
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
<h2><a href="<%=path %>/ka/posting.jsp">我要发贴</a></h2>
</div>
</div>
</div>

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
<div id="dock">
    <div class="content">
        <ul class="clearit">
                <li class="first"><a href="http://bangumi.tv/user/481528">ericho</a></li>
        <li><a href="http://bangumi.tv/notify/all">提醒</a> | <a href="http://bangumi.tv/pm">短信</a> | <a href="http://bangumi.tv/settings">设置</a> | <a href="http://bangumi.tv/logout/82d89381" target="_self">登出</a></li>
                <li class="last"><a href="javascript:void(0);" id="showrobot">&nbsp;</a></li>
        </ul>
    </div>
</div>

<script type="text/javascript">
    function itemInfo(kka101)
	{
		window.location.href = "<%=path%>/ka01PostContent.kahtml?kka101=" + kka101;
	}
</script>
</body>
</html>