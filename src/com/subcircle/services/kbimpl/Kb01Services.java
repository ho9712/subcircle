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
		StringBuilder sql = new StringBuilder();
			 sql.append(" select  k.kkb101,k.kkb102,k.kkb103,k.kkb104,k.kkb105,")
				.append("		 k.kkb106,k.kkb107,k.kkb108,k.kkb109")
				.append("   from  kb01 k ")
				.append("  where  k.kkb110 = 1 ")
				;
		//计算查询结果可分多少页
		StringBuilder sql_1 = new StringBuilder();
			sql_1.append(" select count(kkb101)/12 as pageNum from kb01 k")
				 .append("  where kkb110 = 1");
		
		//还原查询条件
		Object searchText = this.get("searchText");
		String bPrice = (String) this.get("bPrice");
		String ePrice = (String)this.get("ePrice");
		
		if (searchText != null && !searchText.equals(""))
		{
			sql.append("	and (    k.kkb102 like + '%" + searchText + "%'")
			   .append("       	  or k.kkb104 like + '%" + searchText + "%'")
			   .append("		  or k.kkb107 like + '%" + searchText + "%')");
		  sql_1.append("	and (    k.kkb102 like + '%" + searchText + "%'")
			   .append("       	  or k.kkb104 like + '%" + searchText + "%'")
			   .append("		  or k.kkb107 like + '%" + searchText + "%')");
		}
		if (bPrice != null && !bPrice.equals("")) 
		{
			sql.append("    and   k.kkb103 >= " + bPrice);
			sql_1.append("    and   k.kkb103 >= " + bPrice);
		}
		if (ePrice != null && !ePrice.equals("")) 
		{
			sql.append("    and   k.kkb103 <= " + ePrice);
			sql_1.append("    and   k.kkb103 <= " + ePrice);
		}
		sql.append("  limit ?,12");
		int start = (Integer.parseInt((String) this.get("page")) - 1) * 12;
		
		Object args[] = 
			{
				start,
			};
		
		List<Map<String, String>> teMaps =  this.queryForList(sql.toString(),args);
		List<Map<String, String>> result = new ArrayList<>();
		
		for (Map<String, String> map : teMaps) 
		{
			map.put("pageNum", this.queryForMap(sql_1.toString(),new Object[]{}).get("pageNum"));
			result.add(map);
		}
		
		return result;
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
				.append("        s.fvalue kkb106,k1.kkb107,k1.kkb108,k1.kkb109,k1.kkb111")
				.append("	from kb01 k1,syscode s")
				.append("  where k1.kkb110 = 1")
				.append("	 and k1.kkb101 = ?")
				.append("    and k1.kkb106 = s.fcode ")
				.append("	 and s.fname='kkb106'")
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
		StringBuilder sql = new StringBuilder()
				.append("  select k6.kkb601,k6.kkb602,k6.kkb603,k6.kkd101,kd1.kkd105,")
				.append("		  kd1.kkd108")
				.append("	 from kb06 k6,kd01 kd1")
				.append("	where k6.kkb605 = ?")
				.append("	  and k6.kkd101 = kd1.kkd101")
				;
		Object args[] = 
			{
				this.get("kkb101")	
			};
		return this.queryForList(sql.toString(), args);
	}
	
	/**
	 * 商品的具体信息及其评分评价
	 */
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
	
	/**
	 * 商城管理员上架商品
	 * @return
	 * @throws Exception
	 */
	private boolean addItem() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append(" insert into kb01(kkb102,kkb103,kkb104,kkb105,kkb106,")
				.append("			  	   kkb107,kkb108,kkb109,kkb111)")
				.append("	   values     (?,?,?,?,?,")
				.append("				   ?,?,?,?)")
				;
		
		Object args[] = 
			{
				this.get("kkb102"),
				this.get("kkb103"),
				this.get("kkb104"),
				this.get("kkb105"),
				this.get("kkb106"),

				this.get("kkb107"),
				this.get("kkb108"),
				this.get("kkb109"),
				this.get("kkb111")
			};
		
		return this.executeUpdate(sql.toString(), args) > 0;
	}
	
	/**
	 * 商城管理员下架某商品
	 * @return
	 * @throws Exception
	 */
	private boolean modifyItemInfo() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("  update kb01 set kkb102 = ?,kkb103 = ?,kkb104 = ?,kkb105 = ?,kkb106 = ?,")
				.append("						  	   kkb107 = ?,kkb108 = ?,kkb109 = ?,kkb111 = ?")
				.append("            where kkb101 = ?")
				;
		Object args[]= 
			{
				this.get("kkb102"),
				this.get("kkb103"),
				this.get("kkb104"),
				this.get("kkb105"),
				this.get("kkb106"),

				this.get("kkb107"),
				this.get("kkb108"),
				this.get("kkb109"),
				this.get("kkb111"),
				this.get("kkb101")
			};
		return this.executeUpdate(sql.toString(), args) > 0;
	}
	
	/**
	 * 	商城管理员下架商品
	 * @return
	 * @throws Exception
	 */
	private boolean delItem()throws Exception
	{
		String sql = "update kb01 set kkb110 = 0 where kkb101 = ?";
		Object args[] = 
			{
				this.get("kkb101")
			};
		return this.executeUpdate(sql, args) > 0;
	} 
	
	/**
	 * 	用户付款成功后更新商品库存
	 * @param kkb507订单号,筛选出其中的商品和数量
	 * @return
	 */
	public boolean updateStock(String kkb507) throws Exception
	{
		String sql = "select kkb101,kkb504 from kb05 where kkb507 = ?";
		Object args[] = 
			{
				kkb507
			};
	
		List<Map<String, String>> teMaps = this.queryForList(sql, args);
		
		String sql_1 = "update kb01 set kkb108 = kkb108 - ? where kkb101 = ?";
		for (Map<String, String> map : teMaps)
		{
			Object args_1[] = 
				{
					map.get("kkb504"),
					map.get("kkb101")
				};
			this.appendSql(sql_1, args_1);
		}
		return this.executeTransaction();
	}
	
}
