<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function onClickReply(kka201) 
	{
		document.getElementById("kka201-2").value = kka201;
	}
		
	function onClickDel(kka101,kka102,kkd102) 
	{
		window.location.href = "<%=path%>/ka01AdmDelForum.kahtml?"
				+"kka101=" + kka101
				+"&kka102=" + kka102
				+"&kkd203=" + kkd102
				+"&kkd202=" + "${kkd102}";
	}
	
	function onClickDelAnswer(kka101, kka201,kka202,kkd102) 
	{
		window.location.href = "<%=path%>/ka02AdmDelAnswer.kahtml?"
			+"kka101=" + kka101
			+"&kka201=" + kka201
		    +"&kka202=" + kka202
		    +"&kkd203=" + kkd102
		    +"&kkd202=" + "${kkd102}";
	}
</script>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1" name="viewport">
<title>${ins.kka102 }</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/bangumi.css">

</head>
<style type="text/css">
pre {
	white-space: pre-wrap;
	word-wrap: break-word;
}
</style>

<body class="bangumi">
	<div id="wrapperNeue" class="wrapperNeue">
		 <!-- 顶部栏 -->
<div id="headerNeue2">
    <div class="headerNeueInner clearit">
         <div class="bg musume_4"></div>
   		 <a href="/" class="logo">Bangumi 番组计划</a>
        
		<input type="checkbox" id="navMenuNeueToggle" />        
		<label for="navMenuNeueToggle" class="menuCompact"></label>
	<!-- 顶部导航 -->
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
		
		<li>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="kb01QueryItems.kbhtml">
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
	<!-- 顶部导航 -->
	
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
	</div>
	<!-- 顶部头像菜单 -->
	
	<!-- 顶部搜索栏 -->
	<div id="headerSearchWrapper">
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
	<!-- 顶部搜索栏 -->
    </div>
</div>
<!-- 顶部栏 -->

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
</div>
</div>
	<!-- 论坛导航栏 -->
     
     
	 <div class="mainWrapper">
	<div class="columns clearit">
	<div id="columnA" class="column">
        
         <!-- 贴子头部  开始 -->
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
      </font>
       </div> 
        <hr class="board" />
    <div style="margin-left: 10px">
    <ul style="margin-left: 20px">
      <li style="margin-left: 10px">
      <pre>       
      ${ins.kka104 }
      </pre> 
      </li>
    </ul>
    </div>  
    <br>
    <br>
    <br>
    <hr class="board" />
    <div id="SecTab">
    <div>
    <div>
      <ul class="secTab tiny">
           <li>
           <a href="#" title="删除贴子" class="nav" style="color:black" onclick="onClickDel('${ins.kka101}','${ins.kka102}','${ins.kkd102 }')">删除</a>
          </li>
          <li><a href="#bottom">回复</a></li>
          <li>
               <a  href="#" onclick="itemInfo(${ins.kka101 })">收藏</a>
        </li>
        <li style="float: right;">
          <div style="margin-left: 20px;margin-top: 6px;" >
               ${ins.kka105 }
          </div>
        </li>
        <li style="float: right;">
          <div style="margin-top: 6px;float: right;">
                    楼主
          </div>
        </li>
          </ul>
      </div>
      </div>
      </div>
      </div>
      <!-- 贴子头部  结束 -->
      
      <!-- 贴子下其他回复 -->
	  <div class="clear"></div>
		<div id="timeline">
			<ul>
			<c:forEach items="${rows }" var="ins">
			  <c:if test="${ins.kka204 == 1 }">
				<div class="menu_inner"  style="width: 85%; margin-left: 15px; float: left">
                  <div id="columnA">
				<div class="menu_inner" style="width: 75px; float: left; background-color: #F5F5F5">
				<div class="headerAvatar"  style="margin-top: 5px">
				 <c:choose>
					<c:when test="${!empty ins.kkd108}">
					   <a href="#" class="avatar"> <span class="avatarNeue avatarSize75" style="background-image:url('${ins.kkd108}')"></span></a>
					</c:when>
					<c:otherwise>
					    <a href="#" class="avatar"> <span class="avatarNeue avatarSize75" style="background-image:url('<%=path%>/img/avatar/def_avatar.png')"></span></a>
					</c:otherwise>
					</c:choose>
			    </div>
					<div align="center">
					<font size="2" style="width: 10%; height: 15px; margin-top: 65px"> ${ins.kkd105 } </font> 
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
   
    <div  id="columnA" style="margin-left: 5px;margin-right: 15px;width: 99%">
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
				<li><a href="#"  onclick="onClickDelAnswer('${ins.kka101}','${ins.kka201}','${ins.kka202 }','${ins.kkd102 }')">
						<span>删除</span>
				</a></li>

				<li> <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel2" title="发表回复"  
				onclick="onClickReply('${ins.kka201}')" class="thickbox"><span>回复</span></a>
				</li>
				    
				<li style="float: right;">
					<div style="margin-left: 20px; margin-top: 6px;">
						${ins.kka203 }</div>
				</li>
				<li style="float: right;">
					<div style="margin-top: 6px; float: right;">
						${ins.kka201 }楼</div>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	</c:if>
</c:forEach>



<!-- 回复的回复弹窗 -->
<div id="panel2" style="display: none;">
<div class="collectBox clearit">
	<form method="post"
		action="ka02AdmPostAnswerToAnswer.kahtml?kka101=${ins.kka101 }">
					<input type="hidden" id="kka201-2" name="kka201-2" value="">
					<div class="cell">
						<p class="tip">
							<label for="comment"> 回复(最多200字): </label>
						</p>
						<br /> <br />
						<textarea rows="20" cols="70" name="kka202"
							required="required"></textarea>
					</div>
					<div class="clearit">
						<div id="submitBtnO" class="ll">
							<input class="inputBtn" type="submit" name="next" value="提交" />
						</div>
					</div>
				</form>
			</div>
           </div>
           </ul>
</div>

     <div class="light_odd">
	   <span class="tip">
		<form id="editTopicForm" name="new_comment" method="post"  action="ka02AdmPostAnswer.kahtml?kka101=${ins.kka101 }">
           <a name="bottom"></a>	
           <input type="hidden" name="kka201" value="${param.kka201 }" />
        <table align="center" width="99%" class="settings">
	     <tr>
		<td valign="top" width="10%">评论</td>
		<td valign="top"><textarea id="tpc_content" name="kka202"  cols="45" rows="5" style="width: 550px;" 
		        class="quick newBlogEntry loadEditor"   required="required"></textarea>
	    <tr>
		<td valign="top" width="10%"></td>
		<td valign="top">
		<div id="submitBtnO">
		    <input class="inputBtn" value="加上去" name="next"  type="submit" />
		</div>
		</td>
		</tr>
		</table>
		<div id="related_value_list"></div>
	  </form>
		</span>
	</div>
    </div>
    
    
    
   
 <!-- 我要发帖 -->
  <div id="columnB" class="column">
	 <br> <br> <br> <br>
     <div id="sideLayout">
	 <div class="SidePanel png_bg" align="left">
	 <h2><a href="<%=path %>/ka/posting.jsp">我要发贴</a></h2>
	</div>
    </div>
  <!-- 我要发帖 -->
	
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
		您可以管理网站贴子！<br />
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



<div class="homeBg"></div>
<!-- 底部菜单栏 -->
<div id="dock">
    <div class="content">
        <ul class="clearit">
        <li class="first"><a href="<%=path%>/kd01UserMain.kdhtml">${sessionScope.user.kkd102 }</a></li>
        <li><a href="<%= path %>/kd02QueryReceive.kdhtml?username=${user.kkd102}">短信</a></li>
        <li><a href="<%=path%>/kd/userpage_info.jsp">设置</a></li>
        <li><a href="<%=path%>/logout.kdhtml">登出</a></li>
        <li class="last"><a href="javascript:void(0);" id="showrobot">&nbsp;</a></li>
        </ul>
    </div>
</div>
<!-- 底部菜单栏 -->


	<script src="js/bangumi.js" type="text/javascript"></script>
	<script src="<%=path%>/js/bangumi.js" type="text/javascript"></script>
	<script type="text/javascript">
		function setKKa202() {
			var kka202 = document.getElementById("comment");
			kka202.value = kka202.innerHTML;
			alert(kka202.innerHTML)
		}
		
	    function itemInfo(kka101)
		{
			window.location.href = "<%=path%>/ka04AdmAddCollection.kahtml?kka101=" + kka101;
		}
	</script>
	<script type="text/javascript">
		chiiLib.login.init();
	</script>
</body>
</html>