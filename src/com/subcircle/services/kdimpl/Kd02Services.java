package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kd02Services extends JdbcServicesSupport 
{
	public boolean sendMsg()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("insert into kd02(kkd202,kkd203,kkd204,kkd205,kkd206,kkd207,kkd208,kkd209)")
				.append("     values (?,?,?,?,?,current_timestamp,'0','0')")
				;
		Object[] args={
			this.get("kkd202"),	
			this.get("kkd203"),
			this.get("kkd204"),
			this.get("kkd205"),
			"0"
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	@Override
	public List<Map<String, String>> queryByCondition() throws Exception 
	{
		Object flag=this.get("flag");
		Object order=this.get("order");
		Object sender=this.get("keyword");
		Object receiver=this.get("receiver");
		Object kkd206=this.get("kkd206");
		
		StringBuilder sql=new StringBuilder()
				.append("select a.kkd104,a.kkd105,a.kkd108,b.kkd201,b.kkd202,b.kkd203,")
				.append("			 b.kkd204,b.kkd205,b.kkd206,date_format(b.kkd207,'%Y-%m-%d %H:%i:%S') kkd207")
				.append("  from kd01 a,kd02 b")
				.append(" where true")
				;
		List<Object> paras=new ArrayList<>();
		if(flag.toString().equals("receive")) //查询接收消息
		{
			sql.append(" and a.kkd102=b.kkd202");
			sql.append(" and b.kkd203=?");
			sql.append(" and b.kkd209='0'");
			paras.add(this.get("username"));
		}
		else  //查询发送消息
		{
			sql.append(" and a.kkd102=b.kkd203");
			sql.append(" and b.kkd202=?");
			sql.append(" and b.kkd208='0'");
			paras.add(this.get("username"));
		}
		if(isNotNull(sender))
		{
			sql.append(" and (a.kkd105 like ? or b.kkd202 like ?)");
			paras.add("%"+sender+"%");
			paras.add("%"+sender+"%");
		}
		if(isNotNull(receiver))
		{
			sql.append(" and (a.kkd105 like ? or b.kkd203 like ?)");
			paras.add("%"+receiver+"%");
			paras.add("%"+receiver+"%");
		}
		if(isNotNull(kkd206))
		{
			sql.append(" and b.kkd206=?");
			paras.add(kkd206);
		}
		if(order!=null && order.toString().equals("0"))
		{
			sql.append(" order by b.kkd207 asc");
		}
		else if(order!=null && order.toString().equals("1"))
		{
			sql.append(" order by b.kkd207 desc");
		}
		else
		{
			sql.append(" order by b.kkd207 desc");
		}
		return this.queryForList(sql.toString(), paras.toArray());
	}
	
	public boolean senderDelMsg()throws Exception
	{
		String sql="update kd02 set kkd208='1' where kkd201=?";
		return this.executeUpdate(sql, this.get("kkd201"))>0;
	}
	
	public boolean receiverDelMsg()throws Exception
	{
		String sql="update kd02 set kkd209='1' where kkd201=?";
		return this.executeUpdate(sql, this.get("kkd201"))>0;
	}

}
