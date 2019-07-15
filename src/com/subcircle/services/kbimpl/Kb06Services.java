package com.subcircle.services.kbimpl;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb06Services extends JdbcServicesSupport 
{
	/**
	 * 	用户评价订单
	 * @return
	 * @throws Exception
	 */
	private boolean createRate() throws Exception
	{
		StringBuilder sql = new StringBuilder()
			.append(" insert into kb06(kkb501,kkd101,kkb602,kkb603,kkb604,kkb605)")
			.append("		   values     (?,?,?,?,current_timestamp,?)")
			;
		
		//前端页面传过来对应
		Object kkb501List[] = this.getIdlist("kkb501List");	//订单流水号
		Object kkb101List[] = this.getIdlist("kkb101List");	//商品id
		Object kkb602List[] = this.getIdlist("kkb602");		//订单评分
		Object kkb603List[] = this.getIdlist("kkb603");		//订单评价
		
		for(int i = 0; i < kkb501List.length;i++) 
		{
			Object args[] = 
				{
					kkb501List[i],
					this.get("kkd101"),		//用户id
					kkb602List[i],
					kkb603List[i],
					kkb101List[i]
				};
			
			this.appendSql(sql.toString(), args);
		}
		
		return this.executeTransaction();
	} 
	
	/**
	 * 用户评价完订单后修改订单状态为已评价
	 * @return
	 * @throws Exception
	 */
	private boolean updateKkb508()throws Exception 
	{
		StringBuilder sql = new StringBuilder()
			.append("	update kb05 ")
			.append("	   set kkb508 = ?")
			.append("	 where kkd101 = ? and kkb507 = ?")
			;
		
		Object args[] = 
			{
				"1",		//是否评价的标识--1表示已评价
				this.get("kkd101"),		//用户id
				this.get("kkb507")
			};
		
		return this.executeUpdate(sql.toString(), args) > 0;
	}
	
	/**
	 * 	返回某一商品的评分
	 * @param itemId
	 * @return
	 * @throws Exception
	 */
	public String getScoreById(String itemId) throws Exception 
	{
		String sql = "select avg(kkb602) as kkb602 from kb06  where kkb605 = ?";
		Object args[] = 
			{
				itemId	
			};
		return this.queryForMap(sql, args).get("kkb602");
	}
}
