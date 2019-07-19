package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kb02Services extends JdbcServicesSupport 
{
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object order=this.get("order");
		Object keyword=this.get("keyword");
		Object bkkb202=this.get("bkkb202");
		Object ekkb202=this.get("ekkb202");
		
		
		StringBuilder sql=new StringBuilder()
				.append("select b1.kkb101,b1.kkb102,b1.kkb103,b1.kkb104,b1.kkb105,")
				.append("			 b2.kkb201,date_format(b2.kkb202,'%Y-%m-%d %H:%i') kkb202")
				.append("  from kb01 b1,kb02 b2,kd01 d1")
				.append(" where b1.kkb101=b2.kkb101")
				.append("   and b2.kkd101=d1.kkd101")
				.append("   and b2.kkd101=?")
				;
		List<Object> paras=new ArrayList<>();
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and b1.kkb102 like ?");
			paras.add("%"+keyword+"%");
		}
		if(isNotNull(bkkb202))
		{
			sql.append(" and b2.kkb202>?");
			paras.add(bkkb202);
		}
		if(isNotNull(ekkb202))
		{
			sql.append(" and b2.kkb202<?");
			paras.add(ekkb202);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by b2.kkb202 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by b2.kkb202 desc");
			}
		}
		else
		{
			sql.append(" order by b2.kkb202 desc");
		}
		return this.queryForList(sql.toString(), paras.toArray());
	}
	
	public boolean delShopRecord()throws Exception
	{
		String sql="delete from kb02 where kkb201=?";
		return this.executeUpdate(sql, this.get("kkb201"))>0;
	}

	public boolean delSelect()throws Exception
	{
		String sql="delete from kb02 where kkb201=?";
		this.appendBatch(sql, this.getIdlist("kkb201List"));
		return this.executeTransaction();
	}
}
