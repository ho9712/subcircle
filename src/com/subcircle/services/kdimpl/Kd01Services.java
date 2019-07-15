package com.subcircle.services.kdimpl;

import java.util.ArrayList;
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
	
	public List<Map<String, String>> queryMsg()throws Exception
	{
		String sql="select a.kkd105 sender,b.kkd204 title from kd01 a,kd02 b where a.kkd102=b.kkd202 and b.kkd203=? and b.kkd206='0'";
		return this.queryForList(sql, this.get("username"));
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
		//还原查询条件
		Object qkkd104=this.get("qkkd104");
		Object keyword=this.get("keyword");
		Object order=this.get("order");
		
		StringBuilder sql=new StringBuilder()
				.append("select k.kkd101,k.kkd102,k.kkd104,s.fvalue admin,k.kkd105,date_format(k.kkd106,'%Y-%m-%d %H:%i:%S') kkd106,k.kkd107,k.kkd108")
				.append("	from kd01 k,syscode s")
				.append(" where s.fname='kkd104'")
				.append("	 and k.kkd104=s.fcode ")
				;
		List<Object> paraList=new ArrayList<>();
		if(qkkd104==null || "123".contains(qkkd104.toString()))
		{
			sql.append(" and k.kkd104>0 and k.kkd104<4");
		}
		if(qkkd104!=null && !qkkd104.equals(""))
		{
			sql.append(" and k.kkd104=?");
			paraList.add(qkkd104);
		}
		if(keyword!=null && !keyword.equals(""))
		{
			sql.append(" and (k.kkd102 like ? or k.kkd105 like ?)");
			paraList.add("%"+keyword+"%");
			paraList.add("%"+keyword+"%");
		}
		if(order!=null && order.toString().equals("1"))
		{
			sql.append(" order by k.kkd106 desc");
		}
		if(order!=null && order.toString().equals("2"))
		{
			sql.append(" order by s.fvalue desc");
		}
		if(order!=null && order.toString().equals("3"))
		{
			sql.append(" order by k.kkd105 desc");
		}
		List<Map<String, String>> admins=this.queryForList(sql.toString(),paraList.toArray());
		return admins;
	}
	
	public boolean addAdmin()throws Exception
	{
		//判断用户名是否重复
		String sql1="select kkd102 from kd01 where kkd102=?";
		if(this.queryForMap(sql1, this.get("kkd102"))!=null)
		{
			return false;
		}
		StringBuilder sql=new StringBuilder()
				.append("insert into kd01(kkd101,kkd102,kkd103,kkd104,kkd105,")
				.append("								 kkd106)")
				.append("     values (?,?,?,?,?,current_timestamp)")
				;
		Object[] args={
			Tools.getPk("admin"),
			this.get("kkd102"),
			Tools.getMd5(this.get("kkd103")),
			this.get("kkd104"),
			this.get("kkd105")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	public boolean delAdmin()throws Exception
	{
		String sql="delete from kd01 where kkd101=?";
		return this.executeUpdate(sql, this.get("kkd101"))>0;
	}
	
	public boolean modifyAdmin()throws Exception
	{
		StringBuilder sql=new StringBuilder().append("update kd01 set ");
		List<Object> paras=new ArrayList<>();
		if(this.get("flag").toString().equals("1"))
		{
			sql.append(" kkd103=?");
			paras.add(Tools.getMd5(this.get("kkd103")));
		}
		else 
		{
			sql.append(" kkd104=?");
			paras.add(this.get("kkd104"));
		}
		sql.append(" where kkd101=?");
		paras.add(this.get("kkd101"));
		return this.executeUpdate(sql.toString(), paras.toArray())>0;
	}
	
	public boolean revokePermission()throws Exception
	{
		String sql="update kd01 set kkd104='5' where kkd101=?";
		return this.executeUpdate(sql,this.get("kkd101"))>0;
	}
	
	
}
