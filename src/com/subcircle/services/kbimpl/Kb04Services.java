package com.subcircle.services.kbimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb04Services extends JdbcServicesSupport 
{	
	
	@Override
	public Map<String, String> findById() throws Exception 
	{
		//查询购物车表中某用户是否存在某商品
		StringBuilder sql = new StringBuilder()
			.append(" select kkb101,kkd101,kkb402,kkb403")
			.append("   from kb04 ")
			.append("  where kkb101 = ? and kkd101 = ?")
			;
	
		Object args[] = 
			{
				this.get("kkb101"),
				"1" 	//用户id待修改
			};
		return this.queryForMap(sql.toString(),args);
	}
	
	/**
	 * 	查询购物车表中某用户是否存在某商品id
	 * 	存在的话更新该条记录,不存在的话插入记录
	 * 	维持购物车表中某一用户ID下某一商品ID仅有一条记录
	 * @return
	 * @throws Exception
	 */
	private boolean addToMyCart() throws Exception
	{
//		//查询购物车表中某用户是否存在某商品
//		StringBuilder sql_1 = new StringBuilder()
//			.append(" select kkb101,kkd101,kkb402,kkb403")
//			.append("   from kb04 ")
//			.append("  where kkb101 = ? and kkd101 = ?")
//			;
//	
//		Object args_1[] = 
//			{
//				this.get("kkb101"),
//				"1" 	//用户id待修改
//			};
//		
		Map<String,String> ins = this.findById();
		
		StringBuilder sql_2 = new StringBuilder();
		//购物车中存在该用户存在对该商品的记录,更新数目
		if (ins != null)
		{
			sql_2.append("update kb04 set kkb402 = kkb402 + ? where kkb101 = ? and kkd101 = ?");
		}
		else 
		{
			sql_2.append("insert into kb04(kkb402,kkb101,kkd101,kkb403)")
				 .append("		 values (?,?,?,current_timestamp)")
				 ;
		}
		
		Object args_2[] =
			{
				this.get("kkb402"),
				this.get("kkb101"),
				"1"		//用户ID之后修正
			};
		
		return this.executeUpdate(sql_2.toString(), args_2) > 0;
	}
	
	/**
	 *	 显示用户的购物车信息
	 *	
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> queryByCondition() throws Exception
	{
		StringBuilder sql_1 = new StringBuilder()
				.append(" select k.kkb101,k.kkb402")
				.append("	from kb04 k")
				.append("  where k.kkd101 = ?")
				;
		Object args[] = 
		{
			"1" //用户id待替换	
		};
		
		//从kb04表中取出商品id及数量
		List<Map<String, String>> rows = this.queryForList(sql_1.toString(),args);
		
		StringBuilder sql_2 = new StringBuilder()
				.append(" select k.kkb101,k.kkb102,k.kkb103,k.kkb105")
				.append("	from kb01 k")
				.append("  where k.kkb110 = 1")
				.append("  	 and k.kkb101 = ?")
				;
		
		//定义返回容器
		List<Map<String, String>> cartItems = new ArrayList<>();
		//每一个cartItem包含kkb101(ID),kkb102(商品名),kkb103(商品单价),kkb105(缩略图),kkb402(数量)
		int initSize = (int)(5/0.75)+1;	
		for (Map<String, String> ins:rows)
		{
			Map<String,String> cartItem = new HashMap<>(initSize);
			cartItem = this.queryForMap(sql_2.toString(),ins.get("kkb101"));
			cartItem.put("kkb402",ins.get("kkb402"));
			cartItems.add(cartItem); 
		  }
	
		return cartItems;
	}
	
	/**
	 * 	根据购物车中用户id和商品id删除购物车中该用户对该商品的记录
	 * @return
	 * @throws Exception
	 */
	private boolean deleteFromMyCart() throws Exception
	{
		String sql = "delete from kb04 where kkb101 = ? and kkd101 = ?";
		Object args[] = 
			{
				this.get("kkb101"),
				"1"			//用户id待修改
			};
		return this.executeUpdate(sql, args) > 0;
	}
	
	/**
	 * 	更新购物车中某一商品的数目
	 * @return
	 * @throws Exception
	 */
	private boolean updateMyCart() throws Exception
	{
		String sql="update kb04 set kkb402 = ? where kkb101 = ? and kkd101 = ?";
		Object args[] = 
			{
				this.get("kkb402"),
				this.get("kkb101"),
				"1"			//用户id待修改
			};
		return this.executeUpdate(sql, args) > 0;
	}
}
