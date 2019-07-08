package com.subcircle.services.kdimpl;

import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kd01Services extends JdbcServicesSupport 
{
	
	public boolean userSignUp()throws Exception
	{
		//判断用户名是否重复
		String sql1="select kkd102 from kd01 where kkd102=?";
		if(this.queryForMap(sql1, this.get("kkd102"))!=null)
		{
			return false;
		}
		StringBuilder sql2=new StringBuilder()
				.append("insert into kd01(kkd102,kkd103,kkd104,kkd105,kkd106)")
				.append("		 values (?,?,?,?,current_timestamp)")
				;
		Object[] args={
			this.get("kkd102"),
			this.get("kkd103"),
			5,
			this.get("kkd105")
		};
		return this.executeUpdate(sql2.toString(), args)>0;
	}
	
	public Map<String, String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select kkd101,kkd102,kkd103,kkd104,kkd105,")
				.append("			 kkd106,kkd107,kkd108,kkd109,kkd110,")
				.append("			 kkd111,kkd112")
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
	
	public boolean modifyInfo()throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("update kd01")
				.append("   set kkd105=?,kkd107=?,kkd108=?,kkd109=?,kkd110=?,")
				.append("				kkd111=?,kkd112=?")
				.append(" where kkd101=?")
				;
		Object[] args={
			this.get("kkd105"),
			this.get("kkd107"),
			this.get("kkd108"),
			this.get("kkd109"),
			this.get("kkd110"),
			this.get("kkd111"),
			this.get("kkd112"),
			this.get("kkd101")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}

}
