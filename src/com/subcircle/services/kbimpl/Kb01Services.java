package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb01Services extends JdbcServicesSupport 
{
	
	@Override
	public Map<String, Object> queryInMap() throws Exception
	{
		Map<String,Object> objMap = new HashMap<>();
		List<Map<String,String>> items = queryByCondition();
		List<Map<String,String>> hotItems = queryExtral();
		objMap.put("items", items);
		objMap.put("hotItems", hotItems);
		
		return objMap;
	}
	
	/**
	 * 多实例查询商品表
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" select k.kkb101,k.kkb102,k.kkb103,k.kkb104,k.kkb105,")
				.append("        k.kkb106,k.kkb107,k.kkb108,k.kkb109")
				.append("	from kb01 k")
				.append("	where k.kkb110 = 1 limit 12")
				;
		Object args[] = {};
		return this.queryForList(sql.toString(),args);
	}
	
	/**
	 * 根据商品Id找单个商品
	 * @return
	 * @throws Exception
	 */
	public Map<String, String> findById()throws Exception
	{
		StringBuilder  sql = new StringBuilder()
				.append(" select k1.kkb101,k1.kkb102,k1.kkb103,k1.kkb104,k1.kkb105,")
				.append("        k1.kkb106,k1.kkb107,k1.kkb108")
				.append("	from kb01 k1")
				.append("	where k1.kkb110 = 1")
				.append("	and k1.kkb101 = ?")
				;
		Object args[] = {this.get("kkb101")};
		return this.queryForMap(sql.toString(), args);
	}

	
	/**
	 * 查询所有热销商品
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryExtral()throws Exception
	{
		StringBuilder  sql = new StringBuilder()
				.append(" select k.kkb101,k.kkb102,k.kkb103,k.kkb104,k.kkb105")
				.append("	from kb01 k")
				.append("	where k.kkb110 = 1")
				.append("	and k.kkb111 = ?")
				;
		Object args[] = {"1"};		//是否热销
		return this.queryForList(sql.toString(), args);
	}
	
	/**
	 * 生成当前登入用户的浏览记录
	 * @return
	 * @throws Exception
	 */
	private boolean insertBrowse() throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append("insert into kb02(kkb101,kkd101,kkb202)")
			.append("		 values (?,?,current_timestamp)")
			;
		Object args[] =
		{
			this.get("kkb101"),
			this.get("kkd101")		//用户ID
		};
		return this.executeUpdate(sql.toString(), args) > 0;
	}
	
	/**
	 * 	根据商品id获取商品的评分评价
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> getRateByItemId()throws Exception
	{
		String sql = "select k6.kkb602,k6.kkb603,k6.kkd101 from kb06 k6 where k6.kkb605 = ?";
		Object args[] = 
			{
				this.get("kkb101")	
			};
		return this.queryForList(sql, args);
	}
	
	@Override
	public List<Object> queryInList() throws Exception
	{
		List<Map<String , String>> rate = this.getRateByItemId();
		Map<String , String> item = this.findById();
		List<Object> result = new ArrayList<>();
		result.add(item);
		result.add(rate);
		return result;
	}
}
