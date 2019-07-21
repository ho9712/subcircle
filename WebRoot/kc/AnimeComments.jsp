<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

<title>评论们~</title>
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

<li>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="kb01QueryItems.kbhtml?page=1">
	<img alt="前往商城" src="<%=path%>/img/shop_logo.png" style="width:150px;height:50px;">
	</a>&nbsp;&nbsp;
</li>
<li>
	<a href="<%=path %>/ka01MainForum.kahtml?id=0">
	<img alt="前往论坛" src="<%=path%>/img/forum_logo.png" style="width:150px;height:50px;">
	</a>&nbsp;&nbsp;
</li>
</ul>
</div>
</div>
        
        <!-- 顶部头像菜单 -->
	    <div class="idBadgerNeue">
	    	<c:choose>
	    		<c:when test="${empty user}">
	    			<div class="guest">
				    	<a href="<%=path %>/kd/login.jsp" class="guest login">登录</a>
			    		<a href="<%=path %>/kd/signup.jsp" class="guest signup">注册</a>
			    	</div>
	    		</c:when>
	    		<c:otherwise>
	    			<c:choose>
	            		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
	            			<a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
							<span class="avatarNeue avatarSize32 ll" 
								style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
							</a>
	            		</c:when>
	            		<c:otherwise>
	            			<a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
							<span class="avatarNeue avatarSize32 ll" 
								style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
							</a>
	            		</c:otherwise>
	            	</c:choose>
	            	<!-- 用户或管理员入口 -->
					<ul id="badgeUserPanel">
					<c:choose>
			       		<c:when test="${fn:contains('45',sessionScope.user.kkd104) }">
							<li><a href="<%=path%>/kd01UserMain.kdhtml">个人主页</a></li>                    
				       		<li><a href="<%=path%>/kc06AnimeColl.kdhtml">作品</a></li>
				       		<li><a href="<%=path%>/ka01PostRecord.kdhtml">论坛</a></li>
				       		<li><a href="<%=path%>/kb02ShopRecord.kdhtml">商城</a></li>
				       		<li class="row">
					        <a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a> | 
					        <a href="<%=path%>/kd/userpage_info.jsp">设置</a> | 
					        <a href="<%=path%>/logout.kdhtml">登出</a>
				        	</li>
				    	</c:when>
				    	<c:otherwise>
				    		<li><a href="<%=path%>/kd01AdminMain.kdhtml">个人主页</a></li>
				    		<c:choose>
				    			<c:when test="${sessionScope.kkd104 eq '0' }">
									<li><a href="<%= path %>/kd01QueryAdmin.kdhtml">Root管理员</a></li>
								</c:when>
								<c:when test="${sessionScope.kkd104 eq '1' }">
									<li><a href="<%= path %>/kd01QueryUser.kdhtml">作品管理员</a></li>
								</c:when>
								<c:when test="${sessionScope.kkd104 eq '2' }">
									<li><a href="<%= path %>/kd/shopadminpage_turn.jsp">商城管理员</a></li>
								</c:when>
								<c:when test="${sessionScope.kkd104 eq '3' }">
									<li><a href="<%= path %>/ka03QueryReport.kdhtml?flag=post">论坛管理员</a></li>
								</c:when>
				    		</c:choose>
				    		<li class="row">
				    		<a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a> | 
					        <a href="<%=path%>/kd/adminpage_info.jsp">设置</a> | 
					        <a href="<%=path%>/logout.kdhtml">登出</a>
				        	</li>
				    	</c:otherwise>
			        </c:choose>
			    	</ul>	
			    	<!-- 用户或管理员入口 -->
	    		</c:otherwise>
	    	</c:choose>
	    	
		</div>
		<!-- 顶部头像菜单 -->

<div id="headerSearchWrapper">
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
    <div class="subjectNav">
<ul class="navTabs clearit">
        <li><a href="kc02ShowDetail.kchtml?kkc101=${param.kkc101}">概览</a></li>       
        <li><a href=""   class="focus">评论</a></li>
        <li><a href="" >讨论版</a></li>
        </ul>
	
</div>
</div>
<div class="mainWrapper"><div class="columns clearit">
<div id="columnInSubjectA" class="column">
<div class="content_inner clearit"><div id="comment_box"><div class="item clearit">

    </div>
    

<div class="subject_section">





<c:choose>
			<c:when test="${rows!=null }">
			<c:forEach items="${rows }" var="comments" varStatus="vs">
			<c:choose>
			<c:when test="${(vs.count)%2 ==1 }">




<div class="item clearit">
<a href="" class="avatar">
<span class="avatarNeue avatarSize32 ll" style="background-image:url('${comments.kkd108 }');background-size: 100% auto; "></span>
</a>
<div class="text_main_even">
<div class="text">

<!-- 注意此处的星星样式以及评分
sstars1-10即评分 根据数据读取即可
链接里是用户个人中心的链接
图片复用个人中心的头像
用户ID
 -->
 
 
            <a href="" class="l">${comments.kkd105 }</a> <small class="grey">${comments.kkc704 }</small> <span class="sstars${comments.kkc702 } starsinfo"></span>         <p>${comments.kkc703 }</p>
</div>
</div>
</div>


</c:when>
<c:otherwise>
<div class="item clearit">
<a href="" class="avatar"><span class="avatarNeue avatarSize32 rr" style="background-image:url('${comments.kkd108 }');background-size: 100% auto;"></span></a>
<div class="text_main_odd">
<div class="text">

<!-- 注意此处的星星样式以及评分
sstars1-10即评分 根据数据读取即可
链接里是用户个人中心的链接
图片复用个人中心的头像
用户ID
 -->
 
 
            <a href="" class="l">${comments.kkd105 }</a> <small class="grey">${comments.kkc704 }</small> <span class="sstars${comments.kkc702 } starsinfo"></span>         <p>${comments.kkc703 }</p>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</c:when>
</c:choose>

 <div class="clearit"><div class="page_inner">
			 
			 <a href="kc02ShowComments.kchtml?page=1" class="p">|&lsaquo;</a>
			 <c:if test="${param.page >1}"><a href="kc02ShowRank.kchtml?page=${param.page-1 }&kkc101=${param.kkc101}" class="p">&lsaquo;&lsaquo;</a></c:if>
			 <strong class="p_cur">${empty param.page?'1':param.page}</strong>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'2':param.page+1}&kkc101=${param.kkc101}" class="p">${empty param.page?'2':param.page+1}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'3':param.page+2}&kkc101=${param.kkc101}" class="p">${empty param.page?'3':param.page+2}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'4':param.page+3}&kkc101=${param.kkc101}" class="p">${empty param.page?'4':param.page+3}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'5':param.page+4}&kkc101=${param.kkc101}" class="p">${empty param.page?'5':param.page+4}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'6':param.page+5}&kkc101=${param.kkc101}" class="p">${empty param.page?'6':param.page+5}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'7':param.page+6}&kkc101=${param.kkc101}" class="p">${empty param.page?'7':param.page+6}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'8':param.page+7}&kkc101=${param.kkc101}" class="p">${empty param.page?'8':param.page+7}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'9':param.page+8}&kkc101=${param.kkc101}" class="p">${empty param.page?'9':param.page+8}</a>
			 <a href="kc02ShowComments.kchtml?page=${empty param.page?'10':param.page+9}&kkc101=${param.kkc101}" class="p">${empty param.page?'10':param.page+9}</a>
			 <c:if test="${param.page <640 }"><a href="kc02ShowComments.kchtml?page=${param.page+1 }&kkc101=${param.kkc101}" class="p">&rsaquo;&rsaquo;</a></c:if>			 
			 <a href="kc02ShowComments.kchtml?page=640&kkc101=${param.kkc101}" class="p">&rsaquo;|</a>
			 <a class="p_pages" style="padding: 0px">
			 <input class="inputtext" style="width:30px;" type="text" name="custompage" onKeyDown="if(event.keyCode==13) {window.location='kc02ShowComments.kchtml?page='+this.value + '&kkc101=${param.kkc101}'; return false;}"></a>
			 <span class="p_edge">(&nbsp;${empty param.page?'1':param.page}&nbsp;/&nbsp;640&nbsp;)</span>
			 </div>
			 </div>



</div>
</div>  
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