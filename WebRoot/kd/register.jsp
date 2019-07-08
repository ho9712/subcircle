<%@ page language="java" pageEncoding="UTF-8"%>
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
    <div class="guest"><a href="http://bangumi.tv/login" class="guest login">登录</a><a href="http://bangumi.tv/signup" class="guest signup">注册</a></div>
	
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

<div id="main" class="png_bg"><div class="columnsLogin borderNeue clearit">
    <h1>注册成为 Bangumi 会员</h1>
    <div class="clearit">
        <div id="columnLoginA" class="column">        
            <div id="loginSelection" class="loginSelection">
                <h2>我想使用 Bangumi：</h2>
                <ul>
                    <li><a href="javascript:void(0)" onclick="showSignUpAlert();">在线观看、下载资源</a></li>
                    <li><a href="javascript:void(0)" onclick="showSignUpForm();">管理 ACG 收藏与收视进度，分享交流</a></li>
                    <li><a href="javascript:void(0)" onclick="showSignUpForm();">在天窗联盟发布与收藏同人作品</a></li>
                    <li><a href="javascript:void(0)" onclick="showSignUpForm();"><strike>婚恋交友</strike></a></li>                                                            
                </ul>
            </div>
            <div id="signupAlert" style="display: none">
                <p>Bangumi 仅提供条目资料与个人收藏记录，<br />不提供任何在线观看以及下载，<br />您可至以下网站收看正版在线内容：</p>
                <p>
                    <a href="https://www.netflix.com" target="_blank" class="btnBlue" rel="nofollow">Netflix</a>
                    <a href="https://www.iqiyi.com" target="_blank" class="btnBlue" rel="nofollow">爱奇艺</a>
                    <a href="https://www.youku.com" target="_blank" class="btnBlue" rel="nofollow">优酷</a>                                     
                    <a href="https://www.bilibili.com" target="_blank" class="btnBlue" rel="nofollow">Bilibili</a>
                    <a href="https://v.qq.com" target="_blank" class="btnBlue" rel="nofollow">腾讯视频</a>                 
                </p>
            </div>
            <div id="signupFormWrapper" style="display: none">
                <form id="signupForm" method="post" name="signup" action="/RedPill">
                <input type="hidden" name="formhash" value="59c2e8b8">
                <input type="hidden" name="referer" value="">
                <p class="title"><label for="email">你的 Email 地址</label></p>
                <p><input id="email" name="email" class="inputtext" type="text" onfocus="SetTips('RegEmail');" /></p>
                <p class="title"><label for="password">设置一个密码</label></p>
                <p><input id="password" name="password" class="inputtext" type="password" /></p>
                <p class="title"><label for="password2">确认密码</label></p>
                <p><input id="password2" name="password2" class="inputtext" type="password" /></p>
                <p class="title"><label for="nickname">设置一个昵称</label></p>
                <p><input id="nickname" name="nickname" class="inputtext" type="text" onfocus="regSetNickName();" /></p>
                <div id="rechaptcha_form"></div>
                <p class="title"><label for="guideline">Bangumi <strong style="color:#F09199;">不提供</strong> 资源下载与观看（输入粉色文字内容）</label></p>            
                <p>我已了解 Bangumi <input id="guideline" name="guideline" class="inputtext" type="text" style="width:100px;"/> 资源下载与观看</p>          
                <p class="title"><input class="inputBtn" type="submit" name="regsubmit" value="注册会员" /></p>
                </form>
            </div>
        </div>
        <div id="columnLoginB" class="column">
            <div class="panel">
            <p class="title">已经注册过 Bangumi 账户？</p>
            <a href="/login" class="btnPink">立即登录</a>
            </div>
            <p class="title">忘记密码？</p>
            <p class="tip"><a href="/reset_password" class="btnGray">重置密码</a></p>
        </div>
    </div>

    

<div id="robot"  style="display:none;">
<div id="ukagaka_shell">
<div class="ui_10 shell_1">
<div id="ukagaka_voice"></div>
<div id="robot_balloon" class="ukagaka_balloon_pink">
    <div class="inner">
<div id="robot_speech" class="speech" >
没<a href="signup"  class="nav">注册</a>时我很沉默</div>
<div id="robot_speech_js" class="speech">
    </div>
</div>
<div class="ukagaka_balloon_pink_bottom"></div>	
</div>
</div>
</div>
</div>
<script src="js/bangumi.js" type="text/javascript"></script>
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


<script type="text/javascript">chiiLib.login.init();</script>
</body></html>