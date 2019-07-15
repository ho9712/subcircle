package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb05Services extends JdbcServicesSupport 
{

	/**
	 * 	查询购物车中选中商品的具体信息
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> findSelectItemsInfo() throws Exception
	{
		//查询出选中的商品的商品ID,商品名,商品单价,商品缩略图,商品数目
		StringBuilder sql = new StringBuilder()
			.append(" select k1.kkb101,k1.kkb102, k1.kkb103,k1.kkb105,k4.kkb402")
			.append("   from kb01 k1,kb04 k4")
			.append("  where k1.kkb101 = k4.kkb101 and k1.kkb101 = ?")
			;
		
		Object idlist[] = null;
		//getIdlist该方法返回的size至少为1(从购物车页面传过来)
		if(this.getIdlist("idlist")[0] != null) 
		{
			idlist = this.getIdlist("idlist");
		}
		List<Map<String, String>> rows = new ArrayList<>();
		Map<String, String> ins = null;
		int initSize = (int)(5/0.75)+1;
		if(idlist != null && idlist.length > 0) 
		{
			for(Object kkb101 : idlist) 
			{
				ins = new HashMap<>(initSize);
				ins = this.queryForMap(sql.toString(), kkb101);
				rows.add(ins);
			}
		}
		return rows;
	}
	
	/**
	 *	 为用户选中的每一个商品生成一个订单
	 * @return
	 * @throws Exception
	 */
	private boolean createOrder() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into kb05(kkb101,kkd101,kkb502,kkb503,kkb504,")
				.append("                 kkb505,kkb506,kkb507)")
				.append("		 values (?,?,?,current_timestamp,?,")
				.append("                ?,?,?)")
				;

		//点击立即购买按钮创建订单的情况
		if (this.get("kkb101") != null)
		{
			Object args[]= 
				{
					this.get("kkb101"),
					this.get("kkd101"),		//用户ID
					this.get("kkb502"),	//订单状态,0表示待支付
			        this.get("kkb504"),	//商品数量
			        this.get("kkb505"),	//商品单价
			        this.get("kkb506"),	//订单备注（首页的立即购买按钮才会在订单创建时有值）
			        this.get("kkb507")	//商户订单号
				};
			this.appendSql(sql.toString(), args);
		}
		//从购物车中选中商品创建订单
		else
		{
			List<Map<String, String>> rows = this.findSelectItemsInfo();

			if (rows.size() > 0) 
			{
				for(Map<String, String > ins: rows) 
				{
					Object args[]= 
						{
							ins.get("kkb101"),
							this.get("kkd101"),		//用户ID
							this.get("kkb502"),	//订单状态,0表示待支付
					        ins.get("kkb402"),
					        ins.get("kkb103"),
					        this.get("kkb506"),	//订单备注（立即购买才会在订单创建时有值）
					        this.get("kkb507")	//商户订单号
						};
					 this.appendSql(sql.toString(), args);
				}
			}

		}
		 return this.executeTransaction();
	}
	
	
	/**
	 *	根据订单号显示订单详情
	 *	
	 */
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		String userId = (String)this.get("kkd101");		//用户ID
		List<Map<String, String>> orderToPay = queryOrderByNum(userId,(String)this.get("kkb507"));
		return orderToPay;
	}
	
	
	/**
	 * 	查询该用户的某一状态的所有订单号
	 * @param userId
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryOrderNumByState(String userId,String state) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select k5.kkb507,k5.kkb508")
				.append("    from kb01 k1, kb05 k5")
				.append("	where k5.kkd101 = ?  and k5.kkb502 = ?")
				.append("     and k1.kkb101 = k5.kkb101")
				;
		
		Object args[] = 
			{
				userId,
				state
			};
		return this.queryForList(sql.toString(), args);
		
	}
	
	
	/**
	 * 	查询该用户的某一订单号对应的所有订单记录
	 * @param userId
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryOrderByNum(String userId,String kkb507) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb501,k5.kkb504,")
				.append("         k5.kkb505,k5.kkb506,k5.kkb507,k5.kkb508")
				.append("    from kb01 k1, kb05 k5")
				.append("	where k5.kkd101 = ?")
				.append("     and k5.kkb101 = k1.kkb101")
				.append("     and k5.kkb507 = ?")
				;
		
		Object args[] = 
			{
				userId,
				kkb507
			};
		
		List<Map<String, String>> result = new ArrayList<>(); 
		result = this.queryForList(sql.toString(), args);
		//一笔订单记录下kkb508始终是同步的
		if (result.get(0).get("kkb508").equals("1"))
		{
			StringBuilder sql_1 = new StringBuilder()
				.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb501,k5.kkb504,")
			  	.append("         k5.kkb505,k5.kkb506,k5.kkb507,k5.kkb508,k6.kkb602,")
			  	.append("         k6.kkb603")
				.append("    from kb01 k1, kb05 k5,kb06 k6")
				.append("	where k5.kkd101 = ?")
				.append("     and k5.kkb101 = k1.kkb101")
				.append("	  and k5.kkb501 = k6.kkb501")
				.append("     and k5.kkb507 = ?")
				;
			 result = this.queryForList(sql_1.toString(), args);
		}
		
		return result;
	}

	

	/**
	 * 	查询该用户不同状态的订单
	 * 	存在List中再用objMap返回
	 */
	@Override
	public Map<String, Object> queryInMap() throws Exception 
	{
		Map<String, Object> objMap = new HashMap<>();
		String userId = (String)this.get("kkd101");		//用户ID
		//查询出某一状态下的订单的所有的订单号
		List<Map<String, String>> orderNumber = queryOrderNumByState(userId,(String)this.get("kkb502"));
		
		//LinkedHashMap保存加入的顺序
		Map<String, String> dealOrderNumber = new LinkedHashMap<>();
		
		//每一个订单号保留一个
		for(Map<String, String> tempMap : orderNumber) 
		{
			String kkb507 = tempMap.get("kkb507");
			dealOrderNumber.put(kkb507, kkb507);
		}
		
		
		//每一个订单号下的所有记录封装在一个List<Map<String, String>>中
		int i = 0;
		for (String temp: dealOrderNumber.keySet()) 
		{
			i++;
			objMap.put("order"+i,queryOrderByNum(userId,temp));
		}		
		return objMap;
	
	}
	
	@Override
	public List<Object> queryInList() throws Exception 
	{
		List<Object> objList = new ArrayList<>();
		String userId =(String)this.get("kkd101");		//用户ID
		//查询出某一状态下的订单的所有的订单号
		List<Map<String, String>> orderNumber = queryOrderNumByState(userId,(String)this.get("kkb502"));
		
		//LinkedHashMap保存加入的顺序
		Map<String, String> dealOrderNumber = new LinkedHashMap<>();

		//每一个订单号保留一个
		for(Map<String, String> tempMap : orderNumber) 
		{
			String kkb507 = tempMap.get("kkb507");
			dealOrderNumber.put(kkb507, kkb507);
		}
		
		
		//每一个订单号下的所有记录封装在一个List<Map<String, String>>中
		for (String temp: dealOrderNumber.keySet()) 
		{
			objList.add(queryOrderByNum(userId,temp));
		}		
		return objList;
	}
	
	
	/**
	 * 	根据商户订单号删除用户待支付订单
	 * @return
	 * @throws Exception
	 */
	private String deleteOrderToPay() throws Exception
	{
		String sql = "delete from kb05 where kkd101 = ? and kkb507 = ?";
		Object args[] = 
			{
				this.get("kkd101"),	//用户ID
				this.get("kkb507")
			};
		String result = null;
		
		//删除订单后返回到原位置
		if (this.executeUpdate(sql, args) > 0)
		{
			//返回到商城主界面
			if (this.get("backLocation").equals("1"))
			{
				result = "kb01QueryItems.kbhtml";
			}
			//返回到商品详情页面
			else if (this.get("backLocation").equals("2"))
			{
				result = "kb01FindItemById.kbhtml";
			}
			//返回到购物车页面
			else if (this.get("backLocation").equals("3"))
			{
				result = "kb04MyCartCenter.kbhtml";
			}
			//返回到订单管理中心
			else if (this.get("backLocation").equals("4"))
			{
				result = "kb05QueryAllOrder.kbhtml";
			}
		} 
		
		return result;
	}
	
	
	/**
	 * 	根据用户id和商户订单号改变订单的状态
	 * @return
	 * @throws Exception
	 */
	//	供paySuccessServlet使用(供支付订单后将订单状态由0改为1使用)
	//(绕开核心控制器的操作无法获取dto通过参数传递解决,访问权限设为public)
	public boolean updateOrderState(String state,String kkb507,String userId) throws Exception
	{
		String sql = "update kb05 set kkb502 = ? where kkb507 =  ? and kkd101 = ?";
		Object args[] = 
			{
				state,		//订单改变后的状态
				kkb507,		//商户订单号
				userId		//用户ID
			};
		
		return this.executeUpdate(sql, args) >0;
	}
	
	
	//供Kb05UpdateOrderServlet使用(负责确认收货把订单状态从1改为2)
	private boolean UpdateOrderState() throws Exception
	{
		String state = "2";								//订单改变后的状态(确认收货)
		String num = (String)this.get("kkb507");		//商户订单号
		String userId = (String)this.get("kkd101");
		return updateOrderState(state,num,userId);
	}
	
	
	//支付订单前修改订单备注
	private boolean updateOrderInfo() throws Exception
	{
		String sql = "update kb05 set kkb506 = ? where  kkb501 = ?";
		Object kkb501List[] = this.getIdlist("kkb501List");
		Object kkb506List[] = this.getIdlist("kkb506List");
		
		for(int i = 0; i < kkb501List.length; i++) 
		{
			Object args[] = 
				{
					kkb506List[i],
					kkb501List[i],
				};
			this.appendSql(sql, args);
		}
		return this.executeTransaction();
	}
	
}
