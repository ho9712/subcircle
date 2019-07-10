<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>AnimeDetail</title>
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
    <div class="guest"><a href="" class="guest login">登录</a><a href="" class="guest signup">注册</a></div>
    
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
   <a href="/subject/253" title="星际牛仔" property="v:itemreviewed">カウボーイビバップ</a>
                 <small class="grey">TV</small>   </h1>

    
        
    <div class="subjectNav">
<ul class="navTabs clearit">
        <li><a href="/subject/253" class="focus">概览</a></li>       
        <li><a href="/subject/253/reviews" >评论</a></li>
        <li><a href="/subject/253/board" >讨论版</a></li>
        </ul>
	
</div>
</div>
<div class="mainWrapper"><div class="columns clearit" xmlns:v="http://rdf.data-vocabulary.org/#" typeof="v:Movie">
<div id="columnSubjectHomeA" class="column">
    <div id="bangumiInfo">
<div class="infobox">
                                <div align="center">
            <a href="//lain.bgm.tv/pic/cover/l/c2/4c/253_t3XWb.jpg" title="カウボーイビバップ 星际牛仔" alt="カウボーイビバップ 星际牛仔" class="thickbox cover"><img src="//lain.bgm.tv/pic/cover/c/c2/4c/253_t3XWb.jpg" class="cover" /></a>
            </div>
            <ul id="infobox">
                            <li><span class="tip">中文名: </span>星际牛仔</li>
                                        <li><span class="tip">话数: </span>26</li>
                                        <li><span class="tip">放送开始: </span>1998年10月23日</li>
                                        <li><span class="tip">放送星期: </span>星期五</li>
                                        <li><span class="tip">原作: </span><a href="/person/99" class="l">矢立肇</a></li>
                                        <li><span class="tip">导演: </span><a href="/person/100" class="l" title="渡边信一郎" rel="v:directedBy">渡辺信一郎</a></li>
                                        <li><span class="tip">脚本: </span><a href="/person/100" class="l" title="渡边信一郎">渡辺信一郎</a>、<a href="/person/11555" class="l" title="稻荷昭彦">稲荷昭彦</a>、<a href="/person/337" class="l">横手美智子</a>、<a href="/person/103" class="l">信本敬子</a>、<a href="/person/226" class="l" title="村井贞之">村井さだゆき</a>、<a href="/person/921" class="l">佐藤大</a>、<a href="/person/49" class="l">山口亮太</a></li>
                                        <li><span class="tip">分镜: </span><a href="/person/100" class="l" title="渡边信一郎">渡辺信一郎</a>、<a href="/person/522" class="l" title="本乡满">本郷みつる</a>、<a href="/person/2598" class="l" title="饭田马之介">飯田馬之介</a>、<a href="/person/1443" class="l">都留稔幸</a>、<a href="/person/801" class="l">山内重保</a>、<a href="/person/1742" class="l">森邦宏</a>、<a href="/person/560" class="l" title="赤根和树">赤根和樹</a>、<a href="/person/456" class="l" title="佐藤顺一">佐藤順一</a>、<a href="/person/3338" class="l">武井良幸</a>、<a href="/person/343" class="l" title="山口佑司">山口祐司</a>、<a href="/person/12491" class="l">佐藤育郎</a>、<a href="/person/920" class="l" title="冈村天斋">岡村天斎</a></li>
                                        <li><span class="tip">演出: </span><a href="/person/12284" class="l">山田弘和</a>、<a href="/person/1742" class="l">森邦宏</a>、<a href="/person/3338" class="l">武井良幸</a>、<a href="/person/12491" class="l">佐藤育郎</a>、<a href="/person/1373" class="l" title="渡边哲哉">渡邊哲哉</a></li>
                                        <li><span class="tip">音乐: </span><a href="/person/6766" class="l" title="THE SEATBELTS">シートベルツ</a>、<a href="/person/101" class="l" title="菅野洋子">菅野よう子</a></li>
                                        <li><span class="tip">人物设定: </span><a href="/person/102" class="l">川元利浩</a></li>
                                        <li><span class="tip">分镜构图: </span><a href="/person/224" class="l">入江泰浩</a></li>
                                        <li><span class="tip">系列构成: </span><a href="/person/103" class="l">信本敬子</a></li>
                                        <li><span class="tip">色彩设计: </span><a href="/person/562" class="l" title="中山志甫子">中山しほ子</a></li>
                                        <li><span class="tip">作画监督: </span><a href="/person/12502" class="l" title="新保卓郎">しんぼたくろう</a>、<a href="/person/11569" class="l" title="中田荣治">中田栄治</a>、<a href="/person/287" class="l" title="本桥秀之">本橋秀之</a>、<a href="/person/3650" class="l" title="菅野宏纪">菅野宏紀</a>、<a href="/person/1380" class="l">逢坂浩司</a>、<a href="/person/520" class="l">小森高博</a>、<a href="/person/3279" class="l">竹内浩志</a>、<a href="/person/102" class="l">川元利浩</a>、<a href="/person/11371" class="l" title="后藤雅巳">後藤雅巳</a></li>
                                        <li><span class="tip">机械设定: </span><a href="/person/9238" class="l">山根公利</a></li>
                                        <li><span class="tip">摄影监督: </span><a href="/person/104" class="l">大神洋一</a></li>
                                        <li><span class="tip">原画: </span><a href="/person/1380" class="l">逢坂浩司</a>、<a href="/person/11569" class="l" title="中田荣治">中田栄治</a>、<a href="/person/11371" class="l" title="后藤雅巳">後藤雅巳</a>、<a href="/person/520" class="l">小森高博</a>、<a href="/person/2005" class="l" title="杉浦幸二">杉浦幸次</a>、<a href="/person/11475" class="l" title="中村丰">中村豊</a>、<a href="/person/1428" class="l">伊藤嘉之</a>、<a href="/person/7999" class="l" title="斋藤恒德">斎藤恒徳</a>、<a href="/person/11393" class="l" title="鸭川浩">鴨川浩</a>、<a href="/person/373" class="l">伊藤岳史</a>、<a href="/person/2886" class="l">横山彰利</a>、<a href="/person/11490" class="l">星和伸</a>、<a href="/person/1183" class="l" title="大冢健">大塚健</a>、<a href="/person/12450" class="l" title="宫田忠明">宮田忠明</a>、<a href="/person/418" class="l" title="吉田彻">吉田徹</a>、<a href="/person/102" class="l">川元利浩</a>、<a href="/person/3650" class="l" title="菅野宏纪">菅野宏紀</a>、<a href="/person/9241" class="l" title="桥本诚一">橋本誠一</a>、<a href="/person/11410" class="l" title="富冈隆司">富岡隆司</a>、<a href="/person/2540" class="l" title="井上英纪">井上英紀</a>、<a href="/person/1158" class="l" title="冈真里子">岡真里子</a>、<a href="/person/11551" class="l" title="津野田胜敏">津野田勝敏</a>、<a href="/person/224" class="l">入江泰浩</a>、<a href="/person/3421" class="l">佐藤千春</a>、<a href="/person/455" class="l" title="高桥信也">高橋しんや</a>、<a href="/person/3164" class="l" title="伊东伸高">伊東伸高</a>、<a href="/person/11840" class="l">高山朋浩</a>、<a href="/person/25995" class="l">大浪太</a>、<a href="/person/12102" class="l">吉川博明</a>、<a href="/person/1563" class="l" title="高见明男">高見明男</a></li>
                                        <li><span class="tip">主题歌编曲: </span><a href="/person/101" class="l" title="菅野洋子">菅野よう子</a></li>
                                        <li><span class="tip">主题歌作曲: </span><a href="/person/101" class="l" title="菅野洋子">菅野よう子</a></li>
                                        <li><span class="tip">主题歌演出: </span><a href="/person/13950" class="l">山根麻以</a></li>
                                        <li><span class="tip">企画: </span><a href="/person/189" class="l" title="日升">サンライズ</a></li>
                                        <li><span class="tip">制作管理: </span><a href="/person/19297" class="l" title="鸟羽聪">鳥羽聡</a></li>
                                        <li><span class="tip">设定: </span><a href="/person/19297" class="l" title="鸟羽聪">鳥羽聡</a>、<a href="/person/253" class="l">河森正治</a>、<a href="/person/921" class="l">佐藤大</a></li>
                                        <li><span class="tip">音响监督: </span><a href="/person/17" class="l">小林克良</a></li>
                                        <li><span class="tip">特效: </span><a href="/person/19295" class="l" title="长谷川敏生">長谷川敏生</a></li>
                                        <li><span class="tip">制片人: </span><a href="/person/3113" class="l">南雅彦</a></li>
                                        <li><span class="tip">制作助手: </span><a href="/person/44" class="l">BONES</a></li>
                                        <li><span class="tip">动画制作: </span><a href="/person/189" class="l" title="日升">サンライズ</a></li>
                                                                                                        <li><span class="tip">别名: </span>Cowboy Bebop</li>
                                                                                                                <li><span class="tip" style="visibility:hidden;">别名: </span>宇宙牛仔</li>
                                                                                                                <li><span class="tip" style="visibility:hidden;">别名: </span>赏金猎人</li>
                                                                                                                <li><span class="tip" style="visibility:hidden;">别名: </span>太空牛仔</li>
                                                                                                                <li><span class="tip" style="visibility:hidden;">别名: </span>恶男杰特</li>
                                                                                                    <li><span class="tip">官方网站: </span>http://www.cowboybebop.org/；http://www.cowboy-bebop.net/index.html</li>
                                        <li><span class="tip">播放电视台: </span>WOWOW、テレビ東京</li>
                                        <li><span class="tip">播放结束: </span>1999年4月23日</li>
                                                                                                        <li><span class="tip">テレビ東京版: </span>1998年4月3日 - 1998年6月26日</li>
                                                                                                                <li><span class="tip" style="visibility:hidden;">テレビ東京版: </span>全12话+总集篇</li>
                                                                            </ul>
                
        <div class="modifyTool">
        <span class="tip_i">
                <p><span class="tip">修改：</span><a href="/subject/253/edit" class="l">信息</a> / <a href="/subject/253/upload_img" class="l">封面</a></p>
        <p><span class="tip">关联：</span><a href="/subject/253/add_related/character" class="l">角色</a> / <a href="/subject/253/add_related/person" class="l">制作人员</a> / <a href="/subject/253/add_related/subject" class="l">条目</a></p>
                        
        
        </span>
        </div>      
        </div>
</div>
    </div>
    </div>

	<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
</body>
</html>