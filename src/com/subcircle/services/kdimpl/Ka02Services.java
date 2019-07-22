package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Ka02Services extends JdbcServicesSupport 
{
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object order=this.get("order");
		Object keyword=this.get("keyword");
		Object plate=this.get("plate");
		Object bkka203=this.get("bkka203");
		Object ekka203=this.get("ekka203");
		Object page=this.get("page");
		
		StringBuilder sql=new StringBuilder()
				.append("select a1.kka101,a1.kka102,a1.kka103,s.fvalue cnkka103,a2.kka201,")
				.append("			 a2.kka202,date_format(a2.kka203,'%Y-%m-%d %H:%i') kka203")
				.append("	from ka01 a1,ka02 a2,kd01 d1,syscode s")
				.append(" where a1.kka106=1 and a2.kka204=1")
				.append("	 and a1.kka101=a2.kka101")
				.append("	 and a2.kkd101=d1.kkd101")
				.append("   and s.fname='kka103' and s.fcode=a1.kka103")
				.append("	 and a2.kka201!=0")
				.append("   and d1.kkd101=?")
				;
		List<Object> paras=new ArrayList<>();
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and a2.kka202 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(plate))
		{
			sql.append(" and a1.kka103=?");
			paras.add(plate);
		}
		if(isNotNull(bkka203))
		{
			sql.append(" and a2.kka203>?");
			paras.add(bkka203);
		}
		if(isNotNull(ekka203))
		{
			sql.append(" and a2.kka203<?");
			paras.add(ekka203);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by a2.kka203 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by a2.kka203 desc");
			}
		}
		else
		{
			sql.append(" order by a2.kka203 desc");
		}
		if(isNotNull(page))
		{
			sql.append(" limit ?,6");
			paras.add((Integer.parseInt((page).toString())-1)*6);
		}
		else
		{
			sql.append(" limit 0,6");
		}
		return this.queryForList(sql.toString(), paras.toArray());
	}
	
	//查询回帖数量
	public Map<String, String> replyRecordCount() throws Exception 
	{
		Object keyword=this.get("keyword");
		Object plate=this.get("plate");
		Object bkka203=this.get("bkka203");
		Object ekka203=this.get("ekka203");
		
		StringBuilder sql=new StringBuilder()
				.append("select count(*) count")
				.append("	from ka01 a1,ka02 a2,kd01 d1,syscode s")
				.append(" where a1.kka106=1 and a2.kka204=1")
				.append("	 and a1.kka101=a2.kka101")
				.append("	 and a2.kkd101=d1.kkd101")
				.append("   and s.fname='kka103' and s.fcode=a1.kka103")
				.append("	 and a2.kka201!=0")
				.append("   and d1.kkd101=?")
				;
		List<Object> paras=new ArrayList<>();
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and a2.kka202 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(plate))
		{
			sql.append(" and a1.kka103=?");
			paras.add(plate);
		}
		if(isNotNull(bkka203))
		{
			sql.append(" and a2.kka203>?");
			paras.add(bkka203);
		}
		if(isNotNull(ekka203))
		{
			sql.append(" and a2.kka203<?");
			paras.add(ekka203);
		}
		return this.queryForMap(sql.toString(), paras.toArray());
	}

	public boolean delReply()throws Exception
	{
		String sql="update ka02 set kka204=0 where kka201=?";
		return this.executeUpdate(sql, this.get("kka201"))>0;
	}
	
	//查询其他用户信息
	public Map<String, String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select kkd101,kkd102,kkd103,kkd104,kkd105,")
				.append("		date_format(kkd106,'%Y-%m-%d %H:%i:%S') kkd106,kkd107,kkd108,kkd109,kkd110,")
				.append("		kkd111,kkd112")
				.append("  from kd01")
				
				;
		if(this.get("kkd101")!=null)
		{
			sql.append(" where kkd101=?");
			return this.queryForMap(sql.toString(), this.get("kkd101"));
		}
		else
		{
			sql.append(" where kkd102=?");
			return this.queryForMap(sql.toString(), this.get("kkd102"));
		}
	}
}
