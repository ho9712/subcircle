package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb03Services extends JdbcServicesSupport 
{
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object order=this.get("order");
		Object keyword=this.get("keyword");
		Object bkkb302=this.get("bkkb302");
		Object ekkb302=this.get("ekkb302");
		Object page=this.get("page");
		
		StringBuilder sql=new StringBuilder()
				.append("select b1.kkb101,b1.kkb102,b1.kkb103,b1.kkb104,b1.kkb105,b1.kkb107,")
				.append("			 b3.kkb301,date_format(b3.kkb302,'%Y-%m-%d %H:%i') kkb302")
				.append("  from kb01 b1,kb03 b3,kd01 d1")
				.append(" where b1.kkb101=b3.kkb101")
				.append("   and b3.kkd101=d1.kkd101")
				.append("   and b3.kkd101=?")
				;
		List<Object> paras=new ArrayList<>();
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and b1.kkb102 like ?");
			paras.add("%"+keyword+"%");
		}
		if(isNotNull(bkkb302))
		{
			sql.append(" and b3.kkb302>?");
			paras.add(bkkb302);
		}
		if(isNotNull(ekkb302))
		{
			sql.append(" and b3.kkb302<?");
			paras.add(ekkb302);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by b3.kkb302 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by b3.kkb302 desc");
			}
		}
		else
		{
			sql.append(" order by b3.kkb302 desc");
		}
		if(isNotNull(page))
		{
			sql.append(" limit ?,12");
			paras.add((Integer.parseInt((page).toString())-1)*12);
		}
		else
		{
			sql.append(" limit 0,12");
		}
		return this.queryForList(sql.toString(), paras.toArray());
	}
	
	//查询商品收藏数量
	public Map<String, String> shopCollCount()throws Exception
	{
		Object keyword=this.get("keyword");
		Object bkkb302=this.get("bkkb302");
		Object ekkb302=this.get("ekkb302");
		
		StringBuilder sql=new StringBuilder()
				.append("select b1.kkb101,b1.kkb102,b1.kkb103,b1.kkb104,b1.kkb105,b1.kkb107,")
				.append("			 b3.kkb301,date_format(b3.kkb302,'%Y-%m-%d %H:%i') kkb302")
				.append("  from kb01 b1,kb03 b3,kd01 d1")
				.append(" where b1.kkb101=b3.kkb101")
				.append("   and b3.kkd101=d1.kkd101")
				.append("   and b3.kkd101=?")
				;
		List<Object> paras=new ArrayList<>();
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and b1.kkb102 like ?");
			paras.add("%"+keyword+"%");
		}
		if(isNotNull(bkkb302))
		{
			sql.append(" and b3.kkb302>?");
			paras.add(bkkb302);
		}
		if(isNotNull(ekkb302))
		{
			sql.append(" and b3.kkb302<?");
			paras.add(ekkb302);
		}
		return this.queryForMap(sql.toString(), paras.toArray());
	}
	
	public boolean delShopColl()throws Exception
	{
		String sql="delete from kb03 where kkb301=?";
		return this.executeUpdate(sql, this.get("kkb301"))>0;
	}

}
