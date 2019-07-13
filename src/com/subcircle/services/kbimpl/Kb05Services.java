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
		Object idlist[] = this.getIdlist("idlist");
		System.out.println(idlist);
		List<Map<String, String>> rows = new ArrayList<>();
		Map<String, String> ins = null;
		int initSize = (int)(5/0.75)+1;
		if(idlist.length > 0) 
		{
			for(Object kkb101 : idlist) 
			{
				System.out.println(kkb101);
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
				.append("insert into kb05(kkb101,kkd101,kkb502,kkb503,kkb504,kkb505,kkb507)")
				.append("		 values (?,?,?,current_timestamp,?,?,?)")
				;
			
		List<Map<String, String>> rows = this.findSelectItemsInfo();
		for(Map<String, String > ins: rows) 
		{
			Object args[]= 
				{
					ins.get("kkb101"),
					"1",	//用户id待修改
					"0",	//订单状态,0表示待支付
			        ins.get("kkb402"),
			        ins.get("kkb103"),
			        this.get("kkb507")	//商户订单号
				};
			 this.appendSql(sql.toString(), args);
		}
		
		 return this.executeTransaction();
	}
	
	
	/**
	 *	返回用户最新的待支付订单
	 *	从购物车跳转到支付页面只显示当前订单
	 */
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		String userId = "1"; //用户Id待修改
		List<Map<String, String>> orderToPay = queryOrderByState(userId, "0",(String)this.get("kkb507"));
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
				.append("  select k5.kkb507")
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
	 * 	查询该用户的某一状态下某一订单号对应的所有订单记录
	 * @param userId
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryOrderByState(String userId,String state,String kkb507) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb504,k5.kkb505,k5.kkb507")
				.append("    from kb01 k1, kb05 k5")
				.append("	where k5.kkd101 = ?  and k5.kkb502 = ?")
				.append("     and k1.kkb101 = k5.kkb101")
				.append("     and k5.kkb507 = ?")
				;
		
		Object args[] = 
			{
				userId,
				state,
				kkb507
			};
		return this.queryForList(sql.toString(), args);
		
	}

	

	/**
	 * 	查询该用户不同状态的订单
	 * 	存在List中再用objMap返回
	 */
	@Override
	public Map<String, Object> queryInMap() throws Exception 
	{
		Map<String, Object> objMap = new HashMap<>();
		String userId = "1"; //用户Id待修改
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
		
		
		System.out.println(dealOrderNumber);
		//每一个订单号下的所有记录封装在一个List<Map<String, String>>中
		int i = 0;
		for (String temp: dealOrderNumber.keySet()) 
		{
			i++;
			objMap.put("order"+i,queryOrderByState(userId,(String)this.get("kkb502"),temp));
		}		
		return objMap;
	
	}
	
	@Override
	public List<Object> queryInList() throws Exception 
	{
		List<Object> objList = new ArrayList<>();
		String userId = "1"; //用户Id待修改
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
		
		
		System.out.println(dealOrderNumber);
		//每一个订单号下的所有记录封装在一个List<Map<String, String>>中
		for (String temp: dealOrderNumber.keySet()) 
		{
			objList.add(queryOrderByState(userId,(String)this.get("kkb502"),temp));
		}		
		return objList;
	}
	
	
	/**
	 * 	根据商户订单号删除用户待支付订单
	 * @return
	 * @throws Exception
	 */
	private boolean deleteOrderToPay() throws Exception
	{
		String sql = "delete from kb05 where kkd101 = ? and kkb502 = 0 and kkb507 = ?";
		Object args[] = 
			{
				"1",   		//用户id待修改
				this.get("WIDout_trade_no")
			};
		System.out.println("待删除订单编号:" + this.get("WIDout_trade_no"));
		return this.executeUpdate(sql, args) > 0;
	}
	
	
	/**
	 * 	根据用户id和商户订单号改变订单的状态
	 * @return
	 * @throws Exception
	 */
	//(绕开核心控制器的操作无法获取dto通过参数传递解决,访问权限设为public)
	public boolean updateOrderState(String state,String kkb507,String kkd101) throws Exception
	{
		String sql = "update kb05 set kkb502 = ? where kkb507 =  ? and kkd101 = ?";
		Object args[] = 
			{
				state,		//订单改变后的状态
				kkb507,		//商户订单号
				kkd101 		//用户ID
			};
		
		return this.executeUpdate(sql, args) >0;
	}
}
