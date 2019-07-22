package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Ka04Services extends JdbcServicesSupport 
{
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object order=this.get("order");
		Object keyword=this.get("keyword");
		Object plate=this.get("plate");
		Object bkka402=this.get("bkka402");
		Object ekka402=this.get("ekka402");
		Object page=this.get("page");
		
		StringBuilder sql=new StringBuilder()
				.append("select a1.kka101,a1.kka102,a1.kka103,s.fvalue cnkka103,a4.kka401,")
				.append("			 date_format(a4.kka402,'%Y-%m-%d %H:%i') kka402,d1.kkd105")
				.append("	from ka01 a1,ka04 a4,kd01 d1,syscode s")
				.append(" where s.fname='kka103' and s.fcode=kka103")
				.append("   and a1.kka101=a4.kka101")
				.append("   and a4.kkd101=d1.kkd101")
				.append("   and a1.kka106=1")
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
		if(isNotNull(bkka402))
		{
			sql.append(" and a4.kka402>?");
			paras.add(bkka402);
		}
		if(isNotNull(ekka402))
		{
			sql.append(" and a4.kka402<?");
			paras.add(ekka402);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by a4.kka402 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by a4.kka402 desc");
			}
		}
		else
		{
			sql.append(" order by a4.kka402 desc");
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

	//查询贴子收藏数量
	public Map<String, String> postCollCount() throws Exception 
	{
		Object keyword=this.get("keyword");
		Object plate=this.get("plate");
		Object bkka402=this.get("bkka402");
		Object ekka402=this.get("ekka402");
		
		StringBuilder sql=new StringBuilder()
				.append("select count(*) count")
				.append("	from ka01 a1,ka04 a4,kd01 d1,syscode s")
				.append(" where s.fname='kka103' and s.fcode=kka103")
				.append("   and a1.kka101=a4.kka101")
				.append("   and a4.kkd101=d1.kkd101")
				.append("   and a1.kka106=1")
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
		if(isNotNull(bkka402))
		{
			sql.append(" and a4.kka402>?");
			paras.add(bkka402);
		}
		if(isNotNull(ekka402))
		{
			sql.append(" and a4.kka402<?");
			paras.add(ekka402);
		}
		return this.queryForMap(sql.toString(), paras.toArray());
	}
	
	public boolean delPostColl()throws Exception
	{
		String sql="delete from ka04 where kka401=?";
		return this.executeUpdate(sql, this.get("kka401"))>0;
	}
}
