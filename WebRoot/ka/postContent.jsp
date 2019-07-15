<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function onClickReply(kka101,kka201)
	{
		document.getElementById("kka101").value=kka101;
		document.getElementById("kka201").value=kka201;
	}
</script>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1" name="viewport">
<title>${ins.kka102 }</title>
<meta name="keywords" content="登录至 Bangumi 番组计划,ACG,anime,comic,game,music,动漫,音乐,游戏,动画,漫画,番组,bangumi,chii,chobits" />
<meta name="description" content="登录至 Bangumi 番组计划" />
<link rel="search" type="application/opensearchdescription+xml" href="http://bangumi.tv/static/xml/opensearch_bgm.xml" title="Bangumi 番组计划" />
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="/img/ico/ico_ios.png" />	

</style>
<!--[if lte IE 6]>
<script src="/js/pngfixed.js" type="text/javascript"></script>
<script>
  DD_belatedPNG.fix('.png_bg,img,#wrapper');
</script>
<![endif]-->

<link rel="stylesheet" type="text/css" href="<%=path %>/css/bangumi.css" >
<script type="text/javascript">var SHOW_ROBOT = '0',CHOBITS_UID = 0, SITE_URL = 'http://bangumi.tv';</script>
</head>
  <body class="bangumi">
${ins.kka101 }
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
                         <!-- 贴子主体（头部） -->
                         
  <div class="SidePanel png_bg" style="width:85%;margin-left: 5px">
    <div  id="columnA">
      <font size="3" style="width:80%;height:15px;margin-left: 10px">
        <a href="#">
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
    <div  style="float:left;">
      <font size="2" style="width:10%;height:15px;margin-left: 15px">
              ${ins.kkd105 }
      </font>
    </div>
    <br>
    <div style="margin-left: 20px" align="right">
      ${ins.kka105 }
    </div>
  </div>
  
  <div id="timeline">
  <ul>

	<c:forEach items="${rows }" var="ins">
	<c:if test="${ins.kka204 == 1 }">
		<div class="menu_inner" style="width:85%;margin-left: 15px">
   <li class="clearit tml_item">
   <div style="width:85%;margin-left: 15px">
   	<c:if test="${ins.ka02_kka201 ne 0}">
   		<div>
	      <span>
	              回复 ${ins.ka02_kka201 }楼
	      </span>
    	</div>
    	<div>
    	  <span>
    	   
    	  </span>
    	</div>
   	</c:if>
   
    <div  id="columnA" style="margin-left: 15px">
      ${ins.kka202 }
    </div>
    <br>
    <br>
    <br>
    <div style="float:left;">
      <font size="2" style="width:10%;height:15px;margin-left: 15px">
              ${ins.kkd105 }
      </font>
    </div>
    <br>
    
   </div>
   </li>
   
   <hr class="board" />
     <div id="SecTab">
      <ul class="secTab tiny">
        <li>
        <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="举报理由" 
         onclick="GenInterestBox('wish')" class="thickbox">
        <span>举报</span>
        </a>
        </li>
        <li>
        <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="发表回复" 
         onclick="onClickReply('${ins.kka101}','${ins.kka201}')" class="thickbox">
         <span>回复</span>
         </a>
         </li>
        <li style="float: right;">
          <div style="margin-left: 20px;margin-top: 6px;" >
               ${ins.kka203 }
          </div>
        </li>
        <li style="float: right;">
          <div style="margin-top: 6px;float: right;">
             ${ins.kka201 }楼
          </div>
        </li>
      </ul>
    </div>
    <div class="clear"></div>
    
     
   
   </div>
   </c:if>
	</c:forEach>
	
	<!-- 弹窗 -->
	<div id="panel" style="display:none;">
   <div class="collectBox clearit">
    <form method="post" action="ka02PostAnswer.kahtml">
    <input type="hidden" id="kka101" name="kka101" value="">
    <input type="hidden" id="kka201" name="kka201" value="">
      <div class="collectType cell">
        <label><input value="1" id="wish" name="interest" onclick="GenInterestBox('wish')"  type="radio"> 举报</label>&nbsp;&nbsp;
        <label><input value="2" id="collect" name="interest" onclick="GenInterestBox('collect')"  type="radio"> 回复</label>&nbsp;&nbsp;
        
      </div>
      

    <div class="cell">
    <p class="tip"><label for="comment"> (回复，最多200字):</label></p>
    <textarea rows="20" cols="70" name="kka202"></textarea>
    </div>
    <div class="clearit">
    <div id="submitBtnO" class="ll">
        <input class="inputBtn" 
        type="submit" name="next" value="提交" 
        formaction="ka02PostAnswerToAnswer.kahtml"/>
    </div>
    </div>
	
    </form>
    </div>
   </div>
   
 </ul>
 </div>
 
<div class="light_odd">
<span class="tip">
<form id="editTopicForm" name="new_comment" method="post" action="/PostForum.html">		

  <input type="hidden" name="kka201" value="${param.kka201 }" />
<script type="text/javascript">var CHOBITS_SID = 'aru27g'; var SCRIPT_URL = '/blog/upload_photo';</script> 
<table align="center" width="99%" class="settings">
  <tr><td valign="top" width="10%">评论</td><td valign="top"><textarea  id="tpc_content" name="kka202" cols="45" rows="5" style="width:550px;" class="quick newBlogEntry loadEditor" onKeyDown="seditor_ctlent(event,'editTopicForm');"></textarea>
<tr>
<td valign="top" width="10%"></td><td valign="top">
<div id="submitBtnO"><input class="inputBtn" value="加上去" name="next" type="submit" formaction="ka02PostAnswer.kahtml?kka101=${ins.kka101 }"/> </div>
</td>
</tr>
</table>
<div id="related_value_list">
</div>
</form>
</span>
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

<ul class="timeline"><li><small class="feed">注册成为了 Bangumi 成员</small> <small class="time">2019-6-28 18:52</small></li></ul>
</div>
</div>
<div id="sideLayout"><div id="friend" class="sort">
<div class="SidePanel png_bg" align="left">
<h2>/ 我的朋友 <small><a href="/user/481528/friends">...more</a></small></h2><hr class="board" /><a href="postForum.jsp">+ 我要发贴</a>
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
<div class="menu_inner">
    	<p> <a href="/feed/user/481528/interests" class="l">/ RSS2.0: 订阅我的收藏</a></p>
    	<p><a href="/user/481528/wiki" class="l">/ 我的维基编辑</a></p>
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


<script src="js/bangumi.js" type="text/javascript"></script>
<script src="<%=path %>/js/bangumi.js" type="text/javascript"></script>
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-4049707-6']);
    _gaq.push(['_setDomainName', 'none']);
    _gaq.push(['_setAllowLinker', true]);
    _gaq.push(['_trackPageview']);
    
    (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
    
    function setKKa202() {
    	var kka202 = document.getElementById("comment");
    	kka202.value = kka202.innerHTML;
    	alert(kka202.innerHTML)
	}
    
</script>
<script type="text/javascript">chiiLib.login.init();</script>
</body>
</html>