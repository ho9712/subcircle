package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kd03Services extends JdbcServicesSupport 
{
	public boolean commitApp()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("insert into kd03(kkd101,kkd302,kkd303,kkd304,kkd305)")
				.append(" values (?,?,?,current_timestamp,0)")
				;
		Object[] args={
			this.get("kkd101"),
			this.get("kkd302"),
			this.get("kkd303")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}

	@Override
	public Map<String, String> findById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("select k.kkd302,k.kkd303,date_format(k.kkd304,'%Y-%m-%d %H:%i:%S') kkd304,s.fvalue kkd305 ")
				.append("  from kd03 k,syscode s ")
				.append(" where kkd101=? and k.kkd305=s.fcode and s.fname='kkd305'")
				;
		return this.queryForMap(sql.toString(), this.get("kkd101"));
	}
	
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object keyword=this.get("keyword");
		Object order=this.get("order");
		Object state=this.get("state");
		
		StringBuilder sql=new StringBuilder()
				.append("select a.kkd301,b.kkd101,b.kkd102,s.fvalue kkd104,b.kkd105,b.kkd107,b.kkd108,a.kkd302,")
				.append("			 a.kkd303,date_format(a.kkd304,'%Y-%m-%d %H:%i:%S') kkd304,a.kkd305")
				.append("  from kd03 a,kd01 b,syscode s")
				.append(" where a.kkd101=b.kkd101 and s.fname='kkd104' and s.fcode=b.kkd104")
				;
		List<Object> paraList=new ArrayList<>();
		if(keyword!=null && !keyword.equals(""))
		{
			sql.append(" and (b.kkd102 like ? or b.kkd105 like ? or a.kkd302 like ? or a.kkd303 like ?)");
			paraList.add("%"+keyword+"%");
			paraList.add("%"+keyword+"%");
			paraList.add("%"+keyword+"%");
			paraList.add("%"+keyword+"%");
		}
		if(state!=null && !state.equals(""))
		{
			sql.append(" and a.kkd305=?");
			paraList.add(state);
		}
		if(order!=null && order.toString().equals("1"))
		{
			sql.append(" order by a.kkd304 desc");
		}
		if(order!=null && order.toString().equals("2"))
		{
			sql.append(" order by b.kkd105 desc");
		}
		return this.queryForList(sql.toString(),paraList.toArray());
	}
	
	public boolean delApp()throws Exception
	{
		String sql="delete from kd03 where kkd301=?";
		return this.executeUpdate(sql, this.get("kkd301"))>0;
	}
	
	public boolean dealApp()throws Exception
	{
		if(this.get("flag").toString().equals("accept"))
		{
			String sql1="update kd01 set kkd104='4' where kkd101=?";
			this.appendSql(sql1, this.get("kkd101"));
			String sql2="update kd03 set kkd305='1' where kkd101=?";
			this.appendSql(sql2, this.get("kkd101"));
			return this.executeTransaction();
		}
		else
		{
			String sql="update kd03 set kkd305='2' where kkd101=?";
			return this.executeUpdate(sql, this.get("kkd101"))>0;
		}
	}
	

}
