package com.subcircle.services;

import java.util.HashMap;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class HomeServices extends JdbcServicesSupport 
{
	@Override
	public Map<String, Object> queryInMap() throws Exception 
	{
		Map<String, Object> home=new HashMap<>();
		StringBuilder sql1=new StringBuilder()
				.append("select kkc101,kkc202,kkc204,kkc207")
				.append("  from kc02")
				.append(" limit 7")
				;
		home.put("anime", this.queryForList(sql1.toString()));
		StringBuilder sql2=new StringBuilder()
				.append("select kkc101,kkc302,kkc304,kkc307")
				.append("  from kc03")
				.append(" limit 7")
				;
		home.put("book", this.queryForList(sql2.toString()));
		StringBuilder sql3=new StringBuilder()
				.append("select kkc101,kkc402,kkc404,kkc407")
				.append("  from kc04")
				.append(" limit 7")
				;
		home.put("game", this.queryForList(sql3.toString()));
		StringBuilder sql4=new StringBuilder()
				.append("select a1.kka101,a1.kka102,date_format(a1.kka105,'%Y-%m-%d %H:%i') kka105,d1.kkd101,d1.kkd105,d1.kkd108")
				.append("  from ka01 a1,kd01 d1")
				.append(" where a1.kkd101=d1.kkd101 and a1.kka106=1")
				.append(" order by a1.kka105 desc limit 5")
				;
		home.put("posts", this.queryForList(sql4.toString()));
		return home;
	}

}
