package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kc02Services extends JdbcServicesSupport {
	
	/**
	 * 查询排名信息
	 */
	
	public List<Map<String,String>> queryByCondition() throws Exception
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("SELECT k.kkc101,k.kkc202,k.kkc203,k.kkc204,k.kkc205,k.kkc206,k.kkc207,k.kkc208 ")
				.append("from kc02 k ")
				.append("ORDER BY k.kkc208 ")
				.append("LIMIT 12 ");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);		
	}	
	
	
	public  Map<String,String> findById()throws Exception
	
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("select k.kkc202,k.kkc204,k.kkc206,k.kkc207,k.kkc208,")
				.append("       k.kkc209,k.kkc210,k.kkc211,k.kkc212,k.kkc213,")
				.append("       k.kkc214,k.kkc215,k.kkc216,k.kkc217,k.kkc218 ")
				.append("from kc02 k ")
				.append("where k.kkc101=?")
				;
		
		
		return this.queryForMap(sql.toString(),this.get("kkc101"));
		
	}
}
