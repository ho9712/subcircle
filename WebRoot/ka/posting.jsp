<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1" name="viewport">
<title>登录至 Bangumi 番组计划</title>
<meta name="keywords" content="登录至 Bangumi 番组计划,ACG,anime,comic,game,music,动漫,音乐,游戏,动画,漫画,番组,bangumi,chii,chobits" />
<meta name="description" content="登录至 Bangumi 番组计划" />
<link rel="search" type="application/opensearchdescription+xml" href="http://bangumi.tv/static/xml/opensearch_bgm.xml" title="Bangumi 番组计划" />
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="/img/ico/ico_ios.png" />

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
<div id="wrapperNeue" class="wrapperNeue">
<div id="headerNeue2">
    <div class="headerNeueInner clearit">
         <div class="bg musume_2"></div>
    <a href="/" class="logo"><img src="/img/page_icon.png"></a>
    
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
                   
                   
<!-- 以下为页面内容 -->
<div id="main" class="png_bg"><div id="header">
<h1>发表新贴~ </h1>
</div>

<div class="columns clearit">
<div id="columnA" class="column">
<div class="light_odd">
<span class="tip">
<form id="editTopicForm" name="new_comment" method="post" action="<%=request.getContextPath()%>/ka01Posting.kahtml">		
 <input type="hidden" name="kka101" value="${param.kka101 }" />
<script type="text/javascript">var CHOBITS_SID = 'aru27g'; var SCRIPT_URL = '/blog/upload_photo';</script> 
<table align="center" width="99%" class="settings">
  <tr><td valign="top" width="10%">标题</td><td valign="top"><input id="tpc_title" name="kka102" class="inputtext" type="text"  required="required"> <span class="alarm"></span></td></tr>
  <tr><td valign="top" width="10%">正文</td><td valign="top"><textarea  id="tpc_content" name="kka104" cols="45" rows="15" style="width:550px;" class="quick newBlogEntry loadEditor" required="required"  onKeyDown="seditor_ctlent(event,'editTopicForm');"></textarea>
  <tr><td valign="top" width="10%">板块</td><td><e:select name="kka103" value="番剧:1,书籍:2,游戏:3"/></td></tr>
<tr>
<td valign="top" width="10%"></td><td valign="top">
<div id="submitBtnO"><input class="inputBtn" value="加上去" name="next" type="submit" formaction="ka01Posting.kahtml"/></div>
</td>
</tr>
</table>
</form>
</span>
</div>
</div>


<div id="columnB" class="column">
<div class="SidePanel png_bg" align="left">
<h2>关于日志分类</h2>
<span class="tip">在 Bangumi 发表日志，你可以使用 Tag 为自己的文章分类。你甚至可以通过日志为 Bangumi 的会员<strong>提供新闻</strong>，只需要在 Tag 中添加 (可直接点击以下标签) :<br />

<hr class="board" />
<span class="g"><a href="javascript:void(0);" class="l" onclick="chiiLib.subject.addTag('动画')">动画</a></span> /
<span class="g"><a href="javascript:void(0);" class="l" onclick="chiiLib.subject.addTag('书籍')">书籍</a></span> /
<span class="g"><a href="javascript:void(0);" class="l" onclick="chiiLib.subject.addTag('音乐')">音乐</a></span> /
<span class="g"><a href="javascript:void(0);" class="l" onclick="chiiLib.subject.addTag('游戏')">游戏</a></span> /
<span class="g"><a href="javascript:void(0);" class="l" onclick="chiiLib.subject.addTag('三次元')">三次元</a></span><br />
<hr class="board" />
你的日志就会出现在频道的日志汇总页面中。
</span>
</div>
<div class="SidePanel png_bg" align="left">
<h2>关联条目</h2>
<span class="tip">在 Bangumi 发表日志，你可以为日志添加关联条目，这样你的日志就会作为关联条目的评论出现在条目页面中。每篇日志最多可以添加5个关联条目。<br />
<ul id="related_subject_list" class="groupsLine">
</ul>
<input id="add_related_subject" name="add_related_subject" class="inputtext" style="width:180px;" /> <input id="submit_related_subject" class="inputBtn" value="添加" name="submit" type="submit" />
<p class="tip_j">输入条目URL或ID<br />如 http://bangumi.tv/subject/265 或 265</p>
</span>
</div>
<div class="menu_inner" align="left">
<span class="tip_i">/ <a href="/user/481528/blog" class="l">返回我的日志</a></span>
</div>
</div>
</div><div id="footer">
<ul id="footerLinks" class="clearit">
<li class="first">
    <dl>
        <dt>关于我们</dt>
        <dd><a href="http://bangumi.tv/about">关于我们</a></dd>
        <dd><a href="http://bangumi.tv/about/guideline">社区指导原则</a><dd>
        <dd><a href="http://bangumi.tv/about/copyright">版权声明</a><dd>		
        <dd><a href="http://bangumi.tv/about/link2us">链接我们</a><dd>
    </dl>
</li>
<li>
    <dl>
    <dt>获取帮助</dt>
        <dd><a href="http://bangumi.tv/help/bbcode">BBCode</a></dd>
        <dd><a href="http://bangumi.tv/group/forum">站务论坛</a></dd>
        <dd><a href="http://bangumi.tv/group/dev">番组开发</a></dd>
        <dd><a href="http://bangumi.tv/group/issues">BUG追踪</a></dd>
        <dd><a href="http://bangumi.tv/group/doujin">天窗站务</a></dd>	
    </dl>
</li>
<li>
<dl>
    <dt>特别推荐</dt>
        <dd><a href="http://bangumi.tv/award/2018">年鉴 2018</a> | <a href="http://bangumi.tv/award/2017">17</a> |  <a href="http://bangumi.tv/award/2016">16</a> |  <a href="http://bangumi.tv/award/2015">15</a> | <a href="http://bangumi.tv/award/2014">14</a> |  <a href="http://bangumi.tv/award/2013">13</a> | <a href="http://bangumi.tv/award/2012">12</a><br />| <a href="http://bangumi.tv/award/2011">11</a> | <a href="http://bangumi.tv/award/2010">10</a></dd>
        <dd><a href="http://bangumi.tv/group/wiki">番組WIKI計画</a></dd>
        <dd><a href="http://bangumi.tv/onair">onAir 客户端</a></dd>
        <dd><a href="http://bangumi.tv/tokei">etokei 绘时计</a></dd>        
    </dl>
</li>
<li class="last">
    <dl>
    <dt>更多</dt>
        <dd><a href="http://bangumi.tv/dev/app">开发者平台</a></dd>    
        <dd><a href="http://bangumi.tv/index">目录</a></dd>
        <dd><a href="http://bangumi.tv/wiki">维基人</a></dd>
        <dd><a href="http://bangumi.tv/magi">MAGI 问答</a></dd>
        <dd><a href="http://bangumi.tv/goodies">周边</a></dd>
        <dd><a href="http://bangumi.tv/dollars">Dollars</a></dd>	
    </dl>
</li>
</ul><div class="copyright"><small class="grey">&copy; 2008-2019 Bangumi (a.k.a.Chobits), some rights reserved</small></div>
</div>
</div></div>
<div class="homeBg"></div>
<div id="dock">
    <div class="content">
        <ul class="clearit">
                <li class="first"><a href="http://bangumi.tv/user/481528">ericho</a></li>
        <li><a href="http://bangumi.tv/notify/all">提醒</a> | <a href="http://bangumi.tv/pm">短信</a> | <a href="http://bangumi.tv/settings">设置</a> | <a href="http://bangumi.tv/logout/fbf17791" target="_self">登出</a></li>
                <li class="last"><a href="javascript:void(0);" id="showrobot">&nbsp;</a></li>
        </ul>
    </div>
</div>


<script type="text/javascript">chiiLib.login.init();</script>
</body></html>