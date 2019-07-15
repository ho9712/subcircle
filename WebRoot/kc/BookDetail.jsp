<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>${ins.kkc309}</title>
<link href="<%=path %>/css/bangumi.css" rel="stylesheet" type="text/css">
</head>
<body>

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
        
        <div class="idBadgerNeue">
    <c:choose>
    <c:when test="${sessionScope.user.kkd101!=null }">
     <div class="idBadgerNeue">
		<c:choose>
            	<c:when test="${!empty sessionScope.user.kkd108}">
                <a class="avatar" href="<%=path%>/kd/userpage_main.jsp">
				<span class="avatarNeue avatarSize32 ll" 
					style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
				</a>
            	</c:when>
            	<c:otherwise>
                <a class="avatar" href="<%=path%>/kd/userpage_main.jsp">
				<span class="avatarNeue avatarSize32 ll" 
					style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
				</a>
            	</c:otherwise>
            </c:choose>
		<ul id="badgeUserPanel">
			<li><a href="<%=path%>/kd/userpage_main.jsp">时光机</a></li>                    
       		<li><a href="http://bangumi.tv/user/481528/blog">作品</a></li>
       		<li><a href="http://bangumi.tv/user/481528/mono">论坛</a></li>
       		<li><a href="http://bangumi.tv/user/481528/index">商城</a></li>
	    	
	        <li class="row">
		        <a href="http://bangumi.tv/pm">短信</a> | 
		        <a href="<%=path%>/kd/userpage_info.jsp">设置</a> | 
		        <a href="<%=path%>/logout.kdhtml">登出</a>
	        </li>
    	</ul>	
    </div>
    </c:when>
    <c:otherwise>
    <div class="guest"><a href="<%=path %>/kd/login.jsp" class="guest login">登录</a><a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a></div>
    </c:otherwise>
    </c:choose>
    
    
</div><div id="headerSearchWrapper">
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
    </div>
</div>



<div id="main" class="png_bg"></div>
<div id="headerSubject" class="clearit" xmlns:v="http://rdf.data-vocabulary.org/#" typeof="v:Movie">
<h1 class="nameSingle">
   <a href="${ins.kkc303}" title="${ins.kkc302}" property="v:itemreviewed"></a>
   ${ins.kkc309}
                    </h1>

    
        
    <div class="subjectNav">
<ul class="navTabs clearit">
        <li><a href="${ins.kkc303}" class="focus">概览</a></li>       
        <li><a href="" >评论</a></li>
        <li><a href="" >讨论版</a></li>
        </ul>
	
</div>
</div>
<div class="mainWrapper"><div class="columns clearit" xmlns:v="http://rdf.data-vocabulary.org/#" typeof="v:Movie">
<div id="columnSubjectHomeA" class="column">
    <div id="bangumiInfo">
<div class="infobox">
                                <div align="center">
            <a href="${ins.kkc304}" title="${ins.kkc302}" alt="${ins.kkc309}" class="thickbox cover"><img src="${ins.kkc304}" class="cover" /></a>
            </div>
            <ul id="infobox">
                            <li><span class="tip">中文名: </span>${ins.kkc302}</li>
                            			<li><span class="tip">册数: </span>${ins.kkc310}</li> 
                                        <li><span class="tip">话数: </span>${ins.kkc311}</li>                                       
                                        <li><span class="tip">作者: </span>${ins.kkc312}</li>       
                                        <li><span class="tip">出版社: </span>${ins.kkc313}</li>
            </ul>
                
        <div class="modifyTool">
        <span class="tip_i">
                <p><span class="tip">修改：</span><a href="" class="l">信息</a> / <a href="" class="l">封面</a></p>      
                        
        
        </span>
        </div>      
        </div>
</div>

    </div>
    <div id="columnSubjectHomeB" class="column">
     <div id="columnSubjectInHomeB" class="clearit">
            <div id="subject_detail" class="ll"> 
    <div id="subject_summary" class="subject_summary" property="v:summary">${ins.kkc314}</div>
    			<small class="gery clearit"><a href="#;" id="show_summary"  class="rr l">more...</a></small>
    			</div>
    			         <div id="panelInterestWrapper">
           <div class="SidePanel png_bg">
<h2>收藏盒</h2>
        <div id="SecTab">
    <ul class="secTab tiny">
        <li><a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="加入收藏"  onclick="GenInterestBox('wish')" class="thickbox"><span>想看</span></a></li>
        <li><a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="加入收藏"  onclick="GenInterestBox('collect')" class="thickbox"><span>看过</span></a></li>
        <li><a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="加入收藏"  onclick="GenInterestBox('do')" class="thickbox"><span>在看</span></a></li>
        <li><a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="加入收藏"  onclick="GenInterestBox('on_hold')" class="thickbox"><span>搁置</span></a></li>
        <li><a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="加入收藏"  onclick="GenInterestBox('dropped')" class="thickbox"><span>抛弃</span></a></li>
        </ul>
    </div>
    <div class="clear"></div>
    <hr class="board" />

<div id="panel" style="display:none;"><div class="collectBox clearit">
    <form id="collectBoxForm" name="collectBoxForm" method="post" action="/subject/253/interest/update?gh=2dae75e4">
    <input type="hidden" name="referer" value="subject">
    <div class="collectType cell">
        <label><input value="1" id="wish" name="interest" onclick="GenInterestBox('wish')"  type="radio"> 想看</label>&nbsp;&nbsp;
        <label><input value="2" id="collect" name="interest" onclick="GenInterestBox('collect')"  type="radio"> 看过</label>&nbsp;&nbsp;
        <label><input value="3" id="do" name="interest" onclick="GenInterestBox('do')"  type="radio"> 在看</label>&nbsp;&nbsp;
        <label><input value="4" id="on_hold" name="interest" onclick="GenInterestBox('on_hold')"  type="radio"> 搁置</label>&nbsp;&nbsp;
        <label><input value="5" id="dropped" name="interest" onclick="GenInterestBox('dropped')"  type="radio"> 抛弃</label>&nbsp;&nbsp;
        </div>

<div id="interest_rate" class="cell" style="">
  
<span class="tip">我的评价:</span> <span class="alarm" id="rating-tip"></span>
        <div class="clearit">
            <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="1" title="不忍直视 1 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="2" title="很差 2 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="3" title="差 3 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="4" title="较差 4 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="5" title="不过不失 5 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="6" title="还行 6 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="7" title="推荐 7 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="8" title="力荐 8 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="9" title="神作 9 "  />
                <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="10" title="超神作 10 (请谨慎评价)"  />
                </div>
</div>

<div class="cell">
<p class="tip"><label for="tags">标签 (使用半角空格或逗号隔开，至多10个):</label></p>
<input id="tags" class="inputtext" type="text" size="30" name="tags" value="" />
    <div class="tagList clearit">
        <span class="tip_j ll">常用标签：</span>
        <div class="inner">
                
                        <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('菅野洋子')">菅野洋子</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('渡边信一郎')">渡边信一郎</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('星际牛仔')">星际牛仔</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('SUNRISE')">SUNRISE</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('经典')">经典</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('科幻')">科幻</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('神配乐')">神配乐</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('神作')">神作</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('CowboyBebop')">CowboyBebop</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('TV')">TV</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('cowboy')">cowboy</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('1998')">1998</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('林原惠')">林原惠</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('原创')">原创</a>
                                    <a href="#;" class="btnGray" onclick="chiiLib.subject.addTag('山寺宏一')">山寺宏一</a>
                                                                                                                                                                                                                                                                                                                                    </div>
    </div>    
    
    <div class="tagList clearit">
    </div>          
    </div> 
    <div class="cell">
    <p class="tip"><label for="comment">吐槽 (简评，最多200字):</label></p>
    <textarea name="comment" id="comment" cols="32" rows="3" class="quick"></textarea>
    </div>
    <div class="clearit">
    <div id="submitBtnO" class="ll">
        <input class="inputBtn" type="submit" name="update" value="保存" />
    </div>
    <div class="ll">
        &nbsp;&nbsp;<label for="privacy"><input id="privacy" type="checkbox" value="1" name="privacy"  /> 仅自己可见</label>
    </div>
    </div>

    </form>
</div>
</div>
<div rel="v:rating">
<div class="global_rating score9">
<div class="rateEmo"></div>
<div class="global_score">

<!-- 
记得这里分数

排名

描述 如神作等

评分人数
 -->
<span class="number" property="v:average">${ins.kkc306}</span>
<span property="v:best" content="10.0"></span>
<span class="description"></span><div><small class="grey">SubCircle Book Ranked:</small><small class="alarm">#${ins.kkc308}</small></div>
</div>
</div>
<div class="clear"></div>

<div id="ChartWarpper" align="center">
    <div class="chart_desc" style=""><small class="grey"><span property="v:votes">${ins.kkc307}</span> votes</small></div>
    <ul class="horizontalChart">
        <li><a href="javascript:void(0)" title="2823人评分"><span class="label">10</span><span class="count" style="height:47.73%">(2823)</span></a></li>
        <li><a href="javascript:void(0)" title="1880人评分"><span class="label">9</span><span class="count" style="height:31.78%">(1880)</span></a></li>
        <li><a href="javascript:void(0)" title="814人评分"><span class="label">8</span><span class="count" style="height:13.76%">(814)</span></a></li>
        <li><a href="javascript:void(0)" title="247人评分"><span class="label">7</span><span class="count" style="height:4.18%">(247)</span></a></li>
        <li><a href="javascript:void(0)" title="77人评分"><span class="label">6</span><span class="count" style="height:1.30%">(77)</span></a></li>
        <li><a href="javascript:void(0)" title="32人评分"><span class="label">5</span><span class="count" style="height:0.54%">(32)</span></a></li>
        <li><a href="javascript:void(0)" title="8人评分"><span class="label">4</span><span class="count" style="height:0.14%">(8)</span></a></li>
        <li><a href="javascript:void(0)" title="4人评分"><span class="label">3</span><span class="count" style="height:0.07%">(4)</span></a></li>
        <li><a href="javascript:void(0)" title="4人评分"><span class="label">2</span><span class="count" style="height:0.07%">(4)</span></a></li>
        <li><a href="javascript:void(0)" title="26人评分"><span class="label">1</span><span class="count" style="height:0.44%">(26)</span></a></li>
        </ul>
    </div>
</div>
</div>
                                                           
</div> 
    </div>

    <div class="subject_section">
<div class="rr"><a href="#;" onclick="switchDisplay('new_topic');" class="chiiBtn"><span>添加新讨论</span></a></div><h2 class="subtitle">讨论版</h2>

<table class="topic_list" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:0px;"><tbody>    <tr class="odd">
    <td class="subject"><a href="/subject/topic/15388" title="你们觉得第一集的女性对Spike有没有动感情？" class="l">你们觉得第一集的女性对Spike有没有动感情？</a></td>
    <td width="15%"><a href="/user/288280">陈苦瓜</a></td>
    <td width="15%" align="right"><small class="grey">5 replies</small></td>
    <td width="15%" align="right"><small class="grey">2019-6-8</small></td>
    </tr>    <tr class="even">
    <td class="subject"><a href="/subject/topic/1352" title="这么神的片子竟然没人讨论" class="l">这么神的片子竟然没人讨论</a></td>
    <td width="15%"><a href="/user/xsummer">Xsummer</a></td>
    <td width="15%" align="right"><small class="grey">129 replies</small></td>
    <td width="15%" align="right"><small class="grey">2011-9-5</small></td>
    </tr>    <tr class="odd">
    <td class="subject"><a href="/subject/topic/1289" title="感觉ED的角色多余了呀" class="l">感觉ED的角色多余了呀</a></td>
    <td width="15%"><a href="/user/45008">lancer</a></td>
    <td width="15%" align="right"><small class="grey">9 replies</small></td>
    <td width="15%" align="right"><small class="grey">2011-8-4</small></td>
    </tr>    <tr class="even">
    <td class="subject"><a href="/subject/topic/12905" title="可有可无的一段话" class="l">可有可无的一段话</a></td>
    <td width="15%"><a href="/user/288280">陈苦瓜</a></td>
    <td width="15%" align="right"><small class="grey">3 replies</small></td>
    <td width="15%" align="right"><small class="grey">2018-6-23</small></td>
    </tr>    <tr class="odd">
    <td class="subject"><a href="/subject/topic/12461" title="关于 “幻之章节” :Cowboy Bebop - Session XX よせあつめブルース 和 Ru~ssian~" class="l">关于 “幻之章节” :Cowboy Bebop - Session XX よせあつめブルース 和 Ru~ssian~</a></td>
    <td width="15%"><a href="/user/syz4521233">syz</a></td>
    <td width="15%" align="right"><small class="grey">9 replies</small></td>
    <td width="15%" align="right"><small class="grey">2018-3-10</small></td>
    </tr><tr><td>&nbsp</td><td width="15%"></td><td width="15%"></td><td width="15%" align="right"><a href="/subject/253/board" class="more">更多讨论 »</a></td></tr>
</tbody></table>
<a name="new"></a>
<div id="new_topic" style="display:none;">
<h2 class="subtitle">添加新讨论</h2>
<span class="tip">
<form id="newTopicForm" name="new_comment" method="post" action="/subject/253/topic/new">
<input type="hidden" name="formhash" value="2dae75e4">
<table align="center" width="99%" class="settings">
<tr><td valign="top" width="10%">标题</td><td valign="top"><input id="title" name="title" class="inputtext" type="text"></td></tr>
<tr><td valign="top" width="10%">正文</td><td valign="top"><textarea name="content" id="content" cols="45" rows="7" class="reply" onKeyDown="seditor_ctlent(event,'newTopicForm');"></textarea></td></tr>
<tr>
<td valign="top" width="10%"></td>
<td valign="top"><div id="submitBtnO"><input class="inputBtn" value="加上去" name="submit" type="submit"> or <a href="#;" onclick="switchDisplay('new_topic');" class="l">取消</a></div></td>
</tr>
</table>
<br />
</form>
</span>
</div>

</div>

<div class="subject_section">
<h2 class="subtitle">吐槽箱</h2><div id="comment_box"><div class="item clearit">
<a href="/user/465109" class="avatar"><span class="avatarNeue avatarSize32 ll" style="background-image:url('//lain.bgm.tv/pic/user/s/000/46/51/465109.jpg?r=1554029003')"></span></a>
<div class="text_main_even">
<div class="text">
            <a href="/user/465109" class="l">七里泷义</a> <small class="grey">@ 2h 1m  ago</small> <span class="sstars10 starsinfo"></span>         <p>孤独浪漫，关于旅途、关于过去、关于自我。广袤的宇宙，无数个人，无数颗星星，何处是归宿。</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/483816" class="avatar"><span class="avatarNeue avatarSize32 rr" style="background-image:url('//lain.bgm.tv/pic/user/s/icon.jpg')"></span></a>
<div class="text_main_odd">
<div class="text">
            <a href="/user/483816" class="l">Faner</a> <small class="grey">@ 2h 43m  ago</small> <span class="sstars10 starsinfo"></span>           <p>给我一个不给十分的理由</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/coi" class="avatar"><span class="avatarNeue avatarSize32 ll" style="background-image:url('//lain.bgm.tv/pic/user/s/000/42/06/420632.jpg?r=1559643484')"></span></a>
<div class="text_main_even">
<div class="text">
            <a href="/user/coi" class="l">泪果</a> <small class="grey">@ 4h 12m  ago</small> <span class="sstars8 starsinfo"></span>          <p>最强单元剧？观感与吸血姬美夕内在上类似</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/478370" class="avatar"><span class="avatarNeue avatarSize32 rr" style="background-image:url('//lain.bgm.tv/pic/user/s/000/47/83/478370.jpg?r=1560146337')"></span></a>
<div class="text_main_odd">
<div class="text">
            <a href="/user/478370" class="l">花间一壶酒</a> <small class="grey">@ 6h 47m  ago</small> <span class="sstars10 starsinfo"></span>           <p>属于男人的自由与浪漫~~与SC相比，明明有着欢乐的日常，细细品味却总是感受到伤感与无奈......</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/233875" class="avatar"><span class="avatarNeue avatarSize32 ll" style="background-image:url('//lain.bgm.tv/pic/user/s/000/23/38/233875.jpg?r=1538667704')"></span></a>
<div class="text_main_even">
<div class="text">
            <a href="/user/233875" class="l">是这样吗</a> <small class="grey">@ 1d  ago</small>             <p>补档</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/272522" class="avatar"><span class="avatarNeue avatarSize32 rr" style="background-image:url('//lain.bgm.tv/pic/user/s/icon.jpg')"></span></a>
<div class="text_main_odd">
<div class="text">
            <a href="/user/272522" class="l">NOTmax</a> <small class="grey">@ 1d 6h ago</small> <span class="sstars10 starsinfo"></span>            <p>如果我这辈子只能看一部番剧 我希望是这部</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/468754" class="avatar"><span class="avatarNeue avatarSize32 ll" style="background-image:url('//lain.bgm.tv/pic/user/s/icon.jpg')"></span></a>
<div class="text_main_even">
<div class="text">
            <a href="/user/468754" class="l">格林与高斯</a> <small class="grey">@ 2019-7-7 14:03</small> <span class="sstars10 starsinfo"></span>            <p>不说了，混沌武士见</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/476296" class="avatar"><span class="avatarNeue avatarSize32 rr" style="background-image:url('//lain.bgm.tv/pic/user/s/000/47/62/476296.jpg?r=1562421812')"></span></a>
<div class="text_main_odd">
<div class="text">
            <a href="/user/476296" class="l">思念是一把刀</a> <small class="grey">@ 2019-7-7 10:15</small> <span class="sstars10 starsinfo"></span>           <p>狂野西部与黑色硬汉两大好莱坞黄金时代类型片在荒蛮太空背景下的另一种重现，像是更轻松版本的雷蒙德·钱德勒；每个人的性格都那么饱满，尤其是Spike，身上集合了太多人的影子，而那chain-smoker的习惯和冷漠中暗藏热烈的特质真是像极了鲍嘉；很感兴趣的是乔斯·韦登的《萤火虫》是不是从这里偷师良多</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/robot17" class="avatar"><span class="avatarNeue avatarSize32 ll" style="background-image:url('//lain.bgm.tv/pic/user/s/000/40/62/406222.jpg?r=1520748233')"></span></a>
<div class="text_main_even">
<div class="text">
            <a href="/user/robot17" class="l">嘉神川诺艾尔</a> <small class="grey">@ 2019-7-7 08:50</small> <span class="sstars10 starsinfo"></span>          <p>神作不解释</p>
</div>
</div>
</div><div class="item clearit">
<a href="/user/483071" class="avatar"><span class="avatarNeue avatarSize32 rr" style="background-image:url('//lain.bgm.tv/pic/user/s/icon.jpg')"></span></a>
<div class="text_main_odd">
<div class="text">
            <a href="/user/483071" class="l">缺乏想象力</a> <small class="grey">@ 2019-7-6 20:24</small> <span class="sstars10 starsinfo"></span>            <p>完美</p>
</div>
</div>
</div></div><a href="/subject/253/comments" class="more">更多吐槽 »</a>
</div>  
</div>      
</div>
</div>

<!-- <script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
 -->
	

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
</script>


<script type="text/javascript">
$(document).ready(function () {
    $(document).share({
        title: '「カウボーイビバップ」(来自 Bangumi 番组计划)',
        content: "",
        url: document.URL    });
});
</script>
<script type="text/javascript">chiiLib.subject.init();</script>
</body>
</html>