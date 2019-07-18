<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function onClickReport(kka201)
	{
		document.getElementById("kka201-1").value=kka201;
	}
	
	function onClickReply(kka201)
	{
		document.getElementById("kka201-2").value=kka201;
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
<style type="text/css">
	pre {
white-space: pre-wrap;
word-wrap: break-word;
}
</style>
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
   <!-- 主页个人信息 -->
    <div class="headerContainer">
    	<h1 class="nameSingle">
            <div class="rr">
            </div>
            <div class="inner">
                <b class="grey">欢迎来到论坛~</b>
                <a href="<%=path%>/kd/userpage_main.jsp">${sessionScope.user.kkd105 }</a>
            </div>
    	</h1>
    </div>
    <!-- 主页个人信息 -->
    
    <!-- 论坛导航栏 -->
    <div class="subjectNav">
      <ul class="navTabs">
      <li><a href="ka01MainForum.kahtml?id=0" class="focus">全部</a></li>
        <li><a href="ka01AnimeForum.kahtml?id=1">番剧</a></li>
        <li><a href="ka01BookForum.kahtml?id=2">书籍</a></li>
        <li><a href="ka01GameForum.kahtml?id=3" >游戏</a></li>
      </ul>
    </div>
	<!-- 论坛导航栏 -->
</div>
</div>

<div class="mainWrapper">
<div class="columns clearit">
<div id="columnA" class="column">
               
               
                <!-- 贴子主体（头部） -->
  <div id="timeline" class="menu_inner" style="width:85%;margin-left: 15px;float: left;background-color: white;">
    <div  id="columnA">
      <div class="menu_inner" style="width:75px;float: left;background-color: #F5F5F5">
      
            <div class="headerAvatar" style="margin-top: 5px">
              <c:choose>
            	<c:when test="${!empty ins.kkd108}">
           		 <a href="#" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('${ins.kkd108}')"></span>
                </a>
            	</c:when>
            	<c:otherwise>
           		<a href="#" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png')"></span>
                </a>
            	</c:otherwise>
              </c:choose>
            </div>
            <div align="center">
              <font size="2" style="width:10%;height:15px;margin-top: 65px;">
              ${ins.kkd105 }
              </font>
            </div>
        
      </div>
      </div >
      <div id="columnB">
      <font size="3" style="width:80%;height:15px;margin-left: 10px">
        <a href="#">
          <b>
            ${ins.kka102 }
          </b>
       </a>
         <a href="#" onclick="itemInfo(${ins.kka101 })">收藏</a>
         <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="举报理由"  class="thickbox">举报 </a>
       </font>
    </div>
    <hr class="board" />
    
    <div style="margin-left: 60px">
    <ul style="margin-left: 50px">
      <li style="margin-left: 10px">
      <pre>       
      ${ins.kka104 }
      </pre> 
      </li>
    </ul>
    </div>
    <br>
    <div style="margin-left: 20px" align="right">
        楼主&nbsp&nbsp&nbsp ${ins.kka105 }
    </div>
  </div>
  
    <!-- 举报弹窗 ,举报贴子-->
	<div id="panel" style="display:none;">
    <div class="collectBox clearit">
    <form method="post" action="ka03PostReport.kahtml?kka101=${ins.kka101 }">
    <div class="cell">
    <p class="tip"><label for="comment">举报(最多200字):</label></p>
    <br/><br/>
    <textarea rows="20" cols="70" name="kka302-1" required="required"></textarea>
    </div>
    <div class="clearit">
    <div id="submitBtnO" class="ll">
        <input class="inputBtn" type="submit" name="report" value="举报" />
    </div>
    </div>
   </form>
   </div>
   </div>
   <br>
   
  <!-- 贴子回复 -->
   <div class="clear"></div>
  <div id="timeline">
  <ul>
	<c:forEach items="${rows }" var="ins">
	<c:if test="${ins.kka204 == 1 }">
	  <div class="menu_inner" style="width:85%;margin-left: 15px;float: left">
	  
	  <div  id="columnA">
      <div class="menu_inner" style="width:75px;float: left;background-color: #F5F5F5">
       
            <div class="headerAvatar" style="margin-top: 5px">
              <c:choose>
            	<c:when test="${!empty ins.kkd108}">
           		 <a href="#" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('${ins.kkd108}')"></span>
                </a>
            	</c:when>
            	<c:otherwise>
           		<a href="#" class="avatar">
                	<span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png')"></span>
                </a>
            	</c:otherwise>
              </c:choose>
            </div>
            <div align="center">
          <font size="2" style="width:10%;height:15px;margin-top: 65px">
              ${ins.kkd105 }
          </font>
          </div>
       
      </div>
      </div>
	  <li class="clearit tml_item">
          <div style="width:85%;margin-left: 15px">
   	        <c:if test="${ins.ka02_kka201 ne 0}">
   		      <div>
	            <span>
	                       回复 ${ins.ka02_kka201 }楼
	            </span>
	            <c:choose>
	            <c:when test="${ins.delSign ne 0}">
	            <div class="menu_inner">
	            <pre>${ins.rootAnswer }</pre>
	            </div>
	            </c:when>
	            <c:otherwise>
	            <div class="menu_inner">
	            <pre>该回复被删除了哦</pre>
	            </div>
	            </c:otherwise>
	            </c:choose>
    	      </div>
    	      <hr class="board" />
   	       </c:if>
   
    <div  id="columnA" style="margin-left: 5px">
      <pre>
      ${ins.kka202 }
      </pre>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    </div>
   </li>
   <hr class="board" />
     <div id="SecTab">
      <ul class="secTab tiny">
        <li>
        <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel1" title="举报理由" 
         onclick="onClickReport('${ins.kka201}')" class="thickbox">
        <span>举报</span>
        </a>
        </li>
        <li>
        <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel2" title="发表回复" 
         onclick="onClickReply('${ins.kka201}')" class="thickbox">
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
	
	<!-- 举报弹窗 ,举报回复-->
	<div id="panel1" style="display:none;">
    <div class="collectBox clearit">
    <form method="post" action="ka03AnswerReport.kahtml?kka101=${ins.kka101 }">
    <input type="hidden" id="kka201-1" name="kka201-1" value="">
    <div class="cell">
    <p class="tip"><label for="comment">举报(最多200字):</label></p>
    <br/><br/>
    <textarea rows="20" cols="70" name="kka302-2" required="required"></textarea>
    </div>
    <div class="clearit">
    <div id="submitBtnO" class="ll">
        <input class="inputBtn" 
        type="submit" name="next" value="举报" />
    </div>
    </div>
   </form>
   </div>
   </div>
   
   <!-- 回复弹窗 -->
	<div id="panel2" style="display:none;">
    <div class="collectBox clearit">
    <form method="post" action="ka02PostAnswerToAnswer.kahtml?kka101=${ins.kka101 }">
    <input type="hidden" id="kka201-2" name="kka201-2" value="">
    <div class="cell">
    <p class="tip"><label for="comment"> 回复(最多200字): </label></p>
    <br/><br/>
    <textarea rows="20" cols="70" name="kka202" required="required"></textarea>
    </div>
    <div class="clearit">
    <div id="submitBtnO" class="ll">
        <input class="inputBtn" 
        type="submit" name="next" value="提交" />
    </div>
    </div>
   </form>
   </div>
   </div>
  
   </ul>
 </div>
 
 
<!-- 回复贴子-->
<div class="light_odd">
<span class="tip">
<form id="editTopicForm" name="new_comment" method="post" action="ka02PostAnswer.kahtml?kka101=${ins.kka101 }">		
  <input type="hidden" name="kka201" value="${param.kka201 }" />
<script type="text/javascript">var CHOBITS_SID = 'aru27g'; var SCRIPT_URL = '/blog/upload_photo';</script> 
<table align="center" width="99%" class="settings">
  <tr><td valign="top" width="10%">评论</td><td valign="top">
  <textarea  id="tpc_content" name="kka202"   required="required"  cols="45" rows="5"  style="width:550px;" class="quick newBlogEntry loadEditor"  onKeyDown="seditor_ctlent(event,'editTopicForm');"></textarea>
<tr>
<td valign="top" width="10%"></td><td valign="top">
<div id="submitBtnO"><input class="inputBtn" value="加上去" name="next" type="submit" /> </div>
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
</div>
<div id="sideLayout"><div id="friend" class="sort">
<div class="SidePanel png_bg" align="left">
<h2><a href="<%=path %>/ka/posting.jsp">我要发贴</a></h2>
</div>
</div>
</div>

<!-- 展示 -->
<div id="robot" >
<div id="ukagaka_shell">
<div class="ui_10 shell_1">
<div id="ukagaka_voice"></div>
<div id="robot_balloon" class="ukagaka_balloon_pink">
<div class="tools"><a href="javascript:void(0);" id="ukagaka_menu"></a></div>    
<div class="inner">
<div id="robot_speech" class="speech" >
<c:choose>
	<c:when test="${empty msg }">
		<strong>『贴子详情』</strong><br />
		您可以浏览网站贴子！<br />
	</c:when>
	<c:otherwise>
		<strong>${msg }</strong><br />
	</c:otherwise>
</c:choose>

</div>
</div>
<div class="ukagaka_balloon_pink_bottom"></div>	
</div>
</div>
</div>
</div>
<!-- 展示 -->
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


<script src="js/bangumi.js" type="text/javascript"></script>
<script src="<%=path %>/js/bangumi.js" type="text/javascript"></script>
<script type="text/javascript">
    
    function setKKa202() {
    	var kka202 = document.getElementById("comment");
    	kka202.value = kka202.innerHTML;
    	alert(kka202.innerHTML)
}
    
</script>
<script type="text/javascript">chiiLib.login.init();</script>
<script type="text/javascript">
function itemInfo(kka101)
{
	window.location.href = "<%=path%>/ka04AddCollection.kahtml?kka101=" + kka101;
}
</script>
</body>
</html>