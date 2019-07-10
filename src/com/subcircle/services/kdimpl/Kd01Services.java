package com.subcircle.services.kdimpl;

import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;
import com.subcircle.system.tools.Tools;

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
				.append("insert into kd01(kkd101,kkd102,kkd103,kkd104,kkd105,kkd106)")
				.append("		 values (?,?,?,?,?,current_timestamp)")
				;
		Object[] args={
			Tools.getPk("kkd101"),
			this.get("kkd102"),
			Tools.getMd5(this.get("kkd103")),
			5,
			this.get("kkd105")
		};
		return this.executeUpdate(sql2.toString(), args)>0;
	}
	
	public Map<String, String> findById()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select kkd101,kkd102,kkd103,kkd104,kkd105,")
				.append("		kkd106,kkd107,kkd108,kkd109,kkd110,")
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
	
	public boolean modifyInfo()throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("update kd01")
				.append("   set kkd105=?,kkd107=?,kkd109=?,kkd110=?,")
				.append("		kkd111=?,kkd112=?")
				.append(" where kkd101=?")
				;
		Object[] args={
			this.get("kkd105"),
			this.get("kkd107"),
			this.get("kkd109"),
			this.get("kkd110"),
			this.get("kkd111"),
			this.get("kkd112"),
			this.get("kkd101")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	public boolean modifyPwd()throws Exception
	{
		String sql1="select kkd103 from kd01 where kkd101=?";
		Map<String, String> pwd=this.queryForMap(sql1, this.get("kkd101"));
		if(pwd.get("kkd103").equals(Tools.getMd5(this.get("kkd103-old"))))
		{
			String sql2="update kd01 set kkd103=? where kkd101=?";
			return this.executeUpdate(sql2, Tools.getMd5(this.get("kkd103")),this.get("kkd101"))>0;
		}
		else
		{
			return false;
		}
	}
	
	public boolean modifyAvatar()throws Exception
	{
		String sql="update kd01 set kkd108=? where kkd101=?";
		return this.executeUpdate(sql, this.get("kkd108"),this.get("kkd101"))>0;
	}

	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("select k.kkd101,k.kkd102,s.fvalue admin,k.kkd105,k.kkd108")
				.append("	from kd01 k,syscode s")
				.append(" where k.kkd104>0 and k.kkd104<4")
				.append("   and s.fname='kkd104'")
				.append("	 and k.kkd104=s.fcode ")
				;
		return this.queryForList(sql.toString());
	}
}
