package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.subcircle.services.support.JdbcServicesSupport;
import com.subcircle.system.tools.Tools;

public class Kc03Services extends JdbcServicesSupport {

	
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
				.append("SELECT k.kkc101,k.kkc302,k.kkc303,k.kkc304,k.kkc305,k.kkc306,k.kkc307,k.kkc308 ")
				.append("from kc03 k ")
				.append("ORDER BY k.kkc308 ")
				.append("LIMIT ")
				.append(curPage)
				.append(",12");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);
		
		
		
		
		
	}	
	
public  Map<String,String> findById()throws Exception
	
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("select k.kkc302,k.kkc304,k.kkc306,k.kkc307,k.kkc308,")
				.append("       k.kkc309,k.kkc310,k.kkc311,k.kkc312,k.kkc313,")
				.append("       k.kkc314,k.kkc315 ")
				.append("from kc03 k ")
				.append("where k.kkc101=?")
				;
		
		
		return this.queryForMap(sql.toString(),this.get("kkc101"));
		
	}







public boolean UpdateInfoB()throws Exception

{
	StringBuilder sql = new StringBuilder()
			.append("update kc03 ")
			.append("set kkc302=?,kkc309=?,kkc310=?,kkc311=?,kkc312=?,kkc313=?,kkc314=? ")
			.append("where ")
			.append("kkc101=?")
			;
	
	Object args[] =
		{
				this.get("kkc302"),
				this.get("kkc309"),
				this.get("kkc310"),
				this.get("kkc311"),
				this.get("kkc312"),
				this.get("kkc313"),
				this.get("kkc314"),	
				this.get("kkc101")
		};
	
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
			.append("SELECT c3.kkc309,a.kkd101,a.kkd105,a.kkd108,b.kkc702,b.kkc703,date_format(b.kkc704,'%Y-%m-%d %H:%i') kkc704 ")
			.append("FROM kd01 a,kc07 b,kc03 c3 ")
			.append("where b.kkc101=")
			.append(kkc101)
			.append(" AND a.kkd101 = b.kkd101 and b.kkc101=c3.kkc101  ")
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
	
	
	if(this.get("kkd101")!=null)
		
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

public boolean addBook() throws Exception

{
	StringBuilder sql1 = new StringBuilder()
			.append("insert into kc01 ")
			.append("(kkc101,kkc102) ")
			.append("values (?,?)")
			;
	int temp = Tools.getPk("kkc101");
	String kkc101 = String.valueOf(temp);
	String kkc102 ="2";
	StringBuilder sql2 = new StringBuilder()
			.append("insert into kc03 ")
			.append("(kkc101,kkc302,kkc304,kkc305,kkc309,kkc310,kkc311,kkc312,kkc313,kkc314 )")
			.append("values (?,?,?,?,?,?,?,?,?,?)")
			;
	
	Object args1 []=
		{
				kkc101,
				kkc102
		};
	Object args2 []=
		{
				kkc101,
				this.get("kkc302"),
				this.get("kkc304"),
				this.get("kkc305"),
				this.get("kkc309"),
				this.get("kkc310"),
				this.get("kkc311"),
				this.get("kkc312"),
				this.get("kkc313"),
				this.get("kkc314")
				
		};
	
	this.appendSql(sql1.toString(), args1);
	this.appendSql(sql2.toString(), args2);
	return this.executeTransaction();
}


}
