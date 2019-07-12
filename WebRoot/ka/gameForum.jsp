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
<li><a href="/real" class="top chl real"><span>三次元</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/real/chart" class="nav">排行榜</a></li>
<li><a href="/real/tag" class="nav">三次元标签</a></li>
<li><a href="/real/blog" class="nav">三次元日志</a></li>
<li><a href="/real/browser/platform/jp" class="nav">日剧</a></li>
<li><a href="/real/browser/platform/en" class="nav">欧美剧</a></li>
</ul>
</li>
            <li><a href="/mono" class="top"><span>人物</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/character" class="nav">虚构人物</a></li>
<li><a href="/person" class="nav">现实人物</a></li>
	
</ul>
</li>
<li><a href="/rakuen" class="top_lite"><span>超展开</span></a></li>
<li><a href="/group"class="top"><span>小组</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/group/discover" class="nav">随便看看</a></li>
<li><a href="/group/all" class="nav">所有小组</a></li>
</ul>
</li>
<li><a href="javascript:void(0);" class="top"><span>探索</span></a>
<div class="clear"></div>
<ul class="explore clearit">

<li class="single"><a href="/timeline">时空管理局</a></li>		
                <li class="group">
<span><a href="/blog">日志</a><a href="/index">目录</a><a href="/wiki">维基人</a></span>
</li>				
<li class="group"><span><a href="/magi">MAGI 问答</a><a href="/dollars">Dollars</a></span></li>				
                <li class="group">
<span class="root">客户端</span>
<span><a href="/onair">onAir</a><a href="/group/topic/5155">Mobile</a></span>
</li>				
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
    <div class="headerContainer">
    	<h1 class="nameSingle">
            <div class="rr">
            </div>

            <div class="headerAvatar">
                <a href="/user/481528" class="avatar"><span class="avatarNeue avatarSize75" style="background-image:url('<%=path %>/${user.kkd108}')"></span></a>
            </div>

            <div class="inner">
                <a href="/user/481528">${user.kkd102 }</a> <small class="grey">@${user.kkd101 }</small>
                <span id="friend_flag"></span>
            </div>
    	</h1>
    </div>
<div class="navTabsWrapper">
  <div class="column">
    <ul class="navTabs">
      <li><b>论坛里有很多好东西哦~</b></li>
    </ul>
  </div>
</div>
</div>
</div>

<div class="mainWrapper">
<div class="columns clearit">
<div id="columnA" class="column">
  <div class="navTabsWrapper">
  
    <!-- 论坛导航栏 -->
    <div class="subjectNav">
      <ul class="navTabs">
      <li><a href="ka01MainForum.kahtml?id=0" >全部</a></li>
        <li><a href="ka01AnimeForum.kahtml?id=1" >动画</a></li>
        <li><a href="ka01BookForum.kahtml?id=2">书籍</a></li>
        <li><a href="ka01GameForum.kahtml?id=3"  class="focus">游戏</a></li>
      </ul>
    </div>
                              
     <!-- 搜索框 -->
    <div id="forumSearch">
      <form action="<%=path %>/ka01SearchResult.kahtml" method="post">
      	<input type="hidden" name="id" value="0">
        <div class="inner">
          <input id="search_text" name="search_text" class="textfield" type="text"  style="float:left;width:80%;height:40px;border:2px solid #34495E"/>
          <input type="submit" name="submit" value="搜索" class="search" style="float:left;width:10%;height:40px;border:2px solid #34495E;background-color:#34495E;color:#ffffff"/>
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
            <a href="#" onclick="itemInfo(${ins.kka101 })">
              <b>
              ${ins.kka102 }
              </b>
            </a>
          </font>
        </div>
        <br>
        <div  id="columnB" style="margin-left: 15px">
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
<div class="SidePanel png_bg">
<h2>/ 我的时间胶囊 <small><a href="/user/481528/timeline">...more</a></small></h2>

<ul class="timeline"><li><small class="feed">注册</small> <small class="time">2019-6-28 18:52</small></li></ul>
</div>
</div>
<div id="sideLayout"><div id="post" class="sort">
<div class="SidePanel png_bg" align="left">
<h2><a href="<%=path %>/ka/posting.jsp">我要发贴</a></h2>
</div>
</div>
<div id="group" class="sort">
<div class="SidePanel png_bg" align="left">
<h2>/ 我参加的小组 </h2>
    <ul class="groupsLine">
            </ul>
</div>
</div>
</div>
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

<div id="robot"  style="display:none;">
<div id="ukagaka_shell">
<div class="ui_10 shell_1">
<div id="ukagaka_voice"></div>
<div id="robot_balloon" class="ukagaka_balloon_pink">
<div class="tools"><a href="javascript:void(0);" id="ukagaka_menu"><img src="/img/ukagaka/menu.gif" /></a></div>    <div class="inner">
<div id="robot_speech" class="speech" >
必须守护的东西多的人容易操纵真是方便啊。</div>
<div id="robot_speech_js" class="speech">
    </div>
</div>
<div class="ukagaka_balloon_pink_bottom"></div>	
</div>
</div>
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