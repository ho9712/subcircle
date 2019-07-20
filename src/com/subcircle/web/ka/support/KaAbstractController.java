package com.subcircle.web.ka.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.subcircle.services.support.ServicesInterface;
import com.subcircle.web.ControllerInterface;

public abstract class KaAbstractController implements ControllerInterface 
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
		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
		this.dto.put("kkd104", this.session.getAttribute("kkd104"));
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
	

	
	//通过反射机制，传递方法名执行Services中的方法
	private boolean executeMethod(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//设置访问权限，使能够访问private方法
		method.setAccessible(true);
		return (boolean)method.invoke(this.services);
	}
	
	
	private List<Map<String,Object>> executeHotPost(String methodName)throws Exception
	{
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//设置访问权限，使能够访问private方法
		method.setAccessible(true);
		return (List<Map<String,Object>>)method.invoke(this.services);
	}
	

	
	/*********************************************************************
	 * 						根据需要在此写方法
	 *********************************************************************/
	
	/**
	 *  处理类型查询及搜索框模糊匹配查询
	 * @throws Exception
	 */
	protected final String queryByCondition()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
		
		if(this.dto.get("id").toString().equals("0"))
		{
			return "ka/mainForum.jsp";
		}
		else if(this.dto.get("id").toString().equals("1"))
		{
			return "ka/animeForum.jsp";
		}
		else if(this.dto.get("id").toString().equals("2"))
		{
			return "ka/bookForum.jsp";
		}
		else
		{
			return "ka/gameForum.jsp";
		}
	}
	
	

	/**
	 * 	显示贴子内容详情
	 * @throws Exception
	 */
	protected final void showPostContent() throws Exception
	{
		Map<String, String> ins = this.services.findById();
        this.saveAttribute("ins", ins);
	}
	
	
	
	/**
	 * 在贴子内容详情页  显示其他用户回复/评论列表
	 * @throws Exception
	 */
	protected final void forumQueryAnswer()throws Exception
	{
		Map<String, Object> objMap =this.services.queryInMap();
		if(objMap.size()>0)
		{
			this.saveAttribute("rows", objMap.get("queryForAnswer"));
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	
	/**
	 * 回复贴子
	 * @throws Exception
	 */
	protected final String postContent() throws Exception
	{   
		if (this.session.getAttribute("kkd101")==null|| this.session.getAttribute("kkd101").toString().equals("")) 
	   {
		  return "kd/nologin.jsp";
	   } 
		else
		{	
	      this.executeMethod("postContent");
	      this.saveAttribute("msg", "回复成功！");
		  return "ka01PostContent.kahtml";
		}
	}
	
	
	
	/**
	 * 举报违规贴子
	 * @throws Exception
	 */
	protected final void postReport()throws Exception
	{
		if(this.executeMethod("reportPost"))
		{
			this.saveAttribute("msg", "举报成功");
		}
		else
		{
			this.saveAttribute("msg", "举报失败");
		}
	}
	
	/**
	 * 举报违规回复
	 * @throws Exception
	 */
	protected final void answerReport()throws Exception
	{
		if(this.executeMethod("reportAnswer"))
		{
			this.saveAttribute("msg", "举报成功");
		}
		else
		{
			this.saveAttribute("msg", "举报失败");
		}
	}
	
	
	
	/**
	 * 查询执行删除贴子操作后的贴子列表
	 * @return
	 * @throws Exception
	 */
	protected final String queryDelCondition()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
		return "ka/mainForum.jsp";
	}
	
	
	/**
	 *查询删除贴子回复后的贴子列表
	 * @return
	 * @throws Exception
	 */
	protected final String queryDelAnswerCondition()throws Exception
	{
		List<Map<String,String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
		return "ka01AdmPostContent.kahtml";
	}
	
	
	
	/**
	 * 添加收藏
	 * @throws Exception
	 */
	protected final void addCollection()throws Exception
	{
		if( this.executeMethod("addCollection"))
		{
			this.saveAttribute("msg", "收藏成功！");
		}
		else
		{		
		   this.saveAttribute("msg", "收藏失败！您已经收藏过该贴子。");
		}
	}

	
	/**
	 * 查询热点贴子
	 * @throws Exception
	 */
	protected final void hotPost()throws Exception
	{
		
		List<Map<String,Object>> rows1=this.executeHotPost("queryHotPost");
		this.saveAttribute("rows1", rows1);
	}

	
	
}
