<%@ page language="java" pageEncoding="UTF-8"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1" name="viewport">
<title>我的时光机</title>
<meta name="keywords" content="我的时光机,ACG,anime,comic,game,music,动漫,音乐,游戏,动画,漫画,番组,bangumi,chii,chobits" />
<meta name="description" content="我在 Bangumi 收藏的动画、游戏、音乐、图书,参加的小组,拥有的好友" />
<link rel="search" type="application/opensearchdescription+xml" href="http://bangumi.tv/static/xml/opensearch_bgm.xml" title="Bangumi 番组计划" />
<link rel="shortcut icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="/img/ico/ico_ios.png" />


<link rel="stylesheet" type="text/css" href="<%=path %>/css/bangumi.css" />
<script type="text/javascript">var SHOW_ROBOT = '0',CHOBITS_UID = 481528, SITE_URL = 'http://bangumi.tv';</script>
<link rel="alternate" href="/feed/user/481528/interests" type="application/rss+xml" title="ericho的收藏" /></head>
<body class="bangumi">
<div id="wrapperNeue" class="wrapperNeue">
<div id="headerNeue2">
    <div class="headerNeueInner clearit">
         <div class="bg musume_4"></div>
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
<li><div class="sep">我看</div></li>
<li><a href="/anime/list/481528/do" class="nav">在看</a></li>
<li><a href="/anime/list/481528/wish" class="nav">想看</a></li>
<li><a href="/anime/list/481528/collect" class="nav">看过</a></li>
<li><a href="/anime/list/481528/on_hold" class="nav">搁置</a></li>
<li><a href="/anime/list/481528/dropped" class="nav">抛弃</a></li>
</ul>
</li>
<li><a href="/book" class="top chl"><span>书籍</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/book/chart" class="nav">排行榜</a></li>
<li><a href="/book/tag" class="nav">图书标签</a></li>
<li><a href="/book/browser" class="nav">分类浏览</a></li>
<li><a href="/book/blog" class="nav">图书日志</a></li>
<li><div class="sep">我读</div></li>
<li><a href="/book/list/481528/do" class="nav">在读</a></li>
<li><a href="/book/list/481528/wish" class="nav">想读</a></li>
<li><a href="/book/list/481528/collect" class="nav">读过</a></li>
<li><a href="/book/list/481528/on_hold" class="nav">搁置</a></li>
<li><a href="/book/list/481528/dropped" class="nav">抛弃</a></li>
</ul>
</li>
<li><a href="/music" class="top chl"><span>音乐</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/music/chart" class="nav">排行榜</a></li>
<li><a href="/music/tag" class="nav">音乐标签</a></li>
<li><a href="/music/browser" class="nav">浏览全部</a></li>
<li><a href="/music/blog" class="nav">音乐日志</a></li>
<li><div class="sep">我听</div></li>
<li><a href="/music/list/481528/do" class="nav">在听</a></li>
<li><a href="/music/list/481528/wish" class="nav">想听</a></li>
<li><a href="/music/list/481528/collect" class="nav">听过</a></li>
<li><a href="/music/list/481528/on_hold" class="nav">搁置</a></li>
<li><a href="/music/list/481528/dropped" class="nav">抛弃</a></li>
</ul>
</li>
<li><a href="/game" class="top chl"><span>游戏</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/game/chart" class="nav">排行榜</a></li>
<li><a href="/game/tag" class="nav">游戏标签</a></li>
<li><a href="/game/browser" class="nav">平台浏览</a></li>
<li><a href="/game/blog" class="nav">游戏日志</a></li>
<li><div class="sep">我玩</div></li>
<li><a href="/game/list/481528/do" class="nav">在玩</a></li>
<li><a href="/game/list/481528/wish" class="nav">想玩</a></li>
<li><a href="/game/list/481528/collect" class="nav">玩过</a></li>
<li><a href="/game/list/481528/on_hold" class="nav">搁置</a></li>
<li><a href="/game/list/481528/dropped" class="nav">抛弃</a></li>
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
<li><div class="sep">我看</div></li>
<li><a href="/real/list/481528/do" class="nav">在看</a></li>
<li><a href="/real/list/481528/wish" class="nav">想看</a></li>
<li><a href="/real/list/481528/collect" class="nav">看过</a></li>
<li><a href="/real/list/481528/on_hold" class="nav">搁置</a></li>
<li><a href="/real/list/481528/dropped" class="nav">抛弃</a></li>
</ul>
</li>
            <li><a href="/mono" class="top"><span>人物</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/character" class="nav">虚构人物</a></li>
<li><a href="/person" class="nav">现实人物</a></li>
<li><div class="sep">我</div></li>
<li><a href="/mono/update" class="nav">关注人物更新</a></li>
<li><a href="/user/481528/mono/character" class="nav">收藏的角色</a></li>
<li><a href="/user/481528/mono/person" class="nav">收藏的人物</a></li>				
	
</ul>
</li>
<li><a href="/rakuen" class="top_lite"><span>超展开</span></a></li>
<li><a href="/group"class="top"><span>小组</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="/group/discover" class="nav">随便看看</a></li>
<li><a href="/group/all" class="nav">所有小组</a></li>
<li><div class="sep">我</div></li>
<li><a href="/group/my_topic" class="nav">发表的话题</a></li>
<li><a href="/group/my_reply" class="nav">回复的话题</a></li>
<li><a href="/group/mine" class="nav">参加的小组</a></li>
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
<a class="avatar" href="http://bangumi.tv/user/481528"><span class="avatarNeue avatarSize32 ll" style="background-image:url('//lain.bgm.tv/pic/user/s/icon.jpg')"></span></a>
	
<ul id="badgeUserPanel">
    	<li><a href="http://bangumi.tv/user/481528">时光机</a></li>                    
        <li><a href="http://bangumi.tv/user/481528/blog">日志</a></li>
        <li><a href="http://bangumi.tv/user/481528/mono">人物</a></li>
        <li><a href="http://bangumi.tv/user/481528/index">目录</a></li>
        <li><a href="http://bangumi.tv/user/481528/timeline">时间胶囊</a></li>
        <li><a href="http://bangumi.tv/user/481528/groups">小组</a></li>
        <li><a href="http://bangumi.tv/user/481528/friends">好友</a></li>
        <li><a href="http://bangumi.tv/user/481528/wiki">维基</a></li>        
        <li class="row"><a href="http://doujin.bangumi.tv/user/481528">天窗专页</a></li>
        <li class="row"><a href="http://bangumi.tv/pm">短信</a> | <a href="http://bangumi.tv/settings">设置</a> | <a href="http://bangumi.tv/logout/82d89381">登出</a></li>
    </ul>	
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
<ul class="navTabs">
        <li><a href="/user/481528" class="focus">时光机</a></li>
        <li><a href="/anime/list/481528" >收藏</a></li>
        <li><a href="/user/481528/mono" >人物</a></li>
        <li><a href="/user/481528/blog" >日志</a></li>
        <li><a href="/user/481528/index" >目录</a></li>
        <li><a href="/user/481528/timeline" >时间胶囊</a></li>
        <li><a href="/user/481528/groups" >小组</a></li>
        <li><a href="/user/481528/friends" >好友</a></li>
        <li><a href="/user/481528/wiki" >维基</a></li>
        <li><a href="/user/481528/doujin" >天窗</a></li>
</ul>
</div>

</div>
</div>
<div class="mainWrapper"><div class="columns clearit">
<div id="columnA" class="column">
<div id="user_home">
<div class="user_box clearit">
     
    <ul class="network_service clearit">
<li><span class="service" style="background-color:#F09199;">SubCircle</span> <span class="tip">${user.kkd106 } 加入</span></li>
</ul>    
        
    
        <div class="adminTools">
    <a href="<%=path %>/findById.kdhtml" class="btnGraySmall"><span>编辑</span></a>           
                </div>
    </div><div id="blog" class="sort">
<h2 class="drag">&nbsp;</h2><div class="horizontalOptions clearit">
<ul class="">
<li class="title"><h2> 我的日志</h2></li>
<li style="float:right"><small><a href="/user/481528/blog">...more</a></small></li>
</ul>
</div>

<div class="content_inner clearit" align="left">
<div align="center" class="clearit">
<span class="green">还没有发表过日志?</h2>
<a href="/blog/create" class="l">>立即发表<</a><br />
<span class="tip_j">你甚至可以通过日志为 Bangumi 的会员提供新闻</span>
</div>
</div>
</div>
</div>
</div>

<div id="columnB" class="column">
<div id="">
<div class="SidePanel png_bg">
<h2>/ 我的时间胶囊 <small><a href="/user/481528/timeline">...more</a></small></h2>

<ul class="timeline"><li><small class="feed">注册成为了 Bangumi 成员</small> <small class="time">2019-6-28 18:52</small></li></ul>
</div>
</div>
<div id="sideLayout"><div id="friend" class="sort">
<div class="SidePanel png_bg" align="left">
<h2>/ 我的朋友 <small><a href="/user/481528/friends">...more</a></small></h2><hr class="board" /><a href="/user/481528/rev_friends">+ 谁加我为好友</a>
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
<script src="/min/g=js?r307" type="text/javascript"></script>
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
</script>


<script src="/min/g=ui?r307" type="text/javascript"></script><script type="text/javascript">chiiLib.user.profile();</script>
</body></html>