package com.subcircle.web.kd.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.subcircle.services.support.ServicesInterface;
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

	//用户注册
	protected final void userSignUp()throws Exception
	{
		if(this.dto.get("kkd102").toString().length()<6 || this.dto.get("kkd102").toString().length()>12)
		{
			this.saveAttribute("usernameError", "请确保你的用户名长度在6-12位之间！");
			return;
		}
		else if(this.dto.get("kkd103").toString().length()<6 || this.dto.get("kkd103").toString().length()>16)
		{
			this.saveAttribute("passwordError", "请确保你的密码长度在6-16位之间！");
			return;
		}
		else if(!this.dto.get("kkd103").equals(this.dto.get("kkd103-1")))
		{
			this.saveAttribute("checkPwdError", "请确保你输入的两次密码保持一致！");
			return;
		}
		else
		{
			if(this.executeMethod("userSignUp"))
			{
				this.saveAttribute("msg", "注册成功！");
			}
			else
			{
				this.saveAttribute("usernameError", "此用户名已被使用，请换一个试试！");
			}
		}
	}

//	protected boolean userLogin()throws Exception
//	{
//		Map<String, String> user=this.services.findById();
//		if(user==null)
//		{
//			this.saveAttribute("usernameError", "此账号不存在！");
//			return false;
//		}
//		else if(!user.get("kkd103").equals(this.dto.get("kkd103")) || !this.dto.get("kkd104").toString().contains(user.get("kkd104")))
//		{
//			this.saveAttribute("error", "请确认你的用户名、密码及用户组正确！");
//			return false;
//		}
//		else
//		{
//			this.saveAttribute("user", user);
//			return true;
//		}
//	}
	
//	protected final void findById()throws Exception
//	{
//		this.dto.put("kkd101", this.session.getAttribute("kkd101"));
//		Map<String, String> user=this.services.findById();
//		this.saveAttribute("user", user);
//	}
	
	protected final void modifyInfo()throws Exception
	{
		if(this.executeMethod("modifyInfo"))
		{
			this.saveAttribute("msg", "修改成功");
		}
		else
		{
			this.saveAttribute("msg", "修改失败，请稍后再试");
		}
	}
	
	protected final void modifyPwd()throws Exception
	{
		if(this.dto.get("kkd103").toString().equals(this.dto.get("kkd103-check")))
		{
			this.dto.put("kkd101", this.session.getAttribute("kkd101"));
			if(this.executeMethod("modifyPwd"))
			{
				this.saveAttribute("msg", "密码修改成功！");
			}
			else
			{
				this.saveAttribute("msg", "现在的密码不正确");
			}
		}
		else
		{
			this.saveAttribute("msg", "两次密码不一致！");
		}
	}
}
