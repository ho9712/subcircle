package com.subcircle.web.kb.support;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.RowSet;

import com.subcircle.services.support.ServicesInterface;
import com.subcircle.web.ControllerInterface;import com.sun.xml.internal.ws.developer.StreamingAttachment;

public abstract class KbAbstractController implements ControllerInterface 
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
		//从session拿出用户id和权限交给dto
		this.dto.put("kkd101",this.session.getAttribute("kkd101"));
		this.dto.put("kkd104",this.session.getAttribute("kkd104"));
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
	
	protected final boolean update(String methodName)throws Exception
	{
		boolean flag = this.executeMethod(methodName);
		this.saveAttribute("msg", flag);
		return flag;
	}
	
	protected String updateRtn(String methodName,String typeMsg) throws Exception
	{	
		String result = null;
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		//设置访问权限，使能够访问private方法
		method.setAccessible(true);
		result = (String) method.invoke(this.services);

		if (result != null) 
		{
			this.saveAttribute("msg",typeMsg + "成功");
		}
		else 
		{
			this.saveAttribute("msg",typeMsg + "失败");
		}
		
		return result;
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

	/**
	 * 	显示周边商城首页的商品数据信息(用于kb01)
	 * @throws Exception
	 */
	protected final void queryAndShowMarketData()throws Exception
	{
		//objMap中包含热销商品(轮播图显示)和所有商品
		Map<String, Object> objMap =this.services.queryInMap();
		if(objMap.size()>0)
		{
			this.saveAttribute("objMap", objMap);
		}
		else
		{
			this.saveAttribute("msg", "无商品信息！");
		}
	}
	
	/**
	 * 	显示商品详情的数据信息(用于kb01)
	 * @throws Exception
	 */
	protected final void showMarketItemInfo() throws Exception
	{
		Map<String, String> ins = this.services.findById();
		this.saveAttribute("msg","该商品已下架或禁止访问!");
		if(ins != null) 
		{
			this.saveAttribute("msg","查询成功");
		}
		this.saveAttribute("ins", ins);
	}

	/**
	 * 	根据用户ID显示购物车数据信息(用于kb04)
	 * @throws Exception
	 */
	protected final void queryAndShowMyCartData()throws Exception
	{
		List<Map<String, String>> rows=this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "购物车空空如也！");
		}
	}
	
	/**
	 * 	显示购物车中更新后的数量(用于kb04)
	 * @throws Exception
	 */
//	protected final void queryAndShowUpdateCount()throws Exception
//	{
//		Map<String, String> ins = this.services.findById();
//		if(ins != null)
//		{
//			this.saveAttribute("ins",ins);
//		}
//		else
//		{
//			this.saveAttribute("msg", "数据不存在或禁止访问");
//		}
//	}
	
	/**
	 *	根据订单号显示订单详情 (kb05)
	 * @throws Exception
	 */
	protected final void queryAndShowOrderByNum()throws Exception
	{
		List<Map<String, String>> rows=(List<Map<String,String>>)this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
		
		String orderState =(String)this.dto.get("kkb502");
		String backLocation =(String)this.dto.get("backLocation");
		this.saveAttribute("flag", orderState);
		this.saveAttribute("backLocation",backLocation);
	}
	
	/**	(kb05)
	 * 	返回所查询的状态的订单
	 * 	如用户查看待支付订单则返回待支付订单列表
	 */
	protected final void queryAllOrderByState()throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if(objList.size()>0)
		{
			this.saveAttribute("objList",objList);
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
		
		String orderState =(String)this.dto.get("kkb502");
		this.saveAttribute("flag", orderState);
	}
	
	/**
	 * 	显示商品具体信息及评分评价信息(kb01)
	 * @return
	 * @throws Exception
	 */
	protected final String showItemInfo() throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if (objList.size() > 0)
		{
			this.saveAttribute("objList", objList);
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
		return (String)this.dto.get("kkd101");		//返回出去判断有用户登入来决定是否生成浏览记录
	}
	
	/**
	 *	 商城管理员修改商品时查询出该商品的信息(kb01)
	 * @throws Exception
	 */
	protected final void getModifyItemInfo() throws Exception 
	{
		Map<String,String>	ins = this.services.findById();
		if (ins != null && ins.size() > 0)
		{
			this.saveAttribute("ins",ins);
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
	}
	
	/**
	 * 	求购信息列表(kb07)
	 * @throws Exception
	 */
	protected final void showInquiryList() throws Exception
	{
		List<Map<String, String>> rows = this.services.queryByCondition();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
	}
	
	/**
	 * 	返回某一用户的各状态的求购(kb07)
	 * @throws Exception
	 */
	protected final void showUserInquiryList() throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if (objList.size() > 0)
		{
			this.saveAttribute("objList", objList);
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
	}
	
	/**
	 * 	返回某一用户的各状态的响应列表(kb08)
	 * @throws Exception
	 */
	protected final void showUserResponseList() throws Exception
	{
		List<Object> objList = this.services.queryInList();
		if (objList.size() > 0)
		{
			this.saveAttribute("objList", objList);
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
	}
	
	protected final void showResToInquiry() throws Exception
	{
		Map<String, Object> objMap = this.services.queryInMap();
		if (objMap.size() > 0)
		{
			this.saveAttribute("rows",objMap.get("objMap"));
		}
		else
		{
			this.saveAttribute("msg", "数据不存在或禁止访问");
		}
	}
	
}
