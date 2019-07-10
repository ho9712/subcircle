<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>GameList</title>
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



<div id="main" class="png_bg">
<div id="header">
    <h1>全部游戏</h1>
</div>	
	
	<div class="row-fluid">
		<div class="span12">
			<ul id="browserItemList" class="browserFull">
			<c:choose>
			<c:when test="${rows!=null }">
			<c:forEach items="${rows }" var="ins" varStatus="vs">
			<c:choose>
			<c:when test="${(vs.count)%2 ==1 }">
			<li id="${ins.kkc101}" class="item odd clearit">
    <a href="${ins.kkc403 }" class="subjectCover cover ll">       
            <span class="image">
                        <img src="${ins.kkc404 }" class="cover" />
                        
        </span>
        <span class="overlay"></span>
        
    </a>
    <div class="inner">
                                <h3>
                    <a href="${ins.kkc403 }" class="l">${ins.kkc402 }</a> 
                				</h3>
                
        <span class="rank"><small>Rank ${ins.kkc408 }</small></span>        
        <p class="info tip">${ins.kkc405 }
                                             </p>
                <p class="rateInfo">
                        <span class="sstars9 starsinfo"></span> <small class="fade">${ins.kkc406 }</small> <span class="tip_j">(${ins.kkc407 }人评分)</span>
                    </p>             
    </div>
</li>
</c:when>
<c:otherwise>
<li id="${ins.kkc101}" class="item even clearit">
    <a href="${ins.kkc403 }" class="subjectCover cover ll">       
            <span class="image">
                        <img src="${ins.kkc404 }" class="cover" />
                        
        </span>
        <span class="overlay"></span>
        
    </a>
    <div class="inner">
                                <h3>
                    <a href="${ins.kkc403 }" class="l">${ins.kkc402 }</a> 
                				</h3>
                
        <span class="rank"><small>Rank ${ins.kkc408 }</small></span>        
        <p class="info tip">${ins.kkc405 }
                                             </p>
                <p class="rateInfo">
                        <span class="sstars9 starsinfo"></span> <small class="fade">${ins.kkc406 }</small> <span class="tip_j">(${ins.kkc407 }人评分)</span>
                    </p>             
    </div>
</li>
</c:otherwise>
</c:choose>
</c:forEach>
</c:when>
</c:choose>								
			</ul>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
</body>
</html>