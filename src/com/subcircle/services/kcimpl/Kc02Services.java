package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kc02Services extends JdbcServicesSupport {
	
	
	
	public List<Map<String,String>> queryByCondition() throws Exception
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("SELECT k.kkc101,k.kkc202,k.kkc203,k.kkc204,k.kkc205,k.kkc206,k.kkc207,k.kkc208 ")
				.append("from kc02 k ")
				.append("ORDER BY k.kkc208 ")
				.append("LIMIT 12");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);
		
		
		
	}	
}
