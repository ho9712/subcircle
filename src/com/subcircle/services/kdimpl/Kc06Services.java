package com.subcircle.services.kdimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.subcircle.services.support.JdbcServicesSupport;

public class Kc06Services extends JdbcServicesSupport 
{
	//查询动画收藏
	public List<Map<String, String>> queryAnimeColl()throws Exception
	{
		Object keyword=this.get("keyword");
		Object bkkc602=this.get("bkkc602");
		Object ekkc602=this.get("ekkc602");
		Object order=this.get("order");
		Object page=this.get("page");
		
		List<Object> paras=new ArrayList<>();
		StringBuilder sql=new StringBuilder()
				.append("select c6.kkc601,c6.kkc101,date_format(c6.kkc602,'%Y-%m-%d %H:%i') kkc602,c2.kkc202,c2.kkc204,c2.kkc205,")
				.append("			 c7.kkc701,c7.kkc702,c7.kkc703")
				.append("	from kc01 c1,kc02 c2,kc06 c6,kc07 c7")
				.append(" where c6.kkd101=? and c7.kkd101=?")
				.append("   and c6.kkc101=c1.kkc101")
				.append("   and c2.kkc101=c1.kkc101")
				.append("   and c7.kkc101=c1.kkc101")
				;
		paras.add(this.get("kkd101"));
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and c2.kkc202 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(bkkc602))
		{
			sql.append(" and c6.kkc602>?");
			paras.add(bkkc602);
		}
		if(isNotNull(ekkc602))
		{
			sql.append(" and c6.kkc602<?");
			paras.add(ekkc602);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by c6.kkc602 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by c6.kkc602 desc");
			}
			if(order.toString().equals("3"))
			{
				sql.append(" order by c7.kkc702 asc");
			}
			if(order.toString().equals("4"))
			{
				sql.append(" order by c7.kkc702 desc");
			}
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
	
	//查询动画收藏数量
	public Map<String, String> queryAnimeCollCount()throws Exception
	{
		Object keyword=this.get("keyword");
		Object bkkc602=this.get("bkkc602");
		Object ekkc602=this.get("ekkc602");
		
		List<Object> paras=new ArrayList<>();
		StringBuilder sql=new StringBuilder()
				.append("select count(*) count")
				.append("	from kc01 c1,kc02 c2,kc06 c6,kc07 c7")
				.append(" where c6.kkd101=? and c7.kkd101=?")
				.append("   and c6.kkc101=c1.kkc101")
				.append("   and c2.kkc101=c1.kkc101")
				.append("   and c7.kkc101=c1.kkc101")
				;
		paras.add(this.get("kkd101"));
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and c2.kkc202 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(bkkc602))
		{
			sql.append(" and c6.kkc602>?");
			paras.add(bkkc602);
		}
		if(isNotNull(ekkc602))
		{
			sql.append(" and c6.kkc602<?");
			paras.add(ekkc602);
		}
		return this.queryForMap(sql.toString(), paras.toArray());
	}
	
	//查询书籍收藏
	public List<Map<String, String>> queryBookColl()throws Exception
	{
		Object keyword=this.get("keyword");
		Object bkkc602=this.get("bkkc602");
		Object ekkc602=this.get("ekkc602");
		Object order=this.get("order");
		Object page=this.get("page");
		
		List<Object> paras=new ArrayList<>();
		StringBuilder sql=new StringBuilder()
				.append("select c6.kkc601,c6.kkc101,date_format(c6.kkc602,'%Y-%m-%d %H:%i') kkc602,c3.kkc302,c3.kkc304,")
				.append("			 c3.kkc305,c3.kkc309,c7.kkc701,c7.kkc702,c7.kkc703")
				.append("	from kc01 c1,kc03 c3,kc06 c6,kc07 c7")
				.append(" where c6.kkd101=? and c7.kkd101=?")
				.append("   and c6.kkc101=c1.kkc101")
				.append("   and c3.kkc101=c1.kkc101")
				.append("   and c7.kkc101=c1.kkc101")
				;
		paras.add(this.get("kkd101"));
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and c3.kkc302 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(bkkc602))
		{
			sql.append(" and c6.kkc602>?");
			paras.add(bkkc602);
		}
		if(isNotNull(ekkc602))
		{
			sql.append(" and c6.kkc602<?");
			paras.add(ekkc602);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by c6.kkc602 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by c6.kkc602 desc");
			}
			if(order.toString().equals("3"))
			{
				sql.append(" order by c7.kkc702 asc");
			}
			if(order.toString().equals("4"))
			{
				sql.append(" order by c7.kkc702 desc");
			}
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
	
	//查询书籍收藏数量
	public Map<String, String> queryBookCollCount()throws Exception
	{
		Object keyword=this.get("keyword");
		Object bkkc602=this.get("bkkc602");
		Object ekkc602=this.get("ekkc602");
		
		List<Object> paras=new ArrayList<>();
		StringBuilder sql=new StringBuilder()
				.append("select count(*) count")
				.append("	from kc01 c1,kc03 c3,kc06 c6,kc07 c7")
				.append(" where c6.kkd101=? and c7.kkd101=?")
				.append("   and c6.kkc101=c1.kkc101")
				.append("   and c3.kkc101=c1.kkc101")
				.append("   and c7.kkc101=c1.kkc101")
				;
		paras.add(this.get("kkd101"));
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and c3.kkc302 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(bkkc602))
		{
			sql.append(" and c6.kkc602>?");
			paras.add(bkkc602);
		}
		if(isNotNull(ekkc602))
		{
			sql.append(" and c6.kkc602<?");
			paras.add(ekkc602);
		}
		return this.queryForMap(sql.toString(), paras.toArray());
	}
	
	//查询游戏收藏
	public List<Map<String, String>> queryGameColl()throws Exception
	{
		Object keyword=this.get("keyword");
		Object bkkc602=this.get("bkkc602");
		Object ekkc602=this.get("ekkc602");
		Object order=this.get("order");
		Object page=this.get("page");
		
		List<Object> paras=new ArrayList<>();
		StringBuilder sql=new StringBuilder()
				.append("select c6.kkc601,c6.kkc101,date_format(c6.kkc602,'%Y-%m-%d %H:%i') kkc602,c4.kkc402,c4.kkc404,")
				.append("			 c4.kkc405,c4.kkc409,c7.kkc701,c7.kkc702,c7.kkc703")
				.append("	from kc01 c1,kc04 c4,kc06 c6,kc07 c7")
				.append(" where c6.kkd101=? and c7.kkd101=?")
				.append("   and c6.kkc101=c1.kkc101")
				.append("   and c4.kkc101=c1.kkc101")
				.append("   and c7.kkc101=c1.kkc101")
				;
		paras.add(this.get("kkd101"));
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and c4.kkc402 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(bkkc602))
		{
			sql.append(" and c6.kkc602>?");
			paras.add(bkkc602);
		}
		if(isNotNull(ekkc602))
		{
			sql.append(" and c6.kkc602<?");
			paras.add(ekkc602);
		}
		if(isNotNull(order))
		{
			if(order.toString().equals("1"))
			{
				sql.append(" order by c6.kkc602 asc");
			}
			if(order.toString().equals("2"))
			{
				sql.append(" order by c6.kkc602 desc");
			}
			if(order.toString().equals("3"))
			{
				sql.append(" order by c7.kkc702 asc");
			}
			if(order.toString().equals("4"))
			{
				sql.append(" order by c7.kkc702 desc");
			}
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
	
	//查询游戏收藏数量
	public Map<String, String> queryGameCollCount()throws Exception
	{
		Object keyword=this.get("keyword");
		Object bkkc602=this.get("bkkc602");
		Object ekkc602=this.get("ekkc602");
		
		List<Object> paras=new ArrayList<>();
		StringBuilder sql=new StringBuilder()
				.append("select count(*) count")
				.append("	from kc01 c1,kc04 c4,kc06 c6,kc07 c7")
				.append(" where c6.kkd101=? and c7.kkd101=?")
				.append("   and c6.kkc101=c1.kkc101")
				.append("   and c4.kkc101=c1.kkc101")
				.append("   and c7.kkc101=c1.kkc101")
				;
		paras.add(this.get("kkd101"));
		paras.add(this.get("kkd101"));
		if(isNotNull(keyword))
		{
			sql.append(" and c4.kkc402 like ?");
			paras.add("%"+keyword+"%");
			
		}
		if(isNotNull(bkkc602))
		{
			sql.append(" and c6.kkc602>?");
			paras.add(bkkc602);
		}
		if(isNotNull(ekkc602))
		{
			sql.append(" and c6.kkc602<?");
			paras.add(ekkc602);
		}
		return this.queryForMap(sql.toString(), paras.toArray());
	}
	
	//修改对作品的评分评价
	public boolean modifyComment()throws Exception
	{
		String sql="update kc07 set kkc702=?,kkc703=? where kkc701=?";
		Object[] args={
			this.get("kkc702"),	
			this.get("kkc703"),
			this.get("kkc701")
		};
		return this.executeUpdate(sql, args)>0;
	}
	
	public boolean delColl()throws Exception
	{
		String sql1="delete from kc06 where kkc601=?";
		String sql2="delete from kc07 where kkc701=?";
		this.appendSql(sql1, this.get("kkc601"));
		this.appendSql(sql2, this.get("kkc701"));
		return this.executeTransaction();
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
}
