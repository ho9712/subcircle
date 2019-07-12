package com.subcircle.services.kbimpl;

import java.util.List;
import java.util.Map;

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
		//查询购物车中是否存在该商品
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
		
		StringBuilder sql = new StringBuilder()
			.append(" select k4.kkb101,k4.kkb402,k1.kkb102,k1.kkb103,k1.kkb105")
			.append("   from kb04 k4,kb01 k1")
			.append("  where k4.kkd101 = ? ")
			.append(" 	 and k4.kkb101 = k1.kkb101 ")
			.append(" 	 and k1.kkb110 = 1")
			;
		
		Object args[] = 
		{
			"1" //用户id待替换	
		};
		return  this.queryForList(sql.toString(), args);
	}
	
	/**
	 * 	根据购物车中用户id和商品id删除购物车中该用户对该商品的记录
	 * @return
	 * @throws Exception
	 */
	private boolean deleteFromMyCart() throws Exception
	{
		String sql = "delete from  kb04 where kkb101 = ? and kkd101 = ?";
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
	
	/**
	 *	付款成功后根据商户订单号删除该用户购物车中对应的商品 
	 * @param kkb507
	 */
	//(绕开核心控制器的操作无法获取dto通过参数传递解决,访问权限设为public)
	public boolean deleteCartItemsAfterPay(String kkb507,String userID)throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append(" delete ")
			.append("	  from kb04")
			.append("  where kkb101 in ")
			.append("		  	(select k5.kkb101 ")
			.append("					 from kb05 k5 ")
			.append("					where k5.kkb507 = ?)")
			.append("    and kkd101 = ? ")
			;
		
		Object args[] = 
			{
				kkb507,		//商户订单号
				userID  		//用户id待修改
			};
		return this.executeUpdate(sql.toString(), args)  > 0;
	}
}
