package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Ka03Services extends JdbcServicesSupport 
{
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object flag=this.get("flag");
		Object keyword=this.get("keyword");
		Object plate=this.get("plate");
		Object bkka303=this.get("bkka303");
		Object ekka303=this.get("ekka303");
		
		StringBuilder sql=null;
		if(flag.toString().equals("post"))
		{
			sql=new StringBuilder()
					.append("select b.kka301,b.kka101,a.kka102,a.kka103,s.fvalue ckka103,a.kka104,b.kka302,")
					.append("			 date_format(b.kka303,'%Y-%m-%d %H:%i:%S') kka303")
					.append("	from ka01 a,ka03 b,syscode s")
					.append(" where a.kka106=1")
					.append("	 and a.kka101=b.kka101")
					.append("   and b.kka201=0")
					.append("   and s.fname='kka103' and s.fcode=a.kka103")
					;
		}
		else
		{
			sql=new StringBuilder()
					.append("select b.kka301,b.kka101,a.kka102,c.kka202,b.kka302,b.kka201,")
					.append("			 date_format(b.kka303,'%Y-%m-%d %H:%i:%S') kka303,s.fvalue ckka103,a.kka103")
					.append("	from ka01 a,ka03 b,ka02 c,syscode s")
					.append(" where a.kka106=1")
					.append("	 and c.kka204=1")
					.append("	 and a.kka101=b.kka101")
					.append("	 and c.kka101=a.kka101")
					.append("	 and b.kka201=c.kka201")
					.append("   and b.kka201!=0")
					.append("   and s.fname='kka103' and s.fcode=a.kka103")
					;
		}
		List<Object> paras=new ArrayList<>();
		if(isNotNull(keyword))
		{
			sql.append(" and (kka102 like ?)");
			paras.add("%"+keyword+"%");
		}
		if(isNotNull(plate))
		{
			sql.append(" and kka103=?");
			paras.add(plate);
		}
		if(isNotNull(bkka303))
		{
			sql.append(" and kka303>?");
			paras.add(bkka303);
		}
		if(isNotNull(ekka303))
		{
			sql.append(" and kka303<?");
			paras.add(ekka303);
		}
		sql.append(" order by kka303 desc");
		return this.queryForList(sql.toString(),paras.toArray());
	}
	
	public boolean delReport()throws Exception
	{
		String sql="delete from ka03 where kka301=?";
		return this.executeUpdate(sql, this.get("kka301"))>0;
	}

}
