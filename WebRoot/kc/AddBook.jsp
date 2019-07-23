<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

<title>添加新番剧条目</title>
<link href="<%=path %>/css/bangumi.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="headerNeue2">
    <div class="headerNeueInner clearit">
         <div class="bg musume_4"></div>
    <a href="<%=path%>/home" class="logo"></a>
        
    
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
	            			<c:choose>
				            	<c:when test="${!empty sessionScope.user.kkd108}">
				                <a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
								<span class="avatarNeue avatarSize32 ll" 
									style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
								</a>
				            	</c:when>
				            	<c:otherwise>
				                <a class="avatar" href="<%=path%>/kd01UserMain.kdhtml">
								<span class="avatarNeue avatarSize32 ll" 
									style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
								</a>
				            	</c:otherwise>
				            </c:choose>
	            		</c:when>
	            		<c:otherwise>
							<c:choose>
				            	<c:when test="${!empty sessionScope.user.kkd108}">
				                <a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
								<span class="avatarNeue avatarSize32 ll" 
									style="background-image:url('${sessionScope.user.kkd108}');background-size: 100% auto;"></span>
								</a>
				            	</c:when>
				            	<c:otherwise>
				                <a class="avatar" href="<%=path%>/kd01AdminMain.kdhtml">
								<span class="avatarNeue avatarSize32 ll" 
									style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size: 100% auto;"></span>
								</a>
				            	</c:otherwise>
				            </c:choose>
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
   添加条目
                    </h1>

   
        
    <div class="subjectNav">
<ul class="navTabs clearit">
        <li><a href="<%= path %>/kc/AddAnime.jsp">番剧</a></li>       
        <li><a href="" class="focus">书籍</a></li>
        <li><a href="<%= path %>/kc/AddGame.jsp" >游戏</a></li>
        </ul>
	
</div>
</div>

<div class="mainWrapper"><div class="columns clearit">


<h2 class="subtitle">添加番剧条目</h2>
<form id="photoForm" method="post" enctype="multipart/form-data">
					<img id = "showPhoto" src="<%=path%>/img/avatar/def_avatar.png" style="width: 100px;height:100px">
					<input type="file" name="logos" size="25" onchange="uploadPhoto()"/><br>
					<small class="grey">仅支持上传.jpg或.png格式文件</small>
				</form>
<form action="kc03AddBook.kchtml" method="post">
<table class="olt"><tr><td></td><td></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">条目名</p></td><td>
<input type = "text" name="kkc309" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">中文名</p></td><td>
<input type = "text" name="kkc302" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">缩略信息</p></td><td>
<input type = "text" name="kkc305" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">册数</p></td><td>
<input type = "text" name="kkc310" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">话数</p></td><td>
<input type = "text" name="kkc311" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">作者</p></td><td>
<input type = "text" name="kkc312" class="inputtext" value="" /></td></tr>
<tr><td nowrap="nowrap" width="15%"><p class="tip">出版社</p></td><td>
<input type = "text" name="kkc313" class="inputtext" value="" /></td></tr>


<tr><td nowrap="nowrap" width="15%"><p class="tip">简介</p></td><td>
<textarea name="kkc314" id="content" class="reply" cols="45" rows="7"  ></textarea>

<input type="hidden" name="kkc101" value = ""  />
<input type="hidden" id="kkc304" name="kkc304" value = "">

</td></tr>
</table>
<input class="inputBtn" value="提交" name="submit" type="submit">

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
    
    
    
	function uploadPhoto()
	{
		
		$("#photoForm").attr("action","<%=request.getContextPath()%>/uploadlogosServlet")
		$("#photoForm").ajaxSubmit({
	            type: "POST",
	            dataType: "text",
	            success: function (data)
	            {
	            	
	            	if(data)
	            	{
	            		$("#showPhoto").attr("src",data);
	            		$("#kkc304").attr("value",data);
	            	}
	            }//endsuccess
	       });//endajax		
	}
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


<script src="<%=path %>/js/jquery.js" type="text/javascript" ></script>
<script src="https://cdn.bootcss.com/jquery.form/4.2.1/jquery.form.min.js"></script>
</body>


</html>