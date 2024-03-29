package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Ka01Services extends JdbcServicesSupport 
{
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object order=this.get("order");
		Object keyword=this.get("keyword");
		Object plate=this.get("plate");
		Object bkka105=this.get("bkka105");
		Object ekka105=this.get("ekka105");
		Object page=this.get("page");
		
		StringBuilder sql=new StringBuilder()
				.append("select a1.kka101,a1.kka102,a1.kka103,s.fvalue cnkka103,a1.kka104,")
				.append("			 date_format(a1.kka105,'%Y-%m-%d %H:%i') kka105")
				.append("  from ka01 a1,kd01 d1,syscode s")
				.append(" where a1.kkd101=d1.kkd101 and a1.kka106=1")
				.append("   and s.fname='kka103' and s.fcode=a1.kka103")
				.append("   and d1.kkd101=?")
				;
		List<Object> paras=new ArrayList<>();
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and a1.kka102 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(plate))
		{
			sql.append(" and a1.kka103=?");
			paras.add(plate);
		}
		if(isNotNull(bkka105))
		{
			sql.append(" and a1.kka105>?");
			paras.add(bkka105);
		}
		if(isNotNull(ekka105))
		{
			sql.append(" and a1.kka105<?");
			paras.add(ekka105);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by a1.kka105 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by a1.kka105 desc");
			}
		}
		else
		{
			sql.append(" order by a1.kka105 desc");
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
	
	//查询发帖数量
	public Map<String, String> postRecordCount() throws Exception 
	{
		Object keyword=this.get("keyword");
		Object plate=this.get("plate");
		Object bkka105=this.get("bkka105");
		Object ekka105=this.get("ekka105");
		
		StringBuilder sql=new StringBuilder()
				.append("select count(*) count")
				.append("  from ka01 a1,kd01 d1,syscode s")
				.append(" where a1.kkd101=d1.kkd101 and a1.kka106=1")
				.append("   and s.fname='kka103' and s.fcode=a1.kka103")
				.append("   and d1.kkd101=?")
				;
		List<Object> paras=new ArrayList<>();
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and a1.kka102 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(plate))
		{
			sql.append(" and a1.kka103=?");
			paras.add(plate);
		}
		if(isNotNull(bkka105))
		{
			sql.append(" and a1.kka105>?");
			paras.add(bkka105);
		}
		if(isNotNull(ekka105))
		{
			sql.append(" and a1.kka105<?");
			paras.add(ekka105);
		}
		return this.queryForMap(sql.toString(), paras.toArray());
	}

	public boolean delPost()throws Exception
	{
		String sql="update ka01 set kka106=0 where kka101=?";
		return this.executeUpdate(sql, this.get("kka101"))>0;
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
