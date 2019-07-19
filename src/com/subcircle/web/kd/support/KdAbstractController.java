package com.subcircle.web.kd.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.subcircle.services.support.ServicesInterface;
import com.subcircle.system.tools.Tools;
import com.subcircle.web.ControllerInterface;

public abstract class KdAbstractController implements ControllerInterface 
{
	/***********************************************************
	 * 					设置具体的Services实例
	 ***********************************************************/
	
	private ServicesInterface services=null;
	
	protected final void setServices(ServicesInterface services)
	{
		this.services=services;
	}
	
		
	/***********************************************************
	 * 					为Services传递DTO
	 ***********************************************************/
	
	private Map<String, Object> dto=null;
	
	@Override
	public final void setDto(Map<String, Object> dto) 
	{
		this.dto=dto;
		//为Services传递DTO
		this.services.setServicesDto(dto);
	}
	
	/***********************************************************
	 * 					保存Session
	 ***********************************************************/
	
	private HttpSession session=null;
	
	@Override
	public void setSession(HttpSession session) 
	{
		this.session=session;
	}
	
	
	/***********************************************************
	 * 					为页面传递数据方法
	 ***********************************************************/
	
	private Map<String, Object> attribute=new HashMap<>();
	
	@Override
	public final Map<String, Object> getAttribute() 
	{
		return this.attribute;
	}
	
	private final void saveAttribute(String key,Object value)
	{
		this.attribute.put(key, value);
	}
	
	/***********************************************************
	 * 			通过Service实现具体业务操作并设置页面标签
	 ***********************************************************/
	
	/**
	 * 批量查询操作并设置页面显示的标签
	 * @throws Exception
	 */
	protected final void queryAndShow()throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "无匹配结果！");
		}
	}
	
	/**
	 * 单一查询操作并设置页面显示的标签
	 * @throws Exception
	 */
	protected final void findByIdAndShow()throws Exception
	{
		Map<String, String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins", ins);
		}
		else
		{
			this.saveAttribute("msg", "提示：该数据已被删除或禁止访问！");
		}
	}
	
	/**
	 * 更新操作，并设置操作提示信息
	 * @param updateName
	 * @param typeMsg
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeMsg)throws Exception
	{
		String msg=typeMsg+(this.executeMethod(methodName)?"成功":"失败");
		this.saveAttribute("msg", msg);
	}
	
	protected final void update(String methodName,String typeMsg,String extMsg,String key)throws Exception
	{
		String msg=typeMsg+(this.executeMethod(methodName)?"成功":"失败");
		msg+=extMsg+this.dto.get(key);
		this.saveAttribute("msg", msg);
	}
	
	//通过反射机制，传递方法名执行Services中的方法
	private boolean executeMethod(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//设置访问权限，使能够访问private方法
		method.setAccessible(true);
		return (boolean)method.invoke(this.services);
	}
	
	private List<Map<String, String>> executeQueryForList(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//设置访问权限，使能够访问private方法
		method.setAccessible(true);
		return (List<Map<String, String>>)method.invoke(this.services);
	}
	
	private Map<String, Object> executeQueryForMap(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//设置访问权限，使能够访问private方法
		method.setAccessible(true);
		return (Map<String, Object>)method.invoke(this.services);
	}

	/**
	 * 更新操作后重新查询
	 * @throws Exception
	 */
	protected final void queryForDelAndShow()throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	
	/*********************************************************************
	 * 						根据需要在此写方法
	 *********************************************************************/

	//消息提示
	private void setHint(String hint,String msg)
	{
		this.saveAttribute("hint", hint);
		this.saveAttribute("msg", msg);
	}
	
	//用户注册
	protected final void userSignUp()throws Exception
	{
		if(this.dto.get("kkd102").toString().length()<6 || this.dto.get("kkd102").toString().length()>12)
		{
			this.setHint("失败", "请确保你的用户名长度在6-12位之间！");
		}
		else if(this.dto.get("kkd103").toString().length()<6 || this.dto.get("kkd103").toString().length()>16)
		{
			this.setHint("失败", "请确保你的密码长度在6-16位之间！");
		}
		else if(!this.dto.get("kkd103").equals(this.dto.get("kkd103-1")))
		{
			this.setHint("失败", "请确保你输入的两次密码保持一致！");
		}
		else
		{
			if(this.executeMethod("userSignUp"))
			{
				this.setHint("成功", "注册成功！");
			}
			else
			{
				this.setHint("失败", "此用户名已被使用，请换一个试试！");
			}
		}
	}

	//用户登录
	protected String userLogin()throws Exception
	{
		Map<String, String> user=services.findById();
		if(user==null)
		{
			this.setHint("登录失败", "此账号不存在！");
			return "kd/login";
		}
		else if(!user.get("kkd103").equals(Tools.getMd5(dto.get("kkd103"))))
		{
			this.setHint("登录失败", "请确认你的用户名、密码正确！");
			return "kd/login";
		}
		else
		{
			user.remove("kkd103");
			this.session.setAttribute("kkd101", user.get("kkd101"));
			this.session.setAttribute("kkd102", user.get("kkd102"));
			this.session.setAttribute("kkd104", user.get("kkd104"));
			this.session.setAttribute("user", user);
			this.dto.put("username", user.get("kkd102"));
			if(user.get("kkd104").toString().equals("4") || user.get("kkd104").toString().equals("5"))
			{
				return this.userMain();
			}
			else
			{
				return this.adminMain();
			}
		}
	}
	
	//返回用户主页
	protected final String userMain()throws Exception
	{
		if(this.session.getAttribute("user")!=null)
		{
			this.dto.put("username", this.session.getAttribute("kkd102"));
			this.session.removeAttribute("msgs");
			List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
			this.session.setAttribute("msgs", msgs);
			if(this.dto.get("kkd101")==null)
			{
				this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			}
			Map<String,Object> colls=this.executeQueryForMap("queryMainColl");
			this.saveAttribute("colls", colls);
			List<Map<String, String>> posts=this.executeQueryForList("queryMainPost");
			this.saveAttribute("posts", posts);
			List<Map<String, String>> goods=this.executeQueryForList("queryMainShopRecord");
			this.saveAttribute("goods", goods);
			return "kd/userpage_main";
		}
		else
		{
			return "kd/nologin";
		}
	}
	
	//返回管理员主页
	protected final String adminMain()throws Exception
	{
		if(this.session.getAttribute("user")!=null)
		{
			this.dto.put("username", this.session.getAttribute("kkd102"));
			this.session.removeAttribute("msgs");
			List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
			this.session.setAttribute("msgs", msgs);
			return "kd/adminpage_main";
		}
		else
		{
			return "kd/nologin";
		}
	}
	
	//用户登出
	protected void userLogout()throws Exception
	{
		this.session.removeAttribute("user");
		this.session.removeAttribute("kkd104");
		this.session.removeAttribute("kkd101");
		this.session.removeAttribute("msgs");
	}

	//用户修改个人信息
	protected final String modifyInfo()throws Exception
	{
		if(session.getAttribute("user")!=null)
		{
			if(this.executeMethod("modifyInfo"))
			{
				this.setHint("成功", "个人信息修改成功！");
				Map<String, String> user=services.findById();
				user.remove("kkd103");
				this.session.removeAttribute("user");
				this.session.setAttribute("user", user);
			}
			else
			{
				this.setHint("失败", "修改失败，请稍后再试！");
			}
			if("45".contains(this.session.getAttribute("kkd104").toString()))
			{
				return "kd/userpage_info";
			}
			else
			{
				return "kd/adminpage_info";
			}
		}
		else
		{
			return "kd/nologin";
		}
	}
	
	//用户修改密码
	protected final String modifyPwd()throws Exception
	{
		if(!this.dto.get("kkd103").toString().equals(this.dto.get("kkd103-check")))
		{
			this.setHint("失败", "两次输入的密码不一致！");
		}
		else if(this.dto.get("kkd103").toString().length()<6 || this.dto.get("kkd103").toString().length()>16)
		{
			this.setHint("失败", "请确保你的密码长度在6-16位之间！");
		}
		else
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			if(this.executeMethod("modifyPwd"))
			{
				this.setHint("成功", "密码修改成功！");
			}
			else
			{
				this.setHint("失败", "原密码输入不正确！");
			}
		}
		if("45".contains(this.session.getAttribute("kkd104").toString()))
		{
			return "kd/userpage_pwd";
		}
		else
		{
			return "kd/adminpage_pwd";
		}
	}
	
	//查询所有管理员账号
	protected final void queryAdmin()throws Exception
	{
		List<Map<String, String>> admins=this.services.queryByCondition();
		this.saveAttribute("admins", admins);
	}
	
	//添加管理员账号
	protected final void addAdmin()throws Exception
	{
		if(this.executeMethod("addAdmin"))
		{
			this.setHint("操作成功", "成功添加了一个管理员账号！");
		}
		else
		{
			this.setHint("操作失败", "该用户名已被使用。");
		}
	}
	
	//查找某个管理员信息
	protected final void findAdmin()throws Exception
	{
		Map<String, String> admin=this.services.findById();
		this.saveAttribute("admin", admin);
	}
	
	//删除管理员账号
	protected final void delAdmin()throws Exception
	{
		if(this.executeMethod("delAdmin"))
		{
			this.setHint("操作成功", "该管理员账号已被删除！");
		}
		else
		{
			this.setHint("操作失败", "服务器可能出了一点小问题，请稍后再试！");
		}
		this.queryAdmin();
	}
	
	//修改管理员信息
	protected final void modifyAdmin()throws Exception
	{
		if(this.executeMethod("modifyAdmin"))
		{
			if(this.dto.get("flag").toString().equals("1"))
			{
				this.setHint("更新成功",	"该管理员的密码已被修改！");
			}
			else
			{
				this.setHint("更新成功",	"该管理员的权限已被修改！");
			}
		}
		else
		{
			this.setHint("更新失败", "服务器可能出了一点小问题，请稍后再试！");
		}
		this.queryAdmin();
	}
	
	//查询自己的申请
	protected final void findApp()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		Map<String, String> app=this.services.findById();
		this.saveAttribute("app", app);
	}
	
	//用户申请权限
	protected final void commitApp()throws Exception
	{
		if(this.dto.get("kkd302").toString().length()<21)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			if(this.executeMethod("commitApp"))
			{
				this.setHint("申请提交成功",	"请等待管理员的处理！");
			}
			else
			{
				this.setHint("申请提交失败", "服务器可能出了一点小问题，请稍后再试！");
			}
			this.findApp();
		}
		else
		{
			this.setHint("申请提交失败",	"标题字数大于20字！");
		}
	}
	
	//查询所有权限用户
	protected final void queryUser()throws Exception
	{
		this.dto.put("qkkd104", "4");
		List<Map<String, String>> users=this.services.queryByCondition();
		this.saveAttribute("users", users);
	}
	
	//修改用户权限
	protected final void revokePermission()throws Exception
	{
		if(this.executeMethod("revokePermission"))
		{
			this.setHint("操作成功", "该用户权限已被撤销！");	
		}
		else
		{
			this.setHint("操作失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
		this.queryUser();
	}
	
	//查询用户权限申请
	protected final void queryApp()throws Exception
	{
		List<Map<String, String>> apps=this.services.queryByCondition();
		this.saveAttribute("apps", apps);
	}
	
	//删除用户权限申请
	protected final void delApp()throws Exception
	{
		if(this.executeMethod("delApp"))
		{
			this.setHint("操作成功", "已删除该权限申请！");
		}
		else
		{
			this.setHint("操作失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
		this.queryApp();
	}
	
	//处理用户权限申请
	protected final void dealApp()throws Exception
	{
		if(this.executeMethod("dealApp"))
		{
			this.setHint("操作成功", "已处理该用户权限申请！");
		}
		else
		{
			this.setHint("操作失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
		this.queryApp();
	}
	
	//查看他人主页
	protected final void findOther()throws Exception
	{
		Map<String, String> other=this.services.findById();
		this.saveAttribute("other", other);
		Map<String,Object> colls=this.executeQueryForMap("queryMainColl");
		this.saveAttribute("colls", colls);
		List<Map<String, String>> posts=this.executeQueryForList("queryMainPost");
		this.saveAttribute("posts", posts);
	}
	
	//查询其他用户信息
	protected final void otherInfo()throws Exception
	{
		Map<String, String> other=this.services.findById();
		this.saveAttribute("other", other);
	}
	
	//发送消息
	protected final void sendMsg()throws Exception
	{
		if(this.dto.get("kkd204").toString().length()<21)
		{
			if(this.executeMethod("sendMsg"))
			{
				this.setHint("发送成功", "短信已发送至该用户，等待对方查看！");
			}
			else
			{
				this.setHint("发送失败", "服务器可能出现了一点小问题，请稍后再试！");
			}
		}
		else
		{
			this.setHint("发送失败", "你的短信标题超过了20字！");
		}
	}
	
	//查询所有接收消息
	protected final void queryReceive()throws Exception
	{
		this.dto.put("flag", "receive");
		List<Map<String, String>> receives=this.services.queryByCondition();
		this.saveAttribute("receives", receives);
	}
	
	//查询所有发送的消息
	protected final void querySend()throws Exception
	{
		this.dto.put("flag", "send");
		List<Map<String, String>> sends=this.services.queryByCondition();
		this.saveAttribute("sends", sends);
	}
	
	//删除消息
	protected final String delMsg()throws Exception
	{
		if(this.dto.get("sign").toString().equals("sender"))
		{
			if(this.executeMethod("senderDelMsg"))
			{
				this.setHint("删除成功", "该消息已被删除！");
			}
			else
			{
				this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
			}
			this.querySend();
			return "kd/message_to";
		}
		else
		{
			if(this.executeMethod("receiverDelMsg"))
			{
				this.setHint("删除成功", "该消息已被删除！");
				//设置为已读
				this.executeMethod("readMsg");
				//重新获取未读消息
				this.session.removeAttribute("msgs");
				List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
				this.session.setAttribute("msgs", msgs);
			}
			else
			{
				this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
			}
			this.queryReceive();
			return "kd/message_receive";
		}
	}
	
	//查看单个消息详情
	protected final void findMsgDetail()throws Exception
	{
		Map<String, Object> map=this.services.queryInMap();
		this.saveAttribute("map", map);
		if(this.dto.get("flag").toString().equals("receive"))
		{
			//设置为已读
			this.executeMethod("readMsg");
			//重新获取未读消息
			this.session.removeAttribute("msgs");
			List<Map<String, String>> msgs=this.executeQueryForList("queryMsg");
			this.session.setAttribute("msgs", msgs);
		}
	}
	
	//回复消息
	protected final void replyMsg()throws Exception
	{
		if(this.executeMethod("replyMsg"))
		{
			this.setHint("回复成功", "等待对方查看");
			Map<String, Object> map=this.services.queryInMap();
			this.saveAttribute("map", map);
		}
		else
		{
			this.setHint("回复失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//管理员查询举报
	protected final String queryReport()throws Exception
	{
		List<Map<String, String>> reports=this.services.queryByCondition();
		this.saveAttribute("reports",reports);
		if(this.dto.get("flag").toString().equals("post"))
		{
			return "kd/forumadminpage_queryReportPost";
		}
		else
		{
			return "kd/forumadminpage_queryReportReply";
		}
	}
	
	//管理员删除举报
	protected final String delReport()throws Exception
	{
		if(this.executeMethod("delReport"))
		{
			this.setHint("删除成功", "该举报已被删除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
		return this.queryReport();
	}
	
	//查询动画收藏
	protected final void queryAnimeColl()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		}
		List<Map<String, String>> animeColls=this.executeQueryForList("queryAnimeColl");
		this.saveAttribute("animeColls", animeColls);
	}
	
	//查询书籍收藏
	protected final void queryBookColl()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		}
		List<Map<String, String>> bookColls=this.executeQueryForList("queryBookColl");
		this.saveAttribute("bookColls", bookColls);
	}
	
	//查询游戏收藏
	protected final void queryGameColl()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		}
		List<Map<String, String>> gameColls=this.executeQueryForList("queryGameColl");
		this.saveAttribute("gameColls", gameColls);
	}
	
	//修改作品评价
	protected final void modifyComment()throws Exception
	{
		if(this.executeMethod("modifyComment"))
		{
			this.setHint("修改成功", "你对该作品的评价已被更新！");
		}
		else
		{
			this.setHint("修改失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//删除作品收藏及评价
	protected final void delColl()throws Exception
	{
		if(this.executeMethod("delColl"))
		{
			this.setHint("删除成功", "该作品 已从你的收藏中移除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//查询发帖记录
	protected final void queryPostRecord()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));	
		}
		List<Map<String, String>> posts=this.services.queryByCondition();
		this.saveAttribute("posts", posts);
	}
	
	//删除贴子
	protected final void delPost()throws Exception
	{
		if(this.executeMethod("delPost"))
		{
			this.setHint("删除成功", "该帖子已被删除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//查询回帖记录
	protected final void queryReplyRecord()throws Exception
	{
		if(this.dto.get("kkd101")==null)
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));	
		}
		List<Map<String, String>> replys=this.services.queryByCondition();
		this.saveAttribute("replys", replys);
	}
	
	//删除回帖
	protected final void delReply()throws Exception
	{
		if(this.executeMethod("delReply"))
		{
			this.setHint("删除成功", "该回帖已被删除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//查询贴子收藏
	protected final void queryPostColl()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		List<Map<String, String>> postColls=this.services.queryByCondition();
		this.saveAttribute("postColls", postColls);
	}
	
	//取消帖子收藏
	protected final void delPostColl()throws Exception
	{
		if(this.executeMethod("delPostColl"))
		{
			this.setHint("取消成功", "该贴子已从你的收藏中移除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//查询商品浏览记录
	protected final void queryShopRecord()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		List<Map<String, String>> goods=this.services.queryByCondition();
		this.saveAttribute("goods", goods);
	}
	
	//删除商品浏览记录
	protected final void delShopRecord()throws Exception
	{
		if(this.executeMethod("delShopRecord"))
		{
			this.setHint("删除成功", "该记录已从你的浏览记录中移除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//删除选中商品浏览记录
	protected final void delSelect()throws Exception
	{
		if(this.executeMethod("delSelect"))
		{
			this.setHint("删除成功", "选中记录已从你的浏览记录中移除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
	
	//查询商品收藏记录
	protected final void queryShopColl()throws Exception
	{
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		List<Map<String, String>> goods=this.services.queryByCondition();
		this.saveAttribute("goods", goods);
	}
	
	//删除商品收藏记录
	protected final void delShopColl()throws Exception
	{
		if(this.executeMethod("delShopColl"))
		{
			this.setHint("删除成功", "该商品已从你的收藏中移除！");
		}
		else
		{
			this.setHint("删除失败", "服务器可能出现了一点小问题，请稍后再试！");
		}
	}
}
