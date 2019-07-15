package com.subcircle.services.kcimpl;

import java.util.List;
import java.util.Map;


import com.subcircle.services.support.JdbcServicesSupport;

public class Kc02Services extends JdbcServicesSupport {
	
	/**
	 * 查询排名信息
	 */
	
	public List<Map<String,String>> queryByCondition() throws Exception
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("SELECT k.kkc101,k.kkc202,k.kkc203,k.kkc204,k.kkc205,k.kkc206,k.kkc207,k.kkc208 ")
				.append("from kc02 k ")
				.append("ORDER BY k.kkc208 ")
				.append("LIMIT 12 ");
		Object args[] = {};
		return this.queryForList(sql.toString(), args);		
	}	
	
	
	public  Map<String,String> findById()throws Exception
	
	{
		
		
		StringBuilder sql = new StringBuilder()
				.append("select k.kkc202,k.kkc204,k.kkc206,k.kkc207,k.kkc208,")
				.append("       k.kkc209,k.kkc210,k.kkc211,k.kkc212,k.kkc213,")
				.append("       k.kkc214,k.kkc215,k.kkc216,k.kkc217,k.kkc218 ")
				.append("from kc02 k ")
				.append("where k.kkc101=?")
				;
		
		
		return this.queryForMap(sql.toString(),this.get("kkc101"));
		
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
    
    
    
    
    public List<Map<String,String>> queryAnimeComment () throws Exception
    
   
    {
    	String kkc101 = this.get("kkc101").toString();
    	StringBuilder sql = new StringBuilder()
    			.append("SELECT a.kkd101,a.kkd105,a.kkd108,b.kkc702,b.kkc703,b.kkc704 ")
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
    	
    	String kkc101 = this.get("kkc101").toString();
    	StringBuilder sql = new StringBuilder()
    			.append("SELECT a.kkd101,a.kkd105,a.kkd108,b.kkc702,b.kkc703,b.kkc704 ")
    			.append("FROM kd01 a,kc07 b ")
    			.append("where b.kkc101=")
    			.append(kkc101)
    			.append(" AND a.kkd101 = b.kkd101 ")
    			.append("ORDER BY b.kkc704 DESC ")
    			.append("LIMIT 20 ");
    			;
    	Object args[] = {};
    	
    	
    	return this.queryForList(sql.toString(), args);
    }
    
    
    public List<Map<String,String>> searchinAnime () throws Exception
    
    {
    	
    	String kksk = this.get("kksk").toString();
    	StringBuilder sql = new StringBuilder()
    			.append("SELECT k.kkc101,k.kkc202,k.kkc203,k.kkc204,k.kkc205,k.kkc206,k.kkc207,k.kkc208 ")
				.append("from kc02 k ")
				.append("where kkc202 ")
				.append("like '%")
				.append(kksk)
				.append("%' ")
				.append("or kkc217 ")
				.append("like '%")
				.append(kksk)
				.append("%' ")
				.append("ORDER BY k.kkc208 ")
				.append("LIMIT 12 ");
    	
    	Object args[] = {};
    	return this.queryForList(sql.toString(), args);
    }
    
}
