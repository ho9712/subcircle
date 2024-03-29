package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.subcircle.services.support.JdbcServicesSupport;
import com.subcircle.system.tools.Tools;

public  class Kc04Services extends JdbcServicesSupport {

	public List<Map<String,String>> queryByCondition() throws Exception
	{
		
		
		String page = new String("1");
		if(this.get("page") != null)
		{
		page = this.get("page").toString();
		}
		int temp = Integer.parseInt(page);
		temp = (temp-1)*12;
		String curPage = String.valueOf(temp);
		
		StringBuilder sql = new StringBuilder()
				.append("SELECT k.kkc101,k.kkc402,k.kkc403,k.kkc404,k.kkc405,k.kkc406,k.kkc407,k.kkc408 ")
				.append("from kc04 k ")
				.append("ORDER BY k.kkc408 ")
				.append("LIMIT ")
				.append(curPage)
				.append(",12");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);
		
	}
	
	
public  Map<String,String> findById()throws Exception
	
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("select k.kkc402,k.kkc404,k.kkc406,k.kkc407,k.kkc408,")
				.append("       k.kkc409,k.kkc410,k.kkc411,k.kkc412 ")
				.append("from kc04 k ")
				.append("where k.kkc101=?")
				;
		
		
		return this.queryForMap(sql.toString(),this.get("kkc101"));
		
	}




	public boolean UpdateInfoG()throws Exception

{
	StringBuilder sql = new StringBuilder()
			.append("update kc04 ")
			.append("set kkc402=?,kkc409=?,kkc410=?,kkc411=? ")
			.append("where ")
			.append("kkc101=?")
			;
	
	Object args[] =
		{
				this.get("kkc402"),
				this.get("kkc409"),
				this.get("kkc410"),
				this.get("kkc411"),
				this.get("kkc101")
		};
	
	this.appendSql(sql.toString(), args);
	return this.executeTransaction();
}


public boolean addAnimeComment()throws Exception
{
	
	StringBuilder sql1 = new StringBuilder()
			
			.append("insert into kc06(kkd101,kkc101,kkc602) ")
			.append("values(?,?,CURRENT_TIMESTAMP)" );
	StringBuilder sql2 = new StringBuilder()
			
			.append("insert into kc07(kkc101,kkd101,kkc702,kkc703,kkc704) ")
			.append("values(?,?,?,?,CURRENT_TIMESTAMP)" )
			
			
			;
	Object args1[]={
			this.get("kkd101"),
			this.get("kkc101")
					};
	
	Object args2[]={
			this.get("kkc101"),
			this.get("kkd101"),
			this.get("kkc702"),
			this.get("kkc703")
	};
	
	
	this.appendSql(sql1.toString(), args1);
	this.appendSql(sql2.toString(), args2);
    return this.executeTransaction();
}



public boolean updateAnimeComment() throws Exception

{
	StringBuilder sql = new StringBuilder()
			.append("update kc07 ")
			.append("set kkc702=?,")
			.append("kkc703=?,")
			.append("kkc704=CURRENT_TIMESTAMP ")
			.append("where ")
			.append("kkc101=? ")
			.append("and ")
			.append("kkd101=?")
			;
	
	Object args[] ={
			
			this.get("kkc702"),
			this.get("kkc703"),
			this.get("kkc101"),
			this.get("kkd101")
	} ;
	
	this.appendSql(sql.toString(), args);
	
	
	return this.executeTransaction();
}



public List<Map<String, String>> queryAnimeTopic () throws Exception

{
	String kkc101 = this.get("kkc101").toString();
	StringBuilder sql =new StringBuilder()
			.append("select a.kka101,a.kkd101,a.kka102,a.kka104,date_format(a.kka105,'%Y-%m-%d %H:%i') kka105,b.kkd105 ")
			.append("from ka01 a,kd01 b ")
			.append("where a.kkc101=")
			.append(kkc101)
			.append(" and a.kkd101 = b.kkd101 ")
			.append("and a.kka106 = 1 ")
			.append("order by a.kka105 DESC ")
			.append("limit 5 ")
			;
	
	Object args[] = {};
	
	return this.queryForList(sql.toString(), args);
}

public boolean delAnimeComment() throws Exception
{
	
	StringBuilder sql1 = new StringBuilder()
			.append("delete from  kc07 ")
			.append("where ")
			.append("kkc101=? ")
			.append("and ")
			.append("kkd101=?")
			;
	Object args1[] ={
			this.get("kkc101"),
			this.get("kkd101")
	} ;
	
	
	
	StringBuilder sql2 = new StringBuilder()
			.append("delete from  kc06 ")
			.append("where ")
			.append("kkc101=? ")
			.append("and ")
			.append("kkd101=?")
			;
	
	
	this.appendSql(sql1.toString(), args1);
	this.appendSql(sql2.toString(), args1);
	
	
	
	
	return this.executeTransaction();
}



public List<Map<String,String>> queryAnimeComment () throws Exception


{
	String kkc101 = this.get("kkc101").toString();
	StringBuilder sql = new StringBuilder()
			.append("SELECT a.kkd101,a.kkd105,a.kkd108,b.kkc702,b.kkc703,date_format(b.kkc704,'%Y-%m-%d %H:%i') kkc704 ")
			.append("FROM kd01 a,kc07 b ")
			.append("where b.kkc101=")
			.append(kkc101)
			.append(" AND a.kkd101 = b.kkd101 ")
			.append("ORDER BY b.kkc704 DESC ")
			.append("LIMIT 8 ");
			;
	Object args[] = {};
	
	
	return this.queryForList(sql.toString(), args);
}


public List<Map<String,String>> queryAnimeCommentAll () throws Exception


{
	
	
	String page = new String("1");
	if(this.get("page") != null)
	{
	page = this.get("page").toString();
	}
	int temp = Integer.parseInt(page);
	temp = (temp-1)*12;
	String curPage = String.valueOf(temp);
	
	String kkc101 = this.get("kkc101").toString();
	StringBuilder sql = new StringBuilder()
			.append("SELECT c4.kkc409,a.kkd101,a.kkd105,a.kkd108,b.kkc702,b.kkc703,date_format(b.kkc704,'%Y-%m-%d %H:%i') kkc704 ")
			.append("FROM kd01 a,kc07 b,kc04 c4 ")
			.append("where b.kkc101=")
			.append(kkc101)
			.append(" AND a.kkd101 = b.kkd101 and b.kkc101=c4.kkc101  ")
			.append("ORDER BY b.kkc704 DESC ")
			.append("LIMIT ")
			.append(curPage)
			.append(",20");
			;
	Object args[] = {};
	
	
	return this.queryForList(sql.toString(), args);
}


public boolean collectionExsits()throws Exception
{
	
	
	if (this.get("kkd101")!= null)
			
			{
	
	String kkc101 = this.get("kkc101").toString();
	String kkd101 = this.get("kkd101").toString();
	StringBuilder sql = new StringBuilder()
			.append("SELECT COUNT(*) number from ")
			.append("kc06 a ")
			.append("where ")
			.append("a.kkd101 =")
			.append(kkd101)
			.append(" and ")
			.append("a.kkc101 =")
			.append(kkc101);
	Object args[] = {};
	List<Map<String,String>> Temp = this.queryForList(sql.toString(), args);
	String number = Temp.get(0).toString();    	
	String regEx="[^0-9]";  
	Pattern p = Pattern.compile(regEx);  
	Matcher m = p.matcher(number);
	number = m.replaceAll("").trim();
	if(Integer.parseInt(number)>0)
	{
		return true;
	}
	
	else{
	
	return false;
	}
	
			}
	
	else
		
	{
		
		return false;
	}
	
	
}



public boolean addGame() throws Exception

{
	StringBuilder sql1 = new StringBuilder()
			.append("insert into kc01 ")
			.append("(kkc101,kkc102) ")
			.append("values (?,?)")
			;
	int temp = Tools.getPk("kkc101");
	String kkc101 = String.valueOf(temp);
	String kkc102 ="3";
	StringBuilder sql2 = new StringBuilder()
			.append("insert into kc04 ")
			.append("(kkc101,kkc402,kkc404,kkc405,kkc409,kkc410,kkc411 )")
			.append("values (?,?,?,?,?,?,?)")
			;
	
	Object args1 []=
		{
				kkc101,
				kkc102
		};
	Object args2 []=
		{
				kkc101,
				this.get("kkc402"),
				this.get("kkc404"),
				this.get("kkc405"),
				this.get("kkc409"),
				this.get("kkc410"),
				this.get("kkc411")
				
		};
	
	this.appendSql(sql1.toString(), args1);
	this.appendSql(sql2.toString(), args2);
	return this.executeTransaction();
}
	
}
