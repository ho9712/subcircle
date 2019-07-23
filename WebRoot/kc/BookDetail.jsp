<%@ page language="java" pageEncoding="UTF-8" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>

<style> 
pre {
font-size:12px;
white-space: pre-wrap;
word-wrap: break-word;
} 
</style> 

<title>${ins.kkc309}</title>
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
   <a href="${ins.kkc303}" title="${ins.kkc302}" property="v:itemreviewed"></a>
   ${ins.kkc309}
                    </h1>

    
        
    <div class="subjectNav">
<ul class="navTabs clearit">
        <li><a href="${ins.kkc303}" class="focus">概览</a></li>       
        <li><a href="kc03ShowComments.kchtml?kkc101=${param.kkc101 }" >评论</a></li>
        <li><a href="<%=path%>/ka01MainForum.kahtml?id=0&kkc101=${param.kkc101}" >讨论版</a></li>
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
                
    <c:choose>
    <c:when test="${sessionScope.user.kkd101!=null }">
                
                
        <div class="modifyTool">        
        <span class="tip_i">
                <p><span class="tip">修改：</span>               
                	<c:choose>
                	<c:when test="${sessionScope.user.kkd104==1 }">
                	<a href="kc03Edit.kchtml?kkc101=${param.kkc101 }" class="l">
                	</c:when>
                	<c:when test="${sessionScope.user.kkd104==4 }">
                	<a href="kc03Edit.kchtml?kkc101=${param.kkc101 }" class="l">
                	</c:when>
                	<c:otherwise>
                	<a href="#" class="l" onclick="leveltip()">                	
                	</c:otherwise>                	                	
                	</c:choose>                                
 					信息</a></p>             
        </span>
        </div>     
        
        </c:when>
        </c:choose>	     
        </div>
</div>

    </div>
    <div id="columnSubjectHomeB" class="column">
   <div id="columnSubjectInHomeB" class="clearit">
            <div id="subject_detail" class="ll"> 
    <div id="subject_summary" class="subject_summary" property="v:summary"><pre>${ins.kkc314}</pre></div>
    			<small class="gery clearit"><a href="#;" id="show_summary"  class="rr l">more...</a></small>
    			</div>
    			         <div id="panelInterestWrapper">
           <div class="SidePanel png_bg">
           
           
        
<h2>收藏盒</h2>
        <div id="SecTab">
        
        <c:choose>
    <c:when test="${sessionScope.user.kkd101!=null }">
    <c:choose>
    <c:when test="${b }">
    <span class="interest_now">已收藏</span> 
            
        <a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" id="modifyCollect" title="修改收藏" class="thickbox l">修改</a>     <a href="kc03DelComments.kchtml?kkc101=${param.kkc101 }&kkd101=${sessionScope.user.kkd101 }"  class="l">删除</a><br />
    
    
    </c:when>
    <c:otherwise>
     <ul class="secTab tiny">
        
        
        <!--<li><a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="加入收藏"  onclick="GenInterestBox('wish')" class="thickbox"><span>收藏</span></a></li>
          -->
        <li><a href="#TB_inline?height=350&amp;width=500&amp;inlineId=panel" title="加入收藏"  onclick="GenInterestBox('collect')" class="thickbox"><span>收藏并评分</span></a></li>
                </ul>
    </c:otherwise>
    </c:choose>
   
        </c:when>
        </c:choose>
    </div>
    <div class="clear"></div>
    <hr class="board" />


<!-- 评分 -->

<div id="panel" style="display:none;"><div class="collectBox clearit">

	<c:choose>
	<c:when test="${b }">
	<form id="collectBoxForm" name="collectBoxForm" method="post" action="kc03UpdateComment.kchtml">
	</c:when>
	<c:otherwise>
	<form id="collectBoxForm" name="collectBoxForm" method="post" action="kc03AddComment.kchtml">
	</c:otherwise>
	</c:choose>

    
    <input  type="hidden" name="kkc101" value="${param.kkc101 }"/>
    <input  type="hidden" name="kkd101" value="${sessionScope.user.kkd101 }"/>
    <input type="hidden" name="referer" value="subject">
    <div class="collectType cell">
    
    <!-- <label><input value="1" id="wish" name="interest" onclick="GenInterestBox('wish')"  type="radio"> 收藏</label>&nbsp;&nbsp;
    
    <label><input value="2" id="collect" name="interest" onclick="GenInterestBox('collect')"  type="radio"> 收藏并评分</label>&nbsp;&nbsp;
     -->
        
                
        </div>

<div id="interest_rate" class="cell" style="">
  
<span class="tip">我的评价:</span> <span class="alarm" id="rating-tip"></span>
        <div class="clearit">
            <input style="display: none;" id="rating" name="rating" type="radio" class="star rating" value="1" title="不忍直视 1 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="2" title="很差 2 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="3" title="差 3 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="4" title="较差 4 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="5" title="不过不失 5 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="6" title="还行 6 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="7" title="推荐 7 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="8" title="力荐 8 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="9" title="神作 9 "  />
                <input style="display: none;" id="rating" name="kkc702" type="radio" class="star rating" value="10" title="超神作 10 (请谨慎评价)"  />
                </div>
</div>
    <div class="cell">
    <p class="tip"><label for="comment">吐槽 (简评，最多200字):</label></p>
    <textarea name="kkc703" id="comment" cols="32" rows="3" class="quick"></textarea>
    </div>
    <div class="clearit">
    <div id="submitBtnO" class="ll">
        <input class="inputBtn" type="submit" name="update" value="保存" />
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
    
    
   <!-- <ul class="horizontalChart">
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
        </ul>-->
    
    </div>
</div>
</div>
                                                           
</div> 
    </div>

    <div class="subject_section">
<div class="rr"><a href="#;" onclick="switchDisplay('new_topic');" class="chiiBtn"><span>添加新讨论</span></a></div><h2 class="subtitle">讨论版</h2>

<table class="topic_list" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:0px;"><tbody>  
 <c:choose>
			<c:when test="${rows2!=null }">
			<c:forEach items="${rows2 }" var="topics" varStatus="vs">
			<c:choose>
			<c:when test="${(vs.count)%2 ==1 }">
	<tr class="odd">
    <td class="subject"><a href="<%=path%>/ka01PostContent.kahtml?kka101=${topics.kka101}" title="${topics.kka102 }" class="l">${topics.kka102 }</a></td>
    <td width="15%"><a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${topics.kkd101 }">${topics.kkd105 }</a></td>
    <td width="15%" align="right"><small class="grey"></small></td>
    <td width="15%" align="right"><small class="grey">${topics.kka105 }</small></td>
    </tr>    
    </c:when>
    <c:otherwise>
    <tr class="even">
    <td class="subject"><a href="<%=path%>/ka01PostContent.kahtml?kka101=${topics.kka101}" title="${topics.kka102 }" class="l">${topics.kka102 }</a></td>
    <td width="15%"><a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${topics.kkd101 }">{topics.kkd105 }</a></td>
    <td width="15%" align="right"><small class="grey"></small></td>
    <td width="15%" align="right"><small class="grey">${topics.kka105 }</small></td>
    </tr>
    </c:otherwise>
        </c:choose></c:forEach>
        </c:when>
        </c:choose>
<tr><td>&nbsp</td><td width="15%"></td><td width="15%"></td><td width="15%" align="right"><a href="<%=path%>/ka01MainForum.kahtml?id=0&kkc101=${param.kkc101}" class="more">更多讨论 »</a></td></tr>
</tbody></table>
<a name="new"></a>
<div id="new_topic" style="display:none;">
<h2 class="subtitle">添加新讨论</h2>
<span class="tip">
<form id="newTopicForm" name="new_comment" method="post" action="ka01Posting.kahtml">
<input type="hidden" name="formhash" value="2dae75e4">
<input type="hidden" name="kkd101" value="${sessionScope.user.kkd101 }">
<input type="hidden" name="kkc101" value="${param.kkc101 }">
<input type="hidden" name="kka103" value="2">
<input type="hidden" name="id" value="0">
<table align="center" width="99%" class="settings">
<tr><td valign="top" width="10%">标题</td><td valign="top"><input id="title" name="kka102" class="inputtext" type="text"></td></tr>
<tr><td valign="top" width="10%">正文</td><td valign="top"><textarea name="kka104" id="content" cols="45" rows="7" class="reply" onKeyDown="seditor_ctlent(event,'newTopicForm');"></textarea></td></tr>
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
<h2 class="subtitle">吐槽箱</h2><div id="comment_box">




<c:choose>
			<c:when test="${rows!=null }">
			<c:forEach items="${rows }" var="comments" varStatus="vs">
			<c:choose>
			<c:when test="${(vs.count)%2 ==1 }">




<div class="item clearit">
<!-- 头像 -->
<c:choose>
   	<c:when test="${!empty comments.kkd108}">
  		 <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${comments.kkd101 }" class="avatar">
       	<span class="avatarNeue avatarSize32 ll" style="background-image:url('${comments.kkd108 }');background-size:100% auto;"></span>
       </a>
   	</c:when>
   	<c:otherwise>
  		<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${comments.kkd101 }" class="avatar">
       	<span class="avatarNeue avatarSize32 ll" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size:100% auto;"></span>
       </a>
   	</c:otherwise>
</c:choose>
<!-- 头像 -->
<div class="text_main_even">
<div class="text">

<!-- 注意此处的星星样式以及评分
sstars1-10即评分 根据数据读取即可
链接里是用户个人中心的链接
图片复用个人中心的头像
用户ID
 -->
 
 
            <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${comments.kkd101 }" class="l">${comments.kkd105 }</a> <small class="grey">${comments.kkc704 }</small> <span class="sstars${comments.kkc702 } starsinfo"></span>         <p>${comments.kkc703 }</p>
</div>
</div>
</div>


</c:when>
<c:otherwise>
<div class="item clearit">
<!-- 头像 -->
<c:choose>
   	<c:when test="${!empty comments.kkd108}">
  		 <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${comments.kkd101 }" class="avatar">
       	<span class="avatarNeue avatarSize32 ll" style="background-image:url('${comments.kkd108 }');background-size:100% auto;"></span>
       </a>
   	</c:when>
   	<c:otherwise>
  		<a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${comments.kkd101 }" class="avatar">
       	<span class="avatarNeue avatarSize32 ll" style="background-image:url('<%=path%>/img/avatar/def_avatar.png');background-size:100% auto;"></span>
       </a>
   	</c:otherwise>
</c:choose>
<!-- 头像 -->
<div class="text_main_odd">
<div class="text">

<!-- 注意此处的星星样式以及评分
sstars1-10即评分 根据数据读取即可
链接里是用户个人中心的链接
图片复用个人中心的头像
用户ID
 -->
 
 
            <a href="<%=path%>/kd01FindOther.kdhtml?kkd101=${comments.kkd101 }" class="l">${comments.kkd105 }</a> <small class="grey">${comments.kkc704 }</small> <span class="sstars${comments.kkc702 } starsinfo"></span>         <p>${comments.kkc703 }</p>
</div>
</div>
</div>
</c:otherwise>
</c:choose>
</c:forEach>
</c:when>
</c:choose>





</div><a href="kc03ShowComments.kchtml?kkc101=${param.kkc101 }" class="more">更多吐槽 »</a>
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

<script type="text/javascript">
function leveltip()
{
	alert("权限不足！")
	}

</script>
<script type="text/javascript">chiiLib.subject.init();</script>
</body>
</html>