package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public  class Kc04Services extends JdbcServicesSupport {

	public List<Map<String,String>> queryByCondition() throws Exception
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("SELECT k.kkc101,k.kkc402,k.kkc403,k.kkc404,k.kkc405,k.kkc406,k.kkc407,k.kkc408 ")
				.append("from kc04 k ")
				.append("ORDER BY k.kkc408 ")
				.append("LIMIT 12");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);
		
	}
	
	
public  Map<String,String> findById()throws Exception
	
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("select k.kkc402,k.kkc404,k.kkc406,k.kkc407,k.kkc408,")
				.append("       k.kkc409,k.kkc410,k.kkc411,k.kkc412 ")
				.append("from kc04 k ")
				.append("where k.kkc101=?")
				;
		
		
		return this.queryForMap(sql.toString(),this.get("kkc101"));
		
	}
	
}
