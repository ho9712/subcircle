package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kc03Services extends JdbcServicesSupport {

	
	public List<Map<String,String>> queryByCondition() throws Exception
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("SELECT k.kkc101,k.kkc302,k.kkc303,k.kkc304,k.kkc305,k.kkc306,k.kkc307,k.kkc308 ")
				.append("from kc03 k ")
				.append("ORDER BY k.kkc308 ")
				.append("LIMIT 12");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);
		
		
		
	}	
}
