<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title></title>
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
<li><a href="" class="top chl anime"><span>动画</span></a>
                <div class="clear"></div>
<ul class="clearit">
<li><a href="kc02ShowRank.kchtml" class="nav">排行榜</a></li>
</ul>
</li>
<li><a href="" class="top chl"><span>书籍</span></a>
<div class="clear"></div>
<ul class="clearit">
<li><a href="kc03ShowRank.kchtml" class="nav">排行榜</a></li>
</ul>
</li>

<li><a href="" class="top chl game"><span>游戏</span></a>
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
        <form action="kc02Search.kchtml" method="post">
    <div class="inner">
    <select name="kkcs" id="siteSearchSelect">
<option value="all">全部</option>
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
    </div>
</div>



<div id="main" class="png_bg"></div>
<div id="headerSubject" class="clearit" xmlns:v="http://rdf.data-vocabulary.org/#" typeof="v:Movie">
<h1 class="nameSingle">
   <a href="" title="" property="v:itemreviewed"></a>
   标题
                    </h1>

   
        
    <div class="subjectNav">
<ul class="navTabs clearit">
        <li><a href="" >概览</a></li>       
        <li><a href="">评论</a></li>
        <li><a href="" >讨论版</a></li>
        <li><a href="" class="focus">编辑</a></li>
        </ul>
	
</div>
</div>

<div class="mainWrapper"><div class="columns clearit">


<h2 class="subtitle">SubCircle 采用的版本</h2>
<form action="">
<table class="olt"><tr><td></td><td></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">条目名</p></td><td>
<input type = "text" name="kkc202" class="inputtext" value="カウボーイビバップ" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">中文名</p></td><td>
<input type = "text" name="kkc202" class="inputtext" value="星际牛仔" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">话数</p></td><td>
<input type = "text" name="kkc209" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">原作</p></td><td>
<input type = "text" name="kkc210" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">分镜</p></td><td>
<input type = "text" name="kkc211" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">演出</p></td><td>
<input type = "text" name="kkc212" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">音乐</p></td><td>
<input type = "text" name="kkc213" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">原画</p></td><td>
<input type = "text" name="kkc214" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">官方网站</p></td><td>
<input type = "text" name="kkc215" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">电视台</p></td><td>
<input type = "text" name="kkc216" class="inputtext" value="" /></td></tr>

<tr><td nowrap="nowrap" width="15%"><p class="tip">简介</p></td><td>
<textarea name="kkc217" id="content" class="reply" cols="45" rows="7"  ></textarea>

</td></tr>
</table>


</form>
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