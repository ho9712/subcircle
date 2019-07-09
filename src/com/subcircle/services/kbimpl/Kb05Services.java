package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.Query;

import com.subcircle.services.support.JdbcServicesSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

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
		List<Map<String, String>> rows = new ArrayList<>();
		Map<String, String> ins = null;
		int initSize = (int)(5/0.75)+1;
		if(idlist.length > 0) 
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
				.append("insert into kb05(kkb101,kkd101,kkb502,kkb503,kkb504,kkb505)")
				.append("		 values (?,?,?,current_timestamp,?,?)")
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
			        ins.get("kkb103")
				};
			 this.appendSql(sql.toString(), args);
		}
		
		 return this.executeTransaction();
	}
	
	
	/**
	 *	查询该用户所有状态的订单 
	 */
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb504,k5.kkb505")
			.append("    from kb01 k1, kb05 k5")
			.append("	where k5.kkd101 = ?")
			.append("     and k1.kkb101 = k5.kkb101")
			;
		
		Object args[] = 
			{
				"1"		//用户id待修改	
			};
		return this.queryForList(sql.toString(), args);
	}
	
	
	/**
	 * 	查询该用户的某一状态的订单
	 * @param userId
	 * @param tag
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryOrderByState(String userId,String tag) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  select k1.kkb101,k1.kkb105,k1.kkb102,k5.kkb504,k5.kkb505")
				.append("    from kb01 k1, kb05 k5")
				.append("	where k5.kkd101 = ?  and k5.kkb502 = ?")
				.append("     and k1.kkb101 = k5.kkb101")
				;
		
		Object args[] = 
			{
				userId,
				tag
			};
		return this.queryForList(sql.toString(), args);
		
	}
	

	/**
	 * 	查询该用户不同状态的订单存在不同的List中在用objMap返回
	 * 
	 */
	@Override
	public Map<String, Object> queryInMap() throws Exception 
	{
		Map<String, Object> objMap = new HashMap<>();
		String userId = "1"; //用户Id待修改
		List<Map<String, String>> orderToPay = queryOrderByState(userId, "0");
		objMap.put("orderTopay",orderToPay);
		
		return objMap;
	}
	
	
	private boolean deleteOrderToPay() throws Exception
	{
		String sql = "delete from kb05 where kkd101 = ? and kkb502 = 0";
		Object args[] = 
			{
				"1"   		//用户id待修改
			};
		return this.executeUpdate(sql, args) > 0;
	}
	
}
